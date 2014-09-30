<?php

class Client extends BaseEntity {
	
	public function setTableDefinition() {
		#add the table definitions from the parent table
		parent::setTableDefinition();
		
		$this->setTableName('client');
		$this->hasColumn('firstname', 'string', 255, array('notblank' => true));
		$this->hasColumn('lastname', 'string', 255, array('notblank' => true));
		$this->hasColumn('middlename', 'string', 255);
		$this->hasColumn('nickname', 'string', 255);
		$this->hasColumn('initial', 'string', 6);
		$this->hasColumn('email', 'string', 50);
		$this->hasColumn('email2', 'string', 50);
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
		$this->hasColumn('coachname', 'string', 50); # coach text
		$this->hasColumn('completedbyid', 'integer', null); # main coach
		$this->hasColumn('completedby', 'string', 50); # coach text
		$this->hasColumn('programid', 'integer', null);
		$this->hasColumn('funderid', 'integer', null);
		$this->hasColumn('servicetypeid', 'integer', null);
		$this->hasColumn('initialvoucherid', 'integer', null);
		$this->hasColumn('startdate','date', null);
		$this->hasColumn('assessmentdate','date', null);
		$this->hasColumn('referraldate','date', null);
		$this->hasColumn('status', 'integer', null, array('default' => '1'));
		$this->hasColumn('dvrsref', 'string', 15);
		$this->hasColumn('dddref', 'string', 15);
		$this->hasColumn('dvrscounselor', 'string', 255);
		$this->hasColumn('employmentgoal', 'string', 255);
		$this->hasColumn('allergies', 'string', 500);
		$this->hasColumn('iscriminal', 'integer', null);
		$this->hasColumn('criminalhistory', 'string', 1000);
		
		$this->hasColumn('contactperson', 'string', 255);
		$this->hasColumn('relationship', 'string', 255);
		$this->hasColumn('contactphone', 'string', 15);
		$this->hasColumn('contactemail', 'string', 255);
		$this->hasColumn('contactperson2', 'string', 255);
		$this->hasColumn('relationship2', 'string', 255);
		$this->hasColumn('contactphone2', 'string', 15);
		$this->hasColumn('contactemail2', 'string', 255);
		
		$this->hasColumn('primarydiagnosis', 'integer', null);
		$this->hasColumn('primarycause', 'integer', null);
		$this->hasColumn('secondarydiagnosis', 'integer', null);
		$this->hasColumn('secondarycause', 'integer', null);
		$this->hasColumn('needsassessment', 'string', 255);
		$this->hasColumn('incomesources', 'string', 255);
		$this->hasColumn('totalmonthlyincome', 'decimal', 11, array('default'=>null));
		$this->hasColumn('reduceincomebenefit', 'integer', null);
		$this->hasColumn('providedwithbenefitinfo', 'integer', null);
		$this->hasColumn('requiresmedicalaccomodation', 'integer', null);
		$this->hasColumn('therapytreatment', 'string', 255);
		$this->hasColumn('householdcount', 'string', 15);
		$this->hasColumn('oncallhousesupport', 'integer', null);
		$this->hasColumn('qualityoflife', 'integer', null);
		$this->hasColumn('partnername', 'string', 255);
		$this->hasColumn('yearsinrship', 'string', 255);
		$this->hasColumn('jobpreferred', 'string', 50);
		$this->hasColumn('jobpreferred1', 'string', 50);
		$this->hasColumn('workshift', 'string', 25);
		$this->hasColumn('jobtype', 'string', 25);
		$this->hasColumn('dateavailable','date', null);
		$this->hasColumn('hoursavailableperweek', 'decimal', 11, array('default'=>'0.00'));
		$this->hasColumn('traveldistance', 'decimal', 11, array('default'=>NULL));
		$this->hasColumn('desiredhourlyrate', 'decimal', 11, array('default'=>NULL));
		$this->hasColumn('jobtype', 'string', 25);
		$this->hasColumn('transportation', 'string', 15);
		$this->hasColumn('contactschooltoverify', 'integer', null);
		$this->hasColumn('experiencedlearningproblems', 'integer', null);
		$this->hasColumn('learningproblems', 'string', 500);
		$this->hasColumn('academicskillsdetails', 'string', 500);
		$this->hasColumn('formaleducinterests', 'string', 255);
		$this->hasColumn('learningstyles', 'string', 500);
		$this->hasColumn('driverslicenseno', 'string', 15);
		$this->hasColumn('typingspeed', 'string', 15);
		$this->hasColumn('hasphotoid', 'integer', null);
		$this->hasColumn('hasssncard', 'integer', null);
		$this->hasColumn('specialinfoforjobapplied', 'string', 1000);
		$this->hasColumn('cancontactreferences', 'integer', null);
		$this->hasColumn('whynotcontact', 'string', 255);
		
		$this->hasColumn('onprobation', 'integer', null);
		$this->hasColumn('convictedoffelony', 'integer', null);
		$this->hasColumn('convictedofmisdemeanor', 'integer', null);
		$this->hasColumn('convictiondetails', 'string', 255);
		$this->hasColumn('employertheftcase', 'integer', null);
		$this->hasColumn('theftcasedetails', 'string', 255);
		$this->hasColumn('isveteran', 'integer', null);
		$this->hasColumn('dischargetype', 'integer', null);
		$this->hasColumn('iscombat', 'integer', null);
		$this->hasColumn('servicebranch', 'string', 50);
		$this->hasColumn('technicalspeciality', 'string', 50);
		$this->hasColumn('rank', 'string', 50);
		$this->hasColumn('combatproblems', 'string', 255);
		$this->hasColumn('combatproblemstreated', 'integer', null);
		$this->hasColumn('employmentdifficulty', 'string', 255);
		$this->hasColumn('difficultydetails', 'string', 255);
		$this->hasColumn('currentevents', 'string', 255);
		$this->hasColumn('pastevents', 'string', 255);
		$this->hasColumn('supportservices', 'string', 255);
		$this->hasColumn('jobassistcontact', 'string', 255);
		$this->hasColumn('awareofopportunities', 'string', 255);
		$this->hasColumn('assistivedevice', 'string', 255);
		
		$this->hasColumn('selfstrengths', 'string', 255);
		$this->hasColumn('selfabilities', 'string', 255);
		$this->hasColumn('potentialbarriers', 'string', 500);
		$this->hasColumn('barriersolutions', 'string', 500);
		$this->hasColumn('medicalconditions', 'string', 500);
		$this->hasColumn('physicallimatations', 'string', 500);
		$this->hasColumn('psychologicallimitations', 'string', 500);
		$this->hasColumn('medicationregimen', 'string', 500);
		$this->hasColumn('nutritionalstatus', 'string', 500);
		$this->hasColumn('livingconditions', 'string', 500);
		$this->hasColumn('lifestyle', 'string', 500);
		$this->hasColumn('medicalaccesssafety', 'string', 500);
		$this->hasColumn('livingenvironment', 'string', 500);
		$this->hasColumn('transportationsafety', 'string', 500);
		$this->hasColumn('socialrships', 'string', 500);
		$this->hasColumn('language', 'integer', null, array("default"=>1));
		$this->hasColumn('emailpassword', 'string', 50);
	}
	
	# Contructor method for custom initialization
	public function construct() {
		parent::construct();
		
		$this->addDateFields(array("dateofbirth","startdate","assessmentdate","referraldate","dateavailable"));
		
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
		$this->hasMany('ClientMedication as medicationdetails',
				array(
						'local' => 'id',
						'foreign' => 'clientid'
				)
		);
		$this->hasMany('AssessmentDetails as assessments',
				array(
						'local' => 'id',
						'foreign' => 'clientid'
				)
		);
		$this->hasMany('Job as jobs',
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
			if(isArrayKeyAnEmptyString('gender_old', $formvalues)){
				unset($formvalues['gender']);
			} else {
				$formvalues['gender'] = NULL;
			}
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
		if(isArrayKeyAnEmptyString('completedbyid', $formvalues)){
			unset($formvalues['completedbyid']);
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
		if(isArrayKeyAnEmptyString('assessmentdate', $formvalues)){
			unset($formvalues['assessmentdate']);
		}
		if(isArrayKeyAnEmptyString('referraldate', $formvalues)){
			unset($formvalues['referraldate']);
		}
		if(isArrayKeyAnEmptyString('iscriminal', $formvalues)){
			if(isArrayKeyAnEmptyString('iscriminal_old', $formvalues)){
				unset($formvalues['iscriminal']);
			} else {
				$formvalues['iscriminal'] = NULL;
			}
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
		 	if(!isArrayKeyAnEmptyString('description', $formvalues)){
				$formvalues['initialvoucher']['description'] = $formvalues['description'];
			}
			if(!isArrayKeyAnEmptyString('dateapproved', $formvalues)){
				$formvalues['initialvoucher']['dateapproved'] = changeDateFromPageToMySQLFormat($formvalues['dateapproved']);
			}
			if(!isArrayKeyAnEmptyString('referraldate', $formvalues)){
				$formvalues['referraldate'] = changeDateFromPageToMySQLFormat($formvalues['referraldate']);
			}
			if(!isArrayKeyAnEmptyString('startdate', $formvalues)){
				$formvalues['initialvoucher']['startdate'] = changeDateFromPageToMySQLFormat($formvalues['startdate']);
				$formvalues['startdate'] = changeDateFromPageToMySQLFormat($formvalues['startdate']);
			}
		 	if(!isArrayKeyAnEmptyString('enddate', $formvalues)){
				$formvalues['initialvoucher']['enddate'] = changeDateFromPageToMySQLFormat($formvalues['enddate']);
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
		if(isArrayKeyAnEmptyString('id', $formvalues)){
			// check if adding new client so as to set coach assignment
			$assignments = array(
					1 => array(
						'status'=> $formvalues['status'], 
						'startdate' => changeDateFromPageToMySQLFormat($formvalues['assignstartdate']), 
						'createdby'=> $formvalues['createdby'],
						'role'=> 2						
					)
			);
			if(!isArrayKeyAnEmptyString('userid', $formvalues)){
				$formvalues['coachid'] = $formvalues['userid'];
				$formvalues['coachid'] = $formvalues['userid'];
				$assignments[1]['userid'] = $formvalues['userid'];
			}
			if(!isArrayKeyAnEmptyString('completedbyid', $formvalues)){
				
			}
			if(!isArrayKeyAnEmptyString('usertextfirstname', $formvalues) && !isArrayKeyAnEmptyString('usertextlastname', $formvalues)){
				$formvalues['coachname'] = $formvalues['usertextfirstname'].' '.$formvalues['usertextlastname'];
			}

			if(!isArrayKeyAnEmptyString('usertext2firstname', $formvalues) && !isArrayKeyAnEmptyString('usertext2lastname', $formvalues)){
				$formvalues['completedby'] = $formvalues['usertext2firstname'].' '.$formvalues['usertext2lastname'];
			}
			
			$formvalues['assignments'] = $assignments;
			
			// check if adding new client so as to set initial entry to client history
			$clienthistory = array(
					1 => array(
						'status'=> $formvalues['status'],
						'startdate' => changeDateFromPageToMySQLFormat($formvalues['assignstartdate']),
						'createdby'=> $formvalues['createdby'],
					)
			);
			$formvalues['history'] = $clienthistory;
		}
		
		if(!isArrayKeyAnEmptyString('incomesourcesids', $formvalues)) {
			$formvalues['incomesources'] = implode(',', $formvalues['incomesourcesids']);
		} else {
			if(!isArrayKeyAnEmptyString('incomesourcesids_old', $formvalues)){
				if(isArrayKeyAnEmptyString('incomesourcesids', $formvalues)) {
					$formvalues['incomesources'] = NULL;
				}
			} else {
				unset($formvalues['incomesources']);
			}
		}
		
		if(!isArrayKeyAnEmptyString('therapytreatmentids', $formvalues)) {
			$formvalues['therapytreatment'] = implode(',', $formvalues['therapytreatmentids']);
		} else {
			if(!isArrayKeyAnEmptyString('therapytreatmentids_old', $formvalues)){
				if(isArrayKeyAnEmptyString('therapytreatmentids', $formvalues)) {
					$formvalues['therapytreatment'] = NULL;
				}
			} else {
				unset($formvalues['therapytreatment']);
			}
		}
		
		if(isArrayKeyAnEmptyString('reduceincomebenefit', $formvalues)){
			unset($formvalues['reduceincomebenefit']);
			if(isArrayKeyAnEmptyString('reduceincomebenefit_old', $formvalues)){
				unset($formvalues['reduceincomebenefit']);
			} else {
				$formvalues['reduceincomebenefit'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('totalmonthlyincome', $formvalues)){
			unset($formvalues['totalmonthlyincome']);
		}
		if(isArrayKeyAnEmptyString('providedwithbenefitinfo', $formvalues)){
			if(isArrayKeyAnEmptyString('providedwithbenefitinfo_old', $formvalues)){
				unset($formvalues['providedwithbenefitinfo']);
			} else {
				$formvalues['providedwithbenefitinfo'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('requiresmedicalaccomodation', $formvalues)){
			if(isArrayKeyAnEmptyString('requiresmedicalaccomodation_old', $formvalues)){
				unset($formvalues['requiresmedicalaccomodation']);
			} else {
				$formvalues['requiresmedicalaccomodation'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('oncallhousesupport', $formvalues)){
			if(isArrayKeyAnEmptyString('oncallhousesupport_old', $formvalues)){
				unset($formvalues['oncallhousesupport']);
			} else {
				$formvalues['oncallhousesupport'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('workshift', $formvalues)){
			if(isArrayKeyAnEmptyString('workshift_old', $formvalues)){
				unset($formvalues['workshift']);
			} else {
				$formvalues['workshift'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('jobtype', $formvalues)){
			if(isArrayKeyAnEmptyString('jobtype_old', $formvalues)){
				unset($formvalues['jobtype']);
			} else {
				$formvalues['jobtype'] = NULL;
			}
		}
		
		if(isArrayKeyAnEmptyString('qualityoflife', $formvalues)){
			if(isArrayKeyAnEmptyString('qualityoflife_old', $formvalues)){
				unset($formvalues['qualityoflife']);
			} else {
				$formvalues['qualityoflife'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('contactschooltoverify', $formvalues)){
			if(isArrayKeyAnEmptyString('contactschooltoverify_old', $formvalues)){
				unset($formvalues['contactschooltoverify']);
			} else {
				$formvalues['contactschooltoverify'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('experiencedlearningproblems', $formvalues)){
			if(isArrayKeyAnEmptyString('experiencedlearningproblems_old', $formvalues)){
				unset($formvalues['experiencedlearningproblems']);
			} else {
				$formvalues['experiencedlearningproblems'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('cancontactreferences', $formvalues)){
			if(isArrayKeyAnEmptyString('cancontactreferences_old', $formvalues)){
				unset($formvalues['cancontactreferences']);
			} else {
				$formvalues['cancontactreferences'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('onprobation', $formvalues)){
			if(isArrayKeyAnEmptyString('onprobation_old', $formvalues)){
				unset($formvalues['onprobation']);
			} else {
				$formvalues['onprobation'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('convictedoffelony', $formvalues)){
			if(isArrayKeyAnEmptyString('convictedoffelony_old', $formvalues)){
				unset($formvalues['convictedoffelony']);
			} else {
				$formvalues['convictedoffelony'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('convictedofmisdemeanor', $formvalues)){
			if(isArrayKeyAnEmptyString('convictedofmisdemeanor_old', $formvalues)){
				unset($formvalues['convictedofmisdemeanor']);
			} else {
				$formvalues['convictedofmisdemeanor'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('employertheftcase', $formvalues)){
			if(isArrayKeyAnEmptyString('employertheftcase_old', $formvalues)){
				unset($formvalues['employertheftcase']);
			} else {
				$formvalues['employertheftcase'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('traveldistance', $formvalues)){
			if(isArrayKeyAnEmptyString('traveldistance_old', $formvalues)){
				unset($formvalues['traveldistance']);
			} else {
				$formvalues['traveldistance'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('desiredhourlyrate', $formvalues)){
			if(isArrayKeyAnEmptyString('desiredhourlyrate_old', $formvalues)){
				unset($formvalues['desiredhourlyrate']);
			} else {
				$formvalues['desiredhourlyrate'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('hasphotoid', $formvalues)){
			if(isArrayKeyAnEmptyString('hasphotoid_old', $formvalues)){
				unset($formvalues['hasphotoid']);
			} else {
				$formvalues['hasphotoid'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('hasssncard', $formvalues)){
			if(isArrayKeyAnEmptyString('hasssncard_old', $formvalues)){
				unset($formvalues['hasssncard']);
			} else {
				$formvalues['hasssncard'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('cancontactreferences', $formvalues)){
			if(isArrayKeyAnEmptyString('cancontactreferences_old', $formvalues)){
				unset($formvalues['cancontactreferences']);
			} else {
				$formvalues['cancontactreferences'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('isveteran', $formvalues)){
			if(isArrayKeyAnEmptyString('isveteran_old', $formvalues)){
				unset($formvalues['isveteran']);
			} else {
				$formvalues['isveteran'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('dischargetype', $formvalues)){
			if(isArrayKeyAnEmptyString('dischargetype_old', $formvalues)){
				unset($formvalues['dischargetype']);
			} else {
				$formvalues['dischargetype'] = NULL;
			}
		}
		if(isArrayKeyAnEmptyString('iscombat', $formvalues)){
			if(isArrayKeyAnEmptyString('iscombat_old', $formvalues)){
				unset($formvalues['iscombat']);
			} else {
				$formvalues['iscombat'] = NULL;
			}
		}
		
		if(!isArrayKeyAnEmptyString('formaleducinterestsids', $formvalues)) {
			$formvalues['formaleducinterests'] = implode(',', $formvalues['formaleducinterestsids']);
		} else {
			if(!isArrayKeyAnEmptyString('formaleducinterests_old', $formvalues)){
				if(isArrayKeyAnEmptyString('formaleducinterestsids', $formvalues)) {
					$formvalues['formaleducinterests'] = NULL;
				}
			} else {
				unset($formvalues['formaleducinterests']);
			}
		}
		if(!isArrayKeyAnEmptyString('learningstylesids', $formvalues)) {
			$formvalues['learningstyles'] = implode(',', $formvalues['learningstylesids']);
		} else {
			if(!isArrayKeyAnEmptyString('learningstyles_old', $formvalues)){
				if(isArrayKeyAnEmptyString('learningstylesids', $formvalues)) {
					$formvalues['learningstyles'] = NULL;
				}
			} else {
				unset($formvalues['learningstyles']);
			}
		}
		
		$detailsarray = array();
		if(!isArrayKeyAnEmptyString('medicationdetails', $formvalues)){
			foreach ($formvalues['medicationdetails'] as $key => $value){
				if(isEmptyString($value['type'])){
					unset($formvalues['medicationdetails'][$key]);
				} else {
					$detailsarray[$key] = $value;
					if(!isArrayKeyAnEmptyString('id', $formvalues)){
						$detailsarray[$key]['clientid'] = $formvalues['id'];
					}
					if(!isArrayKeyAnEmptyString('id', $value)){
						$detailsarray[$key]['id'] = $value['id'];
					}
				}
			}
		}
		if(count($detailsarray) > 0){
			$formvalues['medicationdetails'] = $detailsarray;
		} else {
			unset($formvalues['medicationdetails']);
		}
		
		// fetch all existing assessment details
		$restoredata = array();
		$allassessments = $this->getAssessments()->toArray(); // debugMessage($allassessments);
		$idsarray = array(); $typeformattedarray = array();
		foreach ($allassessments as $key => $value){
			$idsarray[$value['id']] = $key;
			$typeformattedarray[$value['type']][$key] = $allassessments[$key];
		}
		// debugMessage($typeformattedarray); exit;
		
		$jobaccomadations = array(); $id = 0;
		if(!isArrayKeyAnEmptyString('physicaljb1_value', $formvalues)){
			$id++; $mds = md5($id);
			if(!isArrayKeyAnEmptyString('physicaljb1_id', $formvalues)){
				$mds = $idsarray[$formvalues['physicaljb1_id']];
				$jobaccomadations[$mds]['id'] = $formvalues['physicaljb1_id'];
			}
			if(!isArrayKeyAnEmptyString('id', $formvalues)){
				$jobaccomadations[$mds]['clientid'] = $formvalues['id'];
			}
			$jobaccomadations[$mds]['type'] = 1;
			$jobaccomadations[$mds]['subtype'] = 1;
			$jobaccomadations[$mds]['value1'] = $formvalues['physicaljb1_value'];
		} else {
			if(!isArrayKeyAnEmptyString(1, $typeformattedarray)){
				$restoredata[1] = $typeformattedarray[1];
			}
		}
		
		if(!isArrayKeyAnEmptyString('envjb1_value', $formvalues)){
			$id++; $mds = md5($id);
			if(!isArrayKeyAnEmptyString('envjb1_id', $formvalues)){
				$mds = $idsarray[$formvalues['envjb1_id']];
				$jobaccomadations[$mds]['id'] = $formvalues['envjb1_id'];
			}
			if(!isArrayKeyAnEmptyString('id', $formvalues)){
				$jobaccomadations[$mds]['clientid'] = $formvalues['id'];
			}
			$jobaccomadations[$mds]['type'] = 1;
			$jobaccomadations[$mds]['subtype'] = 2;
			$jobaccomadations[$mds]['value1'] = $formvalues['envjb1_value'];
		}
		if(!isArrayKeyAnEmptyString('instjb1_value', $formvalues)){
			$id++; $mds = md5($id);
			if(!isArrayKeyAnEmptyString('instjb1_id', $formvalues)){
				$mds = $idsarray[$formvalues['instjb1_id']];
				$jobaccomadations[$mds]['id'] = $formvalues['instjb1_id'];
			}
			if(!isArrayKeyAnEmptyString('id', $formvalues)){
				$jobaccomadations[$mds]['clientid'] = $formvalues['id'];
			}
			$jobaccomadations[$mds]['type'] = 1;
			$jobaccomadations[$mds]['subtype'] = 3;
			$jobaccomadations[$mds]['value1'] = $formvalues['instjb1_value'];
		}
		
		// debugMessage($jobaccomadations);
		$detailsarray = array();
		if(!isArrayKeyAnEmptyString('familydetails', $formvalues)){
			foreach ($formvalues['familydetails'] as $key => $value){
				if(isEmptyString($value['value1'])){
					unset($formvalues['familydetails'][$key]);
				} else {
					$id++; $mds = md5($id); // debugMessage($id.'>>'.$mds);
					if(!isArrayKeyAnEmptyString('id', $value)){
						$mds = $idsarray[$value['id']];
						$detailsarray[$mds]['id'] = $value['id'];
					}
					if(!isArrayKeyAnEmptyString('id', $formvalues)){
						$detailsarray[$mds]['clientid'] = $formvalues['id'];
					}
					$detailsarray[$mds]['type'] = 2;
					if(!isArrayKeyAnEmptyString('value1', $value)){
						$detailsarray[$mds]['value1'] = $value['value1'];
					}
					if(!isArrayKeyAnEmptyString('value2', $value)){
						$detailsarray[$mds]['value2'] = $value['value2'];
					}
					if(!isArrayKeyAnEmptyString('value3', $value)){
						$detailsarray[$mds]['value3'] = $value['value3'];
					}
					if(!isArrayKeyAnEmptyString('familydetails_value3_'.$key, $formvalues)){
						$detailsarray[$mds]['value3'] = $formvalues['familydetails_value3_'.$key];
					}
					if(!isArrayKeyAnEmptyString('value4', $value)){
						$detailsarray[$mds]['value4'] = $value['value4'];
					}				
				}
			}
		} else {
			if(!isArrayKeyAnEmptyString(2, $typeformattedarray)){
				$restoredata[2] = $typeformattedarray[2];
			}
		}
		# process weekly schedule for availability
		if(!isArrayKeyAnEmptyString('hasweeklyschedule_1', $formvalues)) {
			$id++; $mds = md5($id);
			if(!isArrayKeyAnEmptyString('hasweeklyschedule_1_id', $formvalues)){
				$mds = $idsarray[$formvalues['hasweeklyschedule_1_id']];
				$detailsarray[$mds]['id'] = $formvalues['hasweeklyschedule_1_id'];
			}
			if(!isArrayKeyAnEmptyString('id', $formvalues)){
				$detailsarray[$mds]['clientid'] = $formvalues['id'];
			}
			$detailsarray[$mds]['type'] = 3;
			$detailsarray[$mds]['subtype'] = $formvalues['hasweeklyschedule_1'];					
			for($i=1; $i<=7; $i++) {
				if(!isArrayKeyAnEmptyString('value_'.$i.'_1', $formvalues)){
					$detailsarray[$mds]['value'.$i] = $formvalues['value_'.$i.'_1'];
				}
			}
		} else {
			if(!isArrayKeyAnEmptyString(3, $typeformattedarray)){
				$restoredata[3] = $typeformattedarray[3];
			}
		}
		
		if(!isArrayKeyAnEmptyString('hasweeklyschedule_2', $formvalues)) {
			$id++; $mds = md5($id);
			if(!isArrayKeyAnEmptyString('hasweeklyschedule_2_id', $formvalues)){
				$mds = $idsarray[$formvalues['hasweeklyschedule_2_id']];
				$detailsarray[$mds]['id'] = $formvalues['hasweeklyschedule_2_id'];
			}
			if(!isArrayKeyAnEmptyString('id', $formvalues)){
				$detailsarray[$mds]['clientid'] = $formvalues['id'];
			}
			$detailsarray[$mds]['type'] = 3;
			$detailsarray[$mds]['subtype'] = $formvalues['hasweeklyschedule_2'];					
			for($i=1; $i<=7; $i++) {
				if(!isArrayKeyAnEmptyString('value_'.$i.'_2', $formvalues)){
					$detailsarray[$mds]['value'.$i] = $formvalues['value_'.$i.'_2'];
				}
			}
		}
		
		# process the education background history
		if (!isArrayKeyAnEmptyString('educdetails', $formvalues)) {
			foreach ($formvalues['educdetails'] as  $key => $value){
				if(!isEmptyString($value['value1'])){
					$id++; $mds = md5($id);
					if(!isArrayKeyAnEmptyString('id', $value)){
						$mds = $idsarray[$value['id']];
						$detailsarray[$mds]['id'] = $value['id'];
					}
					if(!isArrayKeyAnEmptyString('id', $formvalues)){
						$detailsarray[$mds]['clientid'] = $formvalues['id'];
					}
					$detailsarray[$mds]['type'] = 4; 
					if(!isArrayKeyAnEmptyString('subtype', $value)){
						$detailsarray[$mds]['subtype'] = $value['subtype'];
					}
					if(!isArrayKeyAnEmptyString('value1', $value)){
						$detailsarray[$mds]['value1'] = $value['value1'];
					}
					if(!isArrayKeyAnEmptyString('value2', $value)){
						$detailsarray[$mds]['value2'] = $value['value2'];
					}
					if(!isArrayKeyAnEmptyString('value3_'.$key, $formvalues)){
						$detailsarray[$mds]['value3'] = $formvalues['value3_'.$key];
					}
					if(!isArrayKeyAnEmptyString('value4', $value)){
						$detailsarray[$mds]['value4'] = $value['value4'];
					}
					if(!isArrayKeyAnEmptyString('value5', $value)){
						$detailsarray[$mds]['value5'] = $value['value5'];
					}
					if(!isArrayKeyAnEmptyString('value6', $value)){
						$detailsarray[$mds]['value6'] = $value['value6'];
					}
					if(!isArrayKeyAnEmptyString('value7', $value)){
						$detailsarray[$mds]['value7'] = $value['value7'];
					}
				} else {
					unset($formvalues['educdetails'][$key]);
				}
			}
		} else {
			if(!isArrayKeyAnEmptyString(4, $typeformattedarray)){
				$restoredata[4] = $typeformattedarray[4];
			}
		}
		// debugMessage($detailsarray); exit();
		
		# process the reference contacts
		if (!isArrayKeyAnEmptyString('references', $formvalues)) {
			foreach ($formvalues['references'] as  $key => $value){
				$linearray = array();
				if(!isEmptyString($value['value1'])){
					$id++; $mds = md5($id);
					if(!isArrayKeyAnEmptyString('id', $value)){
						$mds = $idsarray[$value['id']];
						$detailsarray[$mds]['id'] = $value['id'];
					}
					if(!isArrayKeyAnEmptyString('id', $formvalues)){
						$detailsarray[$mds]['clientid'] = $formvalues['id'];
					}
					$detailsarray[$mds]['type'] = 5; 
					if(!isArrayKeyAnEmptyString('subtype', $value)){
						$detailsarray[$mds]['subtype'] = $value['subtype'];
					}
					if(!isArrayKeyAnEmptyString('value1', $value)){
						$detailsarray[$mds]['value1'] = $value['value1'];
					}
					if(!isArrayKeyAnEmptyString('value2', $value)){
						$detailsarray[$mds]['value2'] = $value['value2'];
					}
					if(!isArrayKeyAnEmptyString('value3', $value)){
						$detailsarray[$mds]['value3'] = $value['value3'];
					}
					if(!isArrayKeyAnEmptyString('value4', $value)){
						$detailsarray[$mds]['value4'] = $value['value4'];
					}
				} else {
					unset($formvalues['references'][$key]);
				}
			}
		} else {
			if(!isArrayKeyAnEmptyString(5, $typeformattedarray)){
				$restoredata[5] = $typeformattedarray[5];
			}
		}
		
		if(count($restoredata) > 0){
			foreach ($restoredata as $value){
				$detailsarray = array_merge_maintain_keys($detailsarray, $value);
			}
		}
		// debugMessage($detailsarray); exit();
		// merge all assessements
		$detailsarray = array_merge_maintain_keys($jobaccomadations, $detailsarray); 
		if(count($detailsarray) > 0){
			$formvalues['assessments'] = $detailsarray;
		} else {
			unset($formvalues['assessments']);
		}
		
		$jobsarray = array(); $existing_jobs = array();
		if(!isArrayKeyAnEmptyString('employmentdetails', $formvalues)){
			$increment = 0;
			$thejobs = $this->getJobs();
			$existing_jobs = $thejobs->toArray(); // debugMessage($existing_jobs);
			foreach ($formvalues['employmentdetails'] as $key => $value){
				if(isEmptyString($value['jobtitle'])){
					unset($formvalues['employmentdetails'][$key]);
				} else {
					// $detailsarray[$key] = $value; 
					$employer = array();
					if(!isArrayKeyAnEmptyString('employerid', $value)){
						$jobsarray[$key]['employerid'] = $value['employerid'];
					} else {
						$employer['createdby'] = $session->getVar('userid');
					}
					$jobsarray[$key]['type'] = 2;
					if(!isArrayKeyAnEmptyString('id', $formvalues)){
						$jobsarray[$key]['clientid'] = $formvalues['id'];
					}
					if(!isArrayKeyAnEmptyString('id', $value)){
						$jobsarray[$key]['id'] = $value['id'];
					} else {
						$jobsarray[$key]['createdby'] = $session->getVar('userid');
					}
					if(!isArrayKeyAnEmptyString('jobtitle', $value)){
						$jobsarray[$key]['jobtitle'] = $value['jobtitle'];
					}
					if(!isArrayKeyAnEmptyString('workdetails', $value)){
						$jobsarray[$key]['workdetails'] = $value['workdetails'];
					}
					if(!isArrayKeyAnEmptyString('supervisorname', $value)){
						$jobsarray[$key]['supervisorname'] = $value['supervisorname'];
						$employer['contactperson'] = $value['supervisorname'];
					}
					if(!isArrayKeyAnEmptyString('startdate', $value)){
						$jobsarray[$key]['startdate'] = changeDateFromPageToMySQLFormat($value['startdate']);
					}
					if(!isArrayKeyAnEmptyString('enddate', $value)){
						$jobsarray[$key]['enddate'] = changeDateFromPageToMySQLFormat($value['enddate']);
					}
					if(!isArrayKeyAnEmptyString('rate', $value)){
						$jobsarray[$key]['rate'] = $value['rate'];
					}
					if(!isArrayKeyAnEmptyString('ratetype_'.$increment, $formvalues)){
						$jobsarray[$key]['ratetype'] = $formvalues['ratetype_'.$increment];
					}
					if(!isArrayKeyAnEmptyString('terminationreason', $value)){
						$jobsarray[$key]['terminationreason'] = $value['terminationreason'];
					}
					if(!isArrayKeyAnEmptyString('companyname', $value)){
						$employer['name'] = $value['companyname'];
					}
					$employer['type'] = 2;
					
					if(!isArrayKeyAnEmptyString('contactperson', $value)){
						$employer['contactperson'] = $value['contactperson'];
					}
					if(!isArrayKeyAnEmptyString('phone', $value)){
						$employer['phone'] = $value['phone'];
					}
					if(!isArrayKeyAnEmptyString('email', $value)){
						$employer['email'] = $value['email'];
					}
					if(!isArrayKeyAnEmptyString('state_'.$increment, $formvalues)){
						$employer['state'] = $formvalues['state_'.$increment];
					}
					if(!isArrayKeyAnEmptyString('county', $value)){
						$employer['county'] = $value['county'];
					}
					if(!isArrayKeyAnEmptyString('city', $value)){
						$employer['city'] = $value['city'];
					}
					if(!isArrayKeyAnEmptyString('zipcode', $value)){
						$employer['zipcode'] = $value['zipcode'];
					}
					if(!isArrayKeyAnEmptyString('addressline1', $value)){
						$employer['addressline1'] = $value['addressline1'];
					}
					if(!isArrayKeyAnEmptyString('addressline2', $value)){
						$employer['addressline2'] = $value['addressline2'];
					}
					
					
					if(count($employer) > 0){
						$jobsarray[$key]['employer'] = $employer;
					}
				}
				$increment++;
			}
			// debugMessage($jobsarray);
		}
		
		if(count($jobsarray) > 0){
			// $formvalues['jobs'] = $jobsarray; debugMessage($jobsarray);
			$formvalues['jobs'] = multidimensional_array_merge($jobsarray, $existing_jobs); debugMessage($formvalues['jobs']);
		} else {
			unset($formvalues['jobs']);
		}
		
		if(!isArrayKeyAnEmptyString('employmentdifficultyids', $formvalues)) {
			$formvalues['employmentdifficulty'] = implode(',', $formvalues['employmentdifficultyids']);
		} else {
			if(!isArrayKeyAnEmptyString('employmentdifficulty_old', $formvalues)){
				if(isArrayKeyAnEmptyString('employmentdifficultyids', $formvalues)) {
					$formvalues['employmentdifficulty'] = NULL;
				}
			} else {
				unset($formvalues['employmentdifficulty']);
			}
		}
		
		if(!isArrayKeyAnEmptyString('currenteventids', $formvalues)) {
			$formvalues['currentevents'] = implode(',', $formvalues['currenteventids']);
		} else {
			if(!isArrayKeyAnEmptyString('currentevents_old', $formvalues)){
				if(isArrayKeyAnEmptyString('currenteventids', $formvalues)) {
					$formvalues['currentevents'] = NULL;
				}
			} else {
				unset($formvalues['currentevents']);
			}
		}
		
		if(!isArrayKeyAnEmptyString('pasteventids', $formvalues)) {
			$formvalues['pastevents'] = implode(',', $formvalues['pasteventids']);
		} else {
			if(!isArrayKeyAnEmptyString('pastevents_old', $formvalues)){
				if(isArrayKeyAnEmptyString('pasteventids', $formvalues)) {
					$formvalues['pastevents'] = NULL;
				}
			} else {
				unset($formvalues['pastevents']);
			}
		}
		
		if(!isArrayKeyAnEmptyString('assistivedeviceids', $formvalues)) {
			$formvalues['assistivedevice'] = implode(',', $formvalues['assistivedeviceids']);
		} else {
			if(!isArrayKeyAnEmptyString('assistivedevice_old', $formvalues)){
				if(isArrayKeyAnEmptyString('assistivedeviceids', $formvalues)) {
					$formvalues['assistivedevice'] = NULL;
				}
			} else {
				unset($formvalues['assistivedevice']);
			}
		}
		
		if(!isArrayKeyAnEmptyString('supportservicesids', $formvalues)) {
			$formvalues['supportservices'] = implode(',', $formvalues['supportservicesids']);
		} else {
			if(!isArrayKeyAnEmptyString('supportservices_old', $formvalues)){
				if(isArrayKeyAnEmptyString('supportservicesids', $formvalues)) {
					$formvalues['supportservices'] = NULL;
				}
			} else {
				unset($formvalues['supportservices']);
			}
		}
		
		if(!isArrayKeyAnEmptyString('combatproblemsids', $formvalues)) {
			$formvalues['combatproblems'] = implode(',', $formvalues['combatproblemsids']);
		} else {
			if(!isArrayKeyAnEmptyString('combatproblems_old', $formvalues)){
				if(isArrayKeyAnEmptyString('combatproblemsids', $formvalues)) {
					$formvalues['combatproblems'] = NULL;
				}
			} else {
				unset($formvalues['combatproblems']);
			}
		}
		
		# format data for the assessment questionaire
		if(!isArrayKeyAnEmptyString('hasassessment_questions', $formvalues)){
			for ($i = 1; $i<=12; $i++){
				${'data_array_'.$i} = array();
				for ($x = 0; $x <= 3; $x++) {
					if(!isArrayKeyAnEmptyString('qn_'.$i.'_'.$x, $formvalues)){
						${'data_array_'.$i}[$x] = $formvalues['qn_'.$i.'_'.$x];
						if($x == 3){
							${'data_array_'.$i}[3] = encode($formvalues['qn_'.$i.'_'.$x]);
						}
					} else {
						${'data_array_'.$i}[$x] = 0;
					}
				}
				${'data_string_'.$i} = implode(',', ${'data_array_'.$i});
				// storet the appropriate data to the corresponding question
				switch ($i) {
					case 1:
						$formvalues['medicalconditions'] = ${'data_string_'.$i}; 
						break;
					case 2:
						$formvalues['physicallimatations'] = ${'data_string_'.$i}; 
						break;
					case 3:
						$formvalues['psychologicallimitations'] = ${'data_string_'.$i}; 
						break;
					case 4:
						$formvalues['medicationregimen'] = ${'data_string_'.$i}; 
						break;
					case 5:
						$formvalues['nutritionalstatus'] = ${'data_string_'.$i}; 
						break;
					case 6:
						$formvalues['livingconditions'] = ${'data_string_'.$i}; 
						break;
					case 7:
						$formvalues['lifestyle'] = ${'data_string_'.$i}; 
						break;
					case 8:
						$formvalues['medicalaccesssafety'] = ${'data_string_'.$i}; 
						break;
					case 9:
						$formvalues['livingenvironment'] = ${'data_string_'.$i}; 
						break;
					case 10:
						$formvalues['transportationsafety'] = ${'data_string_'.$i}; 
						break;
					case 11:
						$formvalues['socialrships'] = ${'data_string_'.$i}; 
						break;
				}
			}
		}
		
		// debugMessage($formvalues); // exit(); 
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
		$path = BASE_PATH.DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."clients".DIRECTORY_SEPARATOR;
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
		
		if(!isEmptyString($this->getCoachName()) && isEmptyString($this->getCoachID())){
			$name = $this->getCoachName();
			$namesarray = explode(" ", $name);
				
			$firstname = isArrayKeyAnEmptyString(0, $namesarray) ? '' : $namesarray[0];
			$lastname = isArrayKeyAnEmptyString(1, $namesarray) ? '' : $namesarray[1];
			// $othername = isArrayKeyAnEmptyString(2, $namesarray) ? '' : $namesarray[2];
			$groupids = array(2);
			$usergroups = array();
			foreach ($groupids as $id) {
				$usergroups[]['groupid'] = $id;
			}
				
			$userdata = array(
					'firstname' => $firstname,
					'lastname' => $lastname,
					'type' => 2,
					'createdby' => $session->getVar('userid'),
					'gender' => 1,
					'usergroups' => $usergroups
			);
			// save new user
			$user = new UserAccount();
			$user->processPost($userdata);
			$user->save();
			
			// set assignmentid to this user
			$assignment = $this->getCurrentAssignedCoach();
			if(!isEmptyString($assignment->getID())){
				$assignment->setUserID($user->getID());
				$assignment->save();
			}
			
			// blank out coachname [optional]
			$this->setCoachID($user->getID());
			$this->save();
		}
		
		if(!isEmptyString($this->getCompletedBy()) && isEmptyString($this->getCompletedByID())){
			$name = $this->getCompletedBy();
			$namesarray = explode(" ", $name);
		
			$firstname = isArrayKeyAnEmptyString(0, $namesarray) ? '' : $namesarray[0];
			$lastname = isArrayKeyAnEmptyString(1, $namesarray) ? '' : $namesarray[1];
			// $othername = isArrayKeyAnEmptyString(2, $namesarray) ? '' : $namesarray[2];
			$groupids = array(3);
			$usergroups = array();
			foreach ($groupids as $id) {
				$usergroups[]['groupid'] = $id;
			}
		
			$userdata = array(
					'firstname' => $firstname,
					'lastname' => $lastname,
					'type' => 3,
					'createdby' => $session->getVar('userid'),
					'gender' => 1,
					'usergroups' => $usergroups
			);
			// save new user
			$user = new UserAccount();
			$user->processPost($userdata);
			$user->save();
				
			// blank out coachname [optional]
			$this->setCompletedByID($user->getID());
			$this->save();
		}
		return true;
	}
	
	function afterUpdate() {
		return $this->afterSave();
	}
	# relative path to profile image
	function hasProfileImage(){
		$real_path = BASE_PATH.DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."clients".DIRECTORY_SEPARATOR."client_";
		$real_path = $real_path.$this->getID().DIRECTORY_SEPARATOR."avatar".DIRECTORY_SEPARATOR."medium_".$this->getProfilePhoto();
		// debugMessage($real_path);
		if(file_exists($real_path) && !isEmptyString($this->getProfilePhoto())){
			return true;
		}
		return false;
	}
	# determine if person has profile image
	function getRelativeProfilePicturePath(){
		$real_path = BASE_PATH.DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."clients".DIRECTORY_SEPARATOR."client_";
		$real_path = $real_path.$this->getID().DIRECTORY_SEPARATOR."avatar".DIRECTORY_SEPARATOR."medium_".$this->getProfilePhoto();
		if(file_exists($real_path) && !isEmptyString($this->getProfilePhoto())){
			return $real_path;
		}
		$real_path = BASE_PATH.DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."default".DIRECTORY_SEPARATOR."default_medium_male.jpg";
		if($this->isFemale()){
			$real_path = BASE_PATH.DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."default".DIRECTORY_SEPARATOR."default_medium_female.jpg";
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
		if($this->getGender() == 3){
			return 'Transgender';
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
		$path = BASE_PATH.DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."clients".DIRECTORY_SEPARATOR."client_".$this->getID().DIRECTORY_SEPARATOR."resume".DIRECTORY_SEPARATOR.$this->getResumeFilename();
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
		$path = BASE_PATH.DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."clients".DIRECTORY_SEPARATOR."client_".$this->getID().DIRECTORY_SEPARATOR."cover".DIRECTORY_SEPARATOR.$this->getCoverletterFilename();
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
	function getClientJobs($type = '1') {
		$query = Doctrine_Query::create()->from('Job j')
		->where("j.clientid = '".$this->getID()."' AND j.type = '".$type."' ")->orderby('j.startdate');
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
	function getClientActivities($voucherid =''){
		$custom_query = "";
		if(!isEmptyString($voucherid)){
			$custom_query = " AND a.voucherid = '".$voucherid."' ";
		}
		$query = Doctrine_Query::create()->from('Activity a')
		->where("a.clientid = '".$this->getID()."' ".$custom_query)->orderby('a.activitydate desc');
		$result = $query->execute();
		if($result){
			return $result;
		}
		return new Activity();
	}
	# return an array of income sources
	function getIncomeSourcesArray(){
		return isEmptyString($this->getIncomeSources()) ? array() : explode(',',preg_replace('!\s+!', '', trim($this->getIncomeSources())));
	}
	# return list of income sources for client
	function getListofIncomeSources(){
		$listarray = array(); $text = '';
		$allsources = getAllIncomeSources();
		$sources = $this->getIncomeSourcesArray();
		if(isEmptyString($this->getIncomeSources())){
			return $text;
		}
		if(count($sources) > 0){
			foreach ($sources as $source) {
				if(!isArrayKeyAnEmptyString($source, $allsources)){
					$listarray[] = $allsources[$source];
				}
			}
		}
		if(count($listarray) > 0){
			$text = createHTMLCommaListFromArray($listarray, ', ');
		}
		return $text;
	}
	# return an array of client therapy treatments
	function getTherapyTreatmentArray(){
		return isEmptyString($this->getTherapyTreatment()) ? array() : explode(',',preg_replace('!\s+!', '', trim($this->getTherapyTreatment())));
	}
	# return list of income sources for client
	function getListofTherapyTreatment(){
		$listarray = array(); $text = '';
		$allvalues = getAllTherapyTreatments();
		$therapys = $this->getTherapyTreatmentArray();
		if(isEmptyString($this->getTherapyTreatment())){
			return $text;
		}
		if(count($therapys) > 0){
			foreach ($therapys as $therapy) {
				if(!isArrayKeyAnEmptyString($therapy, $allvalues)){
					$listarray[] = $allvalues[$therapy];
				}
			}
		}
		if(count($listarray) > 0){
			$text = createHTMLCommaListFromArray($listarray, ', ');
		}
		return $text;
	}
	# get the activities for client ordered by date
	function getAssessmentDetails($type, $subtype = '', $istop = false){
		$custom_query = "";
		if(!isEmptyString($subtype)){
			$custom_query .= " AND a.subtype = '".$subtype."' ";
		}
		if($istop){
			$custom_query .= " AND a.value3 = '1' ";
		}
		$query = Doctrine_Query::create()->from('AssessmentDetails a')
		->where("a.clientid = '".$this->getID()."' AND a.type = '".$type."' ".$custom_query)->orderby('a.id asc');
		$result = $query->execute();
		if($result){
			return $result;
		}
		return new AssessmentDetails();
	}
	# determine the formal education interest areas for a client
	function getFormalEducInterestsArray(){
		return isEmptyString($this->getformaleducinterests()) ? array() : explode(',',preg_replace('!\s+!', '', trim($this->getformaleducinterests())));
	}
	# return list formal education interests
	function getListofFormalEducInterests(){
		$listarray = array(); $text = '';
		$allvalues = getAllClientInterestsOptions();
		$thevalues = $this->getFormalEducInterestsArray();
		if(isEmptyString($this->getformaleducinterests())){
			return $text;
		}
		if(count($thevalues) > 0){
			foreach ($thevalues as $value) {
				if(!isArrayKeyAnEmptyString($value, $allvalues)){
					$listarray[] = $allvalues[$value];
				}
			}
		}
		if(count($listarray) > 0){
			$text = createHTMLCommaListFromArray($listarray, ', ');
		}
		return $text;
	}
	# determine the learning styles for a client
	function getLearningStylesArray(){
		return isEmptyString($this->getlearningstyles()) ? array() : explode(',',preg_replace('!\s+!', '', trim($this->getlearningstyles())));
	}
	# return list formal education interests
	function getListofLearningStyles(){
		$listarray = array(); $text = '';
		$allvalues = getAllClientLearningStyles();
		$thevalues = $this->getLearningStylesArray();
		if(isEmptyString($this->getlearningstyles())){
			return $text;
		}
		if(count($thevalues) > 0){
			foreach ($thevalues as $value) {
				if(!isArrayKeyAnEmptyString($value, $allvalues)){
					$listarray[] = '- '.$allvalues[$value];
				}
			}
		}
		if(count($listarray) > 0){
			$text = createHTMLCommaListFromArray($listarray, '<br>');
		}
		return $text;
	}
	# determine text to display for 'providedwithbenefitinfo'
	function getprovidedwithbenefitinfotext() {
		$text = '';
		if($this->getprovidedwithbenefitinfo() == '0'){
			$text = 'No';
		}
		if($this->getprovidedwithbenefitinfo() == '1'){
			$text = 'Yes';
		}
		if($this->getprovidedwithbenefitinfo() == '2'){
			$text = 'Consumer declined offer of information';
		}
		return $text;
	}
	# determine array of current employment difficulty reasons
	function getCurrentDifficultyOptionsArray(){
		return isEmptyString($this->getemploymentdifficulty()) ? array() : explode(',',preg_replace('!\s+!', '', trim($this->getemploymentdifficulty())));
	}
	# determine array of current client events
	function getCurrentEventsArray(){
		return isEmptyString($this->getcurrentevents()) ? array() : explode(',',preg_replace('!\s+!', '', trim($this->getcurrentevents())));
	}
	# determine array of past client events
	function getPastEventsArray(){
		return isEmptyString($this->getpastevents()) ? array() : explode(',',preg_replace('!\s+!', '', trim($this->getpastevents())));
	}
	# determine the array of client support services
	function getSupportServicesArray() {
		return isEmptyString($this->getsupportservices()) ? array() : explode(',',preg_replace('!\s+!', '', trim($this->getsupportservices())));
	}
	# return list client support services
	function getListofClientSupportServices(){
		$listarray = array(); $text = '';
		$allvalues = getAllClientSupportServices();
		$thevalues = $this->getSupportServicesArray();
		if(isEmptyString($this->getsupportservices())){
			return $text;
		}
		if(count($thevalues) > 0){
			foreach ($thevalues as $value) {
				if(!isArrayKeyAnEmptyString($value, $allvalues)){
					$listarray[] = $allvalues[$value];
				}
			}
		}
		if(count($listarray) > 0){
			$text = createHTMLCommaListFromArray($listarray, ', ');
		}
		return $text;
	}
	# determine the array of client combat problems
	function getCombatProblemsArray() {
		return isEmptyString($this->getcombatproblems()) ? array() : explode(',',preg_replace('!\s+!', '', trim($this->getcombatproblems())));
	}
	# return list client support services
	function getListofCombatProblems(){
		$listarray = array(); $text = '';
		$allvalues = getAllCombatProblems();
		$thevalues = $this->getCombatProblemsArray();
		if(isEmptyString($this->getcombatproblems())){
			return $text;
		}
		if(count($thevalues) > 0){
			foreach ($thevalues as $value) {
				if(!isArrayKeyAnEmptyString($value, $allvalues)){
					$listarray[] = $allvalues[$value];
				}
			}
		}
		if(count($listarray) > 0){
			$text = createHTMLCommaListFromArray($listarray, ', ');
		}
		return $text;
	}
	# determine the array of client special accomodation options
	function getClientSpecialAccomodationArray(){
		return isEmptyString($this->getassistivedevice()) ? array() : explode(',',preg_replace('!\s+!', '', trim($this->getassistivedevice())));
	}
	# convert assessment data to array
	function getAssessmentDataArray($question){
		$data = '';
		switch ($question) {
			case 1:
				$data = isEmptyString($this->getmedicalconditions()) ? array('0','0','0','--') : explode(',',preg_replace('!\s+!', '', trim($this->getmedicalconditions())));;
				break;
			case 2:
				$data = isEmptyString($this->getphysicallimatations()) ? array('0','0','0','--') : explode(',',preg_replace('!\s+!', '', trim($this->getphysicallimatations())));;
				break;
			case 3:
				$data = isEmptyString($this->getpsychologicallimitations()) ? array('0','0','0','--') : explode(',',preg_replace('!\s+!', '', trim($this->getpsychologicallimitations())));;
				break;
			case 4:
				$data = isEmptyString($this->getmedicationregimen()) ? array('0','0','0','--') : explode(',',preg_replace('!\s+!', '', trim($this->getmedicationregimen())));;
				break;
			case 5:
				$data = isEmptyString($this->getnutritionalstatus()) ? array('0','0','0','--') : explode(',',preg_replace('!\s+!', '', trim($this->getnutritionalstatus())));;
				break;
			case 6:
				$data = isEmptyString($this->getlivingconditions()) ? array('0','0','0','--') : explode(',',preg_replace('!\s+!', '', trim($this->getlivingconditions())));;
				break;
			case 7:
				$data = isEmptyString($this->getlifestyle()) ? array('0','0','0','--') : explode(',',preg_replace('!\s+!', '', trim($this->getlifestyle())));;
				break;
			case 8:
				$data = isEmptyString($this->getmedicalaccesssafety()) ? array('0','0','0','--') : explode(',',preg_replace('!\s+!', '', trim($this->getmedicalaccesssafety())));;
				break;
			case 9:
				$data = isEmptyString($this->getlivingenvironment()) ? array('0','0','0','--') : explode(',',preg_replace('!\s+!', '', trim($this->getlivingenvironment())));;
				break;
			case 10:
				$data = isEmptyString($this->gettransportationsafety()) ? array('0','0','0','--') : explode(',',preg_replace('!\s+!', '', trim($this->gettransportationsafety())));;
				break;
			case 11:
				$data = isEmptyString($this->getsocialrships()) ? array('0','0','0','--') : explode(',',preg_replace('!\s+!', '', trim($this->getsocialrships())));;
				break;
			default:
				break;
		}
		return $data;
	}
	# determine relationship text
	function getRelationshipText(){
		$text = '';
		if(!is_numeric($this->getRelationship())){
			$text = $this->getRelationship();
		}
		$rships = getAllRelationshipOptions();
		if(!isArrayKeyAnEmptyString($this->getRelationship(), $rships)){
			$text = $rships[$this->getRelationship()];
		}
		return $text;
	}
	# determine alt relationship text
	function getRelationship2Text(){
		$text = '';
		if(!is_numeric($this->getRelationship2())){
			$text = $this->getRelationship2();
		}
		$rships = getAllRelationshipOptions();
		if(!isArrayKeyAnEmptyString($this->getRelationship2(), $rships)){
			$text = $rships[$this->getRelationship2()];
		}
		return $text;
	}
	# determine the invoices for client ordered by date
	function getClientInvoices(){
		$query = Doctrine_Query::create()->from('Invoice i')
		->where("i.clientid = '".$this->getID()."'")->orderby('i.invoicedate');
		$result = $query->execute();
		if($result){
			return $result;
		}
		return new Invoice();
	}
	# determine the payments effected
	function getClientPayments(){
		$query = Doctrine_Query::create()->from('Payment p')
		->where("p.clientid = '".$this->getID()."'")->orderby('p.paymentdate');
		$result = $query->execute();
		if($result){
			return $result;
		}
		return new Payment();
	}
	# determine the client's billable hours reports
	function getClientBillableHoursReport($type = 1){
		$query = Doctrine_Query::create()->from('ActivityReport r')
		->where("r.clientid = '".$this->getID()."' AND r.type = '".$type."' ")->orderby('r.reportdate');
		$result = $query->execute();
		if($result){
			return $result;
		}
		return new ActivityReport();
	}
	# fetch the intervention log for a period
	function getAllInterventionsForReport($startdate, $enddate, $voucherid){
		$query = Doctrine_Query::create()->from('Activity a')
		->where("a.clientid = '".$this->getID()."' AND a.voucherid = '".$voucherid."' AND TO_DAYS(a.activitydate) BETWEEN TO_DAYS('".$startdate."') AND TO_DAYS('".$enddate."') ")->orderby('a.activitydate asc');
		$result = $query->execute();
		if($result){
			return $result;
		}
		return new Activity();
	}
	# determine the age of a client
	function getAge(){
		$age = '';
		if(!isEmptyString($this->getDateofBirth())){
			$age = date('Y') - date('Y', strtotime($this->getDateofBirth()));
		}
		return $age;
	}
	function getreduceincomebenefit_text(){
		if(!isEmptyString($this->getreduceincomebenefit()) && $this->getreduceincomebenefit() == '1'){
			return 'Yes';			
		}
		if(!isEmptyString($this->getreduceincomebenefit()) && $this->getreduceincomebenefit() == '0'){
			return 'No';
		}
		return '';
	}
	function getrequiresmedicalaccomodation_text(){
		if(!isEmptyString($this->getrequiresmedicalaccomodation()) && $this->getrequiresmedicalaccomodation() == '1'){
			return 'Yes';
		}
		if(!isEmptyString($this->getrequiresmedicalaccomodation()) && $this->getrequiresmedicalaccomodation() == '0'){
			return 'No';
		}
		return '';
	}
	function getoncallhousesupport_text(){
		if(!isEmptyString($this->getoncallhousesupport()) && $this->getoncallhousesupport() == '1'){
			return 'Yes';
		}
		if(!isEmptyString($this->getoncallhousesupport()) && $this->getoncallhousesupport() == '0'){
			return 'No';
		}
		return '';
	}
	function gethasphotoid_text(){
		if(!isEmptyString($this->gethasphotoid()) && $this->gethasphotoid() == '1'){
			return 'Yes';
		}
		if(!isEmptyString($this->gethasphotoid()) && $this->gethasphotoid() == '0'){
			return 'No';
		}
		return '';
	}
	function getcontactschooltoverify_text(){
		if(!isEmptyString($this->getcontactschooltoverify()) && $this->getcontactschooltoverify() == '1'){
			return 'Yes';
		}
		if(!isEmptyString($this->getcontactschooltoverify()) && $this->getcontactschooltoverify() == '0'){
			return 'No';
		}
		return '';
	}
	function getexperiencedlearningproblems_text(){
		if(!isEmptyString($this->getexperiencedlearningproblems()) && $this->getexperiencedlearningproblems() == '1'){
			return 'Yes';
		}
		if(!isEmptyString($this->getexperiencedlearningproblems()) && $this->getexperiencedlearningproblems() == '0'){
			return 'No';
		}
		return '';
	}
	function getcancontactreferences_text(){
		if(!isEmptyString($this->getcancontactreferences()) && $this->getcancontactreferences() == '1'){
			return 'Yes';
		}
		if(!isEmptyString($this->getcancontactreferences()) && $this->getcancontactreferences() == '0'){
			return 'No';
		}
		return '';
	}
	function getiscriminal_text(){
		if(!isEmptyString($this->getiscriminal()) && $this->getiscriminal() == '1'){
			return 'Yes';
		}
		if(!isEmptyString($this->getiscriminal()) && $this->getiscriminal() == '0'){
			return 'No';
		}
		return '';
	}
	function getonprobation_text(){
		if(!isEmptyString($this->getonprobation()) && $this->getonprobation() == '1'){
			return 'Yes';
		}
		if(!isEmptyString($this->getonprobation()) && $this->getonprobation() == '0'){
			return 'No';
		}
		return '';
	}
	function getconvictedoffelony_text(){
		if(!isEmptyString($this->getconvictedoffelony()) && $this->getconvictedoffelony() == '1'){
			return 'Yes';
		}
		if(!isEmptyString($this->getconvictedoffelony()) && $this->getconvictedoffelony() == '0'){
			return 'No';
		}
		return '';
	}
	function getconvictedofmisdemeanor_text(){
		if(!isEmptyString($this->getconvictedofmisdemeanor()) && $this->getconvictedofmisdemeanor() == '1'){
			return 'Yes';
		}
		if(!isEmptyString($this->getconvictedofmisdemeanor()) && $this->getconvictedofmisdemeanor() == '0'){
			return 'No';
		}
		return '';
	}
	function getemployertheftcase_text(){
		if(!isEmptyString($this->getemployertheftcase()) && $this->getemployertheftcase() == '1'){
			return 'Yes';
		}
		if(!isEmptyString($this->getemployertheftcase()) && $this->getemployertheftcase() == '0'){
			return 'No';
		}
		return '';
	}
	function getisveteran_text(){
		if(!isEmptyString($this->getisveteran()) && $this->getisveteran() == '1'){
			return 'Yes';
		}
		if(!isEmptyString($this->getisveteran()) && $this->getisveteran() == '0'){
			return 'No';
		}
		return '';
	}
	function getiscombat_text(){
		if(!isEmptyString($this->getiscombat()) && $this->getiscombat() == '1'){
			return 'Yes';
		}
		if(!isEmptyString($this->getiscombat()) && $this->getiscombat() == '0'){
			return 'No';
		}
		return '';
	}
}
?>
