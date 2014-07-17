<?php

class InvoiceController extends IndexController  {
	
	/**
	 * Override unknown actions to enable ACL checking 
	 * 
	 * @see SecureController::getActionforACL()
	 *
	 * @return String
	 */
	public function getActionforACL() {
	 	$action = strtolower($this->getRequest()->getActionName()); 
	 	
		return parent::getActionforACL();
    }
    
    function createAction(){
    	$session = SessionWrapper::getInstance();
    	// if id exists use action edit
    	$id = $this->_getParam('id');
    	if(!isEmptyString($id)){
    		# if id present, change action to edit 
    		$this->_setParam('action', ACTION_EDIT);
    		$this->_setParam('id', decode($id));
    	} else {
    		$this->_setParam('createdby', $session->getVar('userid'));
    	}
    	
    	$formvalues = $this->_getAllParams(); debugMessage($formvalues); // exit(); 
    	// debugMessage($formvalues);
    	
    	$invoice = new Invoice();
    	if(!isEmptyString($id)){
    		# if invoice already, fetch existing entry
    		$invoice->populate(decode($id)); // debugMessage($invoice->toArray());
    	}
    	
    	# process the invoice
    	$invoice->processPost($formvalues); // debugMessage($invoice->toArray()); debugMessage('error is '.$invoice->getErrorStackAsString()); exit();
    	
    	# check for processing errors
    	if($invoice->hasError()){
    		$session->setVar(ERROR_MESSAGE, $invoice->getErrorStackAsString());
    		$session->setVar(FORM_VALUES, $formvalues);
    		$this->_helper->redirector->gotoUrl(decode($this->_getParam('failureurl')));
    	}
    	
    	try {
    		// save the invoice and return to success page (client view)
    		$invoice->save(); // debugMessage('ssaved perfect');
    		if(!isEmptyString($invoice->getReportID())){
    			$invoice->getReport()->setInvoiceID($invoice->getID());
    			$invoice->getReport()->setReportDate($invoice->getInvoiceDate());
    			$invoice->getReport()->setCompletedBy($invoice->getVerifiedBy());
    			$invoice->getReport()->save();
    		}
    		if(isEmptyString($id)){
    			$session->setVar(SUCCESS_MESSAGE, $this->_translate->translate('global_save_success'));
    		} else {
    			$session->setVar(SUCCESS_MESSAGE, $this->_translate->translate('global_update_success'));
    		}
    		$this->_helper->redirector->gotoUrl(decode($this->_getParam(URL_SUCCESS)).'/invid/'.encode($invoice->getID()));
    	} catch (Exception $e) { debugMessage($e->getMessage());
    		// failed to save invoice, return to failure page (client view)
    		$session->setVar(ERROR_MESSAGE, $e->getMessage());
    		$session->setVar(FORM_VALUES, $formvalues);
    		$this->_helper->redirector->gotoUrl(decode($this->_getParam(URL_FAILURE)));
    	}
    }
    
    function editAction(){
    	return $this->createAction();
    }
}
