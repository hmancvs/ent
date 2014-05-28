<?php

class TestController extends IndexController  {
	
    
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
    
    function popAction(){
    	$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
    	
    	$user = new UserAccount();
    	$user->populate(1);
    	debugMessage($user->toArray());
    }
}
