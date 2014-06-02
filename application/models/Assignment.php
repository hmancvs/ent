<?php

class Assignment extends BaseRecord  {
	public function setTableDefinition() {
		parent::setTableDefinition();
		
		$this->setTableName('assignment');
		$this->hasColumn('id', 'integer', null, array('primary' => true, 'autoincrement' => true));
		$this->hasColumn('clientid', 'integer', null, array('notblank' => true));
		$this->hasColumn('userid', 'integer', null, array('notblank' => true));
		$this->hasColumn('startdate', 'date', null, array('notblank' => true));
		$this->hasColumn('enddate', 'date', null);
		$this->hasColumn('role', 'integer', null);
		$this->hasColumn('notes', 'string', 255);
		$this->hasColumn('datecreated', 'timestamp');
		$this->hasColumn('createdby', 'integer', 11);
		$this->hasColumn('datedeassigned', 'date', null);
		$this->hasColumn('deassignedbyid', 'date', null);
		$this->hasColumn('reason', 'string', 500);
		$this->hasColumn('status', 'integer', null);
	}
	
	public function setUp() {
		parent::setUp(); 
		// automatically set timestamp on datecreated
		$this->actAs('Timestampable', 
						array('created' => array(
												'name' => 'datecreated',    
											),
							 'updated' => array(
												'name'     =>  'datecreated',    
												'onInsert' => false,
												'options'  =>  array('notnull' => false)
											)
						)
					);
		
		$this->hasOne('Client as client',
				array(
						'local' => 'clientid',
						'foreign' => 'id',
				)
		);
		
		$this->hasOne('UserAccount as user',
				array(
						'local' => 'userid',
						'foreign' => 'id',
				)
		);
		
		$this->hasOne('UserAccount as creator',
				array(
						'local' => 'createdby',
						'foreign' => 'id'
				)
		);
		
		$this->hasOne('UserAccount as deassignee',
				array(
						'local' => 'deassignedbyid',
						'foreign' => 'id'
				)
		);
	}
	
   /**
	 * Contructor method for custom functionality - add the fields to be marked as dates
	 */
	public function construct() {
		parent::construct();
		
		$this->addDateFields(array("startdate"));
		
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
		if(isArrayKeyAnEmptyString('datedeassigned', $formvalues)){
			unset($formvalues['datedeassigned']); 
		}
		if(isArrayKeyAnEmptyString('role', $formvalues)){
			unset($formvalues['role']); 
		}
		if(isArrayKeyAnEmptyString('enddate', $formvalues)){
			unset($formvalues['enddate']); 
		}
		if(isArrayKeyAnEmptyString('createdby', $formvalues)){
			unset($formvalues['createdby']); 
		}
		if(isArrayKeyAnEmptyString('status', $formvalues)){
			unset($formvalues['status']);
		}
		if(isArrayKeyAnEmptyString('datedeassignedbyid', $formvalues)){
			unset($formvalues['datedeassignedbyid']);
		}
		
		// debugMessage($formvalues); // exit();
		parent::processPost($formvalues);
	}
}