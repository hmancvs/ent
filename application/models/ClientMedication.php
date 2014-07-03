<?php

class ClientMedication extends BaseRecord  {
	public function setTableDefinition() {
		parent::setTableDefinition();
		
		$this->setTableName('clientmedication');
		$this->hasColumn('id', 'integer', null, array('primary' => true, 'autoincrement' => true));
		$this->hasColumn('clientid', 'integer', null);
		$this->hasColumn('type', 'string', 500);
		$this->hasColumn('strength', 'string', 500);
		$this->hasColumn('dosage', 'string', 500);
		$this->hasColumn('sidedefects', 'string', 500);
		$this->hasColumn('purpose', 'string', 500);
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
}