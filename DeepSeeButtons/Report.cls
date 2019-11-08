Class DeepSeeButtons.Report Extends %ZEN.Component.page
{

Parameter PAGENAME = "DeepSee Buttons Report";

Parameter CHARSET = "utf-8";

	//<!DOCTYPE html>")
	//<meta charset="UTF-8">")
	//<meta http-equiv="Content-type" content="text/html; charset=UTF-8">")
	//<title>>
	//DeepSee Diagnostic Log for "_CustomerName ,4)
	//</title>>
	//<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">>


/// This Style block contains page-specific CSS style definitions.
XData Style
{
<style type="text/css">
	pre {
	 	white-space: pre-wrap;       /* css-3 */
	 	white-space: -moz-pre-wrap;  /* Mozilla, since 1999 */
	 	white-space: -pre-wrap;      /* Opera 4-6 */
	 	white-space: -o-pre-wrap;    /* Opera 7 */
	 	word-wrap: break-word;       /* Internet Explorer 5.5+ */
	}
	.sidenav {
	box-sizing: border-box;
	height: 100%;
	width: 0;
	resize: horizontal;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: rgb(220,231,241);
	overflow-x: hidden;
	transition: 0.75s;
	padding-top: 60px;
	}
	.sidenav a {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	padding: 8px 8px 8px 8px;
	text-decoration: none;
	font-size: 20px;
	color: blue;
	display: block;
	transition: 0.3s;
	}
	.sidenav a:hover, .offcanvas a:focus{
	font-family: Arial, Helvetica, sans-serif;
	color: white;
	}
	.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 0px;
	font-size: 36px;
	margin-left: 50px;
	}
	.sidenav .red {
    color: red;
    }	
	#main {
	transition: margin-left .5s;
	padding: 16px;
	}
	@media screen and (max-height: 450px) {
	.sidenav {padding-top: 15px;}
	.sidenav a {font-size: 18px;}
	}
	.sidenav .cubelinks {
    font-size: 14px;
    text-decoration: none;
    margin-left: 30px;
    }
	.trapezoid {
	top: 0px;
	width: 0px;
	left: 0px;
	opacity: 0.5;
	text-align: center;
	height: 25px; 
	position:fixed;
	border-top: 20px solid transparent;
	border-left: 25px solid rgb(185,207,227);
	border-bottom: 20px solid transparent;
	box-sizing: content-box;
	}
	.trapezoid span { 
	position: absolute;
	left: -20px;
	top: 15%;
	color: blue;
	}
	.trapezoid span:hover, .offcanvas a:focus{
	color: rgb(104,30,30);
	opacity: 0.1;
	}
    .zebraStriped tbody tr:nth-child(odd) {
    background-color: #ccc;
    border-right: 2px solid #D0D0D0;
    border-left: 2px solid #D0D0D0;
    border-bottom: 2px solid #D0D0D0;
    border-top: 2px solid #D0D0D0;
	}
	.zebraStriped td {
    border-right: 2px solid #D0D0D0;
    border-left: 2px solid #D0D0D0;
    border-bottom: 2px solid #D0D0D0;
    border-top: 2px solid #D0D0D0;
	}
    .scrollable {
    overflow:auto;
    resize:both;
	}
    .wrapped {
    white-space: -moz-pre-wrap; /* Mozilla, supported since 1999 */
    white-space: -pre-wrap; /* Opera */
    white-space: -o-pre-wrap; /* Opera */
    white-space: pre-wrap; /* CSS3 - Text module (Candidate Recommendation) http://www.w3.org/TR/css3-text/#white-space */
    word-wrap: break-word; /* IE 5.5+ */
	}
    .tableWithBorders {
    position: relative;
    visibility: visible;
    table-layout: fixed;
    padding: 0px;
    height: auto;
    font-family: Arial;
    border-collapse: collapse;
    border-right: 2px solid #D0D0D0;
    border-left: 2px solid #D0D0D0;
    border-bottom: 2px solid #D0D0D0;
    border-top: 2px solid #D0D0D0;
	}    
    .tableWithBorders th {
    height: 22px;
    overflow: hidden;
    text-align: left;
    border-bottom: 2px solid #D0D0D0;
	}
    .tableWithBorders td {
    border-right: 1px solid #E8E8E8;
    border-bottom: 1px solid #E8E8E8;
    overflow: hidden;
    //word-wrap:break-word;
    //background: white;
	}	
	.grey {
    background: #ccc;
    }
	.darkgrey {
    background: #7a7a7a
    }
	.red {
    color: red;
    }    
    .bold {
    font-size: 15px;
    font-weight: bold;
    }    
	.tableTabbed p,h5 {
    padding-left: 4ch;
    }
    div a:hover {
    background: rgb(40,94,124);
	}
</style>
}

/// This XML block defines the contents of this page.
XData Contents [XMLNamespace="http://www.intersystems.com/zen"]
{
<page xmlns="http://www.intersystems.com/zen" title="">
	<html id="report" OnDrawContent="DrawPage" />
</page>
}

ClassMethod DrawPage(pSeed As %String) As %Status
{
	Set tSC=$$$OK
	Set tTracking=0
	
	Do ##class(DeepSeeButtons.Report).DrawMainDiv() // DONE
	//Do LogDeepSeeSetupSection   //Note Ale: here rs.%Execute("") messes up my ZW in DumpToFile
	Do ##class(DeepSeeButtons.Report).DrawDeepSeeSetup("SAMPLES",tTracking)
	//Do LogServerSetup
	Do ##class(DeepSeeButtons.Report).DrawServerSetup(tTracking)
	//Do LogCubeSection
	//Do LogBuildSynchSection
	//Do LogCubeRegistry
	//Do:(($D(cubeList)'=0) && (cubeList'="")) LogDetailedCubeInfo
	//Do:getLogs>0 LogQuerylog
	//Do:getLogs>0 LogDeepSeelog
	//Do LogCPF
	//Do:getLogs>0 LogCConsole
	//Do LogMappings
	//Do LogDataBases
	//Do LogTasks
	//Do LogJournal
	//Do LogAlerts
	//Do LogTrailer
	//Do LogSidePanel(cubeList,getLogs,$G(alerts,0))	
	//Do LogCloseBody
	
	Quit tSC
}

ClientMethod toggle(showHideDiv, switchTextDiv) [Language = javascript]
{
	var ele = document.getElementById(showHideDiv);
	var text = document.getElementById(switchTextDiv);
	if (ele.style.display == "block") {
		ele.style.display = "none";
		text.innerHTML = "&rtrif; Expand";
	} else {
		ele.style.display = "block";
		text.innerHTML = "&dtrif; Collapse";
	}
}

ClientMethod toggleNav() [Language = javascript]
{
	document.getElementById("mySidenav").style.width = "200px";
	document.getElementById("main").style.marginLeft = "200px";
}

ClientMethod closeNav() [Language = javascript]
{
	document.getElementById("mySidenav").style.width = "0px";
	document.getElementById("main").style.marginLeft= "0px";
}

ClientMethod highlightLink(obj, mousein) [Language = javascript]
{
	bkg=(mousein ? 'rgb(68, 168, 223)' : '');
	color=(mousein ? 'white' : '');
	document.getElementById('l'+obj.id).style.background=bkg;
	document.getElementById('l'+obj.id).style.color=color;
}

ClientMethod sortTable(elem,n,stringSort) [Language = javascript]
{
	var table, rows, switching, i, x1, x2, shouldSwitch, dir, switchcount = 0;
	//Climb up the table structure to find the <table> element
	table = elem;
	while(table.tagName!="TABLE") {
		table = table.parentElement;
	}
	switching = true;
	//Set the sorting direction to ascending:
	dir = 'asc'; 
	while (switching) {
		switching = false;
		rows = table.getElementsByTagName('TR');
		//Loop through all table rows after the first
		for (i = 1; i < (rows.length - 1); i++) {
			shouldSwitch = false;
			//Get the two adjacent elements to be compared
			x1 = rows[i].getElementsByTagName('TD')[n].innerHTML;
			x2 = rows[i+1].getElementsByTagName('TD')[n].innerHTML;
			//Get sorting if undefined: string or number?
			if (typeof stringSort === 'undefined') {
	 			var stringSort = isNaN(x1) | isNaN(x2)
			}
			x1val = stringSort ? x1.toLowerCase() : +x1.replace(/,/g, '');
			x2val = stringSort ? x2.toLowerCase() : +x2.replace(/,/g, '');
			//When sorting numerically empty string or NA as -Infinity
			if ((!stringSort)&&((x1=='')||(x1=='NA'))) {
	 			x1val = -Infinity;
			}
			if ((!stringSort)&&((x2=='')||(x2=='NA'))) {
	 			x2val = -Infinity;
			}
			if (dir == 'asc') {
	 			if (x1val > x2val) {
	 				//Mark as a switch and break the loop
	 				shouldSwitch= true;
	 				break;
	 			}
			} else if (dir == 'desc') {
	 			if (x1val < x2val) {
	 				//Mark as a switch and break the loop
	 				shouldSwitch= true;
	 				break;
	 			}
			}
		}
		if (shouldSwitch) {
			//Make the switch when marked
			rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			switching = true;
			switchcount ++; 
		} else {
			//If no switching AND dir = as,set dir to desc and rerun while loop
			if (switchcount == 0 && dir == 'asc') {
	 			dir = 'desc';
	 			switching = true;
			}
		}
	}
	//Show or remove the triangles
	console.log('Table: ',table.id,', Column: ',n,', Sorting: ',dir,stringSort?'string':'numeric')
	var ths = table.getElementsByTagName('TH')
	for (i = 0; i < ths.length; i++) {
		ths[i].innerHTML = ths[i].innerHTML.replace(' \u25B4','');
		ths[i].innerHTML = ths[i].innerHTML.replace(' \u25BE','');
		if (i == n) {
			ths[i].innerHTML = ths[i].innerHTML + ((dir == 'asc') ? ' &#x25BE;': ' &#x25B4;');
		}
	}
}

ClassMethod DrawMainDiv()
{
	Do ##class(DeepSeeButtons.Utils).WriteLog("<body bgcolor=""#FFFFFF"" text=""#000000"">")
	Do ##class(DeepSeeButtons.Utils).WriteLog("<div id=""main"">")
	Do ##class(DeepSeeButtons.Utils).WriteLog("<a name=""top""></a>")
	Do ##class(DeepSeeButtons.Utils).WriteLog("<h1 title=""Version v0.1.7"">DeepSeeButtons - DeepSee diagnostic report</h1>")
}

ClassMethod DrawDeepSeeSetup(pNamespace As %String="SAMPLES", pTracking As %Boolean=0)
{
	Set x=$ZUtil(86),ConfigFile=$Piece(x,"*",1),ConfigName=$Piece(x,"*",2)
	Set FileOpenTimeOut=5

	//Begin body tag
	Try {
		//Do ##class(DeepSeeButtons.Utils).WriteLog("<body bgcolor=""#FFFFFF"" text=""#000000"">")
		Do ##class(DeepSeeButtons.Utils).WriteLog("<div class=""trapezoid"">")
		Do ##class(DeepSeeButtons.Utils).WriteLog("<span onclick=""openNav()""> &#9776; </span>",2)
		Do ##class(DeepSeeButtons.Utils).WriteLog("</div>")
		Do ##class(DeepSeeButtons.Utils).WriteUpdate("Getting system information")
		Do:pTracking ##class(DeepSeeButtons.Utils).WriteTrack("setup","Getting system information","")
		Do ##class(DeepSeeButtons.Utils).WriteLog("<div id=""DSSetupDiv"" onmouseover=""highlightLink(this,1)"" onmouseout=""highlightLink(this,0)"">")
		Do ##class(DeepSeeButtons.Utils).WriteParagraph("deepseesetup","DeepSee Setup in "_pNamespace,0)
		
		//Agent Count
		ZN pNamespace
		Set count=##class(%DeepSee.Utils).%GetAgentCount()
		If count="" {
			Set tCPU=##class(%SYSTEM.CPU).%New()
			Set cores = tCPU.nCores
			Set counthigh=cores*4
			Set defaultagents="Default agent count"
			Set countstring=cores_" cores x 8 = "_(counthigh*2)_" agents  ("_counthigh_" high- and "_counthigh_" low-priority agents)"
		} Else {
			Set defaultagents="Non-default agent count"
			Set countstring=(count*2)_" agents  ("_count_" high- and "_count_" low-priority agents)"
		}
		ZN "%SYS"
		Do ##class(DeepSeeButtons.Utils).WriteLog("<table id=""DSSetupTable"" cellpadding=""7"" cellspacing=""3"" ""class=""tableWithBorders tableTabbed"">",2)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<tbody>",4)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
		Do ##class(DeepSeeButtons.Utils).WriteHeader4("Agent Count",10)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<p>"_defaultagents_"</p>",10)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<p>"_countstring_"</p>",10)
		Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
		Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
		
		//Audit section
		Do ##class(DeepSeeButtons.Utils).GetDeepSeeAuditCode(pNamespace)
		Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
		Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
		Do ##class(DeepSeeButtons.Utils).WriteHeader4("Most Recent Activity in Cube Manager",10)
		
		//Get last build, synch, and update info
		Set msgbuild=##class(DeepSeeButtons.Utils).GetLastBuild("Build",,pNamespace)
		Set msgsynch=##class(DeepSeeButtons.Utils).GetLastBuild("Synch",,pNamespace)
		Set msgupdate=##class(DeepSeeButtons.Utils).GetLastBuild("Update",,pNamespace)
		Set msgrepair=##class(DeepSeeButtons.Utils).GetLastBuild("Repair",,pNamespace)
		
		//Cycle through all enabled cubes in cube manager and alert if ther are no build or repair events
		ZN pNamespace
		Set rs=##class(%ResultSet).%New("%DeepSee.CubeManager.RegistryMap:RegistryMapTableView")
		Set registered = ""
		Set state = ""
		Do rs.Execute()
		While rs.Next() {
			Set cube=rs.Get("CubeKey")
			Set state = rs.Get("Disabled")
			Set state = $S(state="Yes":"disabled",state="No":"enabled",1:"unknown")
			If ((rs.Get("IsRegistered")="Yes") && (rs.Get("Disabled")="No")) {
				Set tCubeList($I(tCubeList),"Cube")=cube
				Set tCubeList(tCubeList,"State")=state
			}
		}
		ZN "%SYS"
		Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Build event:  "_msgbuild_"</p>",10)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Synch event:  "_msgsynch_"</p>",10)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Registry Update event: "_msgupdate_"</p>",10)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Repair event: "_msgrepair_"</p>",10)
		For i=1:1:tCubeList {
			Set tCube=tCubeList(i,"Cube")
			Set tState=tCubeList(i,"State")
			Set msgbuild=##class(DeepSeeButtons.Utils).GetLastBuild("Build",tCube,pNamespace)	//Get last build
			Set msgrepair=##class(DeepSeeButtons.Utils).GetLastBuild("Repair",tCube,pNamespace)	//Get last repair
			Do:(tState="enabled") ##class(DeepSeeButtons.ReportAlerts).AlertInitialBuildCubeManager(tCube,msgrepair,msgbuild,.alerts)
		}
		Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
		Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)
		
		/// Important Mappings subsection
		Set NsMap=""
		Set MirCount=0
		Set ECPCount=0
		Set isMirror=0
		Set isECP=0
		Set GlobalKSize=""
		Set RoutineSize=""
		Set bbsiz=""
		Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)	
		Do ##class(DeepSeeButtons.Utils).WriteHeader4("Config section of cpf file",8)
		Set tStream=##class(%Stream.FileCharacter).%New()
		Set tSC=tStream.LinkToFile(ConfigFile)
		If $$$ISERR(tSC) {
			Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Error: could not open Cach&eacute; Configuration File "_ConfigFile_"</p>",10)
		} Else {
			For {
				Set x=tStream.ReadLine()
				If $p(x,".",1)="[Map" { 
					//Grab pNamespace we are mapping from
					//Returns eg [Map.Analytics]
					Set NsMap=x
					Set NsMap=$p($p(NsMap,".",2),"]",1) 	//Returns eg Analytics
					Set MapCount=0 	 				//Reset counter for number of mappings within this pNamespace 
				}
				If x["Global_OBJ.DSTIME"{			//Grab OBJ.DSTIME mapping
					Set DSTimeMapTo=$p(x,"=",2)		//Namespace it is mapped to
					Set DSTimeMapFrom(NsMap)=DSTimeMapTo
				}
				If x["Global_DeepSee"{	//Create array of DeepSee.* global mappings within this pNamespace
					Set MapCount=$I(MapCount)
					Set DeepSeeMap(NsMap,MapCount)=x			
				}
				If x["[Mirrors]" Set isMirror=1		//We are in mirror section
				If isMirror=1 {
					If x="" {
						//Mirror section has ended
						Set isMirror=0
					} Else {	 					//Store mirror information
						Set MirCount=$I(MirCount)
						Set MirArray(MirCount)=x
					}
				}
				If x["[ECPServers]" Set isECP=1		//We are in ECP section
				If isECP=1 {
					If x="" {
						Set isECP=0	 				//ECP section has ended
					} ElseIf x'["[ECPServers]" {
						Set ECPCount=$I(ECPCount)	//Store ECP info
						Set ECPArray(ECPCount)=x
					}
				}
				//Store important values from cpf - Config section
				If x["[config]" Set configSect=1		//We are in Config section
				If x["[Miscellaneous]" Kill configSect	//Config section is over
				If $D(configSect) {
					If x["globals" Set GlobalKSize=$P(x,"globals=",2)
					If x["routines=" Set RoutineSize= $P(x,"routines=",2)
					If x["bbsiz=" Set bbsiz= $P(x,"=",2)
				}
				Quit:x["[Miscellaneous]"	 			//We have passed all information we are interested in, just quit
			}
			Do ##class(DeepSeeButtons.Utils).WriteLog("<p>globals="_GlobalKSize_"</p>",10)
			Do ##class(DeepSeeButtons.Utils).WriteLog("<p>routines="_RoutineSize_"</p>",10)
			Do ##class(DeepSeeButtons.Utils).WriteLog("<p>bbsiz="_bbsiz_"</p>",10)
			Set sc = ##class(DeepSeeButtons.ReportAlerts).AlertGlobalKSize(GlobalKSize,.alerts)
			Set sc = ##class(DeepSeeButtons.ReportAlerts).AlertRoutineSize(RoutineSize,.alerts)	
		}
		Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
		Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)
		//Important mapppings
		Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
		Do ##class(DeepSeeButtons.Utils).WriteHeader4("Important Mappings",10)
		Set status=##Class(Config.Namespaces).Get(pNamespace,.nsprop)
		Do:status=1 ##class(DeepSeeButtons.Utils).WriteLog("<p>Default DBs for globals and routines: "_nsprop("Globals")_", "_nsprop("Routines")_"</p>",10)
		
		If '$D(DSTimeMapFrom(pNamespace)){
			Do ##class(DeepSeeButtons.Utils).WriteLog("<p>^OBJ.DSTIME: no mappings defined</p>",10)
		} Else{
			Do ##class(DeepSeeButtons.Utils).WriteLog("<p>^OBJ.DSTIME: mapped to "_DSTimeMapFrom((pNamespace))_"</p>",10)
		}
		//DeepSeeMap is structured as follows: DeepSeeMap(pNamespace,mapping number)
 		If NsMap'="" {
			If $D(DeepSeeMap(pNamespace,1)) {
				Set NumMaps=$O(DeepSeeMap(pNamespace,""))
				While NumMaps {
					Do ##class(DeepSeeButtons.Utils).WriteLog("<p>"_DeepSeeMap(pNamespace,NumMaps)_"</p>",10)
					Set NumMaps=$O(DeepSeeMap(pNamespace,NumMaps))
				}
			}
			Set sc = ##class(DeepSeeButtons.ReportAlerts).AlertMappings(pNamespace,"Cache",.alerts)
			Set sc = ##class(DeepSeeButtons.ReportAlerts).AlertMappings(pNamespace,"JoinIndex",.alerts)
			If $D(DSTimeMapFrom(pNamespace)){
				Set sc = ##class(DeepSeeButtons.ReportAlerts).AlertDStimeRW(DSTimeMapFrom(pNamespace),.alerts)
			}
		}
		Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
		Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)
		If ECPCount'=0{
			Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
			Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
			Do ##class(DeepSeeButtons.Utils).WriteHeader4("ECP Servers",10)
			Do ##class(DeepSeeButtons.Utils).WriteLog("<p>",10)
			For i=1:1:ECPCount{
				// PFS REVIEW
				Do ##class(DeepSeeButtons.Utils).WriteLog(ECPArray(i))
			}
			Do ##class(DeepSeeButtons.Utils).WriteLog("</p>",10)
			Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
			Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)		
		}
		If MirCount'=0{
			Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
			Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
			Do ##class(DeepSeeButtons.Utils).WriteHeader4("Mirroring Info",10)
			Do ##class(DeepSeeButtons.Utils).WriteLog("<p>",10)
			For i=1:1:MirCount{
				// PFS REVIEW
				Do ##class(DeepSeeButtons.Utils).WriteLog(MirArray(i))
			}
			Do ##class(DeepSeeButtons.Utils).WriteLog("</p>")
			Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
			Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)
		}
		//Initialization code
		Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
		Do ##class(DeepSeeButtons.Utils).WriteHeader4("Server Initialization Code",8,"Defined in the ^DeepSee.InitCode global")
		Try {
			If $D(^[pNamespace]DeepSee.InitCode) {
				Set initcode=$g(^[pNamespace]DeepSee.InitCode)
				Do ##class(DeepSeeButtons.Utils).WriteLog("<p>^DeepSee.InitCode: "_initcode_"</p>",10)
			} Else {
				Do ##class(DeepSeeButtons.Utils).WriteLog("<p>^DeepSee.InitCode is undefined"_initcode_"</p>",10)
			}
		} Catch {
			Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Not Available</p>",10)
		}
		Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
		Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)
		
		//Webapps that are deepsee enabled
		Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
		Do ##class(DeepSeeButtons.Utils).WriteHeader4("DeepSee-enabled namespaces",10)
		Do ##class(%CSP.Portal.Utils).%GetNamespaceList(.nsList)
		SET ns=$o(nsList(""))
		While ns'="" {
			If ##class(%DeepSee.Utils).%IsDeepSeeEnabled(ns) {
				Do ##class(DeepSeeButtons.Utils).WriteLog("<p>"_ns_" with default webapp: "_$system.CSP.GetDefaultApp(ns)_"</p>",10)
			}
			Set ns=$O(nsList(ns))
		}
		Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
		Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)
		
		/*
		Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
		Do ##class(DeepSeeButtons.Utils).WriteHeader4("DeepSee-enabled webapps",10)
		Set rsWeb=##class(%ResultSet).%New("Security.Applications:Detail")
		Do rsWeb.Execute()
		Set onefound=0
		For {
			Quit:'rsWeb.Next()
			If rsWeb.DeepSeeEnabled="Yes" {
	 			Do ##class(DeepSeeButtons.Utils).WriteLog("<p>"_rsWeb.Name_"</p>",10)
	 			Set onefound=1
			}
			Do ##class(DeepSeeButtons.Utils).WriteLog("<p>"_rsWeb.Name_"</p>",10)
			If $D(^SYS("Security", "CSP", "AllowPrefix", rsWeb.Name_"/","%DeepSee.")) {
	 			Do ##class(DeepSeeButtons.Utils).WriteLog("<p>--"_rsWeb.Name_"</p>",10)
			}
		}
		Do:'onefound WriteLog("<p>-</p>",10)
		Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
		Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)	
		*/
		
		Set isInsight=##class(DeepSeeButtons.Utils).IsHealthInsight() 	//Determine if this is a Health Insight namespace (1 if yes)
		Set isTrak=##class(DeepSeeButtons.Utils).IsTrak() 	//Determine if this is a Health Insight namespace (1 if yes)	
		Set nOverrides = "" 
	 	Set:(isInsight || isTrak) nOverrides=##class(DeepSeeButtons.Utils).CountNodes(pNamespace,"^DeepSee.Overrides")
	 	
	 	//DeepSee overrides
	 	If (isInsight || isTrak) {
	 		If (nOverrides<10) {
	 			Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",4)
	 			Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",6)
	 			Do ##class(DeepSeeButtons.Utils).WriteHeader4("DeepSee Overrides",10)
	 			Do ##class(DeepSeeButtons.Utils).PrintGlobal(pNamespace,"^DeepSee.Overrides",10)
	 			Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
	 			Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)	
	 			Do ##class(DeepSeeButtons.Utils).WriteLog("</tbody>",4)
	 			Do ##class(DeepSeeButtons.Utils).WriteLog("</table>",2)
			} Else {
	 			//If there are many overrides place them in a scrollable div
	 			Do ##class(DeepSeeButtons.Utils).WriteLog("</tbody>",4)
 	 			Do ##class(DeepSeeButtons.Utils).WriteLog("</table>",2)
		 		Do ##class(DeepSeeButtons.Utils).WriteLog("<hr noshade size=""4"">")
	 			Do ##class(DeepSeeButtons.Utils).WriteLog("<a name=""overrides""</a>")
	 			Do ##class(DeepSeeButtons.Utils).WriteLog("<h2>DeepSee Overrides</h2>")
	 			Do ##class(DeepSeeButtons.Utils).WriteLog("<div class=""scrollable"" style=""width:100%;height:400px;"">")
	 			Do ##class(DeepSeeButtons.Utils).PrintGlobal(pNamespace,"^DeepSee.Overrides",2)
	 			Do ##class(DeepSeeButtons.Utils).WriteLog("</div>")
 			}	
		} Else {
			Do ##class(DeepSeeButtons.Utils).WriteLog("</tbody>",4)
 			Do ##class(DeepSeeButtons.Utils).WriteLog("</table>",2)
		}
	} Catch(ex) {
		zn pNamespace
		Set tSC = ex.AsStatus()
		Do ##class(DeepSeeButtons.Utils).WriteLog("Error in LogDeepSeeSetupSection: "_tSC,0)
		Do ##class(DeepSeeButtons.Utils).WriteLog("</tbody>",4)
 		Do ##class(DeepSeeButtons.Utils).WriteLog("</table>",2)
	}
	Do ##class(DeepSeeButtons.Utils).WriteLog("</div>")
}

ClassMethod DrawServerSetup(pTracking As %Boolean=0)
{
	Set x=$ZUtil(86),ConfigFile=$Piece(x,"*",1),ConfigName=$Piece(x,"*",2)
	Set CacheVerStr=$ZVersion
	Set HostName=$ZUtil(54,0)
	Set CustomerName=$System.License.KeyCustomerName()
	Set OrderNumber=$System.License.KeyOrderNumber()
	
	#define USEIPV6 $zbitget($zversion(0)_$c(0,0,0,0),42)
	#define HostNameToIPText(%h,%f)  $s($$$USEIPV6:$SYSTEM.INetInfo.HostNameToAddr(%h,%f),1:$p($ZU(54,13,%h),",",1))
	#define IPTextToBinary(%ip)      $s($$$USEIPV6:$SYSTEM.INetInfo.TextAddrToBinary(%ip),1:$ZU(54,1,%ip))
	#define IPBinaryToHostName(%ip)  $s($$$USEIPV6:$SYSTEM.INetInfo.AddrToHostName(%ip),1:$p($ZU(54,14,%ip),",",2))
	#define IPTextToHostName(%ip)    $$$IPBinaryToHostName($$$IPTextToBinary(%ip))
	
	Set IPAddr=$$$HostNameToIPText(HostName,0)
	Set FullHostName=$$$IPTextToHostName(IPAddr)
	
	///Server Details section
	Do ##class(DeepSeeButtons.Utils).WriteLog("<div id=""ServerDetailsDiv"" onmouseover=""highlightLink(this,1)"" onmouseout=""highlightLink(this,0)"">")
	Do ##class(DeepSeeButtons.Utils).WriteParagraph("serverdetails","Server Details",1)
	///The old "Configuration" section
	Do ##class(DeepSeeButtons.Utils).WriteLog("<table id=""ServerDetailsTable"" cellpadding=""7"" cellspacing=""3"" ""class=""tableWithBorders tableTabbed"">",2)
  	Do ##class(DeepSeeButtons.Utils).WriteLog("<tbody>",4)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteHeader4("Configuration",10)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>"_ConfigName_" on Machine """_HostName_""""_"</p>",10)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)	
	Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
	If CustomerName'?1a.e Set CustomerName="Unknown"
	Do ##class(DeepSeeButtons.Utils).WriteHeader4("Customer Name",10)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>"_CustomerName_"</p>",10)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)	
	Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteHeader4("License Order Number",10)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>"_OrderNumber_"</p>",10)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)	
	Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteHeader4("Fully Qualified Host Name",10)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>"_FullHostName_" with IP Address: "_IPAddr_"</p>",10)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)	
	Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteHeader4("Log created by User",10)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>"_$USERNAME_" on "_$ZDT($H,3)_"</p>",10)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)
	//Last Caché Startup
	Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteHeader4("Last Cach&eacute; Startup",10)
	Set tSC=##class(DeepSeeButtons.Utils).GetLastStartup(.tStartTime,.tDays,.tHours,.tMinutes,.tSeconds)
	If $$$ISERR(tSC) {
		Do ##class(DeepSeeButtons.Utils).WriteLog($System.Status.GetErrorText(tSC),10)
		Do:pTracking ##class(DeepSeeButtons.Utils).WriteTrack("warning","","WriteLastStartup",$System.Status.GetErrorText(tSC))
	}
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>"_$ZDATETIME(tStartTime,3)_". As of this report Cach&eacute; has been up for "_tDays_" days "_tHours_" hours "_tMinutes_" minutes "_tSeconds_" seconds"_"</p>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)	
	Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteHeader4("Cach&eacute; Version String",10)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>"_CacheVerStr_"</p>",10)
	Set isInsight=##class(DeepSeeButtons.Utils).IsHealthInsight() 	//Determine if this is a Health Insight namespace (1 if yes)
	Do:isInsight ##class(DeepSeeButtons.Utils).WriteLog("<p>"_##class(%ZHSLIB.HealthShareMgr).VersionInfo()_"</p>",8)
	Do ##class(DeepSeeButtons.Utils).WriteAdhocPatch() //write information on Adhoc patch
	//Current Locale subsection
	Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)	
	Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
	Do ##class(DeepSeeButtons.Report).WriteNLS(pTracking)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)	
	//Operating System Version section
	Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)	
	//PFS REVIEW
	//Do OSVer
	Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)	
	/*Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<h4>Operating System</h4>",10)	
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>",10)
	Do OSVer^Buttons
	Do ##class(DeepSeeButtons.Utils).WriteLog("</p>",10)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)
	*/	
	//Disk space
	Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)
	Do ##class(DeepSeeButtons.Report).WriteDiskSpace()
	Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)
	//RAM physical memory space
	Do ##class(DeepSeeButtons.Utils).WriteLog("<tr>",6)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<td>",8)	
	Do ##class(DeepSeeButtons.Report).WriteRAM()
	Do ##class(DeepSeeButtons.Utils).WriteLog("</td>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</tr>",6)
	//Close the table
	//PFS REVIEW
	//If OS?1"Win".e!(OS="VMS"),OS'="Win9x" 
	Do ##class(DeepSeeButtons.Utils).WriteLog("</tbody>",4)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</table>",2)
	Do ##class(DeepSeeButtons.Utils).WriteLog("</div>")
	Quit
}

ClassMethod WriteNLS(pTracking As %Boolean=0)
{
	Try {
		Do ##class(DeepSeeButtons.Utils).WriteHeader4("Current Locale",8)
		Set oLoc=##class(Config.NLS.Locales).OpenCurrent()
		If oLoc="" Set LocCur="Unknown",LocDesc="Unknown"
		Else  Set LocCur=oLoc.Name,LocDesc=oLoc.Description		
		Set LocSrc=$$ComputeFullDBDir^%SYS.API("Locale")
		Do ##class(DeepSeeButtons.Utils).WriteLog("<p>"_LocCur_" ("_LocDesc_")</p>",8)
	} Catch(ex) {		
		Set tSC = ex.AsStatus()
		Do ##class(DeepSeeButtons.Utils).WriteLog($System.Status.GetErrorText(tSC),10)
		Do:pTracking ##class(DeepSeeButtons.Utils).WriteTrack("warning","","NLS",$System.Status.GetErrorText(tSC))
	}
}

ClassMethod WriteRAM()
{
	Do ##class(DeepSeeButtons.Utils).WriteHeader4("RAM",8)
	//First refresh CPU info
	Do $ZU(204,0)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Model: "_$ZU(204,2)_"</p>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Chips: "_$ZU(204,6)_"</p>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Cores: "_$ZU(204,5)_"</p>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Threads: "_$ZU(204,4)_"</p>",8)	
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Frequency: "_$ZU(204,11)_" MHz</p>",8)	
	Set temp = $ZU(190,18)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Total physical memory: "_$FNUMBER($P(temp,",",1)/1024,",",0)_" MB</p>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Free physical memory: "_$FNUMBER($P(temp,",",2)/1024,",",0)_" MB</p>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Total paging/swap space: "_$FNUMBER($P(temp,",",3)/1024,",",0)_" MB</p>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Free paging/swap space: "_$FNUMBER($P(temp,",",4)/1024,",",0)_" MB</p>",8)
	Do ##class(DeepSeeButtons.Utils).WriteLog("",8)
	Quit
}

ClassMethod WriteDiskSpace()
{
	Do ##class(DeepSeeButtons.Utils).WriteHeader4("Disk space",8)
	Do ##class(%File).DriveListExecute(.drivelist)
	For {
		Set st=##class(%File).DriveListFetch(.drivelist,.drive,.AtEnd)
		Set drive = $LG(drive)
		Do ##class(%Library.File).GetDirectorySpace(drive,.free,.total,1)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Total space in """_drive_""" drive: "_$FNUMBER(total,",",0)_" MB</p>",8)
		Do ##class(DeepSeeButtons.Utils).WriteLog("<p>Free space in """_drive_""" drive:  "_$FNUMBER(free,",",0)_" MB</p>",8)
		Quit:AtEnd
	}	
	Quit
}

}