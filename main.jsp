<link href="/common/popup_style.css" rel="stylesheet" type="text/css">
<%@page pageEncoding="euc-kr"%>
<%@ include file="/include/TopInclude.jsp" %>
<%@ page import="com.board.*" %>

<jsp:useBean id="board" class="com.board.Board" scope="page" />
<jsp:useBean id="room" class="com.room.RoomStory" scope="page" />
<jsp:useBean id="util" class="com.util.PurunetUtil" scope="page" />
<jsp:useBean id="common" class="com.common.Common" scope="page" />
<jsp:useBean id="popup" class="com.board.Popup" scope="page" />

<%
	ArrayList alist = board.getList("","","bbs", 0, 5);
	ArrayList alist2 = room.getMainList("","","RoomStory",0 , 5, "");

	ArrayList alistLayerPopup = popup.getLayerPopups();
	ArrayList alistNomalPopup = popup.getNomalPopups();	

	// ?ìÜ?? ??
    String ip = request.getRemoteAddr();  
	common.visitCount(ip);

	int alistCnt = 0;
	int alist2Cnt = 0;

	if(alist != null )
		alistCnt = alist.size() ;

	if(alist2 != null )
		alist2Cnt = alist2.size() ;

%>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
<script language="JavaScript">
function setCookie( name, value, expiredays ) 
{ 
        var todayDate = new Date(); 
        todayDate.setDate( todayDate.getDate() + expiredays ); 
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
} 
function getNewCookie( name ) 
{ 
        var nameOfCookie = name + "="; 
        var x = 0; 
        while ( x <= document.cookie.length ) 
        { 
                var y = (x+nameOfCookie.length); 
                if ( document.cookie.substring( x, y ) == nameOfCookie ) { 
                        if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
                                endOfCookie = document.cookie.length; 
                        return unescape( document.cookie.substring( y, endOfCookie ) ); 
                } 
                x = document.cookie.indexOf( " ", x ) + 1; 
                if ( x == 0 ) 
                        break; 
        } 
        return ""; 
} 

function getCookie(name) {
    var dc = document.cookie;
    var prefix = name + "=";
    var begin = dc.indexOf("; " + prefix);
    if (begin == -1) {
        begin = dc.indexOf(prefix);
        if (begin != 0) 
            return null;
    } else {
        begin += 2;
    }

    var end = document.cookie.indexOf(";", begin);
    if (end == -1)
        end = dc.length;
    return unescape(dc.substring(begin + prefix.length, end));
}

//??? ????
	<%  
	for(int i = 0 ; i < alistNomalPopup.size() ; i++) {
		PopupBean beans = new PopupBean();
		beans = (PopupBean)alistNomalPopup.get(i);
	%>
	if(getCookie( "purunet_<%=beans.layerFlag%>_<%=beans.popSeq%>" ) != "done") 
	{ 
	    popupWindow  =   
	    popupWindow  =   window.open('/popup/popup.jsp?popSeq=<%=beans.popSeq%>','purunet_<%=beans.layerFlag%>_<%=beans.popSeq%>','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=<%=beans.width%>,height=<%=beans.height%>, top=<%=beans.yLocation%>,left=<%=beans.xLocation%>');	
	    popupWindow.opener = self; 
	 }
	<% }%>

//????? ???? 	
	<%  
	for(int i = 0 ; i < alistLayerPopup.size() ; i++) {
		PopupBean beans = new PopupBean();
		beans = (PopupBean)alistLayerPopup.get(i);
	%>
		$('#layerPop_<%=beans.popSeq%>').hide();	
	if(getCookie("purunet_<%=beans.layerFlag%>_<%=beans.popSeq%>") != "no") {
		$('#layerPop_<%=beans.popSeq%>').show();			
	} 	
	<% }%>	

//if ( getCookie( "EntranceTest3" ) != "done") 
//{ 
//      popupWindow  =  window.open('/popup/2014/20140806_popup.htm','EntranceTest3','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=420,height=325, top=5,left=5'); 
//		popupWindow.opener = self; 
//} 
/*
if ( getCookie( "EntranceTest31" ) != "done") 
{ 
        popupWindow  =  window.open('/popup/2014/20140918_popup.htm','EntranceTest31','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=448,height=382, top=5,left=5'); 
		popupWindow.opener = self; 
} 
if ( getCookie( "EntranceTest4" ) != "done") 
{ 
        popupWindow  =  window.open('/popup/2014/20141001_popup.htm','EntranceTest4','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=232, top=5,left=470'); 
		popupWindow.opener = self; 
} 
*/
//if ( getCookie( "purunet09" ) != "done") 
//{ 
//    popupWindow  =   window.open('/popup/2010/1130_popup.htm','win10','width=390, height=410, top=0, left=10, toolbar=0,  border=thin location=no, scrollbars=no, directories=no, resizable=0,status=no,menubar=0');	
// }
//if ( getCookie( "purunet07" ) != "done") 
//{ 
//    popupWindow  =   window.open('popup/2011/110628_popup.htm','win8','width=439, height=320, top=0, left=420, toolbar=0,  border=thin location=no, scrollbars=no, directories=no, resizable=0,status=no,menubar=0');	
// }

</script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-43561689-1', 'purunethome.com');
  ga('send', 'pageview');
</script>

<body leftmargin="0" topmargin="0">

<table width="879" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="144"> <div style="position:relative;"> 
        <div id="abtoos" style="position:absolute; left:890px; top:145px; width:5px; height:5px; z-index:0"> 
          <table width="74" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td><a href="/room/room.jsp?category=s01_6"><img src="images/main/20081124_06_01.gif" width="74" height="94" border="0"></a></td>
            </tr>
            <tr> 
              <td><a href="/middle/middle04.jsp"><img src="images/main/20081124_06_02.gif" width="74" height="95" border="0"></a></td>
            </tr>
            <tr> 
              <td><a href="/customer/customer06.jsp"><img src="images/main/20130704_06_03.gif" width="74" height="95" border="0"></a></td>
            </tr>
            <tr> 
              <td><a href="http://blog.naver.com/purunethome" target="_blank"><img src="images/main/new_quick02.gif" width="74" height="95" border="0"></a></td>
            </tr>
            <tr> 
              <td align="center"><a href="#top"><img src="images/main/20081124_06_04.gif" width="38" height="41" border="0"></a></td>
            </tr>
          </table>
          <script>
	basicTop = 145
	basicLeft = 890;
	leastBottom = 385;
	abtoos.style.top = document.body.scrollTop + basicTop;
	abtoos.style.left = basicLeft;
	abtoos.style.visibility = 'visible';
	move();
	function move() {

/*  ????? ???¨¨? ??????
		if (parseInt(document.body.clientWidth) > 964){
				basicLeft2 = ((parseInt(document.body.clientWidth) - 964) /2) + 845

				abtoos.style.left = basicLeft2

		}else{
			basicLeft2 = 845
			abtoos.style.left = basicLeft2
		}

*/

		var movefrom, moveto, y, movetimeout;
		movefrom = parseInt(abtoos.style.top);
		moveto = document.body.scrollTop + basicTop;
		if (document.body.scrollHeight - leastBottom < moveto) moveto = document.body.scrollHeight - leastBottom;
		if (moveto < basicTop) moveto = basicTop;
		movetimeout = 500;
		if ((y != moveto)|| isNaN(y)) {
			y = Math.ceil(Math.abs(moveto - movefrom) / 10);
			if (moveto <= movefrom){ y = -y }
			abtoos.style.top = parseInt(abtoos.style.top) + y;
			movetimeout = 1;
		}
		setTimeout('move()',movetimeout);
	}
</script>
        </div>
      </div>
      <!----------????¡À??? ???? ------------------>
      <script language="JavaScript" type="text/javascript">writeFlash('/images/2009_new_fla/menu.swf?main=1',879,144,'transparent','');</script> 
      <!----------????¡À??? ?? ------------------>
    </td>
  </tr>
  <tr> 
    <td><table width="879" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="186" valign="top"><table width="172" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="156" align="center" background="images/main/20081125_01_03.gif"> 
                  <!--------?¥á??? ???? -------------->
                  <%@ include file="/include/new_login.jsp" %>
                  <!--------?¥á??? ?? -------------->
                </td>
              </tr>
              <tr> 
                <td height="7"></td>
              </tr>
              <tr> 
                <td><a href="/info/info02_01_02.jsp"><img src="images/main/20081125_01_04.gif" width="172" height="68" border="0"></a></td>
              </tr>
              <tr> 
                <td height="7"></td>
              </tr>
              <tr> 
                <td><a href="/info/info06.jsp"><img src="images/main/20081124_03_03.gif" width="172" height="69" border="0"></a></td>
              </tr>
              <tr> 
                <td height="7"></td>
              </tr>
              <tr> 
                <td><img src="images/main/20081124_03_04.gif" width="172" height="73"></td>
              </tr>
              <tr> 
                <td height="7"></td>
              </tr>
              <tr> 
                <td><img src="images/main/20081124_03_05.gif" width="172" height="176"></td>
              </tr>
            </table></td>
          <td width="505" valign="top"><table width="505" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="338"> 
                  <!----------?????¡À??? ????------------------>
                  <script language="JavaScript" type="text/javascript">writeFlash('/images/2009_new_fla/main.swf',505,338,'transparent','');</script> 
                  <!----------?????¡À??? ?? ------------------>
                </td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td><table width="505" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="168"><a href="/customer/customer01.jsp" onFocus="this.blur();" /><img src="images/main/20081124_01_01.gif" width="168" height="73" border="0"></a></td>
                      <td width="169"><img src="images/main/20081124_01_02.gif" name="new01" width="169" height="73" border="0" usemap="#new01Map" id="new01"></td>
                      <td><img src="images/main/20081124_01_03.gif" name="new02" width="168" height="73" border="0" usemap="#new02Map" id="new02"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="20"></td>
              </tr>
              <tr> 
                <td><table width="505" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="239" valign="top"> 
                        <!------------???????? ???? -------------------->
                        <table width="239" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><a href="/customer/customer04.jsp" onFocus="this.blur();" /><img src="images/main/20081124_04_01.gif" width="239" height="29" border="0"></a></td>
                          </tr>
                          <tr> 
                            <td><table width="239" border="0" cellspacing="0" cellpadding="0">
                                <% for(int i = 0 ; i < 5 ; i++) { %>
                                <tr> 
                                  <td width="12"><img src="images/main/20081124_04_03.gif" width="12" height="6"></td>
                                  <% if(alistCnt < i+1) { %>
                                  <td width="210" height="18">&nbsp;</td>
                                  <% } else { 
					      BoardBean bean = new BoardBean();
									bean = (BoardBean)alist.get(i);
							//String todate = (util.getDateStr("SmUtil.FMT_DATE2"));
					  %>
                                  <td width="230" height="18"><a href="/customer/customer04_view.jsp?no=<%=bean.no%>"><%=util.truncVal(bean.title, 19)%> 
                                    <% if("NEW".equals(bean.newDate)) { %>
                                    &nbsp;<img src="/images/main/new.gif" border="0" height="11"> 
                                    <% } %>
                                    </a></td>
                                  <% } %>
                                </tr>
                                <% } %>
                              </table></td>
                          </tr>
                        </table>
                        <!------------???????? ??-------------------->
                      </td>
                      <td>&nbsp;</td>
                      <td width="239" valign="top"> 
                        <!-----------???¥é?????? ???? --------------->
                        <table width="239" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><a href="/room/room.jsp?category=s01_4" onFocus="this.blur();" /><img src="images/main/20081124_04_02.gif" width="239" height="29" border="0"></a></td>
                          </tr>
                          <tr> 
                            <td><table width="239" border="0" cellspacing="0" cellpadding="0">
                                <% for(int i = 0 ; i < 5 ; i++) { %>
                                <tr> 
                                  <td width="12"><img src="images/main/20081124_04_03.gif" width="12" height="6"></td>
                                  <% if(alist2Cnt < i+1) { %>
                                  <td width="210" height="18">&nbsp;</td>
                                  <% } else { 
					      BoardBean bean = new BoardBean();
									bean = (BoardBean)alist2.get(i);
							//String todate = (util.getDateStr("SmUtil.FMT_DATE2"));
					  %>
                                  <td width="230" height="18"><a href="/room/room.jsp?category=s01_4&seq=<%=bean.no%>&mode=VIEW""><%=util.truncVal(bean.title, 20)%> 
                                    <% if("NEW".equals(bean.newDate)) { %>
                                    &nbsp;<img src="/images/main/new.gif" border="0" height="11"> 
                                    <% } %>
                                    </a></td>
                                  <% } %>
                                </tr>
                                <% } %>
                              </table></td>
                          </tr>
                        </table>
                        <!-----------???¥é?????? ?? --------------->
                      </td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td valign="top"><table width="188" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="218"> 
                  <!----------????¡À??? ???? ------------------>
                  <div id="banner"> 
                    <script id="elementid" language="JavaScript" type="text/javascript">writeFlash('images/new_fla/main_banner.swf',188,218,'transparent','');</script>
                  </div>
                  <!----------????¡À??? ???? ------------------>
                </td>
              </tr>
              <tr> 
                <td height="14"></td>
              </tr>
              <tr> 
                <td align="right"> <table width="167" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><a href="/book/book01.jsp" onFocus="this.blur();" /><img src="images/main/20081124_05_01.gif" width="167" height="34" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td><a href="/book/book02.jsp" onFocus="this.blur();" /><img src="images/main/20081125_01_01.gif" width="167" height="56" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td><a href="/book/book03.jsp" onFocus="this.blur();" /><img src="images/main/20081125_01_02.gif" width="167" height="57" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td align="right"> <div id="map"> <img src="/images/main/2014_map01.jpg" name="map" width="167" height="183" border="0" usemap="#mapMap" id="map"></div></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="15"></td>
  </tr>
  <tr> 
    <td height="15"><img src="/images/main/20090317_family_site.gif" name="fa" width="879" height="63" border="0" usemap="#faMap" id="fa"></td>
  </tr>
  <tr> 
    <td><img src="images/main/footer.gif" width="879" height="104" border="0" usemap="#Map"></td>
  </tr>
</table>

<%  
for(int i = 0 ; i < alistLayerPopup.size() ; i++) {
	PopupBean beanss = new PopupBean();
	beanss = (PopupBean)alistLayerPopup.get(i);
%>
	 <div id="layerPop_<%=beanss.popSeq%>" style="position:absolute; left:<%=beanss.xLocation%>px; top:<%=beanss.yLocation%>px;" class="pop_area">
		 <table width="<%=beanss.width%>" height="<%=beanss.height%>" border="0" cellpadding="10" cellspacing="1" bgcolor="ffffff">
			 <tr height="20">
				 <td bgcolor="ffffff"><font color="000000"><%=beanss.title%></font></td>
			 </tr>
			 <tr>
				 <td bgcolor="ffffff"><font color="000000"><%=beanss.content%></font></td>
			 </tr>
			 <tr height="20">
				 <td align="right" bgcolor="ffffff"><input type="checkbox" id="checks_<%=beanss.popSeq%>" name="checks_<%=beanss.popSeq%>" value="no" onclick="javascript:oneDayClosed('<%=beanss.layerFlag%>','<%=beanss.popSeq%>')"/>
				 <font color="000000">??Ï½?? ???????</font>&nbsp;<a href="javascript:closeLayerPop('<%=beanss.layerFlag%>','<%=beanss.popSeq%>');"><font color="000000">[???]</font></a></td>
			 </tr>
		 </table>
	 </div>
	 
	<% }%>

<map name="Map">
  <area shape="rect" coords="181,15,244,35" href="/intro/intro02.jsp">
  <area shape="rect" coords="252,16,317,35" href="/customer/customer06.jsp">
  <area shape="rect" coords="318,15,372,36" href="/customer/customer09.jsp">
  <area shape="rect" coords="376,15,456,37" href="/customer/customer07.jsp">
  <area shape="rect" coords="459,15,558,35" href="/customer/customer08.jsp">
</map>
<map name="mapMap">
  <area shape="rect" coords="15,33,57,44" href="/info/info08.jsp?category=info08&sflag=2">
  <area shape="rect" coords="58,36,100,50" href="/info/info08.jsp?category=info08&sflag=1">
  <area shape="rect" coords="104,33,151,47" href="/info/info08.jsp?category=info08&sflag=4">
  <area shape="rect" coords="42,55,88,66" href="/info/info08.jsp?category=info08&sflag=3">
  <area shape="rect" coords="25,74,67,85" href="/info/info08.jsp?category=info08&sflag=20">
  <area shape="rect" coords="25,86,67,96" href="/info/info08.jsp?category=info08&sflag=5">
  <area shape="rect" coords="109,75,149,88" href="/info/info08.jsp?category=info08&sflag=8">
  <area shape="rect" coords="91,88,128,99" href="/info/info08.jsp?category=info08&sflag=9">
  <area shape="rect" coords="107,114,150,126" href="/info/info08.jsp?category=info08&sflag=12">
  <area shape="rect" coords="105,128,153,140" href="/info/info08.jsp?category=info08&sflag=10">
  <area shape="rect" coords="69,119,105,130" href="/info/info08.jsp?category=info08&sflag=11">
  <area shape="rect" coords="38,166,85,179" href="/info/info08.jsp?category=info08&sflag=13">
  <area shape="rect" coords="6,3,160,20" href="/info/info08.jsp">
<area shape="rect" coords="47,130,83,144" href="/info/info08.jsp?category=info08&sflag=15">
<area shape="rect" coords="24,119,68,130" href="/info/info08.jsp?category=info08&sflag=6">
<area shape="rect" coords="111,99,145,111" href="/info/info08.jsp?category=info08&sflag=17">
<area shape="rect" coords="20,44,61,54" href="/info/info08.jsp?category=info08&sflag=19">
</map>
<map name="faMap">
  <area shape="rect" coords="9,8,125,52" href="http://www.kumsung.co.kr/" target="_blank" onFocus="this.blur();" />
  <area shape="rect" coords="255,11,376,54" href="http://www.kstext.com/" target="_blank" onFocus="this.blur();" />
  <area shape="rect" coords="381,8,502,56" href="http://www.purunet.com/" target="_blank" onFocus="this.blur();" />
  <area shape="rect" coords="505,10,627,53" href="http://www.purunetedu.com/" target="_blank" onFocus="this.blur();" />
  <area shape="rect" coords="631,9,749,54" href="http://ischool.purunet.com/ps/UserIdx.prn?TOPMENU=1000000212&SECMENU=1000000213&THRMENU=1000000215&CNM=green" target="_blank" onFocus="this.blur();" />
  <area shape="rect" coords="755,9,873,56" href="http://www.kseshop.com/" target="_blank" onFocus="this.blur();" />
<area shape="rect" coords="128,11,249,53" href="http://www.englishbuddy.kr/" target="_blank" onFocus="this.blur();" />
</map>

<map name="new01Map"><area shape="rect" coords="48,46,106,68" href="/room/room.jsp?category=s01_6" onFocus="this.blur();" />
<area shape="rect" coords="109,45,164,67" href="/middle/middle04.jsp" onFocus="this.blur();" />
</map>
<map name="new02Map"><area shape="rect" coords="67,47,115,67" href="/room/room.jsp?category=s01_6c" onFocus="this.blur();" /><area shape="rect" coords="118,46,163,67" href="/middle/middle04_02.jsp" onFocus="this.blur();" />
</map></body>
</html>
