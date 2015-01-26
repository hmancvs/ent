<?php

class ClientHistory extends BaseRecord  {
	public function setTableDefinition() {
		parent::setTableDefinition();
		
		$this->setTableName('clienthistory');
		$this->hasColumn('id', 'integer', null, array('primary' => true, 'autoincrement' => true));
		$this->hasColumn('clientid', 'integer', null);
		$this->hasColumn('program', 'string', 50);
		$this->hasColumn('startdate', 'date', null, array('notblank' => true));
		$this->hasColumn('enddate', 'date', null);
		$this->hasColumn('nogoal', 'integer', null);
		$this->hasColumn('reason', 'string', 1000);
		$this->hasColumn('goalsmet', 'string', 1000);
		$this->hasColumn('unachievedprogress', 'string', 1000);
		$this->hasColumn('comments', 'string', 1000);
		$this->hasColumn('assessedbyid', 'integer', null);
		$this->hasColumn('closedby', 'string', 255);
		$this->hasColumn('dateclosed', 'date', null);
		$this->hasColumn('status', 'integer', null);
		$this->hasColumn('condition', 'integer', null);
		$this->hasColumn('notified', 'integer', null);
		$this->hasColumn('datenotified', 'date', null);
		$this->hasColumn('notifymethod', 'integer', null);
	}
	
	public function setUp() {
		parent::setUp(); 
		// automatically set timestamp on datecreated
		
		$this->hasOne('Client as client',
				array(
						'local' => 'clientid',
						'foreign' => 'id',
				)
		);
		
		$this->hasOne('UserAccount as assessedby',
				array(
						'local' => 'assessedbyid',
						'foreign' => 'id'
				)
		);
	}
	
   /**
	 * Contructor method for custom functionality - add the fields to be marked as dates
	 */
	public function construct() {
		parent::construct();
		
		$this->addDateFields(array("startdate","enddate","dateclosed","datenotified"));
		
		// set the custom error messages
       	$this->addCustomErrorMessages(array(
       									"clientid.notblank" => $this->translate->_("client_assignment_clientid_error"),
       									"userid.notblank" => $this->translate->_("client_assignment_userid_error"),
       									"startdate.notblank" => $this->translate->_("client_assignment_userid_error"),
       									"role.notblank" => $this->translate->_("client_assignment_role_error")
       	       						));
	}
	/**
	 * Pre process model data
	 */
	function processPost($formvalues){
		# force setting of default none string column values. enum, int and date 	
		if(isArrayKeyAnEmptyString('enddate', $formvalues)){
			unset($formvalues['enddate']); 
		}
		if(isArrayKeyAnEmptyString('status', $formvalues)){
			unset($formvalues['status']);
		}
		if(isArrayKeyAnEmptyString('programs', $formvalues)){
			unset($formvalues['programs']);
		}
		if(isArrayKeyAnEmptyString('condition', $formvalues)){
			unset($formvalues['condition']);
		}
		if(isArrayKeyAnEmptyString('nogoal', $formvalues)){
			unset($formvalues['nogoal']);
		}
		
		# format goals met with a * separator
		$goalsmet = '';
		if(!isArrayKeyAnEmptyString('goalsmet_1', $formvalues)){
			$goalsmet .= $formvalues['goalsmet_1'].'*';
		}
		if(!isArrayKeyAnEmptyString('goalsmet_2', $formvalues)){
			$goalsmet .= $formvalues['goalsmet_2'].'*';
		}
		if(!isArrayKeyAnEmptyString('goalsmet_3', $formvalues)){
			$goalsmet .= $formvalues['goalsmet_3'].'*';
		}
		if(!isArrayKeyAnEmptyString('goalsmet_4', $formvalues)){
			$goalsmet .= $formvalues['goalsmet_4'];
		}
		if(!isEmptyString($goalsmet)){
			$formvalues['goalsmet'] = $goalsmet;
		} else {
			if(isArrayKeyAnEmptyString('goalsmet_old', $formvalues)){
				unset($formvalues['goalsmet']);
			} else {
				$formvalues['goalsmet'] = NULL;
			}
		}
		
		# format unachieved progress with a * separator
		$unachieved = '';
		if(!isArrayKeyAnEmptyString('unachievedprogress_1', $formvalues)){
			$unachieved .= $formvalues['unachievedprogress_1'].'*';
		}
		if(!isArrayKeyAnEmptyString('unachievedprogress_2', $formvalues)){
			$unachieved .= $formvalues['unachievedprogress_2'].'*';
		}
		if(!isArrayKeyAnEmptyString('unachievedprogress_3', $formvalues)){
			$unachieved .= $formvalues['unachievedprogress_3'];
		}
		if(!isEmptyString($unachieved)){
			$formvalues['unachievedprogress'] = $unachieved;
		} else {
			if(isArrayKeyAnEmptyString('unachievedprogress_old', $formvalues)){
				unset($formvalues['unachievedprogress']);
			} else {
				$formvalues['unachievedprogress'] = NULL;
			}
		}
		
		// debugMessage($formvalues); // exit();
		parent::processPost($formvalues);
	}
	# determine client status
	function isActive(){
		$status = false;
		if($this->getStatus() == 1){
			$status = true;
		}
		return $status;
	}
	# determine client status
	function isInActive(){
		$status = false;
		if($this->getStatus() == 0){
			$status = true;
		}
		return $status;
	}
	# determine status text
	function getCurrentStatus(){
		$status = 'Active';
		if($this->isInActive()){
			$status = 'Closed';
		}
		return $status;
	}
	# format goals lines
	function getgoalsmet_1(){
		$txt = '';
		if(isEmptyString($this->getGoalsMet())){
			return $txt;
		}
		$txtarray = explode('*', $this->getGoalsMet());
		if(!isArrayKeyAnEmptyString(0, $txtarray)){
			$txt = $txtarray[0];
		}
		return $txt;
	}
	function getgoalsmet_2(){
		$txt = '';
		if(isEmptyString($this->getGoalsMet())){
			return $txt;
		}
		$txtarray = explode('*', $this->getGoalsMet());
		if(!isArrayKeyAnEmptyString(1, $txtarray)){
			$txt = $txtarray[1];
		}
		return $txt;
	}
	function getgoalsmet_3(){
		$txt = '';
		if(isEmptyString($this->getGoalsMet())){
			return $txt;
		}
		$txtarray = explode('*', $this->getGoalsMet());
		if(!isArrayKeyAnEmptyString(2, $txtarray)){
			$txt = $txtarray[2];
		}
		return $txt;
	}
	function getgoalsmet_4(){
		$txt = '';
		if(isEmptyString($this->getGoalsMet())){
			return $txt;
		}
		$txtarray = explode('*', $this->getGoalsMet());
		if(!isArrayKeyAnEmptyString(3, $txtarray)){
			$txt = $txtarray[3];
		}
		return $txt;
	}
	# format the unachived progress lines
	function getunachievedprogress_1(){
		$txt = '';
		if(isEmptyString($this->getunachievedprogress())){
			return $txt;
		}
		$txtarray = explode('*', $this->getunachievedprogress());
		if(!isArrayKeyAnEmptyString(0, $txtarray)){
			$txt = $txtarray[0];
		}
		return $txt;
	}
	function getunachievedprogress_2(){
		$txt = '';
		if(isEmptyString($this->getunachievedprogress())){
			return $txt;
		}
		$txtarray = explode('*', $this->getunachievedprogress());
		if(!isArrayKeyAnEmptyString(1, $txtarray)){
			$txt = $txtarray[1];
		}
		return $txt;
	}
	function getunachievedprogress_3(){
		$txt = '';
		if(isEmptyString($this->getunachievedprogress())){
			return $txt;
		}
		$txtarray = explode('*', $this->getunachievedprogress());
		if(!isArrayKeyAnEmptyString(2, $txtarray)){
			$txt = $txtarray[2];
		}
		return $txt;
	}
	# determine reason for exit
	function getReasonText(){
		$txt = '';
		if(isEmptyString($this->getReason())){
			return $txt;
		}
		$reasons = getExitReasons();
		if(!isArrayKeyAnEmptyString($this->getReason(), $reasons)){
			$txt = $reasons[$this->getReason()];
		}
		return $txt;
	}
}