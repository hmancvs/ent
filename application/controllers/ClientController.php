<?php

class ClientController extends IndexController  {
	
	/**
	 * Override unknown actions to enable ACL checking 
	 * 
	 * @see SecureController::getActionforACL()
	 *
	 * @return String
	 */
	public function getActionforACL() {
	 	$action = strtolower($this->getRequest()->getActionName()); 
	 	if($action == "removeupload"){
	 		return ACTION_EDIT;
	 	}
		return parent::getActionforACL();
    }
    
    function createAction(){
    	$config = Zend_Registry::get("config");
    	$this->_translate = Zend_Registry::get("translate");
    	$session = SessionWrapper::getInstance();
    	$formvalues = $this->_getAllParams(); // debugMessage($formvalues); // exit();
    	$id = decode($this->_getParam('id'));
    	
    	// if id exists use action edit
    	if(!isArrayKeyAnEmptyString('id', $formvalues)){
    		$this->_setParam('action', ACTION_EDIT);
    	}
    	if(!isEmptyString($this->_getParam('id'))){
    		$client = new Client();
    		$client->populate($id);
    	}
    	// only upload a file if the attachment field is specified
    	$upload = new Zend_File_Transfer();
    	$upload->setOptions(array('useByteString' => false));
    	
    	// File validators
    	$upload->addValidator('Extension', false, $config->uploads->docallowedformats);
    	$upload->addValidator('Size', false, $config->uploads->docmaximumfilesize);
    	
    	// base path for uploaded
    	$destination_path = APPLICATION_PATH.DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.PUBLICFOLDER.DIRECTORY_SEPARATOR.'uploads'.DIRECTORY_SEPARATOR.'clients'.DIRECTORY_SEPARATOR;
    	// add user folder if missing and add it to destination path
    	$clientfolder = "temp";
    	if(!isEmptyString($client->getID())){
    		$clientfolder = "client_".$client->getID();
    	}
    	if(!is_dir($destination_path.$clientfolder)){
    		mkdir($destination_path.$clientfolder, 0755);
    	}

    	// set the destination for 
    	$upload->setDestination($destination_path.$clientfolder.DIRECTORY_SEPARATOR); // exit();
    	
    	// current timestamp
    	$cur_timestamp = mktime();
    	// loop through uploaded images 
    	foreach($upload->getFileInfo() as $file => $info) {
    		// debugMessage($info);
    		// Process resume if it exists in post data
    		if($file == 'resumefilename' && !isEmptyString($info['name'])){
    			$resume_oldfilename = $info['name'];
    			// rename resume file
    			// $resume_newfilename = "resume_".$cur_timestamp.".".findExtension($info['name']);
    			// $samplechapter_newfilename = $resume_newfilename;
    			// $upload->addFilter('Rename', array('target' => $destination_path."package_".md5($formvalues['name'])."/".$samplechapter_newfilename, 'overwrite' => true));
    			
    			if($upload->receive($resume_oldfilename)){
    				$this->_setParam('resumefilename', $resume_oldfilename);
    			} else {
    				// custom error handling
    				$uploaderrors = $upload->getMessages();
    				$customerrors = array();
    				if(!isArrayKeyAnEmptyString('fileExtensionFalse', $uploaderrors)){
    					$custom_exterr = sprintf($this->_translate->translate('client_invalid_ext_error'), 'Resume', $resume_oldfilename, $config->uploads->docallowedformats);
    					$customerrors['fileExtensionFalse'] = $custom_exterr;
    				}
    				if(!isArrayKeyAnEmptyString('fileUploadErrorIniSize', $uploaderrors)){
    					$custom_exterr = sprintf($this->_translate->translate('client_invalid_size_error'), 'Resume', formatBytes($config->uploads->docmaximumfilesize,0));
    					$customerrors['fileUploadErrorIniSize'] = $custom_exterr;
    				}
    				if(!isArrayKeyAnEmptyString('fileSizeTooBig', $uploaderrors)){
    					$custom_exterr = sprintf($this->_translate->translate('client_invalid_size_error'), 'Resume', formatBytes($config->uploads->docmaximumfilesize,0));
    					$customerrors['fileSizeTooBig'] = $custom_exterr;
    				}
    					
    				$this->_setParam('id', $formvalues['id']);
    				$session->setVar(ERROR_MESSAGE, 'The following errors occured <ul><li>'.implode('</li><li>', $customerrors).'</li></ul>');
    				$session->setVar(FORM_VALUES, $this->_getAllParams());
    					
    				// return to index page
    				$this->_helper->redirector->gotoUrl(decode($this->_getParam('failureurl')));
    			}
    		}
    		// Process the cover leter if specified
    		if($file == 'coverletterfilename' && !isEmptyString($info['name'])){
    			$cover_oldfilename = $info['name'];
    			// rename cover file
    			// $cover_newfilename = "cover_".$cur_timestamp.".".findExtension($info['name']);
    			// $cover_newfilename = $resume_newfilename;
    			// $upload->addFilter('Rename', array('target' => $destination_path."package_".md5($formvalues['name'])."/".$samplechapter_newfilename, 'overwrite' => true));
    			if($upload->receive($cover_oldfilename)){
    				$this->_setParam('coverletterfilename', $cover_oldfilename);
    			} else {
    				// custom error handling
    				$uploaderrors = $upload->getMessages();
    				$customerrors = array();
    				if(!isArrayKeyAnEmptyString('fileExtensionFalse', $uploaderrors)){
    					$custom_exterr = sprintf($this->_translate->translate('client_invalid_ext_error'), 'Cover Letter', $cover_oldfilename, $config->uploads->docallowedformats);
    					$customerrors['fileExtensionFalse'] = $custom_exterr;
    				}
    				if(!isArrayKeyAnEmptyString('fileUploadErrorIniSize', $uploaderrors)){
    					$custom_exterr = sprintf($this->_translate->translate('client_invalid_size_error'), 'Cover Letter', formatBytes($config->uploads->docmaximumfilesize,0));
    					$customerrors['fileUploadErrorIniSize'] = $custom_exterr;
    				}
    				if(!isArrayKeyAnEmptyString('fileSizeTooBig', $uploaderrors)){
    					$custom_exterr = sprintf($this->_translate->translate('client_invalid_size_error'), 'Cover Letter', formatBytes($config->uploads->docmaximumfilesize,0));
    					$customerrors['fileSizeTooBig'] = $custom_exterr;
    				}
    					
    				$this->_setParam('id', $formvalues['id']);
    				$session->setVar(ERROR_MESSAGE, 'The following errors occured <ul><li>'.implode('</li><li>', $customerrors).'</li></ul>');
    				$session->setVar(FORM_VALUES, $this->_getAllParams());
    					
    				// return to index page
    				$this->_helper->redirector->gotoUrl(decode($this->_getParam('failureurl')));
    			}
    		}
    	}
    	// exit();
    	parent::createAction();
    }
    
    function editAction(){
    	return $this->createAction();
    }
    
    function removeuploadAction(){
    	$this->_helper->layout->disableLayout();
    	$this->_helper->viewRenderer->setNoRender(TRUE);
    	$session = SessionWrapper::getInstance();
    	$formvalues = $this->_getAllParams();
    	// debugMessage($formvalues);
    	
    	$client = new Client();
    	$client->populate($formvalues['id']); // debugMessage($client->toArray());
    	
    	// type is resume
    	 if($formvalues['type'] == 'resume' && $client->hasResume()){
    		// create archive folder for each user
    		$path = APPLICATION_PATH.DIRECTORY_SEPARATOR."..".DIRECTORY_SEPARATOR.PUBLICFOLDER.DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."clients".DIRECTORY_SEPARATOR."client_".$client->getID().DIRECTORY_SEPARATOR."resume".DIRECTORY_SEPARATOR;
    		if(!is_dir($path."archive")){
    			mkdir($path."archive", 0777);
    		}
    		
    		try {
    			rename($path.$client->getResumeFilename(), $path."archive".DIRECTORY_SEPARATOR.$client->getResumeFilename());
    			$client->setResumefilename('');
    			$client->save();
    			echo 'success';
    		} catch (Exception $e) {
    			// debugMessage($e->getMessage());
    		}
    	} 
    	if($formvalues['type'] == 'cover' && $client->hasCoverletter()){
    		// create archive folder for each user
    		$path = APPLICATION_PATH.DIRECTORY_SEPARATOR."..".DIRECTORY_SEPARATOR.PUBLICFOLDER.DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."clients".DIRECTORY_SEPARATOR."client_".$client->getID().DIRECTORY_SEPARATOR."cover".DIRECTORY_SEPARATOR;
    		if(!is_dir($path."archive")){
    			mkdir($path."archive", 0777);
    		}
    	
    		try {
    			rename($path.$client->getCoverletterfilename(), $path."archive".DIRECTORY_SEPARATOR.$client->getCoverletterfilename());
    			$client->setCoverletterfilename('');
    			$client->save();
    			echo 'success';
    		} catch (Exception $e) {
    			// debugMessage($e->getMessage());
    		}
    	} 
    }
}
