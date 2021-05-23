<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>UPSC | Admin Recruitment App</title>
<script runat="server">
    Dim conn As New Data.SqlClient.SqlConnection
    Dim command As New Data.SqlClient.SqlCommand
    Dim datareader As New Data.SqlClient.SqlDataAdapter
    Dim sql As String
    Dim count As New Integer
    Dim pdfname As String
    Dim currdate As String
    Dim reapp As String
    Dim fname As String
    Dim gender As String
    Dim dob As String
    Dim state As String
    Dim mno As String
    Dim email As String
    Dim eid As String
    Dim mname As String
    Dim lname As String
    Dim fullname As String
    
Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        currdate = Format(Now, "dd/MM/yyyy")
        reapp = GridView1.SelectedRow.Cells(2).Text
        fname = GridView1.SelectedRow.Cells(3).Text
        mname = GridView1.SelectedRow.Cells(4).Text
        lname = GridView1.SelectedRow.Cells(5).Text
        gender = GridView1.SelectedRow.Cells(6).Text
        dob = GridView1.SelectedRow.Cells(9).Text
        state = GridView1.SelectedRow.Cells(11).Text
        mno = GridView1.SelectedRow.Cells(12).Text
        email = GridView1.SelectedRow.Cells(14).Text
       
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\civilservices.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        command = New Data.SqlClient.SqlCommand("select eid from enrolltemp")
        command.Connection = conn
        eid = command.ExecuteScalar
        command = New Data.SqlClient.SqlCommand("select count (*) from appconform where email='" & email & "'")
        command.Connection = conn
        count = command.ExecuteScalar
        If (count > 0) Then
            MsgBox("This Application already Confirmed")
            conn.Close()
        Else
            sql = "insert into appconform values('" & currdate & "','" & reapp & "','" & fname & "','" & gender & "','" & dob & "', '" & state & "','" & mno & "', '" & email & "', '" & eid & "')"
            datareader.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
            datareader.InsertCommand.ExecuteScalar()
            command = New Data.SqlClient.SqlCommand("delete from enrolltemp")
            command.Connection = conn
            command.ExecuteScalar()
            eid = Val(eid) + 126
            sql = "insert into enrolltemp values('" & eid & "')"
            datareader.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
            datareader.InsertCommand.ExecuteScalar()
            MsgBox("Application Detail Submitted Sucessfully")
            conn.Close()
        End If
        conn.Close()
        
End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
</script>
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	width:100%;
	height:672px;
	z-index:1;
	left: 0px;
	top: 0px;
}
#apDiv2 {
	position:absolute;
	width:100%;
	height:34px;
	z-index:1;
	background-color: #2A3F54;
}
#apDiv3 {
	position:absolute;
	width:20%;
	height:566px;
	z-index:2;
	left: -7px;
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
	height:447px;
	z-index:3;
	left: 259px;
	top: 153px;
	background-color: #FFFFFF;
}
.style3 {
	font-size: 24px;
	font-weight: bold;
	color: #000000;
}
#apDiv7 {
	position:absolute;
	width:100%;
	height:30px;
	z-index:4;
	left: 0px;
	top: 629px;
}
#apDiv8 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:2;
}
body,td,th {
	color: #0000CC;
}
body {
	background-color: #F0F0F0;
}
.style27 {
	color: #006DF0;
	font-weight: bold;
}
.style1 {color: #FFFFFF;
	font-weight: bold;
	font-size: 24px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style43 {color: #FFFFFF; font-weight: bold; }
.style44 {color: #000000;
	font-weight: bold;
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
#apDiv9 {
	position:absolute;
	width:80%;
	height:115px;
	z-index:5;
	left: 259px;
	top: 36px;
	background-color: #cccccc;
}
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
        <td width="33%" colspan="3"><div align="center"><span class="style3">Admin Recuritment Application</span></div></td>
      </tr>
      
      <tr>
        <td colspan="3"><hr /></td>
      </tr>
      <tr>
        <td colspan="3">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                onselectedindexchanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="cdate" HeaderText="cdate" SortExpression="cdate" />
                    <asp:BoundField DataField="recapp" HeaderText="recapp" 
                        SortExpression="recapp" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                    <asp:BoundField DataField="mname" HeaderText="mname" SortExpression="mname" />
                    <asp:BoundField DataField="gen" HeaderText="gen" SortExpression="gen" />
                    <asp:BoundField DataField="comm" HeaderText="comm" SortExpression="comm" />
                    <asp:BoundField DataField="physcical" HeaderText="physcical" 
                        SortExpression="physcical" />
                    <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
                    <asp:BoundField DataField="pob" HeaderText="pob" SortExpression="pob" />
                    <asp:BoundField DataField="nameofstate" HeaderText="nameofstate" 
                        SortExpression="nameofstate" />
                    <asp:BoundField DataField="nation" HeaderText="nation" 
                        SortExpression="nation" />
                    <asp:BoundField DataField="mno" HeaderText="mno" SortExpression="mno" />
                    <asp:BoundField DataField="cmno" HeaderText="cmno" SortExpression="cmno" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="cemail" HeaderText="cemail" 
                        SortExpression="cemail" />
                    <asp:BoundField DataField="despass" HeaderText="despass" 
                        SortExpression="despass" />
                    <asp:BoundField DataField="cpass" HeaderText="cpass" SortExpression="cpass" />
                    <asp:BoundField DataField="pdf" HeaderText="pdf" SortExpression="pdf" />
                    <asp:BoundField DataField="pdf1" HeaderText="pdf1" SortExpression="pdf1" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [cdate], [recapp], [name], [fname], [mname], [gen], [comm], [physcical], [dob], [pob], [nameofstate], [nation], [mno], [cmno], [email], [cemail], [despass], [cpass], [pdf], [pdf1] FROM [Table2]">
            </asp:SqlDataSource>
          </td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
    </table>
  </div>
  <div id="apDiv7">
    <table width="100%" border="0">
      <tr>
        <td><hr /></td>
      </tr>
      <tr>
        <td><blockquote>
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
  <div id="apDiv9"></div>
</div>
    </form>
</body>
</html>
