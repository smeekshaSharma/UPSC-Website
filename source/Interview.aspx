﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome To UPSC</title>
<script runat="server">
    Dim conn As New Data.SqlClient.SqlConnection
    Dim command As New Data.SqlClient.SqlCommand
    Dim datareader As New Data.SqlClient.SqlDataAdapter
    Dim sql As String
    Dim count As New Integer
    
</script>
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	width:100%;
	height:1245px;
	z-index:1;
	left: 0;
	top: 0;
}
#apDiv2 {
	position:absolute;
	width:1356px;
	height:103px;
	z-index:1;
}
.style1 {
	font-size: 30px;
	font-weight: bold;
	color: #154979;
}
.style2 {
	font-size: 24px;
	font-weight: bold;
}
#apDiv3 {
	position:absolute;
	width:100%;
	height:496px;
	z-index:2;
	left: 0px;
	top: 105px;
}
#apDiv4 {
	position:absolute;
	width:1355px;
	height:38px;
	z-index:1;
	background-color: #154979;
	top: -1px;
}
#apDiv5 {
	position:absolute;
	width:960px;
	height:409px;
	z-index:2;
	left: 1px;
	top: 41px;
}
#apDiv6 {
	position:absolute;
	width:30%;
	height:416px;
	z-index:3;
	left: 960px;
	top: 36px;
	background-color: #2A3F54;
}
.style3 {
	color: #FFFFFF;
	font-size: 24px;
	font-weight: bold;
}
#apDiv7 {
	position:absolute;
	width:100%;
	height:39px;
	z-index:4;
	left: 0px;
	top: 451px;
	background-color: #353535;
}
.style4 {
	color: #f7f702;
	font-weight: bold;
}
#apDiv8 {
	position:absolute;
	width:100%;
	height:671px;
	z-index:3;
	left: 0px;
	top: 604px;
}
    .style5
    {
        font-size: larger;
    }
    .style6
    {
        height: 35px;
    }
#apDiv9 {
	position:absolute;
	width:100%;
	height:37px;
	z-index:5;
	background-color: #2A3F54;
}
-->
</style>
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
</head>

<body>
    <form id="form1" runat="server">
<div id="apDiv1">
  <div id="apDiv2">
    <table width="100%" border="0">
      <tr>
        <td width="5%" rowspan="2"><img src="../images/logo.jpg" width="64" height="92" /></td>
        <td width="83%" height="49"><span class="style1">Union Public Service Commission</span></td>
        <td width="12%">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2"><span class="style2">संघ लोक सेवा आयोग</span></td>
      </tr>
    </table>
  </div>
  <div id="apDiv3">
    <div id="apDiv5">
      <script type="text/javascript">
AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0','width','960','height','412','src','../animation/Movie2','quality','high','pluginspage','http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','movie','../animation/Movie2' ); //end AC code
</script><noscript><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="960" height="412">
        <param name="movie" value="../animation/Movie2.swf" />
        <param name="quality" value="high" />
        <embed src="../animation/Movie2.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="960" height="412"></embed>
      </object>
    </noscript></div>
    <div id="apDiv6">
      <table width="100%" border="0">
        <tr>
          <td><div align="center"><span class="style3">What’s New</span></div></td>
        </tr>
        <tr>
          <td><hr /></td>
        </tr>
        <tr>
          <td><marquee direction="up"height="374px"width="336px"scrollamount="3">
              <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                  DataSourceID="SqlDataSource2" Width="100%" ForeColor="White" 
                  GridLines="None">
                  <Columns>
                      <asp:BoundField DataField="nexam" SortExpression="nexam" />
                  </Columns>
              </asp:GridView>
              <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                  SelectCommand="SELECT [nexam] FROM [news]"></asp:SqlDataSource></marquee>
            </td>
        </tr>
      </table>
    </div>
    <div id="apDiv7">
      <table width="100%" border="0">
        <tr>
          <td width="4%"><img src="../images/alert.png" width="35" height="35" /></td>
          <td width="96%"><span class="style4"> <marquee direction="left">Civil Services (Preliminary) Examination, 2020: Last date for Online submission of application is 03.03.2020, 6.00 PM    </marquee>    </span></td>
        </tr>
      </table>
    </div>
    <div id="apDiv9">
      <table width="100%" border="0">
        <tr>
          <td><asp:Menu ID="Menu1" runat="server" BackColor="#2B5277" 
                      DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Small" 
                      ForeColor="White" Orientation="Horizontal" StaticSubMenuIndent="10px" 
                      Font-Bold="True">
              <DynamicHoverStyle BackColor="#2B5277" ForeColor="White" />
              <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" 
                  BackColor="#2B5277" />
              <DynamicMenuStyle BackColor="#2B5277" />
              <DynamicSelectedStyle BackColor="#2B5277" ForeColor="Black" />
              <Items>
                <asp:MenuItem Text="Home" Value="Home" ImageUrl="~/images/homelogo.png" 
                      NavigateUrl="~/source/index.aspx"></asp:MenuItem>
                <asp:MenuItem Text="About" Value="About" ImageUrl="~/images/aboutlogo.png">
                  <asp:MenuItem Text="About" Value="About" NavigateUrl="~/source/about.aspx"></asp:MenuItem>
                  <asp:MenuItem Text="RTI" Value="RTI" NavigateUrl="~/source/RTI.aspx"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Examination" Value="Examination" 
                      ImageUrl="~/images/exlogo.png">
                  <asp:MenuItem Text="Calender" Value="Calender" 
                        NavigateUrl="~/source/upcomexam.aspx"></asp:MenuItem>
                  <asp:MenuItem Text="Previous Question Paper" Value="Previous Question Paper" 
                        NavigateUrl="~/source/preqp.aspx"> </asp:MenuItem>
                  <asp:MenuItem Text="Cutt Off Marks" Value="Cutt Off Marks" 
                        NavigateUrl="~/source/examcuttmarks.aspx"></asp:MenuItem>
                  <asp:MenuItem Text="Syllabus" Value="Syllabus" 
                        NavigateUrl="~/source/examsyllabus.aspx"></asp:MenuItem>
                  <asp:MenuItem Text="Post Detail" Value="Post Detail" 
                        NavigateUrl="~/source/exampost.aspx"></asp:MenuItem>
                  <asp:MenuItem Text="Examination Center" Value="Examination Center" 
                        NavigateUrl="~/source/examcenter.aspx"> </asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Recuritment" Value="Recuritment" 
                      ImageUrl="~/images/recuritmentlogo.png">
                  <asp:MenuItem Text="Apply Online" Value="Apply Online" 
                        NavigateUrl="~/source/apllyonline.aspx"></asp:MenuItem>
                  <asp:MenuItem Text="Admit Card" Value="Admit Card" 
                        NavigateUrl="~/source/eadmitcard.aspx"></asp:MenuItem>
                  <asp:MenuItem Text="Written Result" Value="Written Result" 
                        NavigateUrl="~/source/Writtenresult.aspx"></asp:MenuItem>
                  <asp:MenuItem Text="Interview Result" Value="Interview Result" 
                        NavigateUrl="~/source/Interview.aspx"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Forms &amp; Download" Value="Forms &amp; Download" 
                      NavigateUrl="~/source/downloadforms.aspx" 
                      ImageUrl="~/images/downloadlogo.png"> </asp:MenuItem>
                <asp:MenuItem Text="FAQ" Value="FAQ" NavigateUrl="~/source/faq.aspx" 
                      ImageUrl="~/images/faqlogo.png"></asp:MenuItem>
                <asp:MenuItem Text="Admin Login" Value="Admin Login" 
                      NavigateUrl="~/source/adminlogin.aspx" ImageUrl="~/images/adminlogo.png"></asp:MenuItem>
              </Items>
              <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
              <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" 
                          BackColor="#2B5277" />
              <StaticSelectedStyle BackColor="#507CD1" />
            </asp:Menu>
          </td>
        </tr>
      </table>
    </div>
  </div>
  <div id="apDiv8">
    <table width="100%" border="0">
      <tr>
        <td style="color: #2B5277; font-weight: 700" class="style6">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span 
                class="style5">Interview 
            Result<hr /></span></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>
            Enter Encrollment ID<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Get" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" Width="100%">
                <Columns>
                    <asp:BoundField DataField="eni" HeaderText="eni" SortExpression="eni" />
                    <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                    <asp:BoundField DataField="con" HeaderText="con" SortExpression="con" />
                    <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
                    <asp:BoundField DataField="ename" HeaderText="ename" SortExpression="ename" />
                    <asp:BoundField DataField="cname" HeaderText="cname" SortExpression="cname" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="pname" HeaderText="pname" SortExpression="pname" />
                    <asp:BoundField DataField="loc" HeaderText="loc" SortExpression="loc" />
                    <asp:BoundField DataField="doi" HeaderText="doi" SortExpression="doi" />
                    <asp:BoundField DataField="toi" HeaderText="toi" SortExpression="toi" />
                    <asp:BoundField DataField="cyear" HeaderText="cyear" SortExpression="cyear" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                SelectCommand="SELECT [eni], [fname], [con], [dob], [ename], [cname], [email], [pname], [loc], [doi], [toi], [cyear] FROM [int] WHERE ([eni] = @eni)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="eni" PropertyName="Text" 
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
          </td>
      </tr>
    </table>
  </div>
</div>
</form>
</body>
</html>
