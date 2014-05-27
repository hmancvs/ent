<?php

class SearchController extends IndexController  {
	
	function indexAction() {
    	$session = SessionWrapper::getInstance(); 
    	$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(TRUE);
		$conn = Doctrine_Manager::connection();
		$formvalues = $this->_getAllParams();
		$userid = $session->getVar('userid');
		
		/*$user = new UserAccount();
		$user->populate($userid);*/
		
		$q = $formvalues['searchword'];
		$html = '';
		$hasdata = false;
		
		// u.email like '%".$q."%' or u.phone like '%".$q."%' or p.phone like '%".$q."%' or u.username like '%".$q."%') 
		# search users
		$query = "SELECT u.id FROM useraccount as u 
		left join pricesource as p on (u.marketid = p.id AND u.type = 3)
		left join organisation as o on (u.organisationid = o.id)
			WHERE
		   (u.firstname like '%".$q."%' or 
			u.lastname like '%".$q."%' or 
			u.othername like '%".$q."%' or 
			p.name like '%".$q."%' or 
			o.name like '%".$q."%') AND u.isactive <> 2
			GROUP BY u.id
			order by u.firstname asc, u.lastname asc LIMIT 3 ";
		
		$result = $conn->fetchAll($query);
		$count_results = count($result);
		// debugMessage($result);
		if($count_results > 0){
			$hasdata = true;
			$html .= '<div class="separator"><span>Users</span>
				<div class="allresults"><a href="'.$this->view->baseUrl('profile/list/searchterm/'.$q).'">...see more results</a></div>
			</div>';
			foreach ($result as $row){
				$user = new UserAccount();
				$user->populate($row['id']);
				
				$b_q='<b>'.$q.'</b>';
				$name= $user->getName(); $name = str_ireplace($q, $b_q, $name);
				$type = getUserType($user->getType()); $type = str_ireplace($q, $b_q, $type);
				$market = $user->getMarket()->getName(); $market = str_ireplace($q, $b_q, $market);
				$organisation = $user->getOrganisation()->getName(); $organisation = str_ireplace($q, $b_q, $organisation);
				$amia_append = ""; $org_append = "";
				if($user->isAMIA()){
					$amia_append = '<div class="col-md-12 padding0" style="font-size:12px;">'.$market.'</div>';
				}
				if($user->isOrganisation()){
					$org_append = '<div class="col-md-12 padding0" style="font-size:12px;">'.$organisation.'</div>';
				}
				$media = $user->getMediumPicturePath();
				$viewurl = $this->view->baseUrl('profile/view/id/'.encode($row['id']));
				$html .= '
				<li class="display_box clearfix" url="'.$viewurl.'" theid="'.$row['id'].'">
					<a href="'.$viewurl.'">
						<div class="col-md-3 padding0 centeralign clearfix" style="padding-top:8px;">
							<img src="'.$media.'" style="width:50px;" />
						</div>
						<div style="col-md-9 padding0 clearfix">
							<div class="name col-md-12 padding0">'.$name.'</div>
							<div class=" col-md-12 padding0" style="font-size:10px; margin-top:-5px;">'.$type.'</div>
							'.$amia_append.'
							'.$org_append.'
						</div>
					</a>
				</li>';
			}
		}
		
		# search districts
		$query = "SELECT l.id FROM location as l 
			WHERE (l.name like '%".$q."%' AND l.locationtype = 2) GROUP BY l.id
			order by l.name LIMIT 3 ";
		// ('.$count_results.' entries)
		$result = $conn->fetchAll($query);
		$count_results = count($result);
		// debugMessage($result);
		if($count_results > 0){
			$hasdata = true;
			$html .= '<div class="separator"><span>Districts</span>
				<div class="allresults"><a href="'.$this->view->baseUrl('location/list/type/2/searchterm/'.$q).'">...see more results</a></div>
			</div>';
			foreach ($result as $row){
				$district = new Location();
				$district->populate($row['id']);
				
				$b_q='<b>'.$q.'</b>';
				$name= $district->getName(); $name = str_ireplace($q, $b_q, $name);
				$viewurl = $this->view->baseUrl('location/view/id/'.$district->getName());
				$html .= '
				<li class="display_box clearfix" url="'.$viewurl.'" theid="'.$row['id'].'">
					<a href="'.$viewurl.'">
						<div class="col-md-3 padding0 centeralign clearfix">
							<i class="icon-globe" style="font-size:30px;" />
						</div>
						<div style="col-md-9 padding0 clearfix">
							<div class="name col-md-12 padding0">'.$name.'</div>
						</div>
					</a>
				</li>';
			}
		}
		
		# search markets
		$query = "SELECT p.id FROM pricesource as p 
			WHERE (p.name like '%".$q."%' AND p.type = 2) GROUP BY p.id
			order by p.name LIMIT 3 ";
		// ('.$count_results.' entries)
		$result = $conn->fetchAll($query);
		$count_results = count($result);
		// debugMessage($result);
		if($count_results > 0){
			$hasdata = true;
			$html .= '<div class="separator"><span>Markets</span>
				<div class="allresults"><a href="'.$this->view->baseUrl('pricesource/list/type/2/searchterm/'.$q).'">...see more results</a></div>
			</div>';
			foreach ($result as $row){
				$market = new PriceSource();
				$market->populate($row['id']);
				
				$b_q='<b>'.$q.'</b>';
				$name= $market->getName(); $name = str_ireplace($q, $b_q, $name);
				$viewurl = $this->view->baseUrl('pricesource/view/id/'.encode($row['id']));
				$html .= '
				<li class="display_box clearfix" url="'.$viewurl.'" theid="'.$row['id'].'">
					<a href="'.$viewurl.'">
						<div class="col-md-3 padding0 centeralign clearfix">
							<i class="icon-globe" style="font-size:30px;" />
						</div>
						<div style="col-md-9 padding0 clearfix">
							<div class="name col-md-12 padding0">'.$name.'</div>
						</div>
					</a>
				</li>';
			}
		}
		
		# search fuelstation
		$query = "SELECT p.id FROM pricesource as p 
			WHERE (p.name like '%".$q."%' AND p.type = 4) GROUP BY p.id
			order by p.name LIMIT 3 ";
		// ('.$count_results.' entries)
		$result = $conn->fetchAll($query);
		$count_results = count($result);
		// debugMessage($result);
		if($count_results > 0){
			$hasdata = true;
			$html .= '<div class="separator"><span>Fuel Stations</span>
				<div class="allresults"><a href="'.$this->view->baseUrl('pricesource/list/type/4/searchterm/'.$q).'">...see more results</a></div>
			</div>';
			foreach ($result as $row){
				$station = new PriceSource();
				$station->populate($row['id']);
				
				$b_q='<b>'.$q.'</b>';
				$name= $station->getName(); $name = str_ireplace($q, $b_q, $name);
				$viewurl = $this->view->baseUrl('pricesource/view/id/'.encode($row['id']));
				$html .= '
				<li class="display_box clearfix" url="'.$viewurl.'" theid="'.$row['id'].'">
					<a href="'.$viewurl.'">
						<div class="col-md-3 padding0 centeralign clearfix">
							<i class="icon-globe" style="font-size:30px;" />
						</div>
						<div style="col-md-9 padding0 clearfix">
							<div class="name col-md-12 padding0">'.$name.'</div>
						</div>
					</a>
				</li>';
			}
		}
		
		# commodities
		$query = "SELECT c.id FROM commodity as c 
			WHERE (c.name like '%".$q."%') GROUP BY c.id
			order by c.name LIMIT 3 ";
		// ('.$count_results.' entries)
		$result = $conn->fetchAll($query);
		$count_results = count($result);
		// debugMessage($result);
		if($count_results > 0){
			$hasdata = true;
			$html .= '<div class="separator"><span>Commodities</span>
				<div class="allresults"><a href="'.$this->view->baseUrl('commodity/list/searchterm/'.$q).'">...see more results</a></div>
			</div>';
			foreach ($result as $row){
				$commodity = new Commodity();
				$commodity->populate($row['id']);
				
				$b_q='<b>'.$q.'</b>';
				$name= $commodity->getName(); $name = str_ireplace($q, $b_q, $name);
				$viewurl = $this->view->baseUrl('commodity/view/id/'.encode($row['id']));
				$media = $commodity->getImagePath();
				$html .= '
				<li class="display_box clearfix" url="'.$viewurl.'" theid="'.$row['id'].'">
					<a href="'.$viewurl.'">
						<div class="col-md-3 padding0 centeralign clearfix">
							<img class="imagecontainer" src="'.$media.'" style="width:40px;" />
						</div>
						<div style="col-md-9 padding0 clearfix">
							<div class="name col-md-12 padding0">'.$name.'</div>
						</div>
					</a>
				</li>';
			}
		}
		
		# radio stations
		$query = "SELECT r.id FROM organisation as r 
			WHERE (r.name like '%".$q."%' AND r.type = 2) GROUP BY r.id
			order by r.name LIMIT 3 ";
		// ('.$count_results.' entries)
		$result = $conn->fetchAll($query);
		$count_results = count($result);
		// debugMessage($result);
		if($count_results > 0){
			$hasdata = true;
			$html .= '<div class="separator"><span>Radio Stations</span>
				<div class="allresults"><a href="'.$this->view->baseUrl('radio/list/searchterm/'.$q).'">...see more results</a></div>
			</div>';
			foreach ($result as $row){
				$radio = new Organisation();
				$radio->populate($row['id']);
				
				$b_q='<b>'.$q.'</b>';
				$name= $radio->getName(); $name = str_ireplace($q, $b_q, $name);
				$viewurl = $this->view->baseUrl('radio/view/id/'.encode($row['id']));
				$media = $radio->getPicturePath();
				$html .= '
				<li class="display_box clearfix" url="'.$viewurl.'" theid="'.$row['id'].'">
					<a href="'.$viewurl.'">
						<div class="col-md-3 padding0 centeralign clearfix">
							<img class="imagecontainer" src="'.$media.'" style="width:40px;" />
						</div>
						<div style="col-md-9 padding0 clearfix">
							<div class="name col-md-12 padding0">'.$name.' - '.$radio->getFrequency().'</div>
						</div>
					</a>
				</li>';
			}
		}
		
		# Clients
		$query = "SELECT c.id FROM organisation as c 
			WHERE (c.name like '%".$q."%' AND c.type <> 2) GROUP BY c.id
			order by c.name LIMIT 3 ";
		// ('.$count_results.' entries)
		$result = $conn->fetchAll($query);
		$count_results = count($result);
		// debugMessage($result);
		if($count_results > 0){
			$hasdata = true;
			$html .= '<div class="separator"><span>Clients</span>
				<div class="allresults"><a href="'.$this->view->baseUrl('client/list/searchterm/'.$q).'">...see more results</a></div>
			</div>';
			foreach ($result as $row){
				$client = new Organisation();
				$client->populate($row['id']);
				
				$b_q='<b>'.$q.'</b>';
				$name= $client->getName(); $name = str_ireplace($q, $b_q, $name);
				$viewurl = $this->view->baseUrl('client/view/id/'.encode($row['id']));
				$media = $client->getPicturePath();
				$html .= '
				<li class="display_box clearfix" url="'.$viewurl.'" theid="'.$row['id'].'">
					<a href="'.$viewurl.'">
						<div class="col-md-3 padding0 centeralign clearfix">
							<img class="imagecontainer" src="'.$media.'" style="width:60px;" />
						</div>
						<div style="col-md-9 padding0 clearfix">
							<div class="name col-md-12 padding0">'.$name.'</div>
						</div>
					</a>
				</li>';
			}
		}
		
		# Busines directory
		$query = "SELECT c.id FROM contact as c 
			WHERE (c.orgname like '%".$q."%' OR
				c.firstname like '%".$q."%' OR
				c.lastname like '%".$q."%' OR
				c.contactperson like '%".$q."%'
			) GROUP BY c.id
			order by IF(c.contacttype = 1, c.orgname, concat(c.firstname, ' ', c.lastname)) asc LIMIT 3 ";
		// ('.$count_results.' entries)
		$result = $conn->fetchAll($query);
		$count_results = count($result);
		// debugMessage($result);
		if($count_results > 0){
			$hasdata = true;
			$html .= '<div class="separator"><span>Business Directory</span>
				<div class="allresults"><a href="'.$this->view->baseUrl('directory/index/tab/category/id/search/searchterm/'.$q).'">...see more results</a></div>
			</div>';
			foreach ($result as $row){
				$contact = new Contact();
				$contact->populate($row['id']);
				
				$b_q='<b>'.$q.'</b>';
				$name= $contact->getName(); $name = str_ireplace($q, $b_q, $name);
				$viewurl = $this->view->baseUrl('directory/index/tab/view/id/'.encode($row['id']));
				$media = $contact->getPicturePath();
				$html .= '
				<li class="display_box clearfix" url="'.$viewurl.'" theid="'.$row['id'].'">
					<a href="'.$viewurl.'">
						<div class="col-md-3 padding0 centeralign clearfix">
							<img class="imagecontainer" src="'.$media.'" style="width:60px;" />
						</div>
						<div style="col-md-9 padding0 clearfix">
							<div class="name col-md-12 padding0">'.$name.'</div>
						</div>
					</a>
				</li>';
			}
		}
		
		# Forum
		$query = "SELECT f.id FROM communityforum as f 
			WHERE (f.topic like '%".$q."%') GROUP BY f.id
			order by f.topic LIMIT 3 ";
		// ('.$count_results.' entries)
		$result = $conn->fetchAll($query);
		$count_results = count($result);
		// debugMessage($result);
		if($count_results > 0){
			$hasdata = true;
			$html .= '<div class="separator"><span>Forum</span>
				<div class="allresults"><a href="'.$this->view->baseUrl('forum/index/searchterm/'.$q).'">...see more results</a></div>
			</div>';
			foreach ($result as $row){
				$forum = new CommunityForum();
				$forum->populate($row['id']);
				$comments = $forum->getAllComments();
				$noofcomments = $comments->count();
				
				$b_q='<b>'.$q.'</b>';
				$name= $forum->getTopic(); $name = str_ireplace($q, $b_q, $name);
				$viewurl = $this->view->baseUrl('forum/list/tab/comments/id/'.encode($row['id']));
				$html .= '
				<li class="display_box clearfix" url="'.$viewurl.'" theid="'.$row['id'].'">
					<a href="'.$viewurl.'">
						<div style="col-md-12 clearfix">
							<div class="name col-md-12">'.$name.'</div>
							<div class="col-md-12"><span class="pagedescription">('.$noofcomments.' comments)</div>
						</div>
					</a>
				</li>';
			}
		}
		
		# add navigation to searchable parameters
		$result = array(
			'id' => 1,
			'users' => ''
		);
		
		# check no data is available for all areas and return no results message
		if(!$hasdata){
			$html .= '
				<li class="display_box" align="center" style="height:30px;">
					<span style="width:100%; display:block; text-align:center;">No results for <b>'.$q.'</b></span>
				</li>';
		}
		echo $html;
    }
}

