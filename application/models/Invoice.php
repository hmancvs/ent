<?php

class Invoice extends BaseEntity {
	
	public function setTableDefinition() {
		#add the table definitions from the parent table
		parent::setTableDefinition();
		
		$this->setTableName('invoice');
		$this->hasColumn('clientid', 'integer', null, array('notblank' => true));
		$this->hasColumn('voucherid', 'integer', null, array('notblank' => true));
		$this->hasColumn('invoiceno', 'string', 50, array('notblank' => true));
		$this->hasColumn('invoicedate','date', null, array('notblank' => true));
		$this->hasColumn('invoiceamount', 'decimal', 11, array('notblank' => true, 'default'=>'0.0'));
		$this->hasColumn('hourstaken', 'decimal', 11, array('notblank' => true));
		$this->hasColumn('hoursremaining', 'decimal', 11);
		$this->hasColumn('description', 'string', 500);
		$this->hasColumn('verifiedby', 'string', 50);
	}
	
	# Contructor method for custom initialization
	public function construct() {
		parent::construct();
		
		$this->addDateFields(array("invoicedate"));
		
		# set the custom error messages
       	$this->addCustomErrorMessages(array(
       									"clientid.notblank" => $this->translate->_("invoice_clientid_error"),
       									"voucherid.notblank" => $this->translate->_("invoice_voucherid_error"),
       									"invoiceno.notblank" => $this->translate->_("invoice_invoiceno_error"),
       									"invoicedate.notblank" => $this->translate->_("invoice_invoicedate_error"),
       									"invoiceamount.notblank" => $this->translate->_("invoice_invoiceamount_error"),
       									"hourstaken.notblank" => $this->translate->_("invoice_hourstaken_error")
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
	}
	/**
	 * Preprocess model data
	 */
	function processPost($formvalues){
		$session = SessionWrapper::getInstance();
		if(isArrayKeyAnEmptyString('hoursremaining', $formvalues)){
			unset($formvalues['hoursremaining']);
		}
		// debugMessage($formvalues); // exit();
		parent::processPost($formvalues);
	}
}
?>
