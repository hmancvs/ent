<?php

/**
 * The relationship between a Client and Skills
 */
class ClientSkill extends BaseRecord  {
	public function setTableDefinition() {
		parent::setTableDefinition();
		
		$this->setTableName('clientskill');
		$this->hasColumn('clientid', 'integer', null);
		$this->hasColumn('skill', 'integer', null);
	}
	
	public function setUp() {
		parent::setUp();
		
		$this->hasOne('Client as client',
							array(
								'local' => 'clientid',
								'foreign' => 'id'
							)
						);	
	}
}