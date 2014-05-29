<?php

class Client extends BaseEntity {
	
	public function setTableDefinition() {
		#add the table definitions from the parent table
		parent::setTableDefinition();
		
		$this->setTableName('client');
		$this->hasColumn('firstname', 'string', 255, array('notblank' => true));
		$this->hasColumn('lastname', 'string', 255, array('notblank' => true));
		$this->hasColumn('initial', 'string', 6);
		$this->hasColumn('email', 'string', 50/*, array('notnull' => true, 'notblank' => true)*/);
		$this->hasColumn('home', 'string', 15);
		$this->hasColumn('work', 'string', 15);
		$this->hasColumn('cell', 'string', 15);
		$this->hasColumn('ext', 'string', 6);
		# $this->hasColumn('userid', 'integer', null); # client might login at a future date 
		
		$this->hasColumn('country', 'string', 2, array('default' => 'US'));
		$this->hasColumn('state', 'string', 2);
		$this->hasColumn('city', 'string', 50);
		$this->hasColumn('county', 'integer', null);
		$this->hasColumn('zipcode', 'string', 15);
		$this->hasColumn('addressline1', 'string', 255);
		$this->hasColumn('addressline2', 'string', 255);
		
		$this->hasColumn('gender', 'integer', null); # 1=Male, 2=Female, 3=Unknown
		$this->hasColumn('dateofbirth','date', null);
		$this->hasColumn('bio', 'string', 1000);
		$this->hasColumn('profilephoto', 'string', 50);
		
		$this->hasColumn('program', 'integer', null);
		$this->hasColumn('ssn', 'string', 15);
		$this->hasColumn('communication', 'integer', null);
		$this->hasColumn('race', 'integer', null);
		$this->hasColumn('maritalstatus', 'integer', null);
		$this->hasColumn('housing', 'integer', null);
		$this->hasColumn('initialservicedate', 'integer', null);
		$this->hasColumn('allergies', 'string', 500);
		$this->hasColumn('iscriminal', 'integer', null);
		$this->hasColumn('criminalhistory', 'string', 1000);
		$this->hasColumn('educationlevel', 'integer', null);
		$this->hasColumn('bio', 'string', 100);
		$this->hasColumn('profilephoto', 'string', 255);
		
		
	}
	
	# Contructor method for custom initialization
	public function construct() {
		parent::construct();
		
		$this->addDateFields(array("dateofbirth","initialservicedate"));
		
		# set the custom error messages
       	$this->addCustomErrorMessages(array(
       									"firstname.notblank" => $this->translate->_("client_firstname_error"),
       									"lastname.notblank" => $this->translate->_("client_lastname_error")
       	       						));
	}
	
	# Model relationships
	public function setUp() {
		parent::setUp(); 
		
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
		if(isArrayKeyAnEmptyString('county', $formvalues)){
			unset($formvalues['county']);
		}
		if(isArrayKeyAnEmptyString('dateofbirth', $formvalues)){
			unset($formvalues['dateofbirth']); 
		}
		if(isArrayKeyAnEmptyString('gender', $formvalues)){
			unset($formvalues['gender']);
		}
		if(isArrayKeyAnEmptyString('program', $formvalues)){
			unset($formvalues['program']);
		}
		if(isArrayKeyAnEmptyString('communication', $formvalues)){
			unset($formvalues['communication']);
		}
		if(isArrayKeyAnEmptyString('race', $formvalues)){
			unset($formvalues['race']);
		}
		if(isArrayKeyAnEmptyString('maritalstatus', $formvalues)){
			unset($formvalues['maritalstatus']);
		}
		if(isArrayKeyAnEmptyString('housing', $formvalues)){
			unset($formvalues['housing']);
		}
		if(isArrayKeyAnEmptyString('initialservicedate', $formvalues)){
			unset($formvalues['initialservicedate']);
		}
		if(isArrayKeyAnEmptyString('iscriminal', $formvalues)){
			unset($formvalues['iscriminal']);
		}
		if(isArrayKeyAnEmptyString('educationlevel', $formvalues)){
			unset($formvalues['educationlevel']);
		}
		// debugMessage($formvalues); // exit();
		parent::processPost($formvalues);
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
}
?>
