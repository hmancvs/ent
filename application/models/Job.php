<?php

class Job extends BaseEntity {
	
	public function setTableDefinition() {
		#add the table definitions from the parent table
		parent::setTableDefinition();
		
		$this->setTableName('job');
		$this->hasColumn('clientid', 'integer', null, array('notblank' => true));
		$this->hasColumn('employerid', 'integer', null, array('default'=>NULL));
		$this->hasColumn('startdate', 'date', null, array('notblank' => true));
		$this->hasColumn('enddate', 'string', 15);
		$this->hasColumn('type', 'integer', null);
		$this->hasColumn('status', 'integer', null, array('default'=>1));
		$this->hasColumn('islocked', 'integer', null, array('default'=>0));
		$this->hasColumn('jobtitle', 'string', 255, array('notblank' => true));
		$this->hasColumn('workdetails', 'string', 255);
		$this->hasColumn('hoursperweek', 'decimal', 11, array('scale' => 2));
		$this->hasColumn('rate', 'decimal', 11, array('scale' => 2, 'notblank' => true));
		$this->hasColumn('ratetype', 'integer', null, array('default'=>'1'));
		$this->hasColumn('medicaltype', 'integer', null);
		$this->hasColumn('medicalstartdate', 'date', null);
		$this->hasColumn('workschedule', 'string', 255);
		$this->hasColumn('transportation', 'integer', null);
		$this->hasColumn('supervisorname', 'string', 255);
		$this->hasColumn('supervisorphone', 'string', 255);
		$this->hasColumn('terminationtype', 'integer', null);
		$this->hasColumn('terminationreason', 'string', 255);
		$this->hasColumn('notes', 'string', 1000);
	}
	
	# Contructor method for custom initialization
	public function construct() {
		parent::construct();
		
		$this->addDateFields(array("stardate","enddate","medicalstartdate"));
		
		# set the custom error messages
       	$this->addCustomErrorMessages(array(
       									"clientid.notblank" => $this->translate->_("job_clientid_error"),
       									"startdate.notblank" => $this->translate->_("job_startdate_error"),
       									"jobtitle.notblank" => $this->translate->_("job_jobtitle_error"),
       									"rate.notblank" => $this->translate->_("job_rate_error"),
       									"ratetype.notblank" => $this->translate->_("job_ratetype_error"),
       									"status.notblank" => $this->translate->_("job_status_error")
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

		$this->hasOne('Company as employer',
				array(
						'local' => 'employerid',
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
		// about 
		if(isArrayKeyAnEmptyString('employerid', $formvalues)){
			unset($formvalues['employerid']);
		}
		if(isArrayKeyAnEmptyString('enddate', $formvalues)){
			unset($formvalues['enddate']);
		} else {
			if(isEmptyString($formvalues['enddate'])){
				$formvalues['enddate'] = NULL;
			} else {
				$formvalues['enddate'] = changeDateFromPageToMySQLFormat($formvalues['enddate']);
			}
		}
		if(isArrayKeyAnEmptyString('startdate', $formvalues)){
			unset($formvalues['startdate']);
		} else {
			$formvalues['startdate'] = changeDateFromPageToMySQLFormat($formvalues['startdate']);
		}
		if(isArrayKeyAnEmptyString('status', $formvalues)){
			unset($formvalues['status']);
		} else {
			/* if($formvalues['status'] == 1){
				$formvalues['enddate'] = NULL;
			} */
		}
		
		if(isArrayKeyAnEmptyString('ratetype', $formvalues)){
			if(isArrayKeyAnEmptyString('ratetype_old', $formvalues)){
				unset($formvalues['ratetype']);
			} else {
				$formvalues['ratetype'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('transportation', $formvalues)){
			if(isArrayKeyAnEmptyString('transportation_old', $formvalues)){
				unset($formvalues['transportation']);
			} else {
				$formvalues['transportation'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('medicaltype', $formvalues)){
			if(isArrayKeyAnEmptyString('medicaltype_old', $formvalues)){
				unset($formvalues['medicaltype']);
			} else {
				$formvalues['medicaltype'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('medicalstartdate', $formvalues)){
			unset($formvalues['medicalstartdate']);
		}
		if(isArrayKeyAnEmptyString('terminationtype', $formvalues)){
			if(isArrayKeyAnEmptyString('terminationtype_old', $formvalues)){
				unset($formvalues['terminationtype']);
			} else {
				$formvalues['terminationtype'] = NULL;
			}
		}
		
		if(!isArrayKeyAnEmptyString('employerid', $formvalues)){
			$formvalues['employer']['id'] = $formvalues['employerid'];
		}
		if(!isArrayKeyAnEmptyString('companyname', $formvalues)){
			$formvalues['employer']['name'] = $formvalues['companyname'];
		}
		$formvalues['employer']['type'] = 2;
		if(!isArrayKeyAnEmptyString('contactperson', $formvalues)){
			$formvalues['employer']['contactperson'] = $formvalues['contactperson'];
		}
		if(!isArrayKeyAnEmptyString('phone', $formvalues)){
			$formvalues['employer']['phone'] = $formvalues['phone'];
		}
		if(!isArrayKeyAnEmptyString('email', $formvalues)){
			$formvalues['employer']['email'] = $formvalues['email'];
		}
		if(!isArrayKeyAnEmptyString('state', $formvalues)){
			$formvalues['employer']['state'] = $formvalues['state'];
		}
		if(!isArrayKeyAnEmptyString('county', $formvalues)){
			$formvalues['employer']['county'] = $formvalues['county'];
		}
		if(!isArrayKeyAnEmptyString('city', $formvalues)){
			$formvalues['employer']['city'] = $formvalues['city'];
		}
		if(!isArrayKeyAnEmptyString('zipcode', $formvalues)){
			$formvalues['employer']['zipcode'] = $formvalues['zipcode'];
		}
		if(!isArrayKeyAnEmptyString('addressline1', $formvalues)){
			$formvalues['employer']['addressline1'] = $formvalues['addressline1'];
		}
		if(!isArrayKeyAnEmptyString('addressline2', $formvalues)){
			$formvalues['employer']['addressline2'] = $formvalues['addressline2'];
		}
		if(isArrayKeyAnEmptyString('islocked', $formvalues)){
			unset($formvalues['islocked']);
		}
		if(isArrayKeyAnEmptyString('type', $formvalues)){
			unset($formvalues['type']);
		}
		// debugMessage($formvalues); exit(); 
		parent::processPost($formvalues);
	}
	# determine the duration text for a job
	function getDuration(){
		$duration = '';
		if(!isEmptyString($this->getStartDate())){
			$duration = formatDateAndTime($this->getStartDate(), false);
		}
		if(!isEmptyString($this->getEndDate())){
			$duration .= ' - '.formatDateAndTime($this->getEndDate(), false);
		} else {
			$duration .= ' - Todate';
		}
		return $duration;
	}
}
?>
