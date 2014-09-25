<?php

class AssignmentController extends IndexController  {
	
	public function createAction(){
		// debugMessage('here'); // exit();
		parent::createAction();
	}
	
	public function deassignAction(){
		$this->_helper->layout->disableLayout();
    	$this->_helper->viewRenderer->setNoRender(TRUE);
    	$session = SessionWrapper::getInstance();
    	$formvalues = $this->_getAllParams(); // debugMessage($formvalues); // exit();
    	
    	$assignment = new Assignment();
    	$id = getAssignmentIDForUser($formvalues['userid'], $formvalues['clientid']);
    	if(!isEmptyString($id)){
    		$formvalues['deassignedbyid'] = $session->getVar('userid');
    		$formvalues['datedeassigned'] = date('Y-m-d');
    		$assignment->populate($id);
    		$assignment->processPost($formvalues);
    		
    		if($assignment->hasError()){
    			$this->_helper->redirector->gotoUrl();
    		} else {
    			if($assignment->save()){
    				$this->_helper->redirector->gotoUrl(decode($this->_getParam('successurl')));
    			} else {
    				$this->_helper->redirector->gotoUrl(decode($this->_getParam('failureurl')));
    			}
    		}
    	}
	}
}
