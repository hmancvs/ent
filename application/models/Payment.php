<?php

class Payment extends BaseEntity {
	
	public function setTableDefinition() {
		#add the table definitions from the parent table
		parent::setTableDefinition();
		
		$this->setTableName('payment');
		$this->hasColumn('clientid', 'integer', null, array('notblank' => true));
		$this->hasColumn('voucherid', 'integer', null, array('notblank' => true));
		$this->hasColumn('invoiceid', 'integer', null, array('notblank' => true));
		$this->hasColumn('paymentdate','date', null, array('notblank' => true));
		$this->hasColumn('paymentamount', 'decimal', 11, array('notblank' => true));
		$this->hasColumn('refno', 'string', 50);
		$this->hasColumn('receivedby', 'string', 50);
		$this->hasColumn('notes', 'string', 255);
	}
	
	# Contructor method for custom initialization
	public function construct() {
		parent::construct();
		
		$this->addDateFields(array("paymentdate"));
		
		# set the custom error messages
       	$this->addCustomErrorMessages(array(
       									"clientid.notblank" => $this->translate->_("payment_clientid_error"),
       									"voucherid.notblank" => $this->translate->_("payment_voucherid_error"),
       									"invoiceid.notblank" => $this->translate->_("payment_invoiceid_error"),
       									"paymentdate.notblank" => $this->translate->_("payment_paymentdate_error"),
       									"paymentamount.notblank" => $this->translate->_("payment_paymentamount_error")
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
		$this->hasOne('Invoice as invoice',
				array(
						'local' => 'invoiceid',
						'foreign' => 'id',
				)
		);
	}
	/**
	 * Preprocess model data
	 */
	function processPost($formvalues){
		$session = SessionWrapper::getInstance();
		
		// debugMessage($formvalues); // exit();
		parent::processPost($formvalues);
	}
}
?>
