<?php

class VoucherController extends IndexController  {
	
	/**
	 * Override unknown actions to enable ACL checking 
	 * 
	 * @see SecureController::getActionforACL()
	 *
	 * @return String
	 */
	public function getActionforACL() {
	 	$action = strtolower($this->getRequest()->getActionName()); 
	 	if($action == "processvoucher" ){
	 		return ACTION_CREATE;
	 	}
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
    	
    	$voucher = new Voucher();
    	if(!isEmptyString($id)){
    		# if voucher already, fetch existing entry
    		$voucher->populate(decode($id)); // debugMessage($voucher->toArray());
    	}
    	
    	# process the voucher
    	$voucher->processPost($formvalues); // debugMessage($voucher->toArray()); debugMessage('error is '.$voucher->getErrorStackAsString()); // exit();
    	
    	# check for processing errors
    	if($voucher->hasError()){
    		$session->setVar(ERROR_MESSAGE, $voucher->getErrorStackAsString());
    		$session->setVar(FORM_VALUES, $formvalues);
    		$this->_helper->redirector->gotoUrl(decode($this->_getParam('failureurl')));
    	}
    	
    	try {
    		// save the voucher and return to success page (client view)
    		$voucher->save(); // debugMessage('ssaved perfect');
    		if(isEmptyString($id)){
    			$session->setVar(SUCCESS_MESSAGE, $this->_translate->translate('global_save_success'));
    		} else {
    			$session->setVar(SUCCESS_MESSAGE, $this->_translate->translate('global_update_success'));
    		}
    		$this->_helper->redirector->gotoUrl(decode($this->_getParam(URL_SUCCESS)));
    	} catch (Exception $e) { debugMessage($e->getMessage());
    		// failed to save voucher, return to failure page (client view)
    		$session->setVar(ERROR_MESSAGE, $e->getMessage());
    		$session->setVar(FORM_VALUES, $formvalues);
    		$this->_helper->redirector->gotoUrl(decode($this->_getParam(URL_FAILURE)));
    	}
    }
    
    function editAction(){
    	return $this->createAction();
    }
}
