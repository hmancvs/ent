<?php

class TestController extends IndexController  {
	
	function smsAction(){
    	// disable rendering of the view and layout so that we can just echo the AJAX output 
	    $this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    
	    $session = SessionWrapper::getInstance(); 
	    $formvalues = $this->_getAllParams();
	    // debugMessage($formvalues);
	    $phone = $this->_getParam('phone');
	    if(!isEmptyString($this->_getParam('msisdn'))){
	    	$phone = $this->_getParam('msisdn');
	    }
	    $message = $this->_getParam('msg');
	    if(isEmptyString($message)){
	    	$message = "Dear User, This is an automated test message from Q1 system. confirm route - ".mktime();
	    }
	    if(isEmptyString($phone)){
	    	$phone = getSmsSenderName();
	    }
	    sendSMSMessage($phone, $message);
    }
    
	function sendsmsAction(){
    	// disable rendering of the view and layout so that we can just echo the AJAX output 
	    $this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    
	    $session = SessionWrapper::getInstance(); 
	    $formvalues = $this->_getAllParams();
	    // debugMessage($formvalues);
	   	
		$phone = $this->_getParam('phone');
	    if(!isEmptyString($this->_getParam('msisdn'))){
	    	$phone = $this->_getParam('msisdn');
	    }
	    $message = $this->_getParam('msg');
	    if(isEmptyString($message)){
	    	$message = "Dear User, This is an automated test message from Q1 system. confirm route - ".mktime();
	    }
	    if(isEmptyString($phone)){
	    	$phone = SMS_TEST_NUMBER;
	    }
	    
	    sendSMSMessage($phone, $message);
    }
    
    function testmailAction(){
    	$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    
    	$user = new UserAccount();
    	$user->populate(2);
    	$user->sendProfileInvitationNotification();
    	debugMessage($user->toArray());
    }
    
	function emailAction(){
    	$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    
	    sendTestMessage('test farmis email','this is a test message please ignore - '.APPLICATION_ENV);
    }
    
    function soundcloudAction() {
    	$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    $formvalues = $this->_getAllParams();
    	debugMessage($formvalues);
    	exit();
    	
    }
}

