<?php

	# This class require_onces functions to access and use the different drop down lists within
	# this application

	/**
	 * function to return the results of an options query as array. This function assumes that
	 * the query returns two columns optionvalue and optiontext which correspond to the corresponding key
	 * and values respectively. 
	 * 
	 * The selection of the names is to avoid name collisions with database reserved words
	 * 
	 * @param String $query The database query
	 * 
	 * @return Array of values for the query 
	 */
	function getOptionValuesFromDatabaseQuery($query) {
		$conn = Doctrine_Manager::connection(); 
		$result = $conn->fetchAll($query);
		$valuesarray = array();
		foreach ($result as $value) {
			$valuesarray[$value['optionvalue']]	= htmlentities($value['optiontext']);
		}
		return decodeHtmlEntitiesInArray($valuesarray);
	}
	# function to generate months
	function getAllMonths() {
		$months = array(
		"January" => "January",		
		"February" => "February",
		"March" => "March",
		"April" => "April",
		"May" => "May",		
		"June" => "June",
		"July" => "July",
		"August" => "August",
		"September" => "September",		
		"October" => "October",
		"November" => "November",
		"December" => "December"	
		);
		return $months;
	}
	
	# function to generate months
	function getAllMonthsAsNumbers() {
		$months = array(
		"01" => "January",		
		"02" => "February",
		"03" => "March",
		"04" => "April",
		"05" => "May",		
		"06" => "June",
		"07" => "July",
		"08" => "August",
		"09" => "September",		
		"10" => "October",
		"11" => "November",
		"12" => "December"	
		);
		return $months;
	}
	# function to generate months
	function getShortMonthsAsNumbers($current='') {
		$months = array(
		"01" => "Jan",		
		"02" => "Feb",
		"03" => "Mar",
		"04" => "Apr",
		"05" => "May",		
		"06" => "Jun",
		"07" => "Jul",
		"08" => "Aug",
		"09" => "Sep",		
		"10" => "Oct",
		"11" => "Nov",
		"12" => "Dec"	
		);
		if(!isEmptyString($current)){
			return $months[$current];
		}
		return $months;
	}
	# split a date into day month and year
	function splitDate($date) {
		if(isEmptyString($date)){
			return array();
		}
		$date = date('Y-n-j',strtotime($date));
		$date_parts = explode('-', $date);
		// debugMessage($date_parts);
		return $date_parts;	
	}
	# function to generate months
	function getMonthsAsNumbers() {
		$months = array(
		"01" => "01",		
		"02" => "02",
		"03" => "03",
		"04" => "04",
		"05" => "05",		
		"06" => "06",
		"07" => "07",
		"08" => "08",
		"09" => "09",		
		"10" => "10",
		"11" => "11",
		"12" => "12"	
		);
		return $months;
	}
	# function to generate months short names
	function getAllMonthsAsShortNames($current ='') {
		$months = array(
		"1" => "Jan",		
		"2" => "Feb",
		"3" => "Mar",
		"4" => "Apr",
		"5" => "May",		
		"6" => "Jun",
		"7" => "Jul",
		"8" => "Aug",
		"9" => "Sept",		
		"10" => "Oct",
		"11" => "Nov",
		"12" => "Dec"	
		);
		if(!isEmptyString($current)){
			return $months[$current];
		}
		return $months;
	}
	
	function getMonthName($number) {
		$months = getAllMonthsAsNumbers();
		return $months[$number];
	}
	
	# function to generate years
	function getAllYears($yearsback="", $yearsahead="") {				
		$aconfig = Zend_Registry::get("config"); 
		$years = array(); 
		$start_year = date("Y") - $aconfig->dateandtime->mindate;
		if(!isEmptyString($yearsback)){
			$start_year = date("Y") - $yearsback;
		}
		$end_year = date("Y") + $aconfig->dateandtime->maxdate;
		if(!isEmptyString($yearsahead)){
			$end_year = date("Y") + $yearsahead;
		}
		for($i = $start_year; $i <= $end_year; $i++) {
			$years[$i] = $i; 
		}		
		//return the years in descending order from the last year to the first and add true to maintain the array keys
		return array_reverse($years, true);
	}
	
	# function to generate future years
	function getFutureYears() {				
		$aconfig = Zend_Registry::get("config"); 
		$years = array(); 
		$start_year = date("Y");
		
		$end_year = date("Y") + $aconfig->dateandtime->mindate;
		for($i = $start_year; $i <= $end_year; $i++) {
			$years[$i] = $i; 
		}		
		//return the years in descending order from the last year to the first and add true to maintain the array keys
		return $years;
	}
        # function to generate years
	function getMultipleYears() {				
		$aconfig = Zend_Registry::get("config"); 
		$years = array(); 
		$start_year = date("Y") - $aconfig->dateandtime->mindateofbirth;
		
		$end_year = date("Y");
		for($i = $start_year; $i <= $end_year; $i++) {
			$years[$i] = $i; 
		}		
		//return the years in descending order from the last year to the first and add true to maintain the array keys
		return array_reverse($years, true);
	}
	 # function to generate years
	function getSubscribeBirthYears() {				
		$aconfig = Zend_Registry::get("config"); 
		$years = array(); 
		// $start_year = (date("Y")) - 100;
		$start_year = 1900;
		
		$end_year = (date("Y"));
		for($i = $start_year; $i <= $end_year; $i++) {
			$years[$i] = $i; 
		}		
		//return the years in descending order from the last year to the first and add true to maintain the array keys
		return array_reverse($years, true);
	}
	# function to generate years
	function getMonthDays() {
		$days = array(); 
		$start_day = 1;
	
		$end_day = 31;
		for($i = $start_day; $i <= $end_day; $i++) {
			$days[$i] = $i; 
		}		
		//return the years in descending order from 2009 down to the start year and true to maintain the array keys
		return $days;
	}
	# get the first day of a month
	function getFirstDayOfMonth($month,$year) {
		return date("Y-m-d", mktime(0,0,0, $month,1,$year));
	}
	# get the last day of a month
	function getLastDayOfMonth($month,$year) {
		return date("Y-m-d", mktime(0,0,0, $month+1,0,$year));
	}
	# get the first day of current month
	function getFirstDayOfNextMonth($month,$year) {
		return date("Y-m-d", mktime(0,0,0, $month,2,$year));
	}
	# get the last day of the next month
	function getLastDayOfNextMonth($month,$year) {
		return date("Y-m-d", mktime(0,0,0, $month+2,0,$year));
	}
	# get the first day of last month
	function getFirstDayOfLastMonth($month,$year) {
		return date("Y-m-d", mktime(0,0,0, $month,-1,$year));
	}
	# get the last day of the last month
	function getLastDayOfLastMonth($month,$year) {
		return date("Y-m-d", mktime(0,0,0, $month-1,0,$year));
	}
	# get the first day of the current year and month
	function getFirstDayOfCurrentMonth(){
		return date("Y-m-d", mktime (0,0,0, date("n"),1, date("Y")));
	}
	# get the last day of the last month
	function getLastDayOfCurrentMonth() {
		return date("Y-m-d", mktime(0,0,0, date("n")+1,0, date("Y")));
	}
	
    /**
	 * Return an array containing the countries in the world
	 *
	 * @return Array Containing 2 digit country codes as the key, and the name of a couuntry as the value
	 */
	function getCountries(){
		$country_list = array(
			"GB" => "United Kingdom",
			"US" => "United States",
			"AF" => "Afghanistan",
			"AL" => "Albania",
			"DZ" => "Algeria",
			"AS" => "American Samoa",
			"AD" => "Andorra",
			"AO" => "Angola",
			"AI" => "Anguilla",
			"AQ" => "Antarctica",
			"AG" => "Antigua And Barbuda",
			"AR" => "Argentina",
			"AM" => "Armenia",
			"AW" => "Aruba",
			"AU" => "Australia",
			"AT" => "Austria",
			"AZ" => "Azerbaijan",
			"BS" => "Bahamas",
			"BH" => "Bahrain",
			"BD" => "Bangladesh",
			"BB" => "Barbados",
			"BY" => "Belarus",
			"BE" => "Belgium",
			"BZ" => "Belize",
			"BJ" => "Benin",
			"BM" => "Bermuda",
			"BT" => "Bhutan",
			"BO" => "Bolivia",
			"BA" => "Bosnia And Herzegowina",
			"BW" => "Botswana",
			"BV" => "Bouvet Island",
			"BR" => "Brazil",
			"IO" => "British Indian Ocean Territory",
			"BN" => "Brunei Darussalam",
			"BG" => "Bulgaria",
			"BF" => "Burkina Faso",
			"BI" => "Burundi",
			"KH" => "Cambodia",
			"CM" => "Cameroon",
			"CA" => "Canada",
			"CV" => "Cape Verde",
			"KY" => "Cayman Islands",
			"CF" => "Central African Republic",
			"TD" => "Chad",
			"CL" => "Chile",
			"CN" => "China",
			"CX" => "Christmas Island",
			"CC" => "Cocos (Keeling) Islands",
			"CO" => "Colombia",
			"KM" => "Comoros",
			"CG" => "Congo",
			"CD" => "Congo, The Democratic Republic Of The",
			"CK" => "Cook Islands",
			"CR" => "Costa Rica",
			"CI" => "Cote D'Ivoire",
			"HR" => "Croatia (Local Name: Hrvatska)",
			"CU" => "Cuba",
			"CY" => "Cyprus",
			"CZ" => "Czech Republic",
			"DK" => "Denmark",
			"DJ" => "Djibouti",
			"DM" => "Dominica",
			"DO" => "Dominican Republic",
			"TP" => "East Timor",
			"EC" => "Ecuador",
			"EG" => "Egypt",
			"SV" => "El Salvador",
			"GQ" => "Equatorial Guinea",
			"ER" => "Eritrea",
			"EE" => "Estonia",
			"ET" => "Ethiopia",
			"FK" => "Falkland Islands (Malvinas)",
			"FO" => "Faroe Islands",
			"FJ" => "Fiji",
			"FI" => "Finland",
			"FR" => "France",
			"FX" => "France, Metropolitan",
			"GF" => "French Guiana",
			"PF" => "French Polynesia",
			"TF" => "French Southern Territories",
			"GA" => "Gabon",
			"GM" => "Gambia",
			"GE" => "Georgia",
			"DE" => "Germany",
			"GH" => "Ghana",
			"GI" => "Gibraltar",
			"GR" => "Greece",
			"GL" => "Greenland",
			"GD" => "Grenada",
			"GP" => "Guadeloupe",
			"GU" => "Guam",
			"GT" => "Guatemala",
			"GN" => "Guinea",
			"GW" => "Guinea-Bissau",
			"GY" => "Guyana",
			"HT" => "Haiti",
			"HM" => "Heard And Mc Donald Islands",
			"VA" => "Holy See (Vatican City State)",
			"HN" => "Honduras",
			"HK" => "Hong Kong",
			"HU" => "Hungary",
			"IS" => "Iceland",
			"IN" => "India",
			"ID" => "Indonesia",
			"IR" => "Iran (Islamic Republic Of)",
			"IQ" => "Iraq",
			"IE" => "Ireland",
			"IL" => "Israel",
			"IT" => "Italy",
			"JM" => "Jamaica",
			"JP" => "Japan",
			"JO" => "Jordan",
			"KZ" => "Kazakhstan",
			"KE" => "Kenya",
			"KI" => "Kiribati",
			"KP" => "Korea, Democratic People's Republic Of",
			"KR" => "Korea, Republic Of",
			"KW" => "Kuwait",
			"KG" => "Kyrgyzstan",
			"LA" => "Lao People's Democratic Republic",
			"LV" => "Latvia",
			"LB" => "Lebanon",
			"LS" => "Lesotho",
			"LR" => "Liberia",
			"LY" => "Libyan Arab Jamahiriya",
			"LI" => "Liechtenstein",
			"LT" => "Lithuania",
			"LU" => "Luxembourg",
			"MO" => "Macau",
			"MK" => "Macedonia, Former Yugoslav Republic Of",
			"MG" => "Madagascar",
			"MW" => "Malawi",
			"MY" => "Malaysia",
			"MV" => "Maldives",
			"ML" => "Mali",
			"MT" => "Malta",
			"MH" => "Marshall Islands",
			"MQ" => "Martinique",
			"MR" => "Mauritania",
			"MU" => "Mauritius",
			"YT" => "Mayotte",
			"MX" => "Mexico",
			"FM" => "Micronesia, Federated States Of",
			"MD" => "Moldova, Republic Of",
			"MC" => "Monaco",
			"MN" => "Mongolia",
			"MS" => "Montserrat",
			"MA" => "Morocco",
			"MZ" => "Mozambique",
			"MM" => "Myanmar",
			"NA" => "Namibia",
			"NR" => "Nauru",
			"NP" => "Nepal",
			"NL" => "Netherlands",
			"AN" => "Netherlands Antilles",
			"NC" => "New Caledonia",
			"NZ" => "New Zealand",
			"NI" => "Nicaragua",
			"NE" => "Niger",
			"NG" => "Nigeria",
			"NU" => "Niue",
			"NF" => "Norfolk Island",
			"MP" => "Northern Mariana Islands",
			"NO" => "Norway",
			"OM" => "Oman",
			"PK" => "Pakistan",
			"PW" => "Palau",
			"PA" => "Panama",
			"PG" => "Papua New Guinea",
			"PY" => "Paraguay",
			"PE" => "Peru",
			"PH" => "Philippines",
			"PN" => "Pitcairn",
			"PL" => "Poland",
			"PT" => "Portugal",
			"PR" => "Puerto Rico",
			"QA" => "Qatar",
			"RE" => "Reunion",
			"RO" => "Romania",
			"RU" => "Russian Federation",
			"RW" => "Rwanda",
			"KN" => "Saint Kitts And Nevis",
			"LC" => "Saint Lucia",
			"VC" => "Saint Vincent And The Grenadines",
			"WS" => "Samoa",
			"SM" => "San Marino",
			"ST" => "Sao Tome And Principe",
			"SA" => "Saudi Arabia",
			"SN" => "Senegal",
			"SC" => "Seychelles",
			"SL" => "Sierra Leone",
			"SG" => "Singapore",
			"SK" => "Slovakia (Slovak Republic)",
			"SI" => "Slovenia",
			"SB" => "Solomon Islands",
			"SO" => "Somalia",
			"ZA" => "South Africa",
			"GS" => "South Georgia, South Sandwich Islands",
			"ES" => "Spain",
			"LK" => "Sri Lanka",
			"SH" => "St. Helena",
			"PM" => "St. Pierre And Miquelon",
			"SD" => "Sudan",
			"SR" => "Suriname",
			"SJ" => "Svalbard And Jan Mayen Islands",
			"SZ" => "Swaziland",
			"SE" => "Sweden",
			"CH" => "Switzerland",
			"SY" => "Syrian Arab Republic",
			"TW" => "Taiwan",
			"TJ" => "Tajikistan",
			"TZ" => "Tanzania, United Republic Of",
			"TH" => "Thailand",
			"TG" => "Togo",
			"TK" => "Tokelau",
			"TO" => "Tonga",
			"TT" => "Trinidad And Tobago",
			"TN" => "Tunisia",
			"TR" => "Turkey",
			"TM" => "Turkmenistan",
			"TC" => "Turks And Caicos Islands",
			"TV" => "Tuvalu",
			"UG" => "Uganda",
			"UA" => "Ukraine",
			"AE" => "United Arab Emirates",
			"UM" => "United States Minor Outlying Islands",
			"UY" => "Uruguay",
			"UZ" => "Uzbekistan",
			"VU" => "Vanuatu",
			"VE" => "Venezuela",
			"VN" => "Viet Nam",
			"VG" => "Virgin Islands (British)",
			"VI" => "Virgin Islands (U.S.)",
			"WF" => "Wallis And Futuna Islands",
			"EH" => "Western Sahara",
			"YE" => "Yemen",
			"YU" => "Yugoslavia",
			"ZM" => "Zambia",
			"ZW" => "Zimbabwe"
		);
		return $country_list;
	}
	/**
	 * Return full name of a country
	 *
	 * @return String Name of country
	 */
	function getFullCountryName($countrycode) {
		$countriesarray = getCountries();
		return $countriesarray[$countrycode];
	}
	/**
	 * Return an array containing the 2 digit US state codes and names of the states
	 *
	 * @return Array Containing 2 digit state codes as the key, and the name of a US state as the value
	 */
	function getStates() {
		$state_list = array('AL'=>"Alabama",  
			'AK'=>"Alaska",  
			'AZ'=>"Arizona",  
			'AR'=>"Arkansas",  
			'CA'=>"California",  
			'CO'=>"Colorado",  
			'CT'=>"Connecticut",  
			'DE'=>"Delaware",  
			'DC'=>"District Of Columbia",  
			'FL'=>"Florida",  
			'GA'=>"Georgia",  
			'HI'=>"Hawaii",  
			'ID'=>"Idaho",  
			'IL'=>"Illinois",  
			'IN'=>"Indiana",  
			'IA'=>"Iowa",  
			'KS'=>"Kansas",  
			'KY'=>"Kentucky",  
			'LA'=>"Louisiana",  
			'ME'=>"Maine",  
			'MD'=>"Maryland",  
			'MA'=>"Massachusetts",  
			'MI'=>"Michigan",  
			'MN'=>"Minnesota",  
			'MS'=>"Mississippi",  
			'MO'=>"Missouri",  
			'MT'=>"Montana",
			'NE'=>"Nebraska",
			'NV'=>"Nevada",
			'NH'=>"New Hampshire",
			'NJ'=>"New Jersey",
			'NM'=>"New Mexico",
			'NY'=>"New York",
			'NC'=>"North Carolina",
			'ND'=>"North Dakota",
			'OH'=>"Ohio",  
			'OK'=>"Oklahoma",  
			'OR'=>"Oregon",  
			'PA'=>"Pennsylvania",  
			'RI'=>"Rhode Island",  
			'SC'=>"South Carolina",  
			'SD'=>"South Dakota",
			'TN'=>"Tennessee",  
			'TX'=>"Texas",  
			'UT'=>"Utah",  
			'VT'=>"Vermont",  
			'VA'=>"Virginia",  
			'WA'=>"Washington",  
			'WV'=>"West Virginia",  
			'WI'=>"Wisconsin",  
			'WY'=>"Wyoming");
		
		return $state_list; 
	}
	/**
	 * Return full name of a US state
	 *
	 * @return String Name of state
	 */
	function getFullStateName($state) {
		$statesarray = getStates();
		return $statesarray[$state];
	}
   
	# determine signup contact categories
	function getContactUsCategories(){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name =  'CONTACTUS_CATEGORIES' ";
		return getOptionValuesFromDatabaseQuery($query);
	}
	# all listable variable groupings
	function getAllists(){
		$conn = Doctrine_Manager::connection();
		$all_lists = $conn->fetchAll("SELECT l.id as id, l.displayname as name FROM lookuptype AS l WHERE l.listable = 1 order by l.displayname ASC ");
		return $all_lists;
	}
	# all listable variable groupings as lookuptype
	function getListableLookupTypes($current = ''){
		$query = "SELECT l.id as optionvalue, l.displayname as optiontext FROM lookuptype AS l WHERE l.listable = 1 order by l.displayname ASC ";
		$array = getOptionValuesFromDatabaseQuery($query);
		return $array;
	}	
	# user types
	function getUserType($value = '', $ignorelist =''){
		$custom_query = "";
		if(!isEmptyString($ignorelist)){
			$custom_query .= " AND a.id NOT IN(".$ignorelist.") ";
		}
		
		$query = "SELECT a.id as optionvalue, a.name as optiontext FROM aclgroup a where a.id <> '' ".$custom_query." order by optiontext ";
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	function getSystemUsers($value = ''){
		$query = "SELECT u.id as optionvalue, concat(u.firstname,' ',u.lastname) as optiontext FROM useraccount as u Left Join aclusergroup AS g ON u.id = g.userid WHERE g.groupid != '8' AND u.isactive = 1 ORDER BY optiontext ";
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# user status
	function getUserStatus($value = ''){
		$array = array(0 =>'Pending', 1 => 'Active', 2=>'Deactivated');
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# product status values
	function getActiveStatus($value = ''){
		$array = array('1' => 'Enabled', '0' =>'Disabled');
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# check for level one categories
	function getLevelOneCategories($value = ''){
		$query = "SELECT c.id as optionvalue, c.name as optiontext FROM category c where c.level = 1 order by optiontext ";
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			return $array[$value];
		}
		return $array;
	}
	
	# determine the application config variables
	function getConfigLookups() {
		$conn = Doctrine_Manager::connection();
		$all_users = $conn->fetchAll("SELECT * FROM appconfig where id <> '' group by section order by sectiondisplay ");
		return $all_users;
	}
	
	# categories in category table
	function getCategories($sectorid = '', $parentid = ''){
		$custom_query = '';
		if(!isEmptyString($sectorid)){
			$custom_query .= " AND c.sectorid = '".$sectorid."' ";
		}
		if(!isEmptyString($parentid)){
			$custom_query .= " AND c.parentid = '".$parentid."' ";
		}
		$query = "SELECT c.id as optionvalue, c.name as optiontext FROM category AS c WHERE c.status = 1 ".$custom_query." order by c.id ASC ";
		return getOptionValuesFromDatabaseQuery($query);
	}
	
	# determine the latest listings
	function getLatestListings() {
		$conn = Doctrine_Manager::connection();
		$query = "SELECT c.* FROM contact AS c WHERE c.status = 1 order by c.id DESC limit 5 ";
		$all_lists = $conn->fetchAll($query);
		// debugMessage($query);
		return $all_lists;
	}
	# latest system user farmers
	function getLatestUsers($limit){
		$conn = Doctrine_Manager::connection();
		$all_users = $conn->fetchAll("SELECT u.id as id, concat(u.firstname, ' ', u.lastname, ' ', u.othername) as name FROM useraccount AS u WHERE u.type = 8 order by u.datecreated DESC limit ".$limit);
		return $all_users;
	}
	function getUsers($type = '', $limit = '', $ignoretype = '', $ignorelist = ''){
		$custom_query = '';
		if(!isEmptyString($type)){
			$custom_query .= " AND u.type = '".$type."' ";
		}
		if(!isEmptyString($ignoretype)){
			$custom_query .= " AND u.type != '".$ignoretype."' ";
		}
		if(!isEmptyString($ignorelist)){
			$custom_query .= " AND u.id NOT IN(".$ignorelist.") ";
		}
		$limit_query = '';
		if(!isEmptyString($limit)){
			$limit_query= ' LIMIT '.$limit;
		}
		$valuesquery = "SELECT u.id AS optionvalue, concat(u.firstname, ' ', u.lastname) as optiontext FROM useraccount as u WHERE u.id <> '' ".$custom_query." GROUP BY u.id ORDER BY optiontext ASC ".$limit_query;
		// debugMessage($valuesquery);
		return getOptionValuesFromDatabaseQuery($valuesquery);
	}
	function getUserDetails($type = '', $limit = '', $status = 1, $user ='', $start = '', $end ='', $emails=''){
		$custom_query = '';
		if(!isEmptyString($type)){
			$custom_query .= " AND u.type = '".$type."' ";
		}
		if(!isEmptyString($emails)){
			$custom_query .= " AND u.email in(".$emails.")";
		}
		$limit_query = '';
		if(!isEmptyString($limit)){
			$limit_query= ' LIMIT '.$limit;
		}
		$status_query = ' u.isactive = 1 ';
		if(!isEmptyString($status) && $status == 0){
			$status_query = ' u.isactive = 0 ';
		}
		if(!isEmptyString($status) && $status == 2){
			$status_query = ' (u.isactive = 1 || u.isactive = 0) ';
		}
		if(!isEmptyString($user)){
			$custom_query = " AND u.id = '".$user."' ";
		}
		if(!isEmptyString($start) && !isEmptyString($end)){
			$limit_query = ' LIMIT '.$start.','.$end;
		}
		
		$conn = Doctrine_Manager::connection();
		$query = "SELECT u.id AS id, u.firstname as firstname, concat(u.firstname, ' ', u.lastname) as name, u.email as email FROM useraccount as u WHERE u.id <> '' AND (".$status_query.") ".$custom_query." GROUP BY u.id ORDER BY id ASC ".$limit_query;
		// debugMessage($query);
		$all_lists = $conn->fetchAll($query);
		return $all_lists;
	}
	
	function getUserIDFromUsername($username){
		$valuesquery = "SELECT u.id FROM useraccount as u WHERE u.id <> '' AND u.username = '".$username."' ";
		// debugMessage($valuesquery);
		$conn = Doctrine_Manager::connection();
		$result = $conn->fetchOne($valuesquery);
		return $result;
		// return true;
	}
	# return programs
	function getPrograms($value = '', $aliased = true){
		if($aliased){
			$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_PROGRAMS' ";
		} else {
			$query = "SELECT l.lookuptypevalue as optionvalue, l.alias as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_PROGRAMS' ";
		}
		
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# return service types
	function getServiceTypes($value = '', $aliased = true){
		if($aliased){
			$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'VOUCHER_SERVICE_TYPES' ";
		} else {
			$query = "SELECT l.lookuptypevalue as optionvalue, l.alias as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'VOUCHER_SERVICE_TYPES' ";
		}
		
		// debugMessage($query); // exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# return the follow along types
	function getFAServiceTypes($value = '', $aliased = true){
		if($aliased){
			$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'FA_SERVICE_TYPES' ";
		} else {
			$query = "SELECT l.lookuptypevalue as optionvalue, l.alias as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'FA_SERVICE_TYPES' ";
		}
		
		// debugMessage($query); // exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# check for funders
	function getFunders($value = ''){
		$query = "SELECT c.id as optionvalue, c.name as optiontext FROM company c where c.type = 1 order by optiontext ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the marital statuses
	function getAllMaritalStatuses($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'MARITAL_STATUS_VALUES'";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the client races
	function getAllRaces($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'RACES' order by optiontext ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the client languages
	function getAllLanguages($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_LANGUAGES' order by optiontext ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the counties in new jersey
	function getAllCounties($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'NEW_JERSEY_COUNTIES' order by optiontext ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# disability diagnosis codes
	function getDisabilityDiagnosisCodes($value = '', $aliased =true){
		if($aliased){
			$query = "SELECT l.lookuptypevalue as optionvalue, concat(l.alias,' - ',l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'DISABILITY_DIAGNOSIS_CODES' order by ABS(l.alias) ";
		} else {
			$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'DISABILITY_DIAGNOSIS_CODES' order by ABS(l.alias) ";
		}
		
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# disability cause codes
	function getDisabilityCauseCodes($value = '', $aliased = true){
		if($aliased){
			$query = "SELECT l.lookuptypevalue as optionvalue, concat(l.alias,' - ',l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'DISABILITY_CAUSE_CODES' order by ABS(l.alias) ";
		} else {
			$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'DISABILITY_CAUSE_CODES' order by ABS(l.alias) ";
		}
		
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the disability code combination from impairement and cause
	function getDisabilityCodeForClient($impairmentid, $causeid){
		$query_diagnosis = "SELECT l.alias as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'DISABILITY_DIAGNOSIS_CODES' AND l.lookuptypevalue = '".$impairmentid."' ";
		$conn = Doctrine_Manager::connection();
		$result_diagnosis = $conn->fetchOne($query_diagnosis);
		
		$query_cause = "SELECT l.alias as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'DISABILITY_CAUSE_CODES' AND l.lookuptypevalue = '".$causeid."' ";
		$conn = Doctrine_Manager::connection();
		$result_cause = $conn->fetchOne($query_cause);
		
		return $result_diagnosis.$result_cause;
	}
	# determine the education levels
	function getEducationLevels($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'EDUCATION_LEVELS' order by l.code ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the communication
	function getCommunicationLevels($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'COMMUNICATION_LEVELS' order by optionvalue ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the housing
	function getHousingTypes($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'HOUSING_TYPES' order by optionvalue ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the client skills
	function getAllClientSkills($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_SKILLS' order by optiontext ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# get users assigned to a client
	function getUsersAssignedToClient($clientid, $isactive = true){
		$custom_query = '';
		if(!isEmptyString($isactive)){
			$custom_query = " AND a.status = 1 ";
		}
		$query = "SELECT a.userid as optionvalue, concat(u.firstname, ' ', u.lastname) as optiontext FROM assignment AS a INNER JOIN useraccount AS u ON a.userid = u.id WHERE a.clientid = '".$clientid."' ".$custom_query." GROUP BY a.userid  order by optiontext ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		return $array;
	}
	# get users assigned to a client
	function getAssignmentIDForUser($userid, $clientid){
		$conn = Doctrine_Manager::connection();
		$query = "SELECT a.id FROM assignment AS a WHERE a.clientid = '".$clientid."' AND a.userid = '".$userid."' ";
		$data = $conn->fetchOne($query);
		return $data;
	}
	# determine the transportation modes for the client
	function getTransportationModes($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'TRANSPORTATION_MODES' order by optiontext ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the medical types for the client
	function getMedicalTypes($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'MEDICAL_TYPES' order by optionvalue ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the rate types for client
	function getRateTypes($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'WAGE_RATE_TYPES' ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the rate types for client
	function getJobStatuses($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'JOB_STATUSES' ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the job termination types 
	function getTerminationTypes($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'JOB_TERMINATION_TYPES' ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the voucher statuses
	function getVoucherStatuses($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'VOUCHER_STATUS' ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the list of vouchers for the client
	function getClientVouchers($clientid){
		$query = "SELECT v.id as optionvalue, if(v.type = 2, concat(v.favoucherno,' [',s.alias,']'), concat(v.voucherno,' [',s.alias,']')) as optiontext FROM voucher AS v LEFT JOIN service AS s ON v.servicetypeid = s.id where v.clientid = '".$clientid."' group by v.id order by s.alias ";
		// debugMessage($query); // exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		return $array;
	}
	# determine the hours dropdown for timepicker
	function getHoursForTimePicker(){
		$hours = array(
				'00'=>'00',
				'01'=>'01',
				'02'=>'02',
				'03'=>'03',
				'04'=>'04',
				'05'=>'05',
				'06'=>'06',
				'07'=>'07',
				'08'=>'08',
				'09'=>'09',
				'10'=>'10',
				'11'=>'11',
				'12'=>'12'
		);
		return $hours;
	}
	# determine the minutes dropdown for timepicker
	function getMinutesForTimePicker(){
		$minutes = array(
				'00'=>'00',
				'15'=>'15',
				'30'=>'30',
				'45'=>'45'
		);
		return $minutes;
	}
	# determine the minutes dropdown for timepicker
	function getTimeSetting(){
		$setting = array(
				'AM'=>'AM',
				'PM'=>'PM'
		);
		return $setting;
	}
	# determine the client skills
	function getAllIncomeSources($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, trim(l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_INCOME_SOURCE' order by optiontext ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the client medication therapy treatment
	function getAllTherapyTreatments($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, trim(l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_THERAPY_TREATMENTS' order by optiontext ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the client quality of life
	function getAllLifeQualityOptions($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, trim(l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_LIFE_QUALITY' ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the client employment goal options
	function getAllEmploymentGoalOptions($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, trim(l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_EMPLOYMENT_PREFERRENCE' order by optiontext ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the client workshift options
	function getAllWorkshiftOptions($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, trim(l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_PREFERRED_WORKSHIFT' ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the client job type options
	function getAllJobTypes($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, trim(l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_JOB_TYPES' ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the client areas of interest
	function getAllClientInterestsOptions($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, trim(l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_EDUC_INTERESTS' ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the client learning styles
	function getAllClientLearningStyles($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, trim(l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_EDUC_LEARNINGSTYLES' ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the employment job difficult reasons
	function getAllEmploymentDifficultyOptions($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, trim(l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_EMPLOYMENT_DIFFICULTY' ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the client events
	function getAllClientEvents($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, trim(l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_PASTEVENTS_TYPES' ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the client support services
	function getAllClientSupportServices($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, trim(l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_SUPPORT_SERVICES' ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the client special job accomodation
	function getAllSpecialAccomodationOptions($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, trim(l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_EMPLOYMENT_JOBACCOMODATIONS' ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the client discharge types
	function getAllMilitaryDischargeOptions($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, trim(l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_MILITARY_DISCHARGE_TYPE' ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the client problems associated with military combat
	function getAllCombatProblems($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, trim(l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_MILITARY_COMBAT_PROBLEMS' ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the relationship options
	function getAllRelationshipOptions($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, trim(l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'CLIENT_RELATIONSHIP' order by optiontext ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# fetch all vouchers for this client
	function getVouchersForClient($clientid){
		$query = "SELECT v.id as optionvalue, IF((v.parentid <> '' AND v.type = '2'), v.favoucherno, v.voucherno) as optiontext FROM voucher AS v WHERE v.clientid = '".$clientid."' order by v.startdate ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		return $array;
	}
	# determine the invoices for client
	function getInvoicesForClient($clientid){
		$query = "SELECT i.id as optionvalue, i.invoiceno as optiontext FROM invoice AS i WHERE i.clientid = '".$clientid."' order by i.invoicedate ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		return $array;
	}
	# determine the billable hours reports for the client
	function getBillableHoursReportsForClient($clientid, $type = 1){
		$query = "SELECT a.id as optionvalue, concat(a.title,' ', date_format(a.startdate, '%m/%d/%Y'),' to ',date_format(a.enddate, '%m/%d/%Y')) as optiontext FROM activityreport AS a WHERE a.clientid = '".$clientid."' AND a.type = '".$type."' order by a.reportdate ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		return $array;
	} 
	# fetch all the activity codes for billable interventions
	function getAllActivityCodes($value = '', $aliased=true){
		if($aliased){
			$query = "SELECT l.lookuptypevalue as optionvalue, concat(l.alias,' - ',l.lookupvaluedescription) as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'ACTIVITY_CODES' ";
		} else {
			$query = "SELECT l.lookuptypevalue as optionvalue, l.alias as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'ACTIVITY_CODES' ";
		}
		
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# return service types at exit
	function getExitProgramTypes($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'EXIT_PROGRAMS' ";
	
		// debugMessage($query); // exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# return reasons for exit
	function getExitReasons($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'EXIT_REASONS' ";
	
		// debugMessage($query); // exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# return the exit status for exit
	function getExitStatus($value = ''){
		$query = "SELECT l.lookuptypevalue as optionvalue, l.lookupvaluedescription as optiontext FROM lookuptypevalue AS l INNER JOIN lookuptype AS v ON l.lookuptypeid = v.id WHERE v.name = 'EXIT_STATUS' ";
	
		// debugMessage($query); // exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		if(!isEmptyString($value)){
			if(!isArrayKeyAnEmptyString($value, $array)){
				return $array[$value];
			} else {
				return '';
			}
		}
		return $array;
	}
	# determine the employers for a client
	function getEmployersForClient($clientid){
		$query = "SELECT j.id as optionvalue, c.name as optiontext FROM job as j inner join company AS c on (j.employerid = c.id) WHERE j.clientid = '".$clientid."' order by c.name ";
		// debugMessage($query); exit();
		$array = getOptionValuesFromDatabaseQuery($query);
		return $array;
	}
?>
