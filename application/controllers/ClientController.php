<?php

class ClientController extends SecureController {
	
	/**
	 * Override unknown actions to enable ACL checking 
	 * 
	 * @see SecureController::getActionforACL()
	 *
	 * @return String
	 */
	public function getActionforACL() {
	 	$action = strtolower($this->getRequest()->getActionName()); 
	 	if($action == "removeupload" || $action == "assign" || $action == "processassign" || 
	 		$action == "changestatus" || $action == "picture" || $action == "processpicture" || 
	 		$action == "uploadpicture" || $action == "croppicture"
		){
	 		return ACTION_EDIT;
	 	}
		return parent::getActionforACL();
    }
    
    function createAction(){
    	$formvalues = $this->_getAllParams(); // debugMessage($formvalues); exit(); 
    	// if id exists use action edit
    	if(!isArrayKeyAnEmptyString('id', $formvalues)){
    		$this->_setParam('action', ACTION_EDIT);
    	}
    	
    	if(fileUploaded()){
    		$config = Zend_Registry::get("config");
    		$this->_translate = Zend_Registry::get("translate");
    		$session = SessionWrapper::getInstance();
    		
    		$id = decode($this->_getParam('id'));
    		$client = new Client();
    		
    		// debugMessage('fileuploaded'); debugMessage($_FILES); exit;
	    	if(!isEmptyString($this->_getParam('id'))){
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
	    	// add client folder if missing and add it to destination path
	    	$clientfolder = "temp";
	    	if(!isEmptyString($client->getID())){
	    		$clientfolder = "client_".$client->getID();
	    	}
	    	if(!is_dir($destination_path.$clientfolder)){
	    		mkdir($destination_path.$clientfolder, 0777);
	    	}
			
	    	// set the destination for 
	    	$upload->setDestination($destination_path.$clientfolder.DIRECTORY_SEPARATOR);
	    	
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
    	}
    	// debugMessage('going to parent');
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
    		// create archive folder for each client
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
    		// create archive folder for each client
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
    
    function assignAction() {
    	
    }
    
    function changestatusAction() {
    	$this->_helper->layout->disableLayout();
    	$this->_helper->viewRenderer->setNoRender(TRUE);
    	$session = SessionWrapper::getInstance();
    	$formvalues = $this->_getAllParams();
    	debugMessage($formvalues); // exit;
    	
    	$client = new Client();
    	$client->populate($formvalues['id']);
    	
    	$history = $client->getClientHistory(true); debugMessage($history->toArray());
    	if($history){
	    	$history->getClient()->setStatus(0);
	    	$history->setStatus(0);
	    	$history->setEndDate(date('Y-m-d'));
	    	$history->setDateClosed(date('Y-m-d H:i:s'));
	    	$history->setClosedByID($session->getVar('userid'));
	    	debugMessage($history->toArray());
	    	
	    	try {
	    		$history->save();
	    		if($formvalues['status'] == 0){
	    			// set success message to session if only closing
	    			$session->setVar(SUCCESS_MESSAGE, "Account successfully closed.");
	    		}
	    		if($formvalues['status'] == 1){
	    			// proceed to enter new record in history with status open
	    			$historynew = new ClientHistory();
	    			$historynew->setStartDate($history->getEnddate());
	    			$historynew->setStatus(1);
	    			$historynew->setCreatedby($session->getVar('userid'));
	    			$historynew->setDateCreated(date('Y-m-d H:i:s'));
	    			$historynew->setClientID($client->getID()); debugMessage($historynew->toArray());
	    			try {
	    				$historynew->save();
	    				$history->getClient()->setStatus(1);
	    				$history->save();
	    				// set success message to session if only closing
	    				$session->setVar(SUCCESS_MESSAGE, "Account successfully Reopened.");
	    			} catch (Exception $e) {
	    				// set error message to session
	    				$session->setVar(ERROR_MESSAGE, "An error occured in updating status. ".$e->getMessage());
	    			}
	    		}
	    	} catch (Exception $e) {
	    		// set error message to session
	    		$session->setVar(ERROR_MESSAGE, "An error occured in updating status. ".$e->getMessage());
	    	}
    	}
    	$this->_helper->redirector->gotoUrl(decode($this->_getParam('successurl')));
    }
    public function pictureAction() {}
    
    public function processpictureAction() {
    	// disable rendering of the view and layout so that we can just echo the AJAX output
    	$this->_helper->layout->disableLayout();
    	$this->_helper->viewRenderer->setNoRender(TRUE);
    
    	$session = SessionWrapper::getInstance();
    	$config = Zend_Registry::get("config");
    	$this->_translate = Zend_Registry::get("translate");
    
    	$formvalues = $this->_getAllParams();
    	 
    	debugMessage($this->_getAllParams());
    	$client = new Client();
    	$client->populate(decode($this->_getParam('id')));
    
    	// only upload a file if the attachment field is specified
    	$upload = new Zend_File_Transfer();
    	// set the file size in bytes
    	$upload->setOptions(array('useByteString' => false));
    
    	// Limit the extensions to the specified file extensions
    	$upload->addValidator('Extension', false, $config->uploads->photoallowedformats);
    	$upload->addValidator('Size', false, $config->uploads->photomaximumfilesize);
    
    	// base path for profile pictures
    	$destination_path = APPLICATION_PATH.DIRECTORY_SEPARATOR."..".DIRECTORY_SEPARATOR."public".DIRECTORY_SEPARATOR."uploads".DIRECTORY_SEPARATOR."clients".DIRECTORY_SEPARATOR."client_";
    
    	// determine if client has destination avatar folder. Else client is editing there picture
    	if(!is_dir($destination_path.$client->getID())){
    		// no folder exits. Create the folder
    		mkdir($destination_path.$client->getID(), 0777);
    	}
    
    	// set the destination path for the image
    	$profilefolder = $client->getID();
    	$destination_path = $destination_path.$profilefolder.DIRECTORY_SEPARATOR."avatar";
    
    	if(!is_dir($destination_path)){
    		mkdir($destination_path, 0777);
    	}
    	// create archive folder for each client
    	$archivefolder = $destination_path.DIRECTORY_SEPARATOR."archive";
    	if(!is_dir($archivefolder)){
    		mkdir($archivefolder, 0777);
    	}
    
    	$oldfilename = $client->getProfilePhoto();
    
    	//debugMessage($destination_path);
    	$upload->setDestination($destination_path);
    
    	// the profile image info before upload
    	$file = $upload->getFileInfo('profileimage');
    	$uploadedext = findExtension($file['profileimage']['name']);
    	$currenttime = mktime();
    	$currenttime_file = $currenttime.'.'.$uploadedext;
    	// debugMessage($file);
    
    	$thefilename = $destination_path.DIRECTORY_SEPARATOR.'base_'.$currenttime_file;
    	$thelargefilename = $destination_path.DIRECTORY_SEPARATOR.'large_'.$currenttime_file;
    	$updateablefile = $destination_path.DIRECTORY_SEPARATOR.'base_'.$currenttime;
    	$updateablelarge = $destination_path.DIRECTORY_SEPARATOR.'large_'.$currenttime;
    	// exit();
    	// rename the base image file
    	$upload->addFilter('Rename',  array('target' => $thefilename, 'overwrite' => true));
    	// exit();
    	// process the file upload
    	if($upload->receive()){
    		// debugMessage('Completed');
    		$file = $upload->getFileInfo('profileimage');
    		// debugMessage($file);
    			
    		$basefile = $thefilename;
    		// convert png to jpg
    		if(in_array(strtolower($uploadedext), array('png','PNG','gif','GIF'))){
    			ak_img_convert_to_jpg($thefilename, $updateablefile.'.jpg', $uploadedext);
    			unlink($thefilename);
    		}
    		$basefile = $updateablefile.'.jpg';
    			
    		// new profilenames
    		$newlargefilename = "large_".$currenttime_file;
    		// generate and save thumbnails for sizes 250, 125 and 50 pixels
    		resizeImage($basefile, $destination_path.DIRECTORY_SEPARATOR.'large_'.$currenttime.'.jpg', 400);
    		resizeImage($basefile, $destination_path.DIRECTORY_SEPARATOR.'medium_'.$currenttime.'.jpg', 165);
    			
    		// unlink($thefilename);
    		unlink($destination_path.DIRECTORY_SEPARATOR.'base_'.$currenttime.'.jpg');
    			
    		// exit();
    		// update the Client with the new profile images
    		try {
    			$client->setProfilePhoto($currenttime.'.jpg');
    			$client->save();
    
    			// check if client already has profile picture and archive it
    			$ftimestamp = current(explode('.', $client->getProfilePhoto()));
    
    			$allfiles = glob($destination_path.DIRECTORY_SEPARATOR.'*.*');
    			$currentfiles = glob($destination_path.DIRECTORY_SEPARATOR.'*'.$ftimestamp.'*.*');
    			// debugMessage($currentfiles);
    			$deletearray = array();
    			foreach ($allfiles as $value) {
    				if(!in_array($value, $currentfiles)){
    					$deletearray[] = $value;
    				}
    			}
    			// debugMessage($deletearray);
    			if(count($deletearray) > 0){
    				foreach ($deletearray as $afile){
    					$afile_filename = basename($afile);
    					rename($afile, $archivefolder.DIRECTORY_SEPARATOR.$afile_filename);
    				}
    			}
    
    			$session->setVar(SUCCESS_MESSAGE, $this->_translate->translate("global_update_success"));
    			$this->_helper->redirector->gotoUrl($this->view->baseUrl("client/picture/id/".encode($client->getID()).'/crop/1'));
    		} catch (Exception $e) {
    			$session->setVar(ERROR_MESSAGE, $e->getMessage());
    			$session->setVar(FORM_VALUES, $this->_getAllParams());
    			$this->_helper->redirector->gotoUrl($this->view->baseUrl('client/picture/id/'.encode($client->getID())));
    		}
    	} else {
    		// debugMessage($upload->getMessages());
    		$uploaderrors = $upload->getMessages();
    		$customerrors = array();
    		if(!isArrayKeyAnEmptyString('fileUploadErrorNoFile', $uploaderrors)){
    			$customerrors['fileUploadErrorNoFile'] = "Please browse for image on computer";
    		}
    		if(!isArrayKeyAnEmptyString('fileExtensionFalse', $uploaderrors)){
    			$custom_exterr = sprintf($this->_translate->translate('global_invalid_ext_error'), $config->uploads->photoallowedformats);
    			$customerrors['fileExtensionFalse'] = $custom_exterr;
    		}
    		if(!isArrayKeyAnEmptyString('fileUploadErrorIniSize', $uploaderrors)){
    			$custom_exterr = sprintf($this->_translate->translate('global_invalid_size_error'), formatBytes($config->uploads->photomaximumfilesize,0));
    			$customerrors['fileUploadErrorIniSize'] = $custom_exterr;
    		}
    		if(!isArrayKeyAnEmptyString('fileSizeTooBig', $uploaderrors)){
    			$custom_exterr = sprintf($this->_translate->translate('global_invalid_size_error'), formatBytes($config->uploads->photomaximumfilesize,0));
    			$customerrors['fileSizeTooBig'] = $custom_exterr;
    		}
    		$session->setVar(ERROR_MESSAGE, 'The following errors occured <ul><li>'.implode('</li><li>', $customerrors).'</li></ul>');
    		$session->setVar(FORM_VALUES, $this->_getAllParams());
    			
    		$this->_helper->redirector->gotoUrl($this->view->baseUrl('client/picture/id/'.encode($client->getID())));
    	}
    	// exit();
    }
    
    function croppictureAction(){
    	$this->_helper->layout->disableLayout();
    	$this->_helper->viewRenderer->setNoRender(TRUE);
    	$session = SessionWrapper::getInstance();
    	$formvalues = $this->_getAllParams();
    
    	$client = new Client();
    	$client->populate(decode($formvalues['id']));
    	$clientfolder = $client->getID();
    	// debugMessage($formvalues);
    	//debugMessage($client->toArray());
    
    	$oldfile = "large_".$client->getProfilePhoto();
    	$base = APPLICATION_PATH.DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.PUBLICFOLDER.DIRECTORY_SEPARATOR.'uploads'.DIRECTORY_SEPARATOR."clients".DIRECTORY_SEPARATOR.'client_'.$clientfolder.''.DIRECTORY_SEPARATOR.'avatar'.DIRECTORY_SEPARATOR;
    
    	// debugMessage($client->toArray());
    	$src = $base.$oldfile;
    
    	$currenttime = mktime();
    	$currenttime_file = $currenttime.'.jpg';
    	$newlargefilename = $base."large_".$currenttime_file;
    	$newmediumfilename = $base."medium_".$currenttime_file;
    
    	// exit();
    	$image = WideImage::load($src);
    	$cropped1 = $image->crop($formvalues['x1'], $formvalues['y1'], $formvalues['w'], $formvalues['h']);
    	$resized_1 = $cropped1->resize(300, 300, 'fill');
    	$resized_1->saveToFile($newlargefilename);
    		
    	//$image2 = WideImage::load($src);
    	$cropped2 = $image->crop($formvalues['x1'], $formvalues['y1'], $formvalues['w'], $formvalues['h']);
    	$resized_2 = $cropped2->resize(165, 165, 'fill');
    	$resized_2->saveToFile($newmediumfilename);
    
    	$client->setProfilePhoto($currenttime_file);
    	$client->save();
    		
    	// check if client already has profile picture and archive it
    	$ftimestamp = current(explode('.', $client->getProfilePhoto()));
    
    	$allfiles = glob($base.DIRECTORY_SEPARATOR.'*.*');
    	$currentfiles = glob($base.DIRECTORY_SEPARATOR.'*'.$ftimestamp.'*.*');
    	// debugMessage($currentfiles);
    	$deletearray = array();
    	foreach ($allfiles as $value) {
    		if(!in_array($value, $currentfiles)){
    			$deletearray[] = $value;
    		}
    	}
    	// debugMessage($deletearray);
    	if(count($deletearray) > 0){
    		foreach ($deletearray as $afile){
    			$afile_filename = basename($afile);
    			rename($afile, $base.DIRECTORY_SEPARATOR.'archive'.DIRECTORY_SEPARATOR.$afile_filename);
    		}
    	}
    	$session->setVar(SUCCESS_MESSAGE, "Successfully updated profile picture");
    	$this->_helper->redirector->gotoUrl($this->view->baseUrl('client/view/id/'.encode($client->getID())));
    	// exit();
    }
}
