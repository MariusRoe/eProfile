
<%

if Session("User_ID") = 0 then
	Session("PageName") = "Login.asp"
	response.redirect("Login.asp")
end if
	

'**NOTE ***
'always put this in at the top of each page to accomodate IE8 and lower <!DOCTYPE html> and also set margin:0; padding:0; to ZERO
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	
		<!--#include virtual ="./ASP_INC/eProfiling_Initialize_functions.asp"-->

		<script type="text/javascript">
		
		
        
		function ConvertData( dd ) {
		var d = dd;		
		d = d.replace(/[%]/g, "%25");
		d = d.replace(/[&]/g, "%26");
		d = d.replace(/[ ]/g, "%20");
		d = d.replace(/[+]/g, "%2B");
		d = d.replace(/[=]/g, "%3D");
	//	d = d.replace(/[/]/g, "%2F");
	//	d = d.replace(/\/g, "%5C");
		d = d.replace(/[!]/g, "%21");
		d = d.replace(/[?]/g, "%3F");
		d = d.replace(/[*]/g, "%2A");
		d = d.replace(/[-]/g, "%2D");				
		d = d.replace(/[:]/g, "%3A");	
		d = d.replace(/[']/g, "%27");
		d = d.replace(/["]/g, "%22");
		d = d.replace(/[#]/g, "%23");
		d = d.replace(/[$]/g, "%26");
		d = d.replace(/[@]/g, "%40");
	return d;
				
	}	
		function saveUserData()
			{


			var Browser_name = window.navigator["appName"];
			var Browser_platform = window.navigator["platform"];
			var Browser_language = "NA";
			
			try {
				Browser_language = window.navigator["language"];
				
				if (Browser_language == "NA" || Browser_language == undefined)
					{Browser_language = window.navigator["browserLanguage"];
					}
				}
			
			finally
			{			
			}
				
				
				
			
			var Browser_all = window.navigator["userAgent"];
			var OS_all = window.navigator["appVersion"];
			
			
			var winW = screen.width;
			var winH = screen.height;
			
		
			Browser_name=ConvertData(Browser_name);
			Browser_platform=ConvertData(Browser_platform);
			Browser_language=ConvertData(Browser_language);
			Browser_all=ConvertData(Browser_all);
			OS_all=ConvertData(OS_all);
			var DataString = "Browser_name=" + Browser_name+"&Browser_platform="+Browser_platform+"&Browser_language="+Browser_language+"&Browser_all="+Browser_all+"&OS_all="+OS_all+"&Width="+winW+"&Height="+winH;
			$.ajax(								
				{type: "POST",url: "saveUserPCdata.asp", data: DataString, success:function(ResultData)
				{}
				});
				
			}
	</script>



</head>
<body onload="saveUserData()">
 <div id="content">
	 <div id="MenuBar"></div>
	 <div id="StatusBar">
        <div id="barSectionLeft" class="StatusBarTitle">Module Name - Client Name - Version #</div>
        <div id="barSectionCenter" class="StatusBarTitle">Last date & time logged in: </div>
        <div id="barSectionRight" class="StatusBarTitle">Logged In: </div> 
        <div id="barMenuBarClickArea">-</div>
     </div>
	 <div id="FunctionTitleBar">
        <div id="imgFunctionTitleBar"><img src="./ClientStructure/<%=Session("PortalFolderStyle_Name")%>/images/menu/coda.png" width="70px"></div>
        <div id="FunctionTitle">Competency Library</div>
     </div>
		  <div id="ContentBody">
			<div class="WelcomePage">
				<P> </P>
				<strong>News Flash !</strong><br /><br />
				
				 Welcome to the brand new release of QBIT Portal and eProfile V3. We have been hard at work to incorporate all the changes asked for.<br>
				 There have been a few updates to the portal and the functionality. <br>
				 To find out more about the changes, please contact your System Administrator or the Support Team to get a copy of the latest training manual.	
				 <br /><br>
				 <p style="font-size: 15px;color: grey;"><strong>Tips:</strong> The menu is now on the left-hand side. <br>
				 To access the menu, move your mouse to the left-hand side and the menu will automatically display.<br> 
				 The menu will change pending on the function you are accessing. <br>
				 To hide the menu, move your mouse off the menu and it will automatically disappear.</p>
				 <br /><br>
				  
			 </div>
		 </div>
</div>
<div id="pageslide"	 class="pageslide"> </div>

<script src="./ClientStructure/<%=Session("PortalFolderStyle_Name")%>/jquery/jquery.pageslide.js"></script>

</body>
</html>
