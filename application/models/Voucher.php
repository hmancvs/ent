<?php

class Voucher extends BaseEntity {
	
	public function setTableDefinition() {
		#add the table definitions from the parent table
		parent::setTableDefinition();
		
		$this->setTableName('voucher');
		$this->hasColumn('type', 'integer', null, array('default' => 1));
		$this->hasColumn('parentid', 'integer', null);
		$this->hasColumn('clientid', 'integer', null);
		$this->hasColumn('servicetypeid', 'integer', null, array('notblank' => true));
		$this->hasColumn('voucherno', 'string', 50);
		$this->hasColumn('favoucherno', 'string', 50);
		$this->hasColumn('faprefix', 'string', 15);
		$this->hasColumn('dateapproved','date', null);
		$this->hasColumn('startdate','date', null);
		$this->hasColumn('invoicedate','date', null);
		$this->hasColumn('enddate','date', null);
		$this->hasColumn('enddate','date', null);
		$this->hasColumn('status', 'integer', null, array('default' => 0));
		$this->hasColumn('hours', 'decimal', 11, array('scale' => 2, 'notblank' => true));
		$this->hasColumn('days', 'integer', null);
		$this->hasColumn('rate', 'decimal', 11);
		$this->hasColumn('employmentgoal', 'string', 2000);
		$this->hasColumn('notes', 'string', 1000);
		$this->hasColumn('isrenewable', 'integer', null, array('default' => 0));
	}
	
	# Contructor method for custom initialization
	public function construct() {
		parent::construct();
		
		$this->addDateFields(array("dateapproved","startdate","invoicedate","enddate"));
		
		# set the custom error messages
       	$this->addCustomErrorMessages(array(
       									// "clientid.notblank" => $this->translate->_("voucher_clientid_error"),
       									"servicetypeid.notblank" => $this->translate->_("voucher_servicetypeid_error"),
       									"hours.notblank" => $this->translate->_("voucher_hours_error")
       	       						));
	}
	
	# Model relationships
	public function setUp() {
		parent::setUp(); 
		
		$this->hasOne('Client as client',
				array(
						'local' => 'clientid',
						'foreign' => 'id',
				)
		);
		
	}
	/**
	 * Custom model validation
	 */
	function validate() {
		# execute the column validation 
		parent::validate();
		// debugMessage($this->toArray(true));
		
	}
	/**
	 * Preprocess model data
	 */
	function processPost($formvalues){
		$session = SessionWrapper::getInstance();
		if(isArrayKeyAnEmptyString('parentid', $formvalues)){
			unset($formvalues['parentid']);
		}
		if(isArrayKeyAnEmptyString('clientid', $formvalues)){
			unset($formvalues['clientid']);
		}
		if(isArrayKeyAnEmptyString('dateapproved', $formvalues)){
			unset($formvalues['dateapproved']);
		}
		if(isArrayKeyAnEmptyString('startdate', $formvalues)){
			unset($formvalues['startdate']);
		}
		if(isArrayKeyAnEmptyString('invoicedate', $formvalues)){
			unset($formvalues['invoicedate']);
		}
		if(isArrayKeyAnEmptyString('enddate', $formvalues)){
			unset($formvalues['enddate']);
		}
		if(isArrayKeyAnEmptyString('status', $formvalues)){
			unset($formvalues['status']);
		}
		if(isArrayKeyAnEmptyString('days', $formvalues)){
			unset($formvalues['days']);
		}
		if(isArrayKeyAnEmptyString('isrenewable', $formvalues)){
			unset($formvalues['isrenewable']);
		}
		// debugMessage($formvalues); // exit();
		parent::processPost($formvalues);
	}
	# get the total the number of hours used on a voucher
	function getHoursUsed(){
		$hrz = 0;
		$query = Doctrine_Query::create()->from('Activity a')
		->where("a.voucherid = '".$this->getID()."' ")->orderby('a.activitydate desc');
		$result = $query->execute();
		if($result){
			// debugMessage($result->toArray());
			foreach ($result as $activity){
				$hrz += $activity->getBillableHours();
			}
			// debugMessage($hrz);
		}
		return $hrz;
	}
	# get the hours remaining
	function getHoursRemaining(){
		return $this->getHours() - $this->getHoursUsed();
	}
	# get the latest activity for the client voucher
	function getLatestActivity(){
		$query = Doctrine_Query::create()->from('Activity a')
		->where("a.voucherid = '".$this->getID()."'")->orderby('a.activitydate desc')->limit('1');
		$result = $query->execute();
		if($result){
			return $result->get(0);
		}
		return new Activity();
	}
	# determine if a voucher is follow along
	function isFollowAlong(){
		return $this->getType() == 2 && !isEmptyString($this->getParentID());
	}
	# determine if a voucher is deletable
	function hasActivities() {
		$result = false;
		if($this->getHoursUsed() > 0){
			$result = true;
		}
		return $result;
	}
}
?>
