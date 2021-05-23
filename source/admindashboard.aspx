<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>UPSC | Admin Dash Board</title>
<script runat="server">
    Dim conn As New Data.SqlClient.SqlConnection
    Dim command As New Data.SqlClient.SqlCommand
    Dim datareader As New Data.SqlClient.SqlDataAdapter
    Dim sql As String
    Dim count As New Integer
    Dim pass As String
    Dim fname As String
    Dim lname As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\civilservices.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        command = New Data.SqlClient.SqlCommand("select uname from logintemp")
        command.Connection = conn
        Label1.Text = command.ExecuteScalar
        If Label1.Text = "Null" Then
            MsgBox("Login Your Account")
            Response.Redirect("adminlogin.aspx")
        Else
            command = New Data.SqlClient.SqlCommand("select fn from admin where email='" & Label1.Text & "'")
            command.Connection = conn
            fname = command.ExecuteScalar
            command = New Data.SqlClient.SqlCommand("select ln from admin where email='" & Label1.Text & "'")
            command.Connection = conn
            lname = command.ExecuteScalar
            Label2.Text = "Welcome: " & fname & " " & lname
        End If
        conn.Close()
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\civilservices.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        command = New Data.SqlClient.SqlCommand("delete from logintemp")
        command.Connection = conn
        command.ExecuteScalar()
        sql = "insert into logintemp values('" & "Null" & "')"
        datareader.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
        datareader.InsertCommand.ExecuteScalar()
        Response.Redirect("adminlogin.aspx")
        conn.Close()
        
    End Sub
</script>
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	width:100%;
	height:777px;
	z-index:1;
	left: 0px;
	top: 0px;
}
#apDiv2 {
	position:absolute;
	width:100%;
	height:35px;
	z-index:1;
	background-color: #2A3F54;
	top: 0px;
	left: 0px;
    }
#apDiv3 {
	position:absolute;
	width:257px;
	height:542px;
	z-index:2;
	left: 0;
	top: 37px;
	background-color: #2A3F54;
}
#apDiv4 {
	position:absolute;
	width:1032px;
	height:1552px;
	z-index:2;
	left: 268px;
	top: 64px;
}
#apDiv5 {
	position:absolute;
	width:1035px;
	height:1577px;
	z-index:1;
	left: 19px;
	top: 6px;
}
#apDiv6 {
	position:absolute;
	width:80%;
	height:681px;
	z-index:3;
	left: 258px;
	top: 37px;
	background-color: #FFFFFF;
}
.style2 {
	color: #000000;
	font-weight: bold;
	font-size: 24px;
}
.style3 {
	font-size: 24px;
	font-weight: 700;
}
#apDiv7 {
	position:absolute;
	width:100%;
	height:369px;
	z-index:4;
	left: 7px;
	top: 679px;
}
#apDiv8 {
	position:absolute;
	width:100%;
	height:50px;
	z-index:4;
	left: 0px;
	top: 724px;
}
a:link {
	color: #FFFFFF;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #FFFFFF;
}
a:hover {
	text-decoration: underline;
	color: #FFFFFF;
}
a:active {
	text-decoration: none;
	color: #FFFFFF;
}
a {
	font-size: 14px;
	font-weight: bold;
}
.style43 {color: #FFFFFF; font-weight: bold; }
.style44 {color: #000000;
	font-weight: bold;
}
.style1 {color: #FFFFFF;
	font-weight: bold;
	font-size: 24px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style45 {color: #000000}
-->
</style>
</head>

<body>
    <form id="form1" runat="server">
<div id="apDiv1">
  <div id="apDiv2">
    <table width="100%" border="0">
      <tr>
        <td width="2%" bgcolor="#FFFFFF"><img src="../images/upsclogo.png" width="25" height="25" /></td>
        <td width="93%"><span class="style1">UPSC Admin</span></td>
        <td width="5%">&nbsp;</td>
      </tr>
    </table>
  </div>
  <div id="apDiv3">
    <table width="100%" border="0">
      <tr>
        <td colspan="2"><span class="style43">Welcome</span><span class="style43"> Administrator!!!</span></td>
      </tr>
      <tr>
        <td colspan="2" bgcolor="#FFFFFF"><span class="style44">Admin Panel</span></td>
      </tr>
      <tr>
        <td width="15%"><div align="center"><img src="../Images/home.png" alt="" width="25" height="25" /></div></td>
        <td width="85%"><a href="admindashboard.aspx"><span class="style43">Home</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../Images/examination.png" width="25" height="23" /></div></td>
        <td><span class="style43"><a href="adminexamnotice.aspx">Examination Notice</a></span></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../Images/req.png" width="25" height="24" /></div></td>
        <td bordercolor="#0000FF" class="style43">Recuritment Application</td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/logos/a.png" width="25" height="25" /></div></td>
        <td><a href="adminexamcenter.aspx"><span class="style43">Examination Centre</span></a></td>
      </tr>
      <tr>
        <td height="29"><div align="center"><img src="../images/Untitled-1.png" width="25" height="25" /></div></td>
        <td><a href="admincarddetail.aspx"><span class="style43">Grade Card Detail</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../Images/examinationcenter.png" width="25" height="25" /></div></td>
        <td><span class="style43">Examination Result</span></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/cut of marks.png" width="25" height="25" /></div></td>
        <td><a href="admincuttoffmarks.aspx"><span class="style43">Cut Off Marks</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/sllybus.png" width="25" height="25" /></div></td>
        <td><a href="adminexamsyllabus.aspx"><span class="style43">Syllabus</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/pvr.png" width="25" height="25" /></div></td>
        <td><a href="adminprevques.aspx"><span class="style43">Previous Question Paper</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/about us.png" width="25" height="25" /></div></td>
        <td><a href="adminaboutus.aspx"><span class="style43">About Us</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/forms.png" width="25" height="25" /></div></td>
        <td><a href="adminformsupload.aspx"><span class="style43">Forms and Download</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/faqs.png" width="25" height="25" /></div></td>
        <td><a href="FAQDetail.aspx"><span class="style43">FAQ's</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/news.png" width="25" height="25" /></div></td>
        <td><a href="adminnew.aspx"><span class="style43">Current News </span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/RTI.png" width="25" height="25" /></div></td>
        <td><span class="style43"><a href="adminrti.aspx">RTI</a></span></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/logos/efg.png" width="25" height="25" /></div></td>
        <td><a href="adminexamfinal.aspx"><span class="style43">Upcoming Examination</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/ex vghhjujkj.png" width="25" height="25" /></div></td>
        <td><a href="admininterview.aspx"><span class="style43">Written Result</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/intrer.png" width="25" height="25" /></div></td>
        <td><a href="admininterview.aspx"><span class="style43">Interview Result</span></a></td>
      </tr>
    </table>
  </div>
  <div id="apDiv6">
    <table width="100%" border="0">
      <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
          </td>
        <td>
            <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Black" 
                onclick="LinkButton1_Click"><span class="style45">Logout</span></asp:LinkButton>
          </td>
      </tr>
      
      <tr>
        <td colspan="2"><span class="style3">What is Administrator?</span></td>
      </tr>
      
      <tr>
        <td colspan="2">A database administrator (DBA) is the information technician responsible for directing or performing all activities related to maintaining a successful database environment. A DBA makes sure an organization's database and its related applications operate functionally and efficiently.</td>
      </tr>
      <tr>
        <td colspan="2"><span class="style2">Importance Of DBA</span></td>
      </tr>
      
      <tr>
        <td colspan="2"><p align="justify">If your organization uses a database management system (DBMS) for mission-critical workloads, it is important to employ one or more database administrators to ensure that applications have ongoing, uninterrupted access to data. Most modern organizations of every size use at least one DBMS, and therefore the need for database administrators is greater today than ever before.The DBA is responsible for understanding and managing the overall database environment. By developing and implementing a strategic blueprint to follow when deploying databases within their organization, DBAs are instrumental to the ongoing efficacy of modern applications that rely on databases for data storage and access.Without the DBA's oversight, it is inevitable that application and system outages, downtime and slowdowns will occur. Problems such as these result in business outages that can negatively affect revenue, customer experience and company reputation.DBAs are the subject matter experts for database management systems and all related topics, including DBMS implementation and configuration; database design; SQL coding; data extraction, transformation and loading (ETL); test data management; problem resolution; data integrity; database security; optimization; and database backup and recovery.Database administration is a vital component of the IT environment for any organization that relies on one or more database management systems.</p>        </td>
      </tr>
      <tr>
        <td colspan="2"><span class="style2">Roles &amp; Responsibility</span></td>
      </tr>
      
      <tr>
        <td height="344" colspan="2"><p align="justify">          A database administrator (DBA) is the information technician responsible for directing or performing all activities related to maintaining a successful database environment. A DBA makes sure an organization's database and its related applications operate functionally and efficiently. Importance of a DBA</p>
          <p align="justify">If your organization uses a database management system (DBMS) for mission-critical workloads, it is important to employ one or more database administrators to ensure that applications have ongoing, uninterrupted access to data. Most modern organizations of every size use at least one DBMS, and therefore the need for database administrators is greater today than ever before.</p>
          <p align="justify" style="height: 209px">The DBA is responsible for understanding and managing the overall database environment. By developing and implementing a strategic blueprint to follow when deploying databases within their organization, DBAs are instrumental to the ongoing efficacy of modern applications that rely on databases for data storage and access.Without the DBA's oversight, it is inevitable that application and system outages, downtime and slowdowns will occur. Problems such as these result in business outages that can negatively affect revenue, customer experience and company reputation.DBAs are the subject matter experts for database management systems and all related topics, including DBMS implementation and configuration; database design; SQL coding; data extraction, transformation and loading (ETL); test data management; problem resolution; data integrity; database security; optimization; and database ckup and recovery.</p>        </td>
      </tr>
    </table>
    </div>
  <div id="apDiv8">
    <table width="100%" border="0">
      <tr>
        <td><hr /></td>
      </tr>
      <tr>
        <td height="21"><blockquote>
            <blockquote>
              <blockquote>
                <blockquote>
                  <blockquote>
                    <blockquote>
                      <blockquote>
                        <blockquote>
                          <blockquote>
                            <blockquote>
                              <blockquote>
                                <p><span class="style5"> This Website Designed &amp; Developed By Shaheen Bano</p>
                              </blockquote>
                            </blockquote>
                          </blockquote>
                        </blockquote>
                      </blockquote>
                    </blockquote>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
        </blockquote></td>
      </tr>
    </table>
  </div>
</div>
    </form>
</body>
</html>
