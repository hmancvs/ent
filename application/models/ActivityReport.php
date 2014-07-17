<?php

class ActivityReport extends BaseEntity {
	
	public function setTableDefinition() {
		#add the table definitions from the parent table
		parent::setTableDefinition();
		
		$this->setTableName('activityreport');
		$this->hasColumn('type', 'integer', null, array('default' => 1));
		$this->hasColumn('title', 'string', 255, array('notblank' => true));
		$this->hasColumn('clientid', 'integer', null, array('notblank' => true));
		$this->hasColumn('voucherid', 'integer', null, array('notblank' => true));
		$this->hasColumn('coachid', 'integer', null);
		$this->hasColumn('invoiceid', 'integer', null);
		$this->hasColumn('reportdate','date', null, array('notblank' => true));
		$this->hasColumn('startdate','date', null, array('notblank' => true));
		$this->hasColumn('enddate','date', null, array('notblank' => true));
		$this->hasColumn('billablehours', 'decimal', 11);
		$this->hasColumn('ignoredactivities', 'string', 50);
		$this->hasColumn('completedby', 'string', 50);
		
		$this->hasColumn('hoursrequested', 'decimal', 11);
		$this->hasColumn('issues', 'string', 1000);
		$this->hasColumn('strategies', 'string', 1000);
		$this->hasColumn('appropriate', 'string', 1000);
		$this->hasColumn('comments', 'string', 1000);
		$this->hasColumn('meetingrequested', 'integer', null);
		$this->hasColumn('newservicetypeid', 'string', 1000);
		$this->hasColumn('jobid', 'integer', null);
		$this->hasColumn('hasjob', 'integer', null, array('default'=>'0'));
		$this->hasColumn('attachments', 'string', 50);
	}
	
	# Contructor method for custom initialization
	public function construct() {
		parent::construct();
		
		$this->addDateFields(array("reportdate","startdate","enddate"));
		
		# set the custom error messages
       	$this->addCustomErrorMessages(array(
       									"title.notblank" => $this->translate->_("report_activitytitle_error"),
       									"clientid.notblank" => $this->translate->_("report_clientid_error"),
       									"voucherid.notblank" => $this->translate->_("report_voucherid_error"),
       									"reportdate.notblank" => $this->translate->_("report_reportdate_error"),
       									"startdate.notblank" => $this->translate->_("activity_startdate_error"),
       									"enddate.notblank" => $this->translate->_("activity_enddate_error")
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
		
		$this->hasOne('Voucher as voucher',
				array(
						'local' => 'voucherid',
						'foreign' => 'id',
				)
		);
		$this->hasOne('UserAccount as coach',
				array(
						'local' => 'coachid',
						'foreign' => 'id',
				)
		);
		$this->hasOne('Invoice as invoice',
				array(
						'local' => 'invoiceid',
						'foreign' => 'id',
				)
		);
		$this->hasOne('UserAccount as user',
				array(
						'local' => 'completedby',
						'foreign' => 'id',
				)
		);
		
		$this->hasOne('Job as job',
				array(
						'local' => 'jobid',
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
		# validate that the reporting period does not exist.
		if($this->reportExists()){
			$existingreport = $this->getExistingReportDetails();
			// debugMessage($existingreport);
			// ".$existingreport."
			$this->getErrorStack()->add("report.unique", "Current Reporting Period (".formatDateAndTime($this->getStartDate(), false)." - ".formatDateAndTime($this->getEndDate(), false).") is conflicting with an already existing report (".formatDateAndTime($existingreport['startdate'], false)." - ".formatDateAndTime($existingreport['enddate'], false)."). <br> Please update the existing report or delete and regenerate it.");
			
		}
	}
	/**
	 * Preprocess model data
	 */
	function processPost($formvalues){
		$session = SessionWrapper::getInstance();
		if(isArrayKeyAnEmptyString('billablehours', $formvalues)){
			unset($formvalues['billablehours']);
		}
		if(isArrayKeyAnEmptyString('hoursrequested', $formvalues)){
			unset($formvalues['hoursrequested']);
		}
		if(isArrayKeyAnEmptyString('newservicetypeid', $formvalues)){
			unset($formvalues['newservicetypeid']);
		}
		if(isArrayKeyAnEmptyString('jobid', $formvalues)){
			unset($formvalues['jobid']);
		}
		if(isArrayKeyAnEmptyString('hasjob', $formvalues)){
			unset($formvalues['hasjob']);
		}
		if(isArrayKeyAnEmptyString('meetingrequested', $formvalues)){
			unset($formvalues['meetingrequested']);
		}
		// debugMessage($formvalues); exit();
		parent::processPost($formvalues);
	}
	# determine if a report has an invoice
	function isInvoiced(){
		return isEmptyString($this->getInvoiceID()) ? false : true;
	}
	# determine if report already exists for a period
	function reportExists(){
		$conn = Doctrine_Manager::connection();
		$id_check = "";
		if(!isEmptyString($this->getID())){
			$id_check = " AND id <> '".$this->getID()."' ";
		}
		
		$query = "SELECT id FROM activityreport WHERE type = '".$this->getType()."' AND clientid = '".$this->getClientID()."' AND voucherid = '".$this->getVoucherID()."' AND  
		TO_DAYS(startdate) <= TO_DAYS('".$this->getStartDate()."') AND TO_DAYS(enddate) >= TO_DAYS('".$this->getEndDate()."')  
		".$id_check;
		// debugMessage($ref_query);
		$result = $conn->fetchOne($query);
		// debugMessage($ref_result);
		if(isEmptyString($result)){
			return false;
		}
		return true;
	}
	# formatting existing report for error display
	function getExistingReportDetails(){
		$conn = Doctrine_Manager::connection();
		$id_check = "";
		if(!isEmptyString($this->getID())){
			$id_check = " AND id <> '".$this->getID()."' ";
		}
		
		$query = "SELECT * FROM activityreport WHERE type = '".$this->getType()."' AND clientid = '".$this->getClientID()."' AND voucherid = '".$this->getVoucherID()."' AND  TO_DAYS(startdate) <= TO_DAYS('".$this->getStartDate()."') AND TO_DAYS(enddate) >= TO_DAYS('".$this->getEndDate()."') ".$id_check;
		// debugMessage($ref_query);
		$result = $conn->fetchRow($query);
		return $result;
	}
}
?>
