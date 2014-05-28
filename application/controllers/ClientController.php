<?php

class ClientController extends SecureController  {
	
	/**
	 * @see SecureController::getResourceForACL()
	 *
	 * @return String
	 */
	function getResourceForACL() {
		return "Client";
	}
	
	/**
	 * Override unknown actions to enable ACL checking 
	 * 
	 * @see SecureController::getActionforACL()
	 *
	 * @return String
	 */
	public function getActionforACL() {
	 	$action = strtolower($this->getRequest()->getActionName()); 
		if($action == "picture" || $action == "processpicture" || $action == "uploadpicture" || $action == "croppicture"){
			return ACTION_VIEW;
		}
		if($action == "updatestatus"){
			return ACTION_DELETE;
		}
		return parent::getActionforACL();
    }
    
}
