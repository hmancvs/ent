<?php

class ActivityReport extends BaseEntity {
	
	public function setTableDefinition() {
		#add the table definitions from the parent table
		parent::setTableDefinition();
		
		$this->setTableName('activityreport');
		$this->hasColumn('type', 'integer', null, array('default' => 1));
		$this->hasColumn('clientid', 'integer', null, array('notblank' => true));
		$this->hasColumn('voucherid', 'integer', null, array('notblank' => true));
		$this->hasColumn('coachid', 'integer', null, array('notblank' => true));
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
		$this->hasColumn('newservicetypeid', 'integer', null);
		$this->hasColumn('jobid', 'integer', null);
		$this->hasColumn('attachments', 'string', 50);
	}
	
	# Contructor method for custom initialization
	public function construct() {
		parent::construct();
		
		$this->addDateFields(array("reportdate","startdate","enddate"));
		
		# set the custom error messages
       	$this->addCustomErrorMessages(array(
       									"clientid.notblank" => $this->translate->_("report_clientid_error"),
       									"voucherid.notblank" => $this->translate->_("report_voucherid_error"),
       									"coachid.notblank" => $this->translate->_("activity_coachid_error"),
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
		
		$this->hasOne('Job as job',
				array(
						'local' => 'jobid',
						'foreign' => 'id',
				)
		);
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
		// debugMessage($formvalues); exit();
		parent::processPost($formvalues);
	}
}
?>
