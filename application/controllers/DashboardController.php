<?php

class DashboardController extends SecureController  {
	
	public function init()    {
		parent::init();
		$current_timestamp = strtotime('now'); $now_iso = date('Y-m-d H:i:s', $current_timestamp); $this->view->now_iso = $now_iso; //debugMessage('now '.$now_iso.'-'.$current_timestamp); 
		$onehourago_timestamp = strtotime('-1 hour'); $onehourago_iso = date('Y-m-d H:i:s', $onehourago_timestamp ); 
		$this->view->onehourago_iso = $onehourago_iso; $this->view->onehourago_timestamp = $onehourago_timestamp;// debugMessage('now '.$onehourago_iso.'-'.$onehourago_timestamp); 
		$sixhourago_timestamp = strtotime('-6 hour'); $sixhourago_iso = date('Y-m-d H:i:s', $sixhourago_timestamp); 
		$this->view->sixhourago_iso = $sixhourago_iso; $this->view->sixhourago_timestamp = $sixhourago_timestamp;
		$twelvehourago_timestamp = strtotime('-12 hour'); $twelvehourago_iso = date('Y-m-d H:i:s', $twelvehourago_timestamp); 
		$this->view->twelvehourago_timestamp = $twelvehourago_timestamp; $this->view->twelvehourago_iso = $twelvehourago_iso; 
		
		// debugMessage($logged_today_sql);
		$today_iso = date('Y-m-d'); $today = changeMySQLDateToPageFormat($today_iso);  $this->view->today_iso = $today_iso; //debugMessage('today '.$today_iso); 
		$yestday_iso = date('Y-m-d', strtotime('1 day ago')); $yestday = changeMySQLDateToPageFormat($yestday_iso); $this->view->yestday_iso = $yestday_iso; //debugMessage('yesterday '.$yestday_iso); 
		$weekday = date("N");
		
		// monday of week
		$mondaythisweek_iso = date('Y-m-d', strtotime('monday this week')); $mondaythisweek = changeMySQLDateToPageFormat($mondaythisweek_iso); 
		if($weekday == 1){
			$mondaythisweek_iso = $today_iso;
			$mondaythisweek = $today;
		}
		if($weekday == 7){
			$mondaythisweek_iso = date('Y-m-d', strtotime('monday last week'));
			$mondaythisweek = changeMySQLDateToPageFormat($mondaythisweek_iso);
		}
		$this->view->mondaythisweek_iso = $mondaythisweek_iso; //debugMessage('monday this week '.$mondaythisweek_iso);
		
		// sunday of week
		$sundaythisweek_iso = date('Y-m-d', strtotime('sunday this week')); $sundaythisweek = changeMySQLDateToPageFormat($sundaythisweek_iso);
		if($weekday == 1){
			$sundaythisweek_iso = date('Y-m-d', strtotime('today + 7 days')); $sundaythisweek = changeMySQLDateToPageFormat($sundaythisweek_iso);
		}
		if($weekday == 7){
			$sundaythisweek_iso = $today_iso; $sundaythisweek = $today;
		}
		$this->view->sundaythisweek_iso = $sundaythisweek_iso; // debugMessage('sunday this week '.$sundaythisweek_iso);
		
		// monday last week
		$mondaylastweek_iso = date('Y-m-d', strtotime('-7 days', strtotime($mondaythisweek_iso))); //debugMessage('monday last week '.$mondaylastweek_iso);
		$this->view->mondaylastweek_iso = $mondaylastweek_iso;
		// sunday last week
		$sundaylastweek_iso = date('Y-m-d', strtotime('-7 days', strtotime($sundaythisweek_iso))); // debugMessage('sunday last week '.$sundaylastweek_iso);
		$this->view->sundaylastweek_iso = $sundaylastweek_iso;
		// firstday this month
		$firstdayofthismonth_iso = getFirstDayOfCurrentMonth(); //debugMessage('1st day this month '.$firstdayofthismonth_iso);
		$this->view->firstdayofthismonth_iso = $firstdayofthismonth_iso;
		// lastday this month 
		$lastdayofthismonth_iso = getLastDayOfCurrentMonth(); //debugMessage('last day this month '.$lastdayofthismonth_iso);
		$this->view->lastdayofthismonth_iso = $lastdayofthismonth_iso;
		// firstday last month
		$firstdayoflastmonth_iso = getFirstDayOfMonth(date('m')-1, date('Y')); //debugMessage('1st day last month '.$firstdayoflastmonth_iso);
		$this->view->firstdayoflastmonth_iso = $firstdayoflastmonth_iso;
		// lastday last month 
		$lastdayoflastmonth_iso = getLastDayOfMonth(date('m')-1, date('Y')); //debugMessage('last day last month '.$lastdayoflastmonth_iso);
		$this->view->lastdayoflastmonth_iso = $lastdayoflastmonth_iso;
		// firstday this year 
		$firstdayofyear_iso = getFirstDayOfMonth(1, date('Y')); //debugMessage('1st day this year '.$firstdayofyear_iso);
		$this->view->firstdayofyear_iso = $firstdayofyear_iso;
		// lastday this year
		$lastdayofyear_iso = getLastDayOfMonth(12, date('Y')); //debugMessage('last day this year '.$lastdayofyear_iso);
		$this->view->lastdayofyear_iso = $lastdayofyear_iso;
		// first day of month one year ago
		$startofmonth_oneyearago = getFirstDayOfMonth(date('m', strtotime('1 year ago')), date('Y', strtotime('1 year ago')));
		$this->view->startofmonth_oneyearago = $startofmonth_oneyearago;
	}
	/**
	 * @see SecureController::getActionforACL()
	 * 
	 * The dashboard can only be viewed, however the default is create for the index.phtml file. 
	 *
	 * @return String
	 */
	function getActionforACL() {
		return ACTION_VIEW; 
	}
	
	function pricetrendsAction() {
		$this->_helper->layout->disableLayout();
		
	}
	
	function pricesAction() {
		$this->_helper->layout->disableLayout();
		// $this->_helper->viewRenderer->setNoRender(TRUE);
	}
	
	function commodityAction() {
		$this->_helper->layout->disableLayout();
		// $this->_helper->viewRenderer->setNoRender(TRUE);
	}
	
	function farmerugstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    //  debugMessage($this->_getAllParams());
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, FARMIS_SERVER.'graph/farmerugstats');
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		$data = curl_exec($ch);
		curl_close($ch);
		echo $data;
	}
	
	function dnaugstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    $conn = Doctrine_Manager::connection();
	    // debugMessage($this->_getAllParams());
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    // debugMessage(FARMIS_SERVER.'graph/dnaugstats');
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, FARMIS_SERVER.'graph/dnaugstats');
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		$data = curl_exec($ch);
		curl_close($ch);
		echo $data;
	}
	
	function farmerkestatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    //  debugMessage($this->_getAllParams());
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, FARMIS_SERVER.'graph/farmerkestats');
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		$data = curl_exec($ch);
		curl_close($ch);
		echo $data;
	}
	
	function dnakestatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    $conn = Doctrine_Manager::connection();
	    // debugMessage($this->_getAllParams());
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    //  debugMessage($this->_getAllParams());
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, FARMIS_SERVER.'graph/dnakestats');
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		$data = curl_exec($ch);
		curl_close($ch);
		echo $data;
	}
	
	function allmarketssubmittedstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    $conn = Doctrine_Manager::connection();
	    // debugMessage($this->_getAllParams());
		
	    // all submitted  - market
		$allmarkets_submitted_query = "SELECT 
		SUM(IF(UNIX_TIMESTAMP(ps.datecreated) >= ".$this->view->onehourago_timestamp.", 1, 0)) as onehourago, 
		SUM(IF(UNIX_TIMESTAMP(ps.datecreated) >= ".$this->view->sixhourago_timestamp.", 1, 0)) as sixhourago, 
		SUM(IF(UNIX_TIMESTAMP(ps.datecreated) >= ".$this->view->twelvehourago_timestamp.", 1, 0)) as twelvehourago, 
		SUM(IF(TO_DAYS(ps.datecreated) = TO_DAYS('".$this->view->today_iso."'), 1, 0)) as today, 
		SUM(IF(TO_DAYS(ps.datecreated) = TO_DAYS('".$this->view->yestday_iso."'), 1, 0)) as yesterday, 
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->mondaythisweek_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->sundaythisweek_iso."'), 1, 0)) as thisweek, 
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->mondaylastweek_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->sundaylastweek_iso."'), 1, 0)) as lastweek ,
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->firstdayofthismonth_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->lastdayofthismonth_iso."'), 1, 0)) as thismonth,
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->firstdayoflastmonth_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->lastdayoflastmonth_iso."'), 1, 0)) as lastmonth, 
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->firstdayofyear_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->lastdayofyear_iso."'), 1, 0)) as thisyear
		FROM price_submission AS ps Inner Join pricesource AS s ON (ps.sourceid = s.id AND s.type = 2) where ps.status = 2 AND s.type = 2 ";
		// debugMessage($allmarkets_submitted_query);
		$allmarkets_submitted_result = $conn->fetchRow($allmarkets_submitted_query);
		// debugMessage($allmarkets_submitted_result);
		echo json_encode($allmarkets_submitted_result);
	}
	
	function allmarketsapprovedstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    $conn = Doctrine_Manager::connection();
	    // debugMessage($this->_getAllParams());
		
	   	$allmarkets_approved_query = "SELECT 
		SUM(IF(UNIX_TIMESTAMP(ps.datecreated) >= ".$this->view->onehourago_timestamp.", 1, 0)) as onehourago, 
		SUM(IF(UNIX_TIMESTAMP(ps.datecreated) >= ".$this->view->sixhourago_timestamp.", 1, 0)) as sixhourago, 
		SUM(IF(UNIX_TIMESTAMP(ps.datecreated) >= ".$this->view->twelvehourago_timestamp.", 1, 0)) as twelvehourago, 
		SUM(IF(TO_DAYS(ps.datecreated) = TO_DAYS('".$this->view->today_iso."'), 1, 0)) as today, 
		SUM(IF(TO_DAYS(ps.datecreated) = TO_DAYS('".$this->view->yestday_iso."'), 1, 0)) as yesterday, 
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->mondaythisweek_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->sundaythisweek_iso."'), 1, 0)) as thisweek, 
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->mondaylastweek_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->sundaylastweek_iso."'), 1, 0)) as lastweek ,
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->firstdayofthismonth_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->lastdayofthismonth_iso."'), 1, 0)) as thismonth,
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->firstdayoflastmonth_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->lastdayoflastmonth_iso."'), 1, 0)) as lastmonth, 
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->firstdayofyear_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->lastdayofyear_iso."'), 1, 0)) as thisyear
		FROM price_submission AS ps Inner Join pricesource AS s ON (ps.sourceid = s.id AND s.type = 2) where ps.status = 3 AND s.type = 2 ";
		// debugMessage($allmarkets_approved_query);
		$allmarkets_approved_result = $conn->fetchRow($allmarkets_approved_query);
		echo json_encode($allmarkets_approved_result);
	}
	
	function allfuelssubmittedstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    $conn = Doctrine_Manager::connection();
	    // debugMessage($this->_getAllParams());
		
	   	// all submitted - fuel
		$allfuels_submitted_query = "SELECT 
		SUM(IF(UNIX_TIMESTAMP(ps.datecreated) >= ".$this->view->onehourago_timestamp.", 1, 0)) as onehourago, 
		SUM(IF(UNIX_TIMESTAMP(ps.datecreated) >= ".$this->view->sixhourago_timestamp.", 1, 0)) as sixhourago, 
		SUM(IF(UNIX_TIMESTAMP(ps.datecreated) >= ".$this->view->twelvehourago_timestamp.", 1, 0)) as twelvehourago, 
		SUM(IF(TO_DAYS(ps.datecreated) = TO_DAYS('".$this->view->today_iso."'), 1, 0)) as today, 
		SUM(IF(TO_DAYS(ps.datecreated) = TO_DAYS('".$this->view->yestday_iso."'), 1, 0)) as yesterday, 
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->mondaythisweek_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->sundaythisweek_iso."'), 1, 0)) as thisweek, 
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->mondaylastweek_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->sundaylastweek_iso."'), 1, 0)) as lastweek ,
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->firstdayofthismonth_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->lastdayofthismonth_iso."'), 1, 0)) as thismonth,
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->firstdayoflastmonth_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->lastdayoflastmonth_iso."'), 1, 0)) as lastmonth, 
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->firstdayofyear_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->lastdayofyear_iso."'), 1, 0)) as thisyear
		FROM price_submission AS ps Inner Join pricesource AS s ON (ps.sourceid = s.id AND s.type = 4) where ps.status = 2 AND s.type = 4 ";
		// debugMessage($allfuels_submitted_query);
		$allfuels_submitted_result = $conn->fetchRow($allfuels_submitted_query);
		echo json_encode($allfuels_submitted_result);
	}
	
	function allfuelsapprovedstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    $conn = Doctrine_Manager::connection();
	    // debugMessage($this->_getAllParams());
		
	   	// all approved - fuel
		$allfuels_approved_query = "SELECT 
		SUM(IF(UNIX_TIMESTAMP(ps.datecreated) >= ".$this->view->onehourago_timestamp.", 1, 0)) as onehourago, 
		SUM(IF(UNIX_TIMESTAMP(ps.datecreated) >= ".$this->view->sixhourago_timestamp.", 1, 0)) as sixhourago, 
		SUM(IF(UNIX_TIMESTAMP(ps.datecreated) >= ".$this->view->twelvehourago_timestamp.", 1, 0)) as twelvehourago, 
		SUM(IF(TO_DAYS(ps.datecreated) = TO_DAYS('".$this->view->today_iso."'), 1, 0)) as today, 
		SUM(IF(TO_DAYS(ps.datecreated) = TO_DAYS('".$this->view->yestday_iso."'), 1, 0)) as yesterday, 
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->mondaythisweek_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->sundaythisweek_iso."'), 1, 0)) as thisweek, 
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->mondaylastweek_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->sundaylastweek_iso."'), 1, 0)) as lastweek ,
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->firstdayofthismonth_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->lastdayofthismonth_iso."'), 1, 0)) as thismonth,
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->firstdayoflastmonth_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->lastdayoflastmonth_iso."'), 1, 0)) as lastmonth, 
		SUM(IF(TO_DAYS(ps.datecreated) >= TO_DAYS('".$this->view->firstdayofyear_iso."') AND TO_DAYS(ps.datecreated) <= TO_DAYS('".$this->view->lastdayofyear_iso."'), 1, 0)) as thisyear
		FROM price_submission AS ps Inner Join pricesource AS s ON (ps.sourceid = s.id AND s.type = 4) where ps.status = 3 AND s.type = 4 ";
		// debugMessage($allfuels_approved_query);
		$allfuels_approved_result = $conn->fetchRow($allfuels_approved_query);
		echo json_encode($allfuels_approved_result);
	}
	
	function subscriptionresultstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    $conn = Doctrine_Manager::connection();
	    // debugMessage($this->_getAllParams());
		
	   	// agmis subscriptions 
		$subscriber_query = "SELECT 
		SUM(IF(UNIX_TIMESTAMP(u.datecreated) >= ".$this->view->onehourago_timestamp.", 1, 0)) as onehourago, 
		SUM(IF(UNIX_TIMESTAMP(u.datecreated) >= ".$this->view->sixhourago_timestamp.", 1, 0)) as sixhourago, 
		SUM(IF(UNIX_TIMESTAMP(u.datecreated) >= ".$this->view->twelvehourago_timestamp.", 1, 0)) as twelvehourago, 
		SUM(IF(TO_DAYS(u.datecreated) = TO_DAYS('".$this->view->today_iso."'), 1, 0)) as today, 
		SUM(IF(TO_DAYS(u.datecreated) = TO_DAYS('".$this->view->yestday_iso."'), 1, 0)) as yesterday, 
		SUM(IF(TO_DAYS(u.datecreated) >= TO_DAYS('".$this->view->mondaythisweek_iso."') AND TO_DAYS(u.datecreated) <= TO_DAYS('".$this->view->sundaythisweek_iso."'), 1, 0)) as thisweek, 
		SUM(IF(TO_DAYS(u.datecreated) >= TO_DAYS('".$this->view->mondaylastweek_iso."') AND TO_DAYS(u.datecreated) <= TO_DAYS('".$this->view->sundaylastweek_iso."'), 1, 0)) as lastweek ,
		SUM(IF(TO_DAYS(u.datecreated) >= TO_DAYS('".$this->view->firstdayofthismonth_iso."') AND TO_DAYS(u.datecreated) <= TO_DAYS('".$this->view->lastdayofthismonth_iso."'), 1, 0)) as thismonth,
		SUM(IF(TO_DAYS(u.datecreated) >= TO_DAYS('".$this->view->firstdayoflastmonth_iso."') AND TO_DAYS(u.datecreated) <= TO_DAYS('".$this->view->lastdayoflastmonth_iso."'), 1, 0)) as lastmonth, 
		SUM(IF(TO_DAYS(u.datecreated) >= TO_DAYS('".$this->view->firstdayofyear_iso."') AND TO_DAYS(u.datecreated) <= TO_DAYS('".$this->view->lastdayofyear_iso."'), 1, 0)) as thisyear
		FROM useraccount AS u where u.type = 8 ";
		// debugMessage($subscriber_query);
		$subscription_result_agmis = $conn->fetchRow($subscriber_query);
		echo json_encode($subscription_result_agmis);
	}
	
	function infobankstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    $conn = Doctrine_Manager::connection();
	    // debugMessage($this->_getAllParams());
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    //  debugMessage($this->_getAllParams());
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, INFOBANK_SERVER.'graph/infobankstats');
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		$data = curl_exec($ch);
		curl_close($ch);
		echo $data;
	}
	
	function offerresultsubmittedstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    $conn = Doctrine_Manager::connection();
	    // debugMessage($this->_getAllParams());
		
	   	$offer_query_submitted = "SELECT 
		SUM(IF(UNIX_TIMESTAMP(o.datecreated) >= ".$this->view->onehourago_timestamp.", 1, 0)) as onehourago, 
		SUM(IF(UNIX_TIMESTAMP(o.datecreated) >= ".$this->view->sixhourago_timestamp.", 1, 0)) as sixhourago, 
		SUM(IF(UNIX_TIMESTAMP(o.datecreated) >= ".$this->view->twelvehourago_timestamp.", 1, 0)) as twelvehourago, 
		SUM(IF(TO_DAYS(o.datecreated) = TO_DAYS('".$this->view->today_iso."'), 1, 0)) as today, 
		SUM(IF(TO_DAYS(o.datecreated) = TO_DAYS('".$this->view->yestday_iso."'), 1, 0)) as yesterday, 
		SUM(IF(TO_DAYS(o.datecreated) >= TO_DAYS('".$this->view->mondaythisweek_iso."') AND TO_DAYS(o.datecreated) <= TO_DAYS('".$this->view->sundaythisweek_iso."'), 1, 0)) as thisweek, 
		SUM(IF(TO_DAYS(o.datecreated) >= TO_DAYS('".$this->view->mondaylastweek_iso."') AND TO_DAYS(o.datecreated) <= TO_DAYS('".$this->view->sundaylastweek_iso."'), 1, 0)) as lastweek ,
		SUM(IF(TO_DAYS(o.datecreated) >= TO_DAYS('".$this->view->firstdayofthismonth_iso."') AND TO_DAYS(o.datecreated) <= TO_DAYS('".$this->view->lastdayofthismonth_iso."'), 1, 0)) as thismonth,
		SUM(IF(TO_DAYS(o.datecreated) >= TO_DAYS('".$this->view->firstdayoflastmonth_iso."') AND TO_DAYS(o.datecreated) <= TO_DAYS('".$this->view->lastdayoflastmonth_iso."'), 1, 0)) as lastmonth, 
		SUM(IF(TO_DAYS(o.datecreated) >= TO_DAYS('".$this->view->firstdayofyear_iso."') AND TO_DAYS(o.datecreated) <= TO_DAYS('".$this->view->lastdayofyear_iso."'), 1, 0)) as thisyear
		FROM offer AS o where o.id <> '' AND o.status = 2 ";
		// debugMessage($subscriber_query);
		$offer_result_submitted = $conn->fetchRow($offer_query_submitted);
		echo json_encode($offer_result_submitted);
	}
	
	function offerresultapprovedstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    $conn = Doctrine_Manager::connection();
	    // debugMessage($this->_getAllParams());
		
	   	$offer_query_approved = "SELECT 
		SUM(IF(UNIX_TIMESTAMP(o.datecreated) >= ".$this->view->onehourago_timestamp.", 1, 0)) as onehourago, 
		SUM(IF(UNIX_TIMESTAMP(o.datecreated) >= ".$this->view->sixhourago_timestamp.", 1, 0)) as sixhourago, 
		SUM(IF(UNIX_TIMESTAMP(o.datecreated) >= ".$this->view->twelvehourago_timestamp.", 1, 0)) as twelvehourago, 
		SUM(IF(TO_DAYS(o.datecreated) = TO_DAYS('".$this->view->today_iso."'), 1, 0)) as today, 
		SUM(IF(TO_DAYS(o.datecreated) = TO_DAYS('".$this->view->yestday_iso."'), 1, 0)) as yesterday, 
		SUM(IF(TO_DAYS(o.datecreated) >= TO_DAYS('".$this->view->mondaythisweek_iso."') AND TO_DAYS(o.datecreated) <= TO_DAYS('".$this->view->sundaythisweek_iso."'), 1, 0)) as thisweek, 
		SUM(IF(TO_DAYS(o.datecreated) >= TO_DAYS('".$this->view->mondaylastweek_iso."') AND TO_DAYS(o.datecreated) <= TO_DAYS('".$this->view->sundaylastweek_iso."'), 1, 0)) as lastweek ,
		SUM(IF(TO_DAYS(o.datecreated) >= TO_DAYS('".$this->view->firstdayofthismonth_iso."') AND TO_DAYS(o.datecreated) <= TO_DAYS('".$this->view->lastdayofthismonth_iso."'), 1, 0)) as thismonth,
		SUM(IF(TO_DAYS(o.datecreated) >= TO_DAYS('".$this->view->firstdayoflastmonth_iso."') AND TO_DAYS(o.datecreated) <= TO_DAYS('".$this->view->lastdayoflastmonth_iso."'), 1, 0)) as lastmonth, 
		SUM(IF(TO_DAYS(o.datecreated) >= TO_DAYS('".$this->view->firstdayofyear_iso."') AND TO_DAYS(o.datecreated) <= TO_DAYS('".$this->view->lastdayofyear_iso."'), 1, 0)) as thisyear
		FROM offer AS o where o.id <> '' AND o.status = 3 ";
		// debugMessage($subscriber_query);
		$offer_result_approved = $conn->fetchRow($offer_query_approved);
		echo json_encode($offer_result_approved);
	}
	
	function directoryresultsubmittedstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    $conn = Doctrine_Manager::connection();
	    // debugMessage($this->_getAllParams());
		
	   	$offer_query_submitted = "SELECT 
		SUM(IF(UNIX_TIMESTAMP(o.datecreated) >= ".$this->view->onehourago_timestamp.", 1, 0)) as onehourago, 
		SUM(IF(UNIX_TIMESTAMP(o.datecreated) >= ".$this->view->sixhourago_timestamp.", 1, 0)) as sixhourago, 
		SUM(IF(UNIX_TIMESTAMP(o.datecreated) >= ".$this->view->twelvehourago_timestamp.", 1, 0)) as twelvehourago, 
		SUM(IF(TO_DAYS(o.datecreated) = TO_DAYS('".$this->view->today_iso."'), 1, 0)) as today, 
		SUM(IF(TO_DAYS(o.datecreated) = TO_DAYS('".$this->view->yestday_iso."'), 1, 0)) as yesterday, 
		SUM(IF(TO_DAYS(o.datecreated) >= TO_DAYS('".$this->view->mondaythisweek_iso."') AND TO_DAYS(o.datecreated) <= TO_DAYS('".$this->view->sundaythisweek_iso."'), 1, 0)) as thisweek, 
		SUM(IF(TO_DAYS(o.datecreated) >= TO_DAYS('".$this->view->mondaylastweek_iso."') AND TO_DAYS(o.datecreated) <= TO_DAYS('".$this->view->sundaylastweek_iso."'), 1, 0)) as lastweek ,
		SUM(IF(TO_DAYS(o.datecreated) >= TO_DAYS('".$this->view->firstdayofthismonth_iso."') AND TO_DAYS(o.datecreated) <= TO_DAYS('".$this->view->lastdayofthismonth_iso."'), 1, 0)) as thismonth,
		SUM(IF(TO_DAYS(o.datecreated) >= TO_DAYS('".$this->view->firstdayoflastmonth_iso."') AND TO_DAYS(o.datecreated) <= TO_DAYS('".$this->view->lastdayoflastmonth_iso."'), 1, 0)) as lastmonth, 
		SUM(IF(TO_DAYS(o.datecreated) >= TO_DAYS('".$this->view->firstdayofyear_iso."') AND TO_DAYS(o.datecreated) <= TO_DAYS('".$this->view->lastdayofyear_iso."'), 1, 0)) as thisyear
		FROM contact AS o where o.id <> '' AND o.status = 2 ";
		// debugMessage($subscriber_query);
		$offer_result_submitted = $conn->fetchRow($offer_query_submitted);
		echo json_encode($offer_result_submitted);
	}
	
	function directoryresultapprovedstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    $conn = Doctrine_Manager::connection();
	    // debugMessage($this->_getAllParams());
		
	   	$directory_query_approved = "SELECT 
		SUM(IF(UNIX_TIMESTAMP(c.datecreated) >= ".$this->view->onehourago_timestamp.", 1, 0)) as onehourago, 
		SUM(IF(UNIX_TIMESTAMP(c.datecreated) >= ".$this->view->sixhourago_timestamp.", 1, 0)) as sixhourago, 
		SUM(IF(UNIX_TIMESTAMP(c.datecreated) >= ".$this->view->twelvehourago_timestamp.", 1, 0)) as twelvehourago, 
		SUM(IF(TO_DAYS(c.datecreated) = TO_DAYS('".$this->view->today_iso."'), 1, 0)) as today, 
		SUM(IF(TO_DAYS(c.datecreated) = TO_DAYS('".$this->view->yestday_iso."'), 1, 0)) as yesterday, 
		SUM(IF(TO_DAYS(c.datecreated) >= TO_DAYS('".$this->view->mondaythisweek_iso."') AND TO_DAYS(c.datecreated) <= TO_DAYS('".$this->view->sundaythisweek_iso."'), 1, 0)) as thisweek, 
		SUM(IF(TO_DAYS(c.datecreated) >= TO_DAYS('".$this->view->mondaylastweek_iso."') AND TO_DAYS(c.datecreated) <= TO_DAYS('".$this->view->sundaylastweek_iso."'), 1, 0)) as lastweek ,
		SUM(IF(TO_DAYS(c.datecreated) >= TO_DAYS('".$this->view->firstdayofthismonth_iso."') AND TO_DAYS(c.datecreated) <= TO_DAYS('".$this->view->lastdayofthismonth_iso."'), 1, 0)) as thismonth,
		SUM(IF(TO_DAYS(c.datecreated) >= TO_DAYS('".$this->view->firstdayoflastmonth_iso."') AND TO_DAYS(c.datecreated) <= TO_DAYS('".$this->view->lastdayoflastmonth_iso."'), 1, 0)) as lastmonth, 
		SUM(IF(TO_DAYS(c.datecreated) >= TO_DAYS('".$this->view->firstdayofyear_iso."') AND TO_DAYS(c.datecreated) <= TO_DAYS('".$this->view->lastdayofyear_iso."'), 1, 0)) as thisyear
		FROM contact AS c where c.id <> '' AND c.status = 3 ";
		// debugMessage($subscriber_query);
		$directory_result_approved = $conn->fetchRow($directory_query_approved);
		echo json_encode($directory_result_approved);
	}
	
	function forumresultsubmittedstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    $conn = Doctrine_Manager::connection();
	    // debugMessage($this->_getAllParams());
		
	   	$forum_query_submitted = "SELECT 
		SUM(IF(UNIX_TIMESTAMP(c.datecreated) >= ".$this->view->onehourago_timestamp.", 1, 0)) as onehourago, 
		SUM(IF(UNIX_TIMESTAMP(c.datecreated) >= ".$this->view->sixhourago_timestamp.", 1, 0)) as sixhourago, 
		SUM(IF(UNIX_TIMESTAMP(c.datecreated) >= ".$this->view->twelvehourago_timestamp.", 1, 0)) as twelvehourago, 
		SUM(IF(TO_DAYS(c.datecreated) = TO_DAYS('".$this->view->today_iso."'), 1, 0)) as today, 
		SUM(IF(TO_DAYS(c.datecreated) = TO_DAYS('".$this->view->yestday_iso."'), 1, 0)) as yesterday, 
		SUM(IF(TO_DAYS(c.datecreated) >= TO_DAYS('".$this->view->mondaythisweek_iso."') AND TO_DAYS(c.datecreated) <= TO_DAYS('".$this->view->sundaythisweek_iso."'), 1, 0)) as thisweek, 
		SUM(IF(TO_DAYS(c.datecreated) >= TO_DAYS('".$this->view->mondaylastweek_iso."') AND TO_DAYS(c.datecreated) <= TO_DAYS('".$this->view->sundaylastweek_iso."'), 1, 0)) as lastweek ,
		SUM(IF(TO_DAYS(c.datecreated) >= TO_DAYS('".$this->view->firstdayofthismonth_iso."') AND TO_DAYS(c.datecreated) <= TO_DAYS('".$this->view->lastdayofthismonth_iso."'), 1, 0)) as thismonth,
		SUM(IF(TO_DAYS(c.datecreated) >= TO_DAYS('".$this->view->firstdayoflastmonth_iso."') AND TO_DAYS(c.datecreated) <= TO_DAYS('".$this->view->lastdayoflastmonth_iso."'), 1, 0)) as lastmonth, 
		SUM(IF(TO_DAYS(c.datecreated) >= TO_DAYS('".$this->view->firstdayofyear_iso."') AND TO_DAYS(c.datecreated) <= TO_DAYS('".$this->view->lastdayofyear_iso."'), 1, 0)) as thisyear
		FROM communityforum AS c where c.id <> '' AND c.status = 2 ";
		// debugMessage($subscriber_query);
		$forum_result_submitted = $conn->fetchRow($forum_query_submitted);
		echo json_encode($forum_result_submitted);
	}
	
	function forumresultapprovedstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    $conn = Doctrine_Manager::connection();
	    // debugMessage($this->_getAllParams());
		
	   	$forum_query_approved = "SELECT 
		SUM(IF(UNIX_TIMESTAMP(c.datecreated) >= ".$this->view->onehourago_timestamp.", 1, 0)) as onehourago, 
		SUM(IF(UNIX_TIMESTAMP(c.datecreated) >= ".$this->view->sixhourago_timestamp.", 1, 0)) as sixhourago, 
		SUM(IF(UNIX_TIMESTAMP(c.datecreated) >= ".$this->view->twelvehourago_timestamp.", 1, 0)) as twelvehourago, 
		SUM(IF(TO_DAYS(c.datecreated) = TO_DAYS('".$this->view->today_iso."'), 1, 0)) as today, 
		SUM(IF(TO_DAYS(c.datecreated) = TO_DAYS('".$this->view->yestday_iso."'), 1, 0)) as yesterday, 
		SUM(IF(TO_DAYS(c.datecreated) >= TO_DAYS('".$this->view->mondaythisweek_iso."') AND TO_DAYS(c.datecreated) <= TO_DAYS('".$this->view->sundaythisweek_iso."'), 1, 0)) as thisweek, 
		SUM(IF(TO_DAYS(c.datecreated) >= TO_DAYS('".$this->view->mondaylastweek_iso."') AND TO_DAYS(c.datecreated) <= TO_DAYS('".$this->view->sundaylastweek_iso."'), 1, 0)) as lastweek ,
		SUM(IF(TO_DAYS(c.datecreated) >= TO_DAYS('".$this->view->firstdayofthismonth_iso."') AND TO_DAYS(c.datecreated) <= TO_DAYS('".$this->view->lastdayofthismonth_iso."'), 1, 0)) as thismonth,
		SUM(IF(TO_DAYS(c.datecreated) >= TO_DAYS('".$this->view->firstdayoflastmonth_iso."') AND TO_DAYS(c.datecreated) <= TO_DAYS('".$this->view->lastdayoflastmonth_iso."'), 1, 0)) as lastmonth, 
		SUM(IF(TO_DAYS(c.datecreated) >= TO_DAYS('".$this->view->firstdayofyear_iso."') AND TO_DAYS(c.datecreated) <= TO_DAYS('".$this->view->lastdayofyear_iso."'), 1, 0)) as thisyear
		FROM communityforum AS c where c.id <> '' AND c.status = 3 ";
		// debugMessage($subscriber_query);
		$forum_result_approved = $conn->fetchRow($forum_query_approved);
		echo json_encode($forum_result_approved);
	}
	
	function smsinboundstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    // debugMessage($this->_getAllParams());
		$smsconn = getSMSConnection(); 
		
		$inbound_mo_query = "SELECT 
		SUM(IF(UNIX_TIMESTAMP(c.created) >= ".$this->view->onehourago_timestamp.", 1, 0)) as onehourago, 
		SUM(IF(UNIX_TIMESTAMP(c.created) >= ".$this->view->sixhourago_timestamp.", 1, 0)) as sixhourago, 
		SUM(IF(UNIX_TIMESTAMP(c.created) >= ".$this->view->twelvehourago_timestamp.", 1, 0)) as twelvehourago, 
		SUM(IF(TO_DAYS(c.created) = TO_DAYS('".$this->view->today_iso."'), 1, 0)) as today, 
		SUM(IF(TO_DAYS(c.created) = TO_DAYS('".$this->view->yestday_iso."'), 1, 0)) as yesterday, 
		SUM(IF(TO_DAYS(c.created) >= TO_DAYS('".$this->view->mondaythisweek_iso."') AND TO_DAYS(c.created) <= TO_DAYS('".$this->view->sundaythisweek_iso."'), 1, 0)) as thisweek, 
		SUM(IF(TO_DAYS(c.created) >= TO_DAYS('".$this->view->mondaylastweek_iso."') AND TO_DAYS(c.created) <= TO_DAYS('".$this->view->sundaylastweek_iso."'), 1, 0)) as lastweek ,
		SUM(IF(TO_DAYS(c.created) >= TO_DAYS('".$this->view->firstdayofthismonth_iso."') AND TO_DAYS(c.created) <= TO_DAYS('".$this->view->lastdayofthismonth_iso."'), 1, 0)) as thismonth,
		SUM(IF(TO_DAYS(c.created) >= TO_DAYS('".$this->view->firstdayoflastmonth_iso."') AND TO_DAYS(c.created) <= TO_DAYS('".$this->view->lastdayoflastmonth_iso."'), 1, 0)) as lastmonth, 
		SUM(IF(TO_DAYS(c.created) >= TO_DAYS('".$this->view->firstdayofyear_iso."') AND TO_DAYS(c.created) <= TO_DAYS('".$this->view->lastdayofyear_iso."'), 1, 0)) as thisyear
		FROM sms AS c where c.id <> '' AND c.destination = 8555 AND c.direction = 'mo' ";
		// debugMessage($inbound_mo_query);
		$inbound_result = $smsconn->fetchRow($inbound_mo_query);
		
	   	// debugMessage($inbound_result);
	   	echo json_encode($inbound_result);
	}
	
	function smsinboundcbsstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    // debugMessage($this->_getAllParams());
		$smsconn = getSMSConnectionCBS(); 
		
		$inbound_mo_query = "SELECT 
		SUM(IF(UNIX_TIMESTAMP(c.created) >= ".$this->view->onehourago_timestamp.", 1, 0)) as onehourago, 
		SUM(IF(UNIX_TIMESTAMP(c.created) >= ".$this->view->sixhourago_timestamp.", 1, 0)) as sixhourago, 
		SUM(IF(UNIX_TIMESTAMP(c.created) >= ".$this->view->twelvehourago_timestamp.", 1, 0)) as twelvehourago, 
		SUM(IF(TO_DAYS(c.created) = TO_DAYS('".$this->view->today_iso."'), 1, 0)) as today, 
		SUM(IF(TO_DAYS(c.created) = TO_DAYS('".$this->view->yestday_iso."'), 1, 0)) as yesterday, 
		SUM(IF(TO_DAYS(c.created) >= TO_DAYS('".$this->view->mondaythisweek_iso."') AND TO_DAYS(c.created) <= TO_DAYS('".$this->view->sundaythisweek_iso."'), 1, 0)) as thisweek, 
		SUM(IF(TO_DAYS(c.created) >= TO_DAYS('".$this->view->mondaylastweek_iso."') AND TO_DAYS(c.created) <= TO_DAYS('".$this->view->sundaylastweek_iso."'), 1, 0)) as lastweek ,
		SUM(IF(TO_DAYS(c.created) >= TO_DAYS('".$this->view->firstdayofthismonth_iso."') AND TO_DAYS(c.created) <= TO_DAYS('".$this->view->lastdayofthismonth_iso."'), 1, 0)) as thismonth,
		SUM(IF(TO_DAYS(c.created) >= TO_DAYS('".$this->view->firstdayoflastmonth_iso."') AND TO_DAYS(c.created) <= TO_DAYS('".$this->view->lastdayoflastmonth_iso."'), 1, 0)) as lastmonth, 
		SUM(IF(TO_DAYS(c.created) >= TO_DAYS('".$this->view->firstdayofyear_iso."') AND TO_DAYS(c.created) <= TO_DAYS('".$this->view->lastdayofyear_iso."'), 1, 0)) as thisyear
		FROM sms AS c where c.id <> '' AND c.destination = 8892 AND c.direction = 'mo' ";
		// debugMessage($inbound_mo_query);
		$inbound_result = $smsconn->fetchRow($inbound_mo_query);
		
	   	// debugMessage($inbound_result);
	   	echo json_encode($inbound_result);
	}
	
	function smsoutboundstatsAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    // debugMessage($this->_getAllParams());
	    $smsconn = getSMSConnection(); 
		
		$outbound_mt_query = "SELECT 
		SUM(IF(UNIX_TIMESTAMP(c.created) >= ".$this->view->onehourago_timestamp.", 1, 0)) as onehourago, 
		SUM(IF(UNIX_TIMESTAMP(c.created) >= ".$this->view->sixhourago_timestamp.", 1, 0)) as sixhourago, 
		SUM(IF(UNIX_TIMESTAMP(c.created) >= ".$this->view->twelvehourago_timestamp.", 1, 0)) as twelvehourago, 
		SUM(IF(TO_DAYS(c.created) = TO_DAYS('".$this->view->today_iso."'), 1, 0)) as today, 
		SUM(IF(TO_DAYS(c.created) = TO_DAYS('".$this->view->yestday_iso."'), 1, 0)) as yesterday, 
		SUM(IF(TO_DAYS(c.created) >= TO_DAYS('".$this->view->mondaythisweek_iso."') AND TO_DAYS(c.created) <= TO_DAYS('".$this->view->sundaythisweek_iso."'), 1, 0)) as thisweek, 
		SUM(IF(TO_DAYS(c.created) >= TO_DAYS('".$this->view->mondaylastweek_iso."') AND TO_DAYS(c.created) <= TO_DAYS('".$this->view->sundaylastweek_iso."'), 1, 0)) as lastweek ,
		SUM(IF(TO_DAYS(c.created) >= TO_DAYS('".$this->view->firstdayofthismonth_iso."') AND TO_DAYS(c.created) <= TO_DAYS('".$this->view->lastdayofthismonth_iso."'), 1, 0)) as thismonth,
		SUM(IF(TO_DAYS(c.created) >= TO_DAYS('".$this->view->firstdayoflastmonth_iso."') AND TO_DAYS(c.created) <= TO_DAYS('".$this->view->lastdayoflastmonth_iso."'), 1, 0)) as lastmonth, 
		SUM(IF(TO_DAYS(c.created) >= TO_DAYS('".$this->view->firstdayofyear_iso."') AND TO_DAYS(c.created) <= TO_DAYS('".$this->view->lastdayofyear_iso."'), 1, 0)) as thisyear
		FROM mt AS c where TO_DAYS(c.created) >= TO_DAYS(DATE_SUB(NOW(), INTERVAL 4 MONTH)) ";
		// debugMessage($outbound_mt_query);
		$outbound_result = $smsconn->fetchRow($outbound_mt_query);
		
	   	// debugMessage($outbound_result);
	   	echo json_encode($outbound_result);
	}
	
	function allfarmersugAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    
		$conn = getFarmisConnection(); 
		
		$farmer_query = "SELECT COUNT(c.id) as farmercount
		FROM useraccount AS c where c.id <> '' AND c.type = 2 AND UPPER(c.country) = 'UG' ";
		// debugMessage($farmer_query);
		$farmer_result = $conn->fetchRow($farmer_query);
		// debugMessage($farmer_result);
		echo json_encode($farmer_result);
	}
	
	function alldnasugAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
		$conn = getFarmisConnection(); 
		
		$dna_query = "SELECT COUNT(c.id) as dnacount
		FROM farmgroup AS c where c.id <> '' AND c.parentid IS NULL AND UPPER(c.country) = 'UG' ";
		// debugMessage($dna_query);
		$dna_result = $conn->fetchRow($dna_query);
		// debugMessage($dna_result);
		echo json_encode($dna_result);
	}
	
	function allfarmerskeAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
	    
		$conn = getFarmisConnection(); 
		
		$farmer_query = "SELECT COUNT(c.id) as farmercount
		FROM useraccount AS c where c.id <> '' AND c.type = 2 AND UPPER(c.country) = 'KE' ";
		// debugMessage($farmer_query);
		$farmer_result = $conn->fetchRow($farmer_query);
		// debugMessage($farmer_result);
		echo json_encode($farmer_result);
	}
	
	function alldnaskeAction(){
		$this->_helper->layout->disableLayout();
	    $this->_helper->viewRenderer->setNoRender(TRUE);
		$conn = getFarmisConnection(); 
		
		$dna_query = "SELECT COUNT(c.id) as dnacount
		FROM farmgroup AS c where c.id <> '' AND c.parentid IS NULL AND UPPER(c.country) = 'KE' ";
		// debugMessage($dna_query);
		$dna_result = $conn->fetchRow($dna_query);
		// debugMessage($dna_result);
		echo json_encode($dna_result);
	}
}