<?php

class Activity extends BaseEntity {
	
	public function setTableDefinition() {
		#add the table definitions from the parent table
		parent::setTableDefinition();
		
		$this->setTableName('activity');
		$this->hasColumn('voucherid', 'integer', null, array('notblank' => true));
		$this->hasColumn('clientid', 'integer', null, array('notblank' => true));
		$this->hasColumn('coachid', 'integer', null, array('notblank' => true));
		$this->hasColumn('activitydate','date', null, array('notblank' => true));
		$this->hasColumn('starttime', 'time', null, array('notblank' => true));
		$this->hasColumn('endtime', 'time', null, array('notblank' => true));
		$this->hasColumn('breakhours', 'decimal', 11);
		$this->hasColumn('billablehours', 'decimal', 11, array('scale' => 2, 'notblank' => true));
		$this->hasColumn('activitysummary', 'string', 255);
		$this->hasColumn('actcode', 'string', 15);
		$this->hasColumn('expectedperformance', 'string', 1000, array('notblank' => true));
		$this->hasColumn('actualperformance', 'string', 1000, array('notblank' => true));
		$this->hasColumn('interventionplan', 'string', 1000, array('notblank' => true));
		$this->hasColumn('progressofintervention', 'string', 1000, array('notblank' => true));
		$this->hasColumn('notes', 'string', 1000);
	}
	
	# Contructor method for custom initialization
	public function construct() {
		parent::construct();
		
		$this->addDateFields(array("activitydate"));
		
		# set the custom error messages
       	$this->addCustomErrorMessages(array(
       									"clientid.notblank" => $this->translate->_("activity_clientid_error"),
       									"voucherid.notblank" => $this->translate->_("activity_voucherid_error"),
       									"coachid.notblank" => $this->translate->_("activity_coachid_error"),
       									"activitydate.notblank" => $this->translate->_("activity_activitydate_error"),
       									"starttime.notblank" => $this->translate->_("activity_starttime_error"),
       									"endtime.notblank" => $this->translate->_("activity_endtime_error"),
       									"billablehours.notblank" => $this->translate->_("activity_billablehours_error"),
       									"expectedperformance.notblank" => $this->translate->_("activity_expectedperformance_error"),
       									"actualperformance.notblank" => $this->translate->_("activity_actualperformance_error"),
       									"interventionplan.notblank" => $this->translate->_("activity_interventionplan_error"),
       									"progressofintervention.notblank" => $this->translate->_("activity_progressofintervention_error")
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
		if(isArrayKeyAnEmptyString('breakhours', $formvalues)){
			unset($formvalues['breakhours']);
		}
		if(!isArrayKeyAnEmptyString('starthour', $formvalues) && !isArrayKeyAnEmptyString('startminute', $formvalues)){
			$formvalues['starttime'] = $formvalues['starthour'].":".$formvalues['startminute'].":00";
			if($formvalues['startsetting'] == 'PM' && $formvalues['starthour'] != 12){
				$formvalues['starttime'] = ($formvalues['starthour']+12).":".$formvalues['startminute'].":00";
			}
		}
		if(!isArrayKeyAnEmptyString('endhour', $formvalues) && !isArrayKeyAnEmptyString('endminute', $formvalues)){
			$formvalues['endtime'] = $formvalues['endhour'].":".$formvalues['endminute'].":00";
			if($formvalues['endsetting'] == 'PM' && $formvalues['endhour'] != 12){
				$formvalues['endtime'] = ($formvalues['endhour']+12).":".$formvalues['endminute'].":00";
			}
		}
		// debugMessage($formvalues); exit();
		parent::processPost($formvalues);
	}
}
?>
