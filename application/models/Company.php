<?php

class Company extends BaseEntity {
	
	public function setTableDefinition() {
		#add the table definitions from the parent table
		parent::setTableDefinition();
		
		$this->setTableName('company');
		$this->hasColumn('type', 'integer', null, array('notblank' => true));
		$this->hasColumn('name', 'string', 500, array('notblank' => true));
		$this->hasColumn('alias', 'string', 50);
		$this->hasColumn('contactperson', 'string', 500, array('notblank' => true));
		$this->hasColumn('email', 'string', 50);
		$this->hasColumn('phone', 'string', 15);
		$this->hasColumn('fax', 'string', 15);
		$this->hasColumn('defaultrate', 'integer', null);
		$this->hasColumn('country', 'string', 2, array('default' => 'US'));
		$this->hasColumn('state', 'string', 2, array('default' => 'NJ'));
		$this->hasColumn('city', 'string', 50);
		$this->hasColumn('county', 'integer', null);
		$this->hasColumn('zipcode', 'string', 15);
		$this->hasColumn('addressline1', 'string', 255);
		$this->hasColumn('addressline2', 'string', 255);
	}
	
	# Contructor method for custom initialization
	public function construct() {
		parent::construct();
		
		# set the custom error messages
       	$this->addCustomErrorMessages(array(
       									"type.notblank" => $this->translate->_("company_type_error"),
       									"name.notblank" => $this->translate->_("company_name_error"),
       									"contactperson.notblank" => $this->translate->_("company_contactperson_error"),
       									"phone.notblank" => $this->translate->_("company_phone_error")
       	       						));
	}
	
	/**
	 * Preprocess model data
	 */
	function processPost($formvalues){
		$session = SessionWrapper::getInstance();
		// about 
		if(isArrayKeyAnEmptyString('county', $formvalues)){
			unset($formvalues['county']);
		}
		if(isArrayKeyAnEmptyString('defaultrate', $formvalues)){
			unset($formvalues['defaultrate']);
		}
		// debugMessage($formvalues); exit(); 
		parent::processPost($formvalues);
	}
}
?>
