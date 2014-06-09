<?php

class JobController extends IndexController  {
	
	/**
	 * Override unknown actions to enable ACL checking 
	 * 
	 * @see SecureController::getActionforACL()
	 *
	 * @return String
	 */
	public function getActionforACL() {
	 	$action = strtolower($this->getRequest()->getActionName()); 
	 	if($action == "processjob" ){
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
    	
    	$formvalues = $this->_getAllParams(); // debugMessage($formvalues); // exit(); 
    	if($this->_getParam('status') == 0 && !isEmptyString($this->_getParam('terminationreason'))){
    		$formvalues['islocked'] == 1;
    	}
    	if(isEmptyString($this->_getParam('enddate'))){
    		$formvalues['islocked'] = NULL;
    		$formvalues['enddate'] = NULL;
    	}
    	debugMessage($formvalues);
    	
    	$job = new Job();
    	if(!isEmptyString($id)){
    		# if job already, fetch existing entry
    		$job->populate(decode($id)); // debugMessage($job->toArray());
    	}
    	
    	# process the job
    	$job->processPost($formvalues); // debugMessage($job->toArray()); debugMessage('error is '.$job->getErrorStackAsString()); exit();
    	
    	# check for processing errors
    	if($job->hasError()){
    		$session->setVar(ERROR_MESSAGE, $job->getErrorStackAsString());
    		$session->setVar(FORM_VALUES, $formvalues);
    		$this->_helper->redirector->gotoUrl(decode($this->_getParam('failureurl')));
    	}
    	
    	try {
    		// save the job and return to success page (client view)
    		$job->save(); // debugMessage('ssaved perfect');
    		if(isEmptyString($id)){
    			$session->setVar(SUCCESS_MESSAGE, $this->_translate->translate('global_save_success'));
    		} else {
    			$session->setVar(SUCCESS_MESSAGE, $this->_translate->translate('global_update_success'));
    		}
    		$this->_helper->redirector->gotoUrl(decode($this->_getParam(URL_SUCCESS)));
    	} catch (Exception $e) { debugMessage($e->getMessage());
    		// failed to save job, return to failure page (client view)
    		$session->setVar(ERROR_MESSAGE, $e->getMessage());
    		$session->setVar(FORM_VALUES, $formvalues);
    		$this->_helper->redirector->gotoUrl(decode($this->_getParam(URL_FAILURE)));
    	}
    }
    
    function editAction(){
    	return $this->createAction();
    }
}
