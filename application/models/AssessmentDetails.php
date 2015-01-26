<?php

class AssessmentDetails extends BaseRecord  {
	public function setTableDefinition() {
		parent::setTableDefinition();
		
		$this->setTableName('assessmentdetails');
		$this->hasColumn('id', 'integer', null, array('primary' => true, 'autoincrement' => true));
		$this->hasColumn('clientid', 'integer', null);
		$this->hasColumn('type', 'integer', null);
		// 1 (job accomodation needed), 2 (houehold members), (3) client availability, 4(education background), 
		// 5(client references), 6(support contact info), 7(client exit referrals)
		$this->hasColumn('subtype', 'integer', null);
		// 1 (physical, environmental, instructional), 2(null), 3(startime, endtime) 4(education level), 5(null), 
		// 6(allowcontact)
		$this->hasColumn('parentid', 'integer', null);
		$this->hasColumn('value1', 'string', 500);
		$this->hasColumn('value2', 'string', 500);
		$this->hasColumn('value3', 'string', 500);
		$this->hasColumn('value4', 'string', 500);
		$this->hasColumn('value5', 'string', 500);
		$this->hasColumn('value6', 'string', 500);
		$this->hasColumn('value7', 'string', 500);
	}
	
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
	 * Preprocess model data
	 */
	function processPost($formvalues){
		$session = SessionWrapper::getInstance();
		if(isArrayKeyAnEmptyString('clientid', $formvalues)){
			unset($formvalues['clientid']);
		}
		if(isArrayKeyAnEmptyString('type', $formvalues)){
			unset($formvalues['type']);
		}
		if(isArrayKeyAnEmptyString('subtype', $formvalues)){
			unset($formvalues['subtype']);
		}
		if(isArrayKeyAnEmptyString('parentid', $formvalues)){
			unset($formvalues['parentid']);
		}
		// debugMessage($formvalues); // exit();
		parent::processPost($formvalues);
	}
}