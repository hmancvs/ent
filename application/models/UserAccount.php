<?php

class UserAccount extends BaseEntity {
	
	public function setTableDefinition() {
		#add the table definitions from the parent table
		parent::setTableDefinition();
		
		$this->setTableName('useraccount');
		$this->hasColumn('type', 'integer', null, array('notblank' => true));
		$this->hasColumn('firstname', 'string', 255, array('notblank' => true));
		$this->hasColumn('lastname', 'string', 255, array('notblank' => true));
		$this->hasColumn('othernames', 'string', 255);
		$this->hasColumn('initial', 'string', 6);
		$this->hasColumn('password', 'string', 50);
		$this->hasColumn('trx', 'string', 50);
		$this->hasColumn('email', 'string', 50/*, array('notnull' => true, 'notblank' => true)*/);
		$this->hasColumn('email2', 'string', 50);
		$this->hasColumn('username', 'string', 15/*, array('notnull' => true, 'notblank' => true)*/);
		$this->hasColumn('home', 'string', 15);
		$this->hasColumn('work', 'string', 15);
		$this->hasColumn('cell', 'string', 15);
		$this->hasColumn('ext', 'string', 6);
		$this->hasColumn('ssn', 'string', 15);
		
		$this->hasColumn('gender', 'integer', null); # 1=Male, 2=Female, 3=Unknown
		$this->hasColumn('dateofbirth','date');
		$this->hasColumn('isactive', 'integer', null, array('default' => '0')); # 0=noactivated, 1=active, 2=deactivated
		$this->hasColumn('activationkey', 'string', 15);
		$this->hasColumn('activationdate', 'date');
		$this->hasColumn('agreedtoterms', 'integer', null, array('default' => '0'));	# 0=NO, 1=YES
		$this->hasColumn('notes', 'string', 1000);
		$this->hasColumn('securityquestion', 'integer', null);
		$this->hasColumn('securityanswer', 'integer', null);
		$this->hasColumn('bio', 'string', 1000);
		$this->hasColumn('profilephoto', 'string', 50);
		
		$this->hasColumn('country', 'string', 2, array('default' => 'US'));
		$this->hasColumn('state', 'string', 2, array('default' => 'NJ'));
		$this->hasColumn('city', 'string', 50);
		$this->hasColumn('county', 'integer', null);
		$this->hasColumn('zipcode', 'string', 15);
		$this->hasColumn('addressline1', 'string', 255);
		$this->hasColumn('addressline2', 'string', 255);
		
		$this->hasColumn('isinvited', 'integer', null, array('default' => NULL));
		$this->hasColumn('invitedbyid', 'integer', null);
		$this->hasColumn('hasacceptedinvite', 'integer', null, array('default' => 0));
		$this->hasColumn('dateinvited','date');
		
		# override the not null and not blank properties for the createdby column in the BaseEntity
		$this->hasColumn('createdby', 'integer', 11);
	}
	
	protected $oldpassword;
	protected $newpassword;
	protected $confirmpassword;
	protected $trx;
	protected $oldemail;
	protected $changeemail;
	protected $isinvited;
	protected $isphoneinvited;
	
	function getOldPassword(){
		return $this->oldpassword;
	}
	function setOldPassword($oldpassword) {
		$this->oldpassword = $oldpassword;
	}
	function getNewPassword(){
		return $this->newpassword;
	}
	function setNewPassword($newpassword) {
		$this->newpassword = $newpassword;
	}
	function getConfirmPassword(){
		return $this->confirmpassword;
	}
	function setConfirmPassword($confirmpassword) {
		$this->confirmpassword = $confirmpassword;
	}
	function getTrx(){
		return $this->trx;
	}
	function setTrx($trx) {
		$this->trx = $trx;
	}
	function getOldEmail(){
		return $this->oldemail;
	}
	function setOldEmail($oldemail) {
		$this->oldemail = $oldemail;
	}
	function getChangeEmail(){
		return $this->changeemail;
	}
	function setChangeEmail($changeemail) {
		$this->changeemail = $changeemail;
	}
	function getIsinvited(){
		return $this->isinvited;
	}
	function setIsinvited($isinvited) {
		$this->isinvited = $isinvited;
	}
	
	# Contructor method for custom initialization
	public function construct() {
		parent::construct();
		
		$this->addDateFields(array("dateofbirth","activationdate","dateinvited"));
		
		# set the custom error messages
       	$this->addCustomErrorMessages(array(
       									"type.notblank" => $this->translate->_("profile_type_error"),
       									"firstname.notblank" => $this->translate->_("profile_firstname_error"),
       									"lastname.notblank" => $this->translate->_("profile_lastname_error")
       	       						));
	}
	
	# Model relationships
	public function setUp() {
		parent::setUp(); 
		# copied directly from BaseEntity since the createdby can be NULL when a user signs up 
		# automatically set timestamp column values for datecreated and lastupdatedate 
		$this->actAs('Timestampable', 
						array('created' => array(
												'name' => 'datecreated'
											),
							 'updated' => array(
												'name'     =>  'lastupdatedate',    
												'onInsert' => false,
												'options'  =>  array('notnull' => false)
											)
						)
					);
		$this->hasMany('UserGroup as usergroups',
							array('local' => 'id',
									'foreign' => 'userid'
							)
						);
		$this->hasOne('UserAccount as creator', 
								array(
									'local' => 'createdby',
									'foreign' => 'id'
								)
						);
		$this->hasOne('UserAccount as invitedby', 
								array(
									'local' => 'invitedbyid',
									'foreign' => 'id',
								)
						);
	}
	/**
	 * Custom model validation
	 */
	function validate() {
		# execute the column validation 
		parent::validate();
		// debugMessage($this->toArray(true));
		# validate that username is unique
		if($this->usernameExists()){
			$this->getErrorStack()->add("username.unique", sprintf($this->translate->_("profile_username_unique_error"), $this->getUsername()));	
		}
		# validate that email is unique
		if($this->emailExists()){
			$this->getErrorStack()->add("email.unique", sprintf($this->translate->_("profile_email_unique_error"), $this->getEmail()));
		}
		
		# check that at least one group has been specified
		if ($this->getUserGroups()->count() == 0) {
			$this->getErrorStack()->add("groups", $this->translate->_("profile_group_error"));
		}
		
		# validate attempt to change password with an invalid current password
		if(!isEmptyString($this->getNewPassword())){
			if(!isEmptyString($this->getOldPassword()) && sha1($this->getOldPassword()) != $this->getTrx()){
				$this->getErrorStack()->add("oldpassword", $this->translate->_("profile_oldpassword_invalid_error"));
			} else {
				$this->setPassword(sha1($this->getNewPassword()));
			}
		}
	}
	# determine if the username has already been assigned
	function usernameExists($username =''){
		$conn = Doctrine_Manager::connection();
		# validate unique username and email
		$id_check = "";
		if(!isEmptyString($this->getID())){
			$id_check = " AND id <> '".$this->getID()."' ";
		}
		
		if(isEmptyString($username)){
			$username = $this->getUsername();
		}
		$query = "SELECT id FROM useraccount WHERE username = '".$username."' AND username <> '' ".$id_check;
		// debugMessage($query);
		$result = $conn->fetchOne($query);
		// debugMessage($result);
		if(isEmptyString($result)){
			return false;
		}
		return true;
	}
	# determine if the email has already been assigned
	function emailExists($email =''){
		$conn = Doctrine_Manager::connection();
		# validate unique username and email
		$id_check = "";
		if(!isEmptyString($this->getID())){
			$id_check = " AND id <> '".$this->getID()."' ";
		}
		
		if(isEmptyString($email)){
			$email = $this->getEmail();
		}
		$query = "SELECT id FROM useraccount WHERE email = '".$email."' AND email <> '' ".$id_check;
		// debugMessage($ref_query);
		$result = $conn->fetchOne($query);
		// debugMessage($ref_result);
		if(isEmptyString($result)){
			return false;
		}
		return true;
	}
	/**
	 * Preprocess model data
	 */
	function processPost($formvalues){
		$session = SessionWrapper::getInstance();
		# if the passwords are not changed , set value to null
		if(isArrayKeyAnEmptyString('password', $formvalues)){
			unset($formvalues['password']); 
		} else {
			$formvalues['password'] = sha1($formvalues['password']); 
		}
		if(!isArrayKeyAnEmptyString('oldpassword', $formvalues)){
			$this->setoldpassword($formvalues['oldpassword']);
		}
		if(!isArrayKeyAnEmptyString('confirmpassword', $formvalues)){
			$this->setconfirmpassword($formvalues['confirmpassword']);
		}
		if(!isArrayKeyAnEmptyString('trx', $formvalues)){
			$this->settrx($formvalues['trx']);
		}
		if(!isArrayKeyAnEmptyString('newpassword', $formvalues)){
			$this->setNewPassword($formvalues['newpassword']);
			$formvalues['password'] = sha1($formvalues['newpassword']); 
		}
		/*if(!isArrayKeyAnEmptyString('phone', $formvalues)){
			$formvalues['phone'] = str_pad(ltrim($formvalues['phone'], '0'), 12, getCountryCode(), STR_PAD_LEFT); 
		}*/
		if(!isArrayKeyAnEmptyString('email', $formvalues) && !isArrayKeyAnEmptyString('oldemail', $formvalues) && !isArrayKeyAnEmptyString('isactive', $formvalues)){
			if($formvalues['email'] != $formvalues['oldemail'] && $session->getVar('userid') == $formvalues['id']){
				$this->setChangeEmail('1');
				$this->setOldEmail($formvalues['oldemail']);
				$formvalues['email2'] = $formvalues['email'];
				$formvalues['email'] = $formvalues['oldemail'];
				$formvalues['activationkey'] = $this->generateActivationKey();
			}
		}
		# force setting of default none string column values. enum, int and date 	
		if(isArrayKeyAnEmptyString('isactive', $formvalues)){
			unset($formvalues['isactive']); 
		}
		if(isArrayKeyAnEmptyString('agreedtoterms', $formvalues)){
			unset($formvalues['agreedtoterms']); 
		}
		if(isArrayKeyAnEmptyString('gender', $formvalues)){
			unset($formvalues['gender']); 
		}
		if(isArrayKeyAnEmptyString('dateofbirth', $formvalues)){
			unset($formvalues['dateofbirth']);
		}
		if(isArrayKeyAnEmptyString('activationdate', $formvalues)){
			unset($formvalues['activationdate']); 
		}
		if(isArrayKeyAnEmptyString('type', $formvalues)){
			unset($formvalues['type']); 
		}
		if(isArrayKeyAnEmptyString('isinvited', $formvalues)){
			$formvalues['isinvited'] = NULL;
		}
		if(isArrayKeyAnEmptyString('hasacceptedinvite', $formvalues)){
			$formvalues['hasacceptedinvite'] = NULL; 
		}
		if(isArrayKeyAnEmptyString('dateinvited', $formvalues)){
			unset($formvalues['dateinvited']); 
		}
		if(!isArrayKeyAnEmptyString('isinvited', $formvalues)){
			if($formvalues['isinvited'] == 1){
				$formvalues['invitedbyid'] = $session->getVar('userid');
				$formvalues['dateinvited'] = date('Y-m-d');
				$formvalues['hasacceptedinvite'] = 0;
			}
		}
		if(isArrayKeyAnEmptyString('county', $formvalues)){
			if(isArrayKeyAnEmptyString('county_old', $formvalues)){
				unset($formvalues['county']);
			} else {
				$formvalues['county'] = NULL;
			}
		}
		
		# move the data from $formvalues['usergroups_groupid'] into $formvalues['usergroups'] array
		# the key for each group has to be the groupid
		if(isArrayKeyAnEmptyString('id', $formvalues)) {
			if(!isArrayKeyAnEmptyString('type', $formvalues)) {
				if(!isArrayKeyAnEmptyString('type', $formvalues)) {
					$formvalues['usergroups_groupid'] = array($formvalues['type']);
				}
				if(isArrayKeyAnEmptyString('createdby', $formvalues)) {
					$formvalues['createdby'] = DEFAULT_ID;
				}
				$formvalues['activationkey'] = $this->generateActivationKey();
			}
		}
		
		if (array_key_exists('usergroups_groupid', $formvalues)) {
			$groupids = $formvalues['usergroups_groupid']; 
			$usergroups = array(); 
			foreach ($groupids as $id) {
				$usergroups[]['groupid'] = $id; 
			}
			$formvalues['usergroups'] = $usergroups; 
			# remove the usergroups_groupid array, it will be ignored, but to be on the safe side
			unset($formvalues['usergroups_groupid']); 
		}
		
		# add the userid if the useraccount is being edited
		if (!isArrayKeyAnEmptyString('id', $formvalues)) {
			if (array_key_exists('usergroups', $formvalues)) {
				$usergroups = $formvalues['usergroups']; 
				foreach ($usergroups as $key=>$value) {
					$formvalues['usergroups'][$key]["userid"] = $formvalues["id"];
					if(!isArrayKeyAnEmptyString('type', $formvalues)){
						$formvalues['usergroups'][$key]["groupid"] = $formvalues['type'];
					}
				}
			} 
		}
		
		// debugMessage($formvalues); exit();
		parent::processPost($formvalues);
	}
	/*
	 * Custom save logic
	 */
	function transactionSave(){
		$conn = Doctrine_Manager::connection();
		$session = SessionWrapper::getInstance();
		
		# begin transaction to save
		try {
			$conn->beginTransaction();
			# initial save
			$this->save();
				
			# commit changes
			$conn->commit();
		} catch(Exception $e){
			$conn->rollback();
			// debugMessage('Error is '.$e->getMessage());
			throw new Exception($e->getMessage());
		}
		
		// find any duplicates and delete them
		$duplicates = $this->getDuplicates();
		if($duplicates->count() > 0){
			$duplicates->delete();
		}
		
		// invite via email
		if($this->getIsinvited() == 1){
			$this->inviteViaEmail();
		}
		
		return true;
	}
# update after
	function afterUpdate(){
		$session = SessionWrapper::getInstance();
		// invite via email
	 	if($this->getIsinvited() == 1){
	 		$this->inviteViaEmail();
        }
       	 
        return true;
	}
	# find duplicates after save
	function getDuplicates(){
		$q = Doctrine_Query::create()->from('UserAccount u')->where("u.email = '".$this->getEmail()."' AND u.username = '".$this->getUserName()."' AND u.id <> '".$this->getID()."' ");
		
		$result = $q->execute();
		return $result;
	}
	# invite user to activate via email
	function inviteViaEmail(){
		$session = SessionWrapper::getInstance();
		if($this->sendProfileInvitationNotification()){
			$session->setVar('invitesuccess', "Email Invitation sent to ".$this->getEmail());
		}
	
		return true;
	}
	/**
	 * Reset the password for  the user. All checks and validations have been completed
	 * 
	 * @param String $newpassword The new password. If the new password is not defined, a new random password is generated
	 *
	 * @return Boolean TRUE if the password is changed, FALSE if it fails to change the user's password.
	 */
	 function resetPassword($newpassword = "") {
	 	# check if the password is empty 
	 	if (isEmptyString($newpassword)) {
	 		# generate a new random password
	 		$newpassword = $this->generatePassword(); 
	 	}
	 	return $this->changePassword($newpassword); 
	}
	/**
	 * Change the password for the user. All checks and validations have been completed
	 * 
	 * @param String $providedpassword The password provided on the screen
	 * @param String $newpassword The new password
	 *
	 * @return TRUE if the password is changed, FAlSE if it fails to change the user's password.
	 */
	function changePassword($newpassword){
		// now change the password
		$this->setPassword(sha1($newpassword));
		$this->setActivationKey('');
      	
      	try {
      		$this->save();
      		# Log to audit trail that a password has been changed.
			$audit_values = array("transactiontype" => USER_CHANGE_PASSWORD, "userid" => $this->getID(), "executedby" => $this->getID(), "success" => 'Y');
			$audit_values['transactiondetails'] = $this->getName()." changed account password";
			// $this->notify(new sfEvent($this, USER_CHANGE_PASSWORD, $audit_values));
      	
      	} catch (Exception $e){
      		# Log to audit trail that user has failed to change password
			$audit_values = array("transactiontype" => USER_CHANGE_PASSWORD, "userid" => $this->getID(), "executedby" => $this->getID(), "success" => 'N');
			$audit_values['transactiondetails'] = $this->getName()." failed to change account password". $e->getMessage();
			// $this->notify(new sfEvent($this, USER_CHANGE_PASSWORD, $audit_values));
      	}
		return true;
	}
	/*
	 * Reset the user's password and send a notification to complete the recovery  
	 *
	 * @return Boolean TRUE if resetting is successful and FALSE if emailaddress security questions and answer is invalid or has no record in the database
	 */
	function recoverPassword() {
      // save to the audit trail
		$audit_values = array("transactiontype" => USER_RECOVER_PASSWORD); 
		// set the updater of the account only when specified
		if (!isEmptyString($this->getLastUpdatedBy())) {
			$audit_values['executedby'] = $this->getLastUpdatedBy();
		}
		
		# check that the user's email exists and that they are signed up
		/*if(!$this->findByEmail($this->getEmail())){
			$audit_values['transactiondetails'] = "Recovery of password for '".$this->getEmail()."' failed - user not found";
			// $this->notify(new sfEvent($this, USER_RECOVER_PASSWORD, $audit_values));
			return false;
		}*/
			
		# reset the password and set the next password change date
		$this->setActivationKey($this->generateActivationKey());
		# save the activation key for the user 
		$this->save();
		
		# Send the user the reset password email
		$this->sendRecoverPasswordEmail();
		
		// save the audit trail record
		// the transaction details is the email address being used to
		$audit_values['userid'] = $this->getID(); 
		$audit_values['transactiondetails'] = "Password Recovery link for '".$this->getEmail()."' sent to '".$this->getEmail()."'";
		$audit_values['success'] = 'Y';
		// s$this->notify(new sfEvent($this, USER_RECOVER_PASSWORD, $audit_values));
		
		return true;
	}
	/**
	 * Send an email with a link to activate the members' account
	 */
	function sendRecoverPasswordEmail() {
		$session = SessionWrapper::getInstance(); 
		$template = new EmailTemplate(); 
		// create mail object
		$mail = getMailInstance(); 

		// assign values
		$template->assign('firstname', $this->getFirstName());
		// just send the parameters for the activationurl, the actual url will be built in the view 
		// $template->assign('resetpasswordurl', array("controller"=> "user","action"=> "resetpassword", "actkey" => $this->getActivationKey(), "id" => encode($this->getID())));
		$viewurl = $template->serverUrl($template->baseUrl('user/resetpassword/id/'.encode($this->getID())."/actkey/".$this->getActivationKey()."/")); 
		$template->assign('resetpasswordurl', $viewurl);
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		
		// configure base stuff
		$mail->addTo($this->getEmail());
		// set the send of the email address
		$mail->setFrom($this->config->notification->emailmessagesender, $this->config->notification->notificationsendername);
		
		$mail->setSubject($this->translate->_('profile_email_subject_recoverpassword'));
		// render the view as the body of the email
		$mail->setBodyHtml($template->render('recoverpassword.phtml'));
		// debugMessage($template->render('recoverpassword.phtml')); 
		try {
			$mail->send();
		} catch (Exception $e) {
			$session->setVar(ERROR_MESSAGE, 'Email notification not sent! '.$e->getMessage());
		}
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		$mail->clearFrom();
		
		return true;
   }
   /**
    * Process the activation key from the activation email
    * 
    * @param $actkey The activation key 
    * 
    * @return bool TRUE if the signup process completes successfully, false if activation key is invalid or save fails
    */
   function activateAccount($actkey, $acttype = false) {
   		# save to the audit trail
		$isphoneactivation = $acttype;
		# validate the activation key 
		if($this->getActivationKey() != $actkey){
			// debugMessage('failed');
			# Log to audit trail when an invalid activation key is used to activate account
			$audit_values = array("executedby" => $this->getID(), "transactiontype" => USER_SIGNUP, "success" => "N");
			$audit_values["transactiondetails"] = "Invalid Activation Code specified for User(".$this->getID().") (".$this->getEmail()."). "; 
			// $this->notify(new sfEvent($this, USER_SIGNUP, $audit_values));
			$this->getErrorStack()->add("user.activationkey", $this->translate->_("profile_invalid_actkey_error"));
			return false;
		}
		
		# set active to true and blank out activation key
		$this->setIsActive(1);		
		$this->setActivationKey("");
		$startdate = date("Y-m-d H:i:s");
		$this->setActivationDate($startdate);
		
		# save
		try {
			$this->save();
			
			# if user activated via phone. automatically set thier phone as validated.
			if($isphoneactivation){
				# activate account
				$this->activatePhone(1);
				# send confirmation to mobile
				$this->sendSignupConfirmationToMobile();
			}
			
			# Add to audittrail that a new user has been activated.
			$audit_values = array("executedby" => $this->getID(), "transactiontype" => USER_SIGNUP, "success" => "Y");
			$audit_values["transactiondetails"] = $this->getID()." (".$this->getEmail().") has completed the sign up process"; 
			// $this->notify(new sfEvent($this, USER_SIGNUP, $audit_values));
		
			return true;
			
		} catch (Exception $e){
			$this->getErrorStack()->add("user.activation", $this->translate->_("profile_activation_error"));
			$this->logger->err("Error activating useraccount ".$this->getEmail()." ".$e->getMessage());
			// debugMessage($e->getMessage());
			# log to audit trail when an error occurs in updating payee details on user account
			$audit_values = array("executedby" => $this->getID(), "transactiontype" => USER_SIGNUP, "success" => "N");
			$audit_values["transactiondetails"] = "An error occured in activating account for User(".$this->getID().") (".$this->getEmail()."): ".$e->getMessage(); 
			// $this->notify(new sfEvent($this, USER_SIGNUP, $audit_values));
			return false;
		}
   	}
   
	/**
    * Process the deactivation for an agent
    * 
    * @param $actkey The activation key 
    * 
    * @return bool TRUE if the signup process completes successfully, false if activation key is invalid or save fails
    */
   function deactivateAccount($status = 0) {
   		# save to the audit trail
   		
		# set active to true and blank out activation key
		$this->setIsActive($status);		
		$this->setActivationKey('');
		// $this->setActivationDate(NULL);
		if($this->getusergroups()->count() == 0){
			$this->getusergroups()->get(1)->setUserID($this->getID());
			$this->getusergroups()->get(1)->setGroupID($this->getType());
		}
		
		$this->save();
		
		return true;
   }
	/**
	 * Send a notification to agent that their account will be approved shortly
	 * 
	 * @return bool whether or not the signup notification email has been sent
	 *
	 */
	function sendSignupNotification() {
		$session = SessionWrapper::getInstance(); 
		$template = new EmailTemplate(); 
		# create mail object
		$mail = getMailInstance(); 

		# assign values
		$template->assign('firstname', $this->getFirstName());
		$viewurl = $template->serverUrl($template->baseUrl('signup/activate/id/'.encode($this->getID())."/actkey/".$this->getActivationKey()."/")); 
		$template->assign('activationurl', $viewurl);
		$template->assign('usertype', 2);
				
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		
		# configure base stuff
		$mail->addTo($this->getEmail(), $this->getName());
		# set the send of the email address
		$subject = sprintf($this->translate->_('profile_email_subject_signup'), getAppName());
		$mail->setFrom($this->config->notification->emailmessagesender, $this->config->notification->notificationsendername);
		
		$mail->setSubject($subject);
		# render the view as the body of the email
		$mail->setBodyHtml($template->render('signupnotification.phtml'));
		// debugMessage($template->render('signupnotification.phtml')); // exit();
		
		try {
			$mail->send();
		} catch (Exception $e) {
			$session->setVar(ERROR_MESSAGE, 'Email notification not sent! '.$e->getMessage());
		}
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		$mail->clearFrom();
		
		return true;
	}
	# set activation code to change user's email
	function triggerEmailChange($newemail) {
		$this->setActivationKey($this->generateActivationKey());
		$this->setTempEmail($newemail);
		$this->save();
		$this->sendNewEmailActivation();
		return true;
	}
	
	# send new email change confirmation
	function sendNewEmailActivation() {
		$session = SessionWrapper::getInstance(); 
		$template = new EmailTemplate(); 
		# create mail object
		$mail = getMailInstance();
		$view = new Zend_View();
		
		// assign values
		$template->assign('firstname', $this->getFirstName());
		$template->assign('newemail', $this->getTempEmail());
		$viewurl = $template->serverUrl($template->baseUrl('profile/newemail/id/'.encode($this->getID()).'/actkey/'.$this->getActivationKey())); 
		$template->assign('activationurl', $viewurl);
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		
		// configure base stuff
		$mail->addTo($this->getEmail(), $this->getName());
		// set the send of the email address
		$mail->setFrom($this->config->notification->emailmessagesender, $this->config->notification->notificationsendername);
		
		$mail->setSubject($this->translate->_('profile_email_subject_changeemail'));
		// render the view as the body of the email
		$mail->setBodyHtml($template->render('emailchangenotification.phtml'));
		// debugMessage($template->render('emailchangenotification.phtml')); exit();
		try {
			$mail->send();
		} catch (Exception $e) {
			$session->setVar(ERROR_MESSAGE, 'Email notification not sent! '.$e->getMessage());
		}
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		$mail->clearFrom();
		
		return true;
	}
	/**
	 * Send a notification to agent that their account will be approved shortly
	 * 
	 * @return bool whether or not the signup notification email has been sent
	 *
	 */
	function sendDeactivateNotification() {
		$session = SessionWrapper::getInstance(); 
		$template = new EmailTemplate(); 
		# create mail object
		$mail = getMailInstance(); 

		// assign values
		$template->assign('firstname', $this->getFirstName());
		// $template->assign('activationurl', array("action"=> "activate", "actkey" => $this->getActivationKey(), "id" => encode($this->getID())));
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		
		// configure base stuff
		$mail->addTo($this->getEmail(), $this->getName());
		// set the send of the email address
		$mail->setFrom($this->config->notification->emailmessagesender, $this->config->notification->notificationsendername);
		
		$mail->setSubject("Account Deactivation");
		// render the view as the body of the email
		$mail->setBodyHtml($template->render('accountdeactivationconfirmation.phtml'));
		// debugMessage($template->render('accountdeactivationconfirmation.phtml')); // exit();
		try {
			$mail->send();
		} catch (Exception $e) {
			$session->setVar(ERROR_MESSAGE, 'Email notification not sent! '.$e->getMessage());
		}
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		$mail->clearFrom();
		
		return true;
	}
	# change email notification to new address
	function sendNewEmailNotification($newemail) {
		$session = SessionWrapper::getInstance(); 
		$template = new EmailTemplate(); 
		# create mail object
		$mail = getMailInstance(); 
		
		// assign values
		$template->assign('firstname', $this->getFirstName());
		$template->assign('fromemail', $this->getEmail());
		$template->assign('toemail', $newemail);
		$template->assign('code', $this->getActivationKey());
		$viewurl = $template->serverUrl($template->baseUrl('profile/changeemail/id/'.encode($this->getID())."/actkey/".$this->getActivationKey()."/ref/".encode($newemail)."/"));
		$template->assign('activationurl', $viewurl);
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		
		// configure base stuff
		$mail->addTo($newemail, $this->getName());
		// set the send of the email address
		$mail->setFrom($this->config->notification->emailmessagesender, $this->config->notification->notificationsendername);
		
		$mail->setSubject("Email Change Request");
		// render the view as the body of the email
		$mail->setBodyHtml($template->render('changeemail_newnotification.phtml'));
		// debugMessage($template->render('changeemail_newnotification.phtml')); exit();
		try {
			$mail->send();
		} catch (Exception $e) {
			$session->setVar(ERROR_MESSAGE, 'Email notification not sent! '.$e->getMessage());
		}
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		$mail->clearFrom();
		
		return true;
	}
	
	# change email notification to old address
	function sendOldEmailNotification($newemail) {
		$session = SessionWrapper::getInstance(); 
		$template = new EmailTemplate(); 
		# create mail object
		$mail = getMailInstance(); 
		
		// assign values
		$template->assign('firstname', $this->getFirstName());
		$template->assign('fromemail', $this->getEmail());
		$template->assign('toemail', $newemail);
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		
		// configure base stuff
		$mail->addTo($this->getEmail(), $this->getName());
		// set the send of the email address
		$mail->setFrom($this->config->notification->emailmessagesender, $this->config->notification->notificationsendername);
		
		$mail->setSubject("Email Change Request");
		// render the view as the body of the email
		$mail->setBodyHtml($template->render('changeemail_oldnotification.phtml'));
		// debugMessage($template->render('changeemail_oldnotification.phtml')); //exit();
		try {
			$mail->send();
		} catch (Exception $e) {
			$session->setVar(ERROR_MESSAGE, 'Email notification not sent! '.$e->getMessage());
		}
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		$mail->clearFrom();
		
		return true;
	}
	
	# Send notification to invite person to create an account
	function sendProfileInvitationNotification() {
		$session = SessionWrapper::getInstance(); 
		$template = new EmailTemplate(); 
		# create mail object
		$mail = getMailInstance();
		$view = new Zend_View(); 

		// assign values
		$template->assign('firstname', isEmptyString($this->getFirstName()) ? 'Friend' : $this->getFirstName());
		$template->assign('inviter', $this->getInvitedBy()->getName());
		// the actual url will be built in the view
		$viewurl = $template->serverUrl($template->baseUrl('signup/index/id/'.encode($this->getID())."/")); 
		$template->assign('invitelink', $viewurl);
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		
		// configure base stuff
		$mail->addTo($this->getEmail(), $this->getName());
		// set the send of the email address
		$mail->setFrom($this->config->notification->emailmessagesender, $this->config->notification->notificationsendername);
		
		$mail->setSubject(sprintf($this->translate->_('profile_email_subject_invite_user'), getAppName()));
		// render the view as the body of the email
		$mail->setBodyHtml($template->render('invitenotification.phtml'));
		// debugMessage($template->render('invitenotification.phtml')); exit();
		
		try {
			$mail->send();
		} catch (Exception $e) {
			$session->setVar(ERROR_MESSAGE, 'Email notification not sent! '.$e->getMessage());
		}
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		$mail->clearFrom();
		
		return true;
	}
	/**
	 * Generate a new password incase a user wants a new password
	 * 
	 * @return String a random password 
	 */
    function generatePassword() {
		return $this->generateRandomString($this->config->password->passwordminlength);
    }
	/**
	 * Generate a 10 digit activation key  
	 * 
	 * @return String An activation key
	 */
    function generateActivationKey() {
		return substr(md5(uniqid(mt_rand(), 1)), 0, 6);
    }
   /**
    * Find a user account either by their email address 
    * 
    * @param String $email The email
    * @return UserAccount or FALSE if the user with the specified email does not exist 
    */
	function findByEmail($email) {
		# query active user details using email
		$q = Doctrine_Query::create()->from('UserAccount u')->where('u.email = ?', $email);
		$result = $q->fetchOne(); 
		
		# check if the user exists 
		if(!$result){
			# user with specified email does not exist, therefore is valid
			$this->getErrorStack()->add("user.invalid", $this->translate->_("profile_user_invalid_error"));
			return false;
		}
		
		$data = $result->toArray(); 

		# merge all the data including the user groups 
		$this->merge($data);
		# also assign the identifier for the object so that it can be updated
		$this->assignIdentifier($data['id']); 
		
		return true; 
	}
	# find user by email
	function populateByEmail($email) {
		# query active user details using email
		$q = Doctrine_Query::create()->from('UserAccount u')->where('u.email = ?', $email);
		$result = $q->fetchOne(); 
		
		# check if the user exists 
		if(!$result){
			$result = new UserAccount();
		}
		
		return $result; 
	}
	function findByUsername($username) {
		# query active user details using email
		$q = Doctrine_Query::create()->from('UserAccount u')->where('u.username = ?', $username);
		$result = $q->fetchOne(); 
		
		if($result){
			$data = $result->toArray(); 
		} else {
			$data = $this->toArray(); 
		}
		
		# merge all the data including the user groups 
		$this->merge($data);
		# also assign the identifier for the object so that it can be updated
		if($result){
			$this->assignIdentifier($data['id']);
		} 
		
		return true; 
	}
	/**
	 * Return the user's full names, which is a concatenation of the first and last names
	 *
	 * @return String The full name of the user
	 */
	function getName() {
		return $this->getFirstName()." ".$this->getLastName();
	}
	# function to determine the user's profile path
	function getProfilePath() {
		$path = "";
		$view = new Zend_View();
		// $path = '<a href="'.$view->serverUrl($view->baseUrl('user/'.strtolower($this->getUserName()))).'">'.$view->serverUrl($view->baseUrl('user/'.strtolower($this->getUserName()))).'</a>';
		$path = '<a href="javascript: void(0)">'.$view->serverUrl($view->baseUrl('user/'.strtolower($this->getUserName()))).'</a>';
		return $path;
	}
	/*
	 * TODO Put proper comments
	 */
	function generateRandomString($length) {
		$rand_array = array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9");
		$rand_id = "";
		for ($i = 0; $i <= $length; $i++) {
			$rand_id .= $rand_array[rand(0, 35)];
		}
		return $rand_id;
	}
 	/**
     * Return an array containing the IDs of the groups that the user belongs to
     *
     * @return Array of the IDs of the groups that the user belongs to
     */
    function getGroupIDs() {
        $ids = array();
        $groups = $this->getUserGroups();
        //debugMessage($groups->toArray());
        foreach($groups as $thegroup) {
            $ids[] = $thegroup->getGroupID();
        }
        return $ids;
    }
    /**
     * Display a list of groups that the user belongs
     *
     * @return String HTML list of the groups that the user belongs to
     */
    function displayGroups() {
        $groups = $this->getUserGroups();
        $str = "";
        if ($groups->count() == 0) {
            return $str;
        }
        $str .= '<ul class="list">';
        foreach($groups as $thegroup) {
            $str .= "<li>".$thegroup->getGroup()->getName()."</li>"; 
        }
        $str .= "</ul>";
        return $str; 
    }
	
	/**
     * Determine the gender strinig of a person
     * @return String the gender
     */
    function getGenderLabel(){
    	if($this->isMale()){
			return 'Male';
		}
		if($this->isFemale()){		
			return 'Female';
		}
		return '';
    }
 	/**
     * Determine if a person is male
     * @return bool
     */
    function isMale(){
    	return $this->getGender() == '1' ? true : false; 
    }
	/**
     * Determine if a person is female
     * @return bool
     */
    function isFemale(){
    	return $this->getGender() == '2' ? true : false; 
    }
    
	# Determine gender text depending on the gender
	function getGenderText(){
		if($this->isMale()){
			return 'Male';
		}
		if($this->isFemale()){		
			return 'Female';
		}
		if($this->getGender() == 3){
			return 'Transgender';
		}
		return '';
	}
	# Determine if user profile has been activated
	function isActivated(){
		return $this->getIsActive() == 1;
	}
	# Determine if user has accepted terms
	function hasAcceptedTerms(){
		return $this->getAgreedToTerms() == 1;
	}
    # Determine if user is active	 
	function isUserActive() {
		return $this->getIsActive() == 1;
	}
	# determine text to display depending on the status of the user
	function getStatusLabel(){
		return $this->getIsActive() == 1 ? 'Active' : 'Inactive';
	}
    # Determine if user is deactivated
	function isUserInActive() {
		return $this->getIsActive() == 0 ? true : false;
	}
	# determine if user has been pending
	function isPending() {
		return $this->getIsActive() == 1 ? true : false;
	}
	# determine if user has been deactivated
	function isDeactivated() {
		return $this->getIsActive() == 2 ? true : false;
	}
	# determine if is an admin
	function isAdmin(){
    	return $this->getType() == 1 ? true : false; 
    }
	# determine if is a subscriber
	function isCoach(){
    	return $this->getType() == 2 ? true : false; 
    }
	function isDataClerk(){
    	return $this->getType() == 3 ? true : false; 
    }
	# determine if a department
	function isManageer(){
    	return $this->getType() == 4 ? true : false; 
    }
    # determine if person has not been invited
    function hasNotBeenInvited() {
    	return $this->getIsInvited() == 0 ? true : false;
    }
    # determine if person has been invited
    function hasBeenInvited() {
    	return $this->getIsInvited() == 1 ? true : false;
    }
    function hasAcceptedInvitation() {
    	return $this->getHasAcceptedInvite() == 1 ? true : false;
    }
    # determine if user has pending activation
    function hasPendingActivation() {
   		return $this->isUserInActive() && !isEmptyString($this->getInvitedByID()) ? true : false;
    }
	/**
	 * Return the date of birth 
	 * @return string dateofbirth 
	 */
	function getBirthDateFormatted() {
		$birth = "--";
		if(!isEmptyString($this->getDateOfBirth())){
			$birth = changeMySQLDateToPageFormat($this->getDateOfBirth());
		} 
		return $birth;
	}
	
	# relative path to profile image
	function hasProfileImage(){
		$real_path = APPLICATION_PATH.DIRECTORY_SEPARATOR."..".DIRECTORY_SEPARATOR."public".DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."users".DIRECTORY_SEPARATOR."user_";
		$real_path = $real_path.$this->getID().DIRECTORY_SEPARATOR."avatar".DIRECTORY_SEPARATOR."medium_".$this->getProfilePhoto();
		// debugMessage($real_path);
		if(file_exists($real_path) && !isEmptyString($this->getProfilePhoto())){
			return true;
		}
		return false;
	}
	# determine if person has profile image
	function getRelativeProfilePicturePath(){
		$real_path = APPLICATION_PATH.DIRECTORY_SEPARATOR."..".DIRECTORY_SEPARATOR."public".DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."users".DIRECTORY_SEPARATOR."user_";
		$real_path = $real_path.$this->getID().DIRECTORY_SEPARATOR."avatar".DIRECTORY_SEPARATOR."medium_".$this->getProfilePhoto();
		if(file_exists($real_path) && !isEmptyString($this->getProfilePhoto())){
			return $real_path;
		}
		$real_path = APPLICATION_PATH.DIRECTORY_SEPARATOR."..".DIRECTORY_SEPARATOR."public".DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."users".DIRECTORY_SEPARATOR."user_0".DIRECTORY_SEPARATOR."avatar".DIRECTORY_SEPARATOR."default_medium_male.jpg";
		if($this->isFemale()){
			$real_path = APPLICATION_PATH.DIRECTORY_SEPARATOR."..".DIRECTORY_SEPARATOR."public".DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."users".DIRECTORY_SEPARATOR."user_0".DIRECTORY_SEPARATOR."avatar".DIRECTORY_SEPARATOR."default_medium_female.jpg";
		}
		return $real_path;
	}
	
	# determine path to small profile picture
	function getSmallPicturePath() {
		$baseUrl = Zend_Controller_Front::getInstance()->getBaseUrl();
		$path = $baseUrl.'/uploads/default/default_small_male.jpg';
		if($this->isFemale()){
			$path = $baseUrl.'/uploads/default/default_small_female.jpg'; 
		}
		if($this->hasProfileImage()){
			$path = $baseUrl.'/uploads/users/user_'.$this->getID().'/avatar/small_'.$this->getProfilePhoto();
		}
		return $path;
	}
	# determine path to thumbnail profile picture
	function getThumbnailPicturePath() {
		$baseUrl = Zend_Controller_Front::getInstance()->getBaseUrl();
		$path = $baseUrl.'/uploads/default/default_thumbnail_male.jpg';
		if($this->isFemale()){
			$path = $baseUrl.'/uploads/default/default_thumbnail_female.jpg'; 
		}
		if($this->hasProfileImage()){
			$path = $baseUrl.'/uploads/users/user_'.$this->getID().'/avatar/thumbnail_'.$this->getProfilePhoto();
		}
		return $path;
	}
	# determine path to medium profile picture
	function getMediumPicturePath() {
		$baseUrl = Zend_Controller_Front::getInstance()->getBaseUrl();
		$path = "";
		$path = $baseUrl.'/uploads/default/default_medium_male.jpg';
		if($this->isFemale()){
			$path = $baseUrl.'/uploads/default/default_medium_female.jpg'; 
		}
		if($this->hasProfileImage()){
			$path = $baseUrl.'/uploads/users//user_'.$this->getID().'/avatar/medium_'.$this->getProfilePhoto();
		}
		// debugMessage($path);
		return $path;
	}
	# determine path to large profile picture
	function getLargePicturePath() {
		$baseUrl = Zend_Controller_Front::getInstance()->getBaseUrl();
		$path = $baseUrl.'/uploads/default/default_large_male.jpg';
		if($this->isFemale()){
			$path = $baseUrl.'/uploads/default/default_large_female.jpg'; 
		}
		if($this->hasProfileImage()){
			$path = $baseUrl.'/uploads/users/user_'.$this->getID().'/avatar/large_'.$this->getProfilePhoto();
		}
		# debugMessage($path);
		return $path;
	}
	/**
	 * Get the full name of the country from the two digit code
	 * 
	 * @return String The full name of the state 
	 */
	function getCountryName() {
		if(isEmptyString($this->getCountry())){
			return "--";
		}
		$countries = getCountries(); 
		return $countries[$this->getCountry()];
	}
	# invite one user to join. already existing persons
	function inviteOne() {
		$this->setDateInvited(date('Y-m-d'));
		$this->setIsInvited('1');
		$this->setHasAcceptedInvite('0');

		// debugMessage($this->toArray()); exit();
		$this->save();
		
		// send email
		$this->sendProfileInvitationNotification();
		
		return true;
	}
	/**
	 * Send notification to inform user that profile has been activated
	 * @return bool whether or not the notification email has been sent
	 */
	function sendInviteConfirmationNotification() {
		$template = new EmailTemplate(); 
		# create mail object
		$mail = getMailInstance();
		$view = new Zend_View(); 

		// assign values
		$template->assign('firstname', $this->getFirstName());
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		
		// configure base stuff
		$mail->addTo($this->getEmail(), $this->getName());
		// set the send of the email address
		$mail->setFrom($this->config->notification->emailmessagesender, $this->config->notification->notificationsendername);
		
		$subject = sprintf($this->translate->_('profile_email_subject_invite_confirmation'), getAppName());
		$mail->setSubject($subject);
		// render the view as the body of the email
		$mail->setBodyHtml($template->render('inviteconfirmation.phtml'));
		$message_contents = $template->render('signupnotification.phtml');
		// debugMessage($template->render('inviteconfirmation.phtml')); exit();
		$mail->send();
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		$mail->clearFrom();
		
		return true;
	}
	# Send contact us notification
	function sendContactNotification($dataarray) {
		$template = new EmailTemplate(); 
		# create mail object
		$mail = getMailInstance();
		$view = new Zend_View(); 
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		
		// debugMessage($first);
		// assign values
		$template->assign('name', $dataarray['name']);
		$template->assign('email', $dataarray['email']);
		$template->assign('subject', $dataarray['subject']);
		$template->assign('message', nl2br($dataarray['message']));
		
		$mail->setSubject("New Contact Us Message: ".$dataarray['subject']);
		// set the send of the email address
		$mail->setFrom($dataarray['email'], $dataarray['name']);
		
		// configure base stuff
		$mail->addTo($this->config->notification->supportemailaddress);
		// render the view as the body of the email
		$mail->setBodyHtml($template->render('contactconfirmation.phtml'));
		// debugMessage($template->render('contactconfirmation.phtml')); exit();
		$mail->send();
		
		$mail->clearRecipients();
		$mail->clearSubject();
		$mail->setBodyHtml('');
		$mail->clearFrom();
		
		return true;
	}
}
?>
