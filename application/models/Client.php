<?php

class Client extends BaseEntity {
	
	public function setTableDefinition() {
		#add the table definitions from the parent table
		parent::setTableDefinition();
		
		$this->setTableName('client');
		$this->hasColumn('firstname', 'string', 255, array('notblank' => true));
		$this->hasColumn('lastname', 'string', 255, array('notblank' => true));
		$this->hasColumn('initial', 'string', 6);
		$this->hasColumn('email', 'string', 50);
		$this->hasColumn('home', 'string', 15);
		$this->hasColumn('work', 'string', 15);
		$this->hasColumn('cell', 'string', 15);
		$this->hasColumn('ext', 'string', 6);
		# $this->hasColumn('userid', 'integer', null); # client might login at a future date 
		
		$this->hasColumn('country', 'string', 2, array('default' => 'US'));
		$this->hasColumn('state', 'string', 2, array('default' => 'NJ'));
		$this->hasColumn('city', 'string', 50);
		$this->hasColumn('county', 'integer', null);
		$this->hasColumn('zipcode', 'string', 15);
		$this->hasColumn('addressline1', 'string', 255);
		$this->hasColumn('addressline2', 'string', 255);
		
		$this->hasColumn('gender', 'integer', null); # 1=Male, 2=Female, 3=Unknown
		$this->hasColumn('dateofbirth','date', null);
		$this->hasColumn('bio', 'string', 1000);
		$this->hasColumn('profilephoto', 'string', 50);
		$this->hasColumn('ssn', 'string', 15);
		$this->hasColumn('communication', 'integer', null);
		$this->hasColumn('race', 'integer', null);
		$this->hasColumn('maritalstatus', 'integer', null);
		$this->hasColumn('housing', 'integer', null);
		$this->hasColumn('educationlevel', 'integer', null);
		$this->hasColumn('bio', 'string', 100);
		$this->hasColumn('profilephoto', 'string', 255);
		$this->hasColumn('resumefilename', 'string', 255);
		$this->hasColumn('coverletterfilename', 'string', 255);
		
		$this->hasColumn('coachid', 'integer', null); # main coach
		$this->hasColumn('programid', 'integer', null);
		$this->hasColumn('funderid', 'integer', null);
		$this->hasColumn('servicetypeid', 'integer', null);
		$this->hasColumn('initialvoucherid', 'integer', null);
		$this->hasColumn('startdate','date', null);
		$this->hasColumn('status', 'integer', null, array('default' => '1'));
		$this->hasColumn('dvrsref', 'string', 15);
		$this->hasColumn('dddref', 'string', 15);
		$this->hasColumn('dvrscounselor', 'string', 255);
		$this->hasColumn('allergies', 'string', 500);
		$this->hasColumn('iscriminal', 'integer', null);
		$this->hasColumn('criminalhistory', 'string', 1000);
		$this->hasColumn('primarydiagnosis', 'integer', null);
		$this->hasColumn('primarycause', 'integer', null);
		$this->hasColumn('secondarydiagnosis', 'integer', null);
		$this->hasColumn('secondarycause', 'integer', null);
		$this->hasColumn('needsassessment', 'string', 255);
		$this->hasColumn('employmentgoal', 'string', 255);
		
		$this->hasColumn('contactperson', 'string', 255);
		$this->hasColumn('relationship', 'string', 255);
		$this->hasColumn('contactphone', 'string', 15);
		$this->hasColumn('contactemail', 'string', 255);
	}
	
	# Contructor method for custom initialization
	public function construct() {
		parent::construct();
		
		$this->addDateFields(array("dateofbirth","startdate"));
		
		# set the custom error messages
       	$this->addCustomErrorMessages(array(
       									"firstname.notblank" => $this->translate->_("client_firstname_error"),
       									"lastname.notblank" => $this->translate->_("client_lastname_error")
       	       						));
	}
	
	# Model relationships
	public function setUp() {
		parent::setUp(); 
		
		$this->hasOne('Voucher as initialvoucher',
				array(
						'local' => 'initialvoucherid',
						'foreign' => 'id'
				)
		);
		$this->hasOne('UserAccount as user',
				array(
						'local' => 'coachid',
						'foreign' => 'id',
				)
		);
		$this->hasMany('ClientSkill as skills',
				array(
						'local' => 'id',
						'foreign' => 'clientid'
				)
		);
		$this->hasMany('Assignment as assignments',
				array(
						'local' => 'id',
						'foreign' => 'clientid'
				)
		);
		$this->hasMany('ClientHistory as history',
				array(
						'local' => 'id',
						'foreign' => 'clientid'
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
		
	}
	/**
	 * Preprocess model data
	 */
	function processPost($formvalues){
		$session = SessionWrapper::getInstance();
		// about 
		if(isArrayKeyAnEmptyString('gender', $formvalues)){
			unset($formvalues['gender']);
		}
		if(isArrayKeyAnEmptyString('dateofbirth', $formvalues)){
			unset($formvalues['dateofbirth']);
		}
		if(isArrayKeyAnEmptyString('maritalstatus', $formvalues)){
			if(isArrayKeyAnEmptyString('maritalstatus_old', $formvalues)){
				unset($formvalues['maritalstatus']);
			} else {
				$formvalues['maritalstatus'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('race', $formvalues)){
			if(isArrayKeyAnEmptyString('race_old', $formvalues)){
				unset($formvalues['race']);
			} else {
				$formvalues['race'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('educationlevel', $formvalues)){
			if(isArrayKeyAnEmptyString('educationlevel_old', $formvalues)){
				unset($formvalues['educationlevel']);
			} else {
				$formvalues['educationlevel'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('county', $formvalues)){
			if(isArrayKeyAnEmptyString('county_old', $formvalues)){
				unset($formvalues['county']);
			} else {
				$formvalues['county'] = NULL;
			}
		}
		
		// referral
		if(isArrayKeyAnEmptyString('initialvoucherid', $formvalues)){
			unset($formvalues['initialvoucherid']);
		}
		if(isArrayKeyAnEmptyString('programid', $formvalues)){
			unset($formvalues['programid']);
		}
		if(isArrayKeyAnEmptyString('coachid', $formvalues)){
			unset($formvalues['coachid']);
		}
		if(isArrayKeyAnEmptyString('funderid', $formvalues)){
			unset($formvalues['funderid']);
		}
		if(isArrayKeyAnEmptyString('servicetypeid', $formvalues)){
			unset($formvalues['servicetypeid']);
		}
		if(isArrayKeyAnEmptyString('units', $formvalues)){
			unset($formvalues['units']);
		}
		if(isArrayKeyAnEmptyString('rate', $formvalues)){
			unset($formvalues['rate']);
		}
		
		if(isArrayKeyAnEmptyString('startdate', $formvalues)){
			unset($formvalues['startdate']);
		}
		if(isArrayKeyAnEmptyString('iscriminal', $formvalues)){
			unset($formvalues['iscriminal']);
		}
		
		if(isArrayKeyAnEmptyString('communication', $formvalues)){
			if(isArrayKeyAnEmptyString('communication_old', $formvalues)){
				unset($formvalues['communication']);
			} else {
				$formvalues['communication'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('housing', $formvalues)){
			if(isArrayKeyAnEmptyString('housing_old', $formvalues)){
				unset($formvalues['housing']);
			} else {
				$formvalues['housing'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('status', $formvalues)){
			unset($formvalues['status']);
		}
		if(isArrayKeyAnEmptyString('primarydiagnosis', $formvalues)){
			if(isArrayKeyAnEmptyString('primarydiagnosis_old', $formvalues)){
				unset($formvalues['primarydiagnosis']);
			} else {
				$formvalues['primarydiagnosis'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('secondarydiagnosis', $formvalues)){
			if(isArrayKeyAnEmptyString('secondarydiagnosis_old', $formvalues)){
				unset($formvalues['secondarydiagnosis']);
			} else {
				$formvalues['secondarydiagnosis'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('primarycause', $formvalues)){
			if(isArrayKeyAnEmptyString('primarycause_old', $formvalues)){
				unset($formvalues['primarycause']);
			} else {
				$formvalues['primarycause'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('secondarycause', $formvalues)){
			if(isArrayKeyAnEmptyString('secondarycause_old', $formvalues)){
				unset($formvalues['secondarycause']);
			} else {
				$formvalues['secondarycause'] = NULL;
			}
		}
		
		$initialvoucher = array();
		if(!isArrayKeyAnEmptyString('programid', $formvalues) && !isArrayKeyAnEmptyString('servicetypeid', $formvalues) 
		 && !isArrayKeyAnEmptyString('rate', $formvalues) && !isArrayKeyAnEmptyString('hours', $formvalues)){
			if(!isArrayKeyAnEmptyString('id', $formvalues)){
				$formvalues['initialvoucher']['clientid'] = $formvalues['id'];
			}
			if(!isArrayKeyAnEmptyString('servicetypeid', $formvalues)){
				$formvalues['initialvoucher']['servicetypeid'] = $formvalues['servicetypeid'];
			}
			if(!isArrayKeyAnEmptyString('dateapproved', $formvalues)){
				$formvalues['initialvoucher']['dateapproved'] = changeDateFromPageToMySQLFormat($formvalues['dateapproved']);
			}
			if(!isArrayKeyAnEmptyString('datereceived', $formvalues)){
				$formvalues['initialvoucher']['startdate'] = changeDateFromPageToMySQLFormat($formvalues['startdate']);
			}
			if(!isArrayKeyAnEmptyString('status', $formvalues)){
				$formvalues['initialvoucher']['status'] = $formvalues['status'];
			} else {
				$formvalues['initialvoucher']['status'] = 1;
			}
			if(!isArrayKeyAnEmptyString('hours', $formvalues)){
				$formvalues['initialvoucher']['hours'] = $formvalues['hours'];
			}
			if(!isArrayKeyAnEmptyString('rate', $formvalues)){
				$formvalues['initialvoucher']['rate'] = $formvalues['rate'];
			}
			$formvalues['initialvoucher']['voucherno'] = $formvalues['voucherno'];
			
		}
		
		// process skills to be mapped to the clientskills relationship
		$skills = array();
		if(!isArrayKeyAnEmptyString('skillids', $formvalues)) {
			foreach ($formvalues['skillids'] as $key => $skill) {
				if(!isEmptyString($formvalues['id'])){
					// place back existing agentgenre ids
					$existing_skills = $this->getSkillsForClient($formvalues['id'], $skill);
					// debugMessage($existing_skills);
					// debugMessage($existing_agentgenres['id']);
					if(!isEmptyString($existing_skills['id'])){
						$skills[$existing_skills['id']]['id'] = $existing_skills['id'];
						$skills[$existing_skills['id']]['clientid'] = $formvalues['id'];
						$skills[$existing_skills['id']]['skill'] = $skill;
					} else {
						// debugMessage($key);
						$skills[md5($key)]['clientid'] = $formvalues['id'];
						$skills[md5($key)]['skill'] = $skill;
					}
				}
			}
			if(count($skills) > 0){
				$formvalues['skills'] = $skills;
			}
		} else {
			if(!isArrayKeyAnEmptyString('skillids_old', $formvalues)){
				if($formvalues['skillids_old'] != 0){
					$formvalues['skills'] = NULL;
				}
			} else {
				unset($formvalues['skills']);
			}
		}
		
		// if adding new client
		if(isArrayKeyAnEmptyString('id', $formvalues) && !isArrayKeyAnEmptyString('userid', $formvalues)){
			// check if adding new client so as to set coach assignment
			$formvalues['coachid'] = $formvalues['userid'];
			$assignments = array(
					1 => array(
						'userid'=> $formvalues['userid'], 
						'status'=> $formvalues['status'], 
						'startdate' => changeDateFromPageToMySQLFormat($formvalues['assignstartdate']), 
						'createdby'=> $formvalues['createdby'],
						'role'=> $formvalues['role']						
					)
			);
			$formvalues['assignments'] = $assignments;
			
			// check if adding new client so as to set initial entry to client history
			$clienthistory = array(
					1 => array(
						'status'=> $formvalues['status'],
						'startdate' => changeDateFromPageToMySQLFormat($formvalues['startdate']),
						'createdby'=> $formvalues['createdby'],
					)
			);
			$formvalues['history'] = $clienthistory;
		}
		
		// debugMessage($formvalues); exit(); 
		parent::processPost($formvalues);
	}
	
	/**
	 * Return skill entry for client/skill combination
	 * @return $array
	 */
	function getSkillsForClient($clientid, $skill) {
		$conn = Doctrine_Manager::connection();
		$existing_query = "SELECT * from clientskill as s where s.clientid = '".$clientid."' AND s.skill = '".$skill."' ";
		// debugMessage($existing_query);
		$result = $conn->fetchRow($existing_query);
		return $result;
	}
	
	function afterSave(){
		$conn = Doctrine_Manager::connection();
		$session = SessionWrapper::getInstance();
		
		// base path for uploaded
		$path = APPLICATION_PATH.DIRECTORY_SEPARATOR."..".DIRECTORY_SEPARATOR.PUBLICFOLDER.DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."clients".DIRECTORY_SEPARATOR;
		$clientfolder = "client_".$this->getID();
		
		// check if file was uploaded to client temp area and move it to the right folder (resume). If creating, file will be at root of clients while edit it will be at client_folderid
		// check for resume
		if(file_exists($path."temp".DIRECTORY_SEPARATOR.$this->getResumeFilename()) && !isEmptyString($this->getResumeFilename())){
			if(!is_dir($path.$clientfolder)){
				mkdir($path.$clientfolder, 0777);
			}
			if(!is_dir($path.$clientfolder.DIRECTORY_SEPARATOR."resume")){
				mkdir($path.$clientfolder.DIRECTORY_SEPARATOR."resume", 0777);
			}
			rename($path."temp".DIRECTORY_SEPARATOR.$this->getResumeFilename(), $path.$clientfolder.DIRECTORY_SEPARATOR."resume".DIRECTORY_SEPARATOR.$this->getResumeFilename());
		}
		if(file_exists($path.$clientfolder.DIRECTORY_SEPARATOR.$this->getResumeFilename()) && !isEmptyString($this->getResumeFilename())){
			if(!is_dir($path.$clientfolder)){
				mkdir($path.$clientfolder, 0777);
			}
			if(!is_dir($path.$clientfolder.DIRECTORY_SEPARATOR."resume")){
				mkdir($path.$clientfolder.DIRECTORY_SEPARATOR."resume", 0777);
			}
			rename($path.$clientfolder.DIRECTORY_SEPARATOR.$this->getResumeFilename(), $path.$clientfolder.DIRECTORY_SEPARATOR."resume".DIRECTORY_SEPARATOR.$this->getResumeFilename());
		}
		
		// check for cover letter
		if(file_exists($path."temp".DIRECTORY_SEPARATOR.$this->getCoverletterFilename()) && !isEmptyString($this->getCoverletterFilename())){
			if(!is_dir($path.$clientfolder)){
				mkdir($path.$clientfolder, 0777);
			}
			if(!is_dir($path.$clientfolder.DIRECTORY_SEPARATOR."cover")){
				mkdir($path.$clientfolder.DIRECTORY_SEPARATOR."cover", 0777);
			}
			rename($path."temp".DIRECTORY_SEPARATOR.$this->getCoverletterFilename(), $path.$clientfolder.DIRECTORY_SEPARATOR."cover".DIRECTORY_SEPARATOR.$this->getCoverletterFilename());
		}
		if(file_exists($path.$clientfolder.DIRECTORY_SEPARATOR.$this->getCoverletterFilename()) && !isEmptyString($this->getCoverletterFilename())){
			if(!is_dir($path.$clientfolder)){
				mkdir($path.$clientfolder, 0777);
			}
			if(!is_dir($path.$clientfolder.DIRECTORY_SEPARATOR."cover")){
				mkdir($path.$clientfolder.DIRECTORY_SEPARATOR."cover", 0777);
			}
			rename($path.$clientfolder.DIRECTORY_SEPARATOR.$this->getCoverletterFilename(), $path.$clientfolder.DIRECTORY_SEPARATOR."cover".DIRECTORY_SEPARATOR.$this->getCoverletterFilename());
		}
		
		if(!isEmptyString($this->getInitialVoucherID())){
			if(isEmptyString($this->getInitialVoucher()->getClientID())){
				$this->getInitialVoucher()->setClientID($this->getID());
				$this->getInitialVoucher()->save();
			}
		}
		return true;
	}
	
	function afterUpdate() {
		return $this->afterSave();
	}
	# relative path to profile image
	function hasProfileImage(){
		$real_path = APPLICATION_PATH.DIRECTORY_SEPARATOR."..".DIRECTORY_SEPARATOR."public".DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."clients".DIRECTORY_SEPARATOR."client_";
		$real_path = $real_path.$this->getID().DIRECTORY_SEPARATOR."avatar".DIRECTORY_SEPARATOR."medium_".$this->getProfilePhoto();
		// debugMessage($real_path);
		if(file_exists($real_path) && !isEmptyString($this->getProfilePhoto())){
			return true;
		}
		return false;
	}
	# determine if person has profile image
	function getRelativeProfilePicturePath(){
		$real_path = APPLICATION_PATH.DIRECTORY_SEPARATOR."..".DIRECTORY_SEPARATOR."public".DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."clients".DIRECTORY_SEPARATOR."client_";
		$real_path = $real_path.$this->getID().DIRECTORY_SEPARATOR."avatar".DIRECTORY_SEPARATOR."medium_".$this->getProfilePhoto();
		if(file_exists($real_path) && !isEmptyString($this->getProfilePhoto())){
			return $real_path;
		}
		$real_path = APPLICATION_PATH.DIRECTORY_SEPARATOR."..".DIRECTORY_SEPARATOR."public".DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."default".DIRECTORY_SEPARATOR."default_medium_male.jpg";
		if($this->isFemale()){
			$real_path = APPLICATION_PATH.DIRECTORY_SEPARATOR."..".DIRECTORY_SEPARATOR."public".DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."default".DIRECTORY_SEPARATOR."default_medium_female.jpg";
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
			$path = $baseUrl.'/uploads/clients/client_'.$this->getID().'/avatar/small_'.$this->getProfilePhoto();
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
			$path = $baseUrl.'/uploads/clients/client_'.$this->getID().'/avatar/thumbnail_'.$this->getProfilePhoto();
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
			$path = $baseUrl.'/uploads/clients/client_'.$this->getID().'/avatar/medium_'.$this->getProfilePhoto();
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
			$path = $baseUrl.'/uploads/clients/client_'.$this->getID().'/avatar/large_'.$this->getProfilePhoto();
		}
		# debugMessage($path);
		return $path;
	}
	/**
	 * Return the user's full names, which is a concatenation of the first and last names
	 *
	 * @return String The full name of the user
	 */
	function getName() {
		return $this->getFirstName()." ".$this->getLastName();
	}
	# Determine gender text depending on the gender
	function getGenderText(){
		if($this->getGender() == 1){
			return 'Male';
		} 
		if($this->getGender() == 2){
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
	# path to resume absolute path
	function getResumePath(){
		$path = APPLICATION_PATH.DIRECTORY_SEPARATOR."..".DIRECTORY_SEPARATOR.PUBLICFOLDER.DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."clients".DIRECTORY_SEPARATOR."client_".$this->getID().DIRECTORY_SEPARATOR."resume".DIRECTORY_SEPARATOR.$this->getResumeFilename();
		return $path;
	}
	# check if client has a resume
	function hasResume(){
		if(file_exists($this->getResumePath()) && !isEmptyString($this->getResumefilename())){
			return true;
		}
		return false;
	}
	# path to resume download url
	function getResumeDownloadLink(){
		$view = new Zend_View();
		$path = '';
		if($this->hasResume()){
			$path = $view->serverUrl($view->baseUrl('download/index/filename/'.encode($this->getResumeFilename()).'/path/'.encode($this->getResumePath())));
		}
		return $path;
	}
	# display resume as a link
	function getResumeLink() {
		$path = '';
		if($this->hasResume()){
			$path = '<a href="'.$this->getResumeDownloadLink().'" target="_blank"><span class="glyphicon glyphicon-file"></span> '.$this->getResumefilename().'</a>';
		}
		return $path;
	}
	
	# path to cover absolute path
	function getCoverletterPath(){
		$path = APPLICATION_PATH.DIRECTORY_SEPARATOR."..".DIRECTORY_SEPARATOR.PUBLICFOLDER.DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."clients".DIRECTORY_SEPARATOR."client_".$this->getID().DIRECTORY_SEPARATOR."cover".DIRECTORY_SEPARATOR.$this->getCoverletterFilename();
		return $path;
	}
	# check if client has a cover
	function hasCoverletter(){
		if(file_exists($this->getCoverletterPath()) && !isEmptyString($this->getCoverletterfilename())){
			return true;
		}
		return false;
	}
	# path to cover download url
	function getCoverletterDownloadLink(){
		$view = new Zend_View();
		$path = '';
		if($this->hasCoverletter()){
			$path = $view->serverUrl($view->baseUrl('download/index/filename/'.encode($this->getCoverletterFilename()).'/path/'.encode($this->getCoverletterPath())));
		}
		return $path;
	}
	# display cover as a link
	function getCoverletterLink() {
		$path = '';
		if($this->hasCoverletter()){
			$path = '<a href="'.$this->getCoverletterDownloadLink().'" target="_blank"><span class="glyphicon glyphicon-file"></span> '.$this->getCoverletterfilename().'</a>';
		}
		return $path;
	}
	# get client skills
	function getClientSkills() {
		$query = Doctrine_Query::create()->from('ClientSkill s')
		->innerJoin('s.client c')
		->where("s.clientid = '".$this->getID()."'");
		//debugMessage($query->getSQLQuery());
		$result = $query->execute();
		return $result;
	}
	# Return an array containing the IDs of the skills
	function getSkillIDs(){
		$ids = array();
		$skills = $this->getClientSkills(); //debugMessage($skills->toArray());
		 
		foreach($skills as $skill) {
			$ids[] = $skill->getSkill();
		}
		return $ids;
	}
	# return the list of client skills
	function getSkillsList(){
		$text = '';
		$allskills = getAllClientSkills();
		$list_array = array();
		$skillset = $this->getClientSkills();
		if(count($skillset) > 0){
			foreach ($skillset as $skill){
				if(!isArrayKeyAnEmptyString($skill->getSkill(), $allskills)){
					$list_array[] = $allskills[$skill->getSkill()];
				}
			}
		}
		if(count($list_array) > 0){
			$text = createHTMLCommaListFromArray($list_array, ', ');
		}
		return $text;
	}
	# get assignments for the client
	function getClientAssignments() {
		$query = Doctrine_Query::create()->from('Assignment a')
		->where("a.clientid = '".$this->getID()."'");
		//debugMessage($query->getSQLQuery());
		$result = $query->execute();
		return $result;
	}
	# has been assigned
	function hasBeenAssignedCoach() {
		$query = Doctrine_Query::create()->from('Assignment a')
		->where("a.clientid = '".$this->getID()."' AND a.status = 1 ");
		//debugMessage($query->getSQLQuery());
		$result = $query->execute();
		if($result){
			if($result->count() == 1){
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
	# the current assigned coach
	function getCurrentAssignedCoach() {
		$query = Doctrine_Query::create()->from('Assignment a')
		->where("a.clientid = '".$this->getID()."' AND a.status = 1 ")->orderby("a.startdate desc")->limit('1');
		//debugMessage($query->getSQLQuery());
		$result = $query->execute();
		if($result){
			return $result->get(0);
		} else {
			return new Assignment();
		}
	}
	# get array of users already assigned to a client
	function getAssignedUsersArray(){
		$users = array();
		$assignments = $this->getClientAssignments();
		if($assignments){
			if($assignments->count() > 0){
				foreach ($assignments as $assignline){
					$users[] = $assignline->getUserID();
				}
			}
		}
		return $users;
	}
	# get history entries for the client
	function getClientHistory($latest = false) {
		if($latest == false){
			$query = Doctrine_Query::create()->from('ClientHistory h')
			->where("h.clientid = '".$this->getID()."'");
			//debugMessage($query->getSQLQuery());
			$result = $query->execute();
			return $result;
		} else {
			$query = Doctrine_Query::create()->from('ClientHistory h')
			->where("h.clientid = '".$this->getID()."'")->orderBy("h.id desc")->limit('1');
			//debugMessage($query->getSQLQuery());
			$result = $query->fetchOne();
			return $result;
		}
	}
	# determine client status
	function isActive(){
		$status = false;
		if($this->getStatus() == 1){
			$status = true;
		}
		return $status;
	}
	# get latest status entry in client history
	function getLatestInHistory() {
		$query = Doctrine_Query::create()->from('ClientHistory h')
		->where("h.clientid = '".$this->getID()."'");
		//debugMessage($query->getSQLQuery());
		$result = $query->execute();
		return $result;
	}
	# get the employment jobs for the client
	function getClientJobs() {
		$query = Doctrine_Query::create()->from('Job j')
		->where("j.clientid = '".$this->getID()."'")->orderby('j.startdate');
		$result = $query->execute();
		if($result){
			return $result;
		}
		return new Job();
	}
	# get the vouchers for client ordered by date
	function getClientVouchers() {
		$query = Doctrine_Query::create()->from('Voucher v')
		->where("v.clientid = '".$this->getID()."'")->orderby('v.startdate');
		$result = $query->execute();
		if($result){
			return $result;
		}
		return new Voucher();
	}
	# get the activities for client ordered by date
	function getClientActivities(){
		$query = Doctrine_Query::create()->from('Activity a')
		->where("a.clientid = '".$this->getID()."'")->orderby('a.activitydate desc');
		$result = $query->execute();
		if($result){
			return $result;
		}
		return new Activity();
	}
}
?>
