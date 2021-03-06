<?php

class Assignment extends BaseRecord  {
	public function setTableDefinition() {
		parent::setTableDefinition();
		
		$this->setTableName('assignment');
		$this->hasColumn('id', 'integer', null, array('primary' => true, 'autoincrement' => true));
		$this->hasColumn('clientid', 'integer', null);
		$this->hasColumn('userid', 'integer', null);
		$this->hasColumn('startdate', 'date', null, array('notblank' => true));
		$this->hasColumn('enddate', 'date', null);
		$this->hasColumn('role', 'integer', null, array('default' => 2));
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
       									"startdate.notblank" => $this->translate->_("client_assignment_userid_error"),
       									"role.notblank" => $this->translate->_("client_assignment_role_error")
       	       						));
	}
	/**
	 * Pre process model data
	 */
	function processPost($formvalues){
		$session = SessionWrapper::getInstance();
		# force setting of default none string column values. enum, int and date 	
		if(isArrayKeyAnEmptyString('datedeassigned', $formvalues)){
			unset($formvalues['datedeassigned']); 
		}
		if(isArrayKeyAnEmptyString('clientid', $formvalues)){
			unset($formvalues['clientid']);
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
		
		if(!isArrayKeyAnEmptyString('usertextfirstname', $formvalues) && !isArrayKeyAnEmptyString('usertextlastname', $formvalues)){
			// unset($formvalues['userid']);
			//$name = $formvalues['usertext']; 
			// $namesarray = explode(" ", $name); 
			
			$firstname = $formvalues['usertextfirstname'];
			$lastname = $formvalues['usertextlastname'];
			$groupids = array(2);
			$usergroups = array();
			foreach ($groupids as $id) {
				$usergroups[]['groupid'] = $id;
			}
			
			$userdata = array(
						'firstname' => $firstname,
						'lastname' => $lastname,
						'type' => 2,
						'createdby' => $session->getVar('userid'),
						'gender' => 1,
						'usergroups' => $usergroups
					);
			$formvalues['user'] = $userdata;
		}
		// debugMessage($formvalues); 
		parent::processPost($formvalues);
	}
}