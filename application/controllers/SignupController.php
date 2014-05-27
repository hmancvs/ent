<?php

class SignupController extends IndexController {
	
	function indexAction(){
		$url = $this->view->baseUrl("user/login/tab/signup");
		if(!isEmptyString($this->_getParam('id'))){
			$url = $this->view->baseUrl("user/login/tab/signup/id/".$this->_getParam('id'));
			if($this->_getParam('complete') == '1'){
				$url = $this->view->baseUrl("user/login/tab/signup/id/".$this->_getParam('id')."/complete/1");
			}
			if($this->_getParam('reactivate') == '1'){
				$url = $this->view->baseUrl("user/login/tab/signup/id/".$this->_getParam('id')."/reactivate/1");
			}
		}
		$this->_helper->redirector->gotoUrl($url);
	}
	function createAction() {
		// the group to which the user is to be added
		$formvalues = $this->_getAllParams();
		// debugMessage($formvalues);
		$this->_setParam("action", ACTION_CREATE); 
		$this->_setParam('entityname', 'UserAccount');
		$this->_setParam('firstname', ucfirst($formvalues['firstname']));
		$this->_setParam('lastname', ucfirst($formvalues['lastname']));
		
		if(!isEmptyString($this->_getParam('spamcheck')) || !is_numeric($this->_getParam('phone')) || isEmptyString($this->_getParam('agreedtoterms')) || isEmptyString($this->_getParam('gender'))){
			// debugMessage('failed');
			$session = SessionWrapper::getInstance(); 
			$session->setVar(ERROR_MESSAGE, 'Spam detected. Try again later'); 
			$this->_helper->redirector->gotoUrl($this->view->baseUrl('signup'));
		}
		
		// debugMessage($this->_getAllParams()); exit();
		parent::createAction();
	}
	
	function processinviteAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(TRUE);
		
		$formvalues = $this->_getAllParams();
		$session = SessionWrapper::getInstance(); 
		// debugMessage($formvalues); exit();
		
		// debugMessage($this->_getAllParams()); 
		$user = new UserAccount();
		$user->populate(decode($formvalues['id']));
		
		$this->_setParam("action", ACTION_EDIT);
		$this->_setParam('isactive', 1);
		$this->_setParam('activationkey', '');
		$this->_setParam('activationdate', DEFAULT_DATETIME);
		// $this->_setParam('usergroups', array(array("groupid" => $formvalues['type'])));
		$this->_setParam('hasacceptedinvite', 1);
		$this->_setParam('isinvited', NULL);
		$this->_setParam('id', trim(decode($formvalues['id'])));
		if(isEmptyString($this->_getParam('createdby'))){
			$this->_setParam('createdby', decode($formvalues['id']));
		}
		$this->_setParam('reactivatedsubscriber', 1);
		$successurl = $this->view->baseUrl('user/checklogin/email/'.$this->_getParam('email').'/password/'.$this->_getParam('password').'/hashed/1');
		// debugMessage($successurl);
		
		$user->processPost($this->_getAllParams());
		/*debugMessage('error: '.$user->getErrorStackAsString());
		debugMessage($user->toArray()); exit();*/
		if($user->hasError()){
			// debugMessage('process errors are '.$user->getErrorStackAsString()); exit();
			$session->setVar(FORM_VALUES, $this->_getAllParams());
    		$session->setVar(ERROR_MESSAGE, $user->getErrorStackAsString()); 
			$this->_helper->redirector->gotoUrl(decode($this->_getParam(URL_FAILURE)));
		}
		
		try {
			$user->save(); // debugMessage($user->toArray());
			$user->afterActivation();
			// $session->setVar(SUCCESS_MESSAGE, 'Your account on has been successfully activated. Login below to get started.');
			// $this->_helper->redirector->gotoUrl(decode($this->_getParam(URL_SUCCESS)));
			$session->setVar(SUCCESS_MESSAGE, 'Your AGMIS Account has been successfully activated.');
			$this->_helper->redirector->gotoUrl($successurl); 
		} catch (Exception $e) {
			$session->setVar(FORM_VALUES, $this->_getAllParams());
    		$session->setVar(ERROR_MESSAGE, $e->getMessage()); 
    		// debugMessage('save errors are '.$e->getMessage());
			$this->_helper->redirector->gotoUrl(decode($this->_getParam(URL_FAILURE)));
		}
	}
	
	function activateAction() {
		$session = SessionWrapper::getInstance(); 
		$formvalues = $this->_getAllParams();
		$isphoneactivation = false;
		if(!isArrayKeyAnEmptyString('id', $formvalues)){
			// debugMessage($formvalues);
			$user = new UserAccount(); 
			$user->populate(decode($formvalues['id']));
			// debugMessage($user->toArray());
			
			if ($user->isUserActive() && isEmptyString($user->getActivationKey())) {
				// account already activated 
	    		$session->setVar(ERROR_MESSAGE, 'Account is already activated. Please login.'); 
				$this->_helper->redirector->gotoUrl($this->view->baseUrl("user/login"));
			}
			
			$this->_setParam(URL_FAILURE, encode($this->view->baseUrl("signup/confirm/id/".encode($user->getID()))));
			$key = $this->_getParam('actkey');
			
			$this->view->result = $user->activateAccount($key, $isphoneactivation);
			// exit();
			if (!$this->view->result) {
				// activation failed
				$this->view->message = $user->getErrorStackAsString();
				$session->setVar(FORM_VALUES, $this->_getAllParams());
	    		$session->setVar(ERROR_MESSAGE, $user->getErrorStackAsString()); 
				$this->_helper->redirector->gotoUrl(decode($this->_getParam(URL_FAILURE)));
			}
		}
		if(!isArrayKeyAnEmptyString('act_byphone', $formvalues)){
			// debugMessage('activated via phone');
			$isphoneactivation = true;
			$this->_helper->redirector->gotoUrl($this->view->baseUrl("user/login/tab/activate/act_byphone/1"));
		}
		$this->_helper->redirector->gotoUrl($this->view->baseUrl("user/login"));
	}
	
	function activateaccountAction() {
		$session = SessionWrapper::getInstance(); 
		// replace the decoded id with an undecoded value which will be used during processPost() 
		$id = decode($this->_getParam('id')); 
		$this->_setParam('id', $id); 
		
		$user = new UserAccount(); 
		$user->populate($id);
		$user->processPost($this->_getAllParams());
		
		if ($user->hasError()) {
			$session->setVar(FORM_VALUES, $this->_getAllParams());
    		$session->setVar(ERROR_MESSAGE, $user->getErrorStackAsString()); 
			$this->_helper->redirector->gotoUrl(decode($this->_getParam(URL_FAILURE)));
		}
		
		$result = $user->activateAccount($this->_getParam('activationkey'));
		if ($result) {
			// go to sucess page 
			$this->_helper->redirector->gotoUrl(decode($this->_getParam(URL_SUCCESS))); 
		} else {
			$session->setVar(FORM_VALUES, $this->_getAllParams());
    		$session->setVar(ERROR_MESSAGE, $user->getErrorStackAsString()); 
			$this->_helper->redirector->gotoUrl(decode($this->_getParam(URL_FAILURE)));
		}
	}
	
	function mobileactivateAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(TRUE);
		
		$formvalues = $this->_getAllParams();
		$session = SessionWrapper::getInstance();
		// debugMessage($formvalues);
		$key = trim($formvalues['actkey']);
		$user = new UserAccount();
		$useraccount = new UserAccount();
		
		if(!isEmptyString($this->_getParam('phone'))){
			$useraccount = $user->populateByPhone(getFullPhone($formvalues['phone']), $key);
		} else {
			if(!isEmptyString($this->_getParam('id'))){
				$useraccount->populate(decode($formvalues['id']));
			}
		}
		
		// debugMessage($useraccount->toArray()); exit();
		# check if user with specified phone exists
		if(!isEmptyString($useraccount->getID())){
			# now validate user's activation code specified
			if($useraccount->getActivationKey() == $key){
				if(!isEmptyString($this->_getParam('id'))){
					try {
						$useraccount->activateAccount($key, 1);
						$session->setVar(SUCCESS_MESSAGE, 'Activation Code successfully validated. Please login to continue');
					} catch (Exception $e) {
						$session->setVar(ERROR_MESSAGE, $e->getMessage());
						$this->_helper->redirector->gotoUrl(decode($this->_getParam(URL_FAILURE)));
					}
				}
				if(!isEmptyString($this->_getParam('phone'))){
					$session->setVar(SUCCESS_MESSAGE, 'Activation Code successfully validated. Please complete your profile to continue.');
				}
				//$this->_helper->redirector->gotoUrl($this->view->baseUrl("user/login/tab/signup/id/".encode($useraccount->getID()).'/actkey/valid'));
				$this->_helper->redirector->gotoUrl(decode($this->_getParam(URL_SUCCESS))); 
			}
		}
		// $session->setVar(ERROR_MESSAGE, 'Invalid Phone or Activation Code');
		$session->setVar(ERROR_MESSAGE, 'Invalid Activation Code specified. Please try again');
		$this->_helper->redirector->gotoUrl(decode($this->_getParam(URL_FAILURE)));
	}
	
	function confirmAction() {
		
	}
	
	function activationerrorAction() {
		
	}
	
	function activationconfirmationAction() {
		
	}
	
	function inviteconfirmationAction() {
		
	}
	
	function getcaptchaAction(){
		$this->view->layout()->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(true);
		$session = SessionWrapper::getInstance(); 
		
		$string = '';
		for ($i = 0; $i < 5; $i++) {
			$string .= chr(rand(97, 122));
		}
		$session->setVar('random_number', $string);
		// $_SESSION['random_number'] = $string;

		$dir = $this->view->baseUrl("images/fonts/");
		//$dir = APPLICATION_PATH."/../public/images/fonts";
		// debugMessage($dir);
		$image = imagecreatetruecolor(165, 50);

		// random number 1 or 2
		
		echo $session->getVar('random_number');
	}
	function captchaAction() {
		$this->view->layout()->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(true);
		$session = SessionWrapper::getInstance();
		//include('dbcon.php');
		// debugMessage('scre is '.strtolower($this->_getParam('code')));
		// debugMessage('rand is '.strtolower($session->getVar('random_number')));
		if(strtolower($this->_getParam('code')) == strtolower($session->getVar('random_number'))){
			echo 1;// submitted 
		} else {
			echo 0; // invalid code
		}
	}
	
	function testAction() {
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(true);
		$user = new UserAccount();
		$user->populate(decode($this->_getParam('id')));
		$user->transactionSave();
		//debugMessage($user->toArray());
		//debugMessage($user->getFarmer()->getNextRegNo());
	}
	
	function checkusernameAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(true);
	    
		$formvalues = $this->_getAllParams();
		$username = trim($formvalues['username']);
		// debugMessage($formvalues);
		$user = new UserAccount();
		if(!isArrayKeyAnEmptyString('userid', $formvalues)){
			$user->populate($formvalues['userid']);
		}
		if($user->usernameExists($username)){
			echo '1';
		} else {
			echo '0';
		}
		
	}
	
	function checkemailAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(true);
	    
		$formvalues = $this->_getAllParams();
		$email = trim($formvalues['email']);
		// debugMessage($formvalues);
		$user = new UserAccount();
		if(!isArrayKeyAnEmptyString('userid', $formvalues)){
			$user->populate($formvalues['userid']);
		}
		if($user->emailExists($email)){
			echo '1';
		} else {
			echo '0';
		}
	}
	
	function checkphoneAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(true);
	    
		$formvalues = $this->_getAllParams();
		$phone = trim($formvalues['phone']);
		// debugMessage($formvalues);
		$user = new UserAccount();
		if(!isArrayKeyAnEmptyString('userid', $formvalues)){
			$user->populate($formvalues['userid']);
		}
		if($user->phoneExists(getFullPhone($phone))){
			echo '1';
		} else {
			echo '0';
		}
	}
	
	function pricingAction(){
		
	}
}
