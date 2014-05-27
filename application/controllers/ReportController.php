<?php
class ReportController extends SecureController   {
	
	/**
	 * Get the name of the resource being accessed 
	 *
	 * @return String 
	 */
	function getActionforACL() {
		return ACTION_VIEW;
	}
	/**
	 * Get the name of the resource being accessed 
	 *
	 * @return String 
	 */
	function getResourceForACL() {
		$action = strtolower($this->getRequest()->getActionName()); 
		
		if ($action == "dashboard" || $action == "reportsearch") {
			return "Report Dashboard";
		}
		if ($action == "approvedmarketprices") {
			return "Approved Market Prices Report";
		}
		if ($action == "submissions") {
			return "AMIA Submissions Report";
		}
		if ($action == "subscriber" || $action == "subscriberdata") {
			return "Subscriber Report";
		}
		if ($action == "pricecomparison") {
			return "Price Comparison Report";
		}
		if ($action == "latestmarketprices") {
			return "Current Market Prices Report";
		}
		if ($action == "latestfuelprices") {
			return "Current Fuel Prices Report";
		}
		if ($action == "pricetrends") {
			return "Price Trends Report";
		}
		
		return parent::getResourceForACL(); 
	}
	function dashboardAction() {
    	
    }
	function approvedmarketpricesAction() {
    	
    }
	function submissionsAction() {
		
    }
	function subscriberAction() {
		
    }
	function subscriberdataAction(){
		$this->_helper->layout->disableLayout();
	}
    function pricetrendsAction() {
    	
    }
	function pricecomparisonAction() {
    	
    }
	function latestmarketpricesAction() {
    	
    }
	function latestfuelpricesAction() {
    	
    }
	/**
     * Redirect list searches to maintain the urls as per zend format 
     */
    public function reportsearchAction() {
    	// debugMessage($this->getRequest()->getQuery());
    	// debugMessage($this->_getAllParams());
    	$action = $this->_getParam('page');
    	// exit();
    	if(!isEmptyString($action)){
    		$this->_helper->redirector->gotoSimple($action, $this->getRequest()->getControllerName(), 
    											$this->getRequest()->getModuleName(),
    											array_remove_empty(array_merge_maintain_keys($this->_getAllParams(), $this->getRequest()->getQuery())));
    	}
    }
	/**
     * Pre-processing for all actions
     *
     * - Disable the layout when displaying printer friendly pages 
     *
     */
    function preDispatch(){
		
		parent::preDispatch();
    	// disable rendering of the layout so that we can just echo the AJAX output
    	if(!isEmptyString($this->_getParam(EXPORT_TO_EXCEL))) { 
			
			// disable rendering of the view and layout so that we can just echo the AJAX output
			$this->_helper->layout->disableLayout();			
	
			// required for IE, otherwise Content-disposition is ignored
			if(ini_get('zlib.output_compression')) {
				ini_set('zlib.output_compression', 'Off');
			}
			
			$response = $this->getResponse();
			
			# This line will stream the file to the user rather than spray it across the screen
			$response->setHeader("Content-type", "application/vnd.ms-excel");
			
			# replace excelfile.xls with whatever you want the filename to default to
			$response->setHeader("Content-Disposition", "attachment;filename=".time().rand(1, 10).".xls");
			$response->setHeader("Expires", 0);
			$response->setHeader("Cache-Control", "private");
			session_cache_limiter("public");
		} 
    } 
}

