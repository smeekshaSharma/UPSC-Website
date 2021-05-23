<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>UPSC | Previous Question Paper</title>
<script runat="server">
    Dim conn As New Data.SqlClient.SqlConnection
    Dim command As New Data.SqlClient.SqlCommand
    Dim datareader As New Data.SqlClient.SqlDataAdapter
    Dim sql As String
    Dim count As New Integer
    Dim pdf As String
    Dim fname As String
    Dim lname As String
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If T1.Text = "" Or t2.Text = "select any one" Or FileUpload1.FileName = "" Then
            MsgBox("Please Fill All Records")
            Exit Sub
        End If
        If IsNumeric(t2.Text) Then
            MsgBox("please fill subject name")
            t2.Text = ""
            Exit Sub
        End If
        pdf = "~/pdf/" & FileUpload1.FileName
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\civilservices.mdf;Integrated Security=True;User Instance=True")
       
        conn.Open()
        command = New Data.SqlClient.SqlCommand("select count (*) from previousQP where ename='" & UCase(t2.Text) & "'and dateofqp='" & T3.SelectedDate & "'")
        command.Connection = conn
        count = command.ExecuteScalar
        If (count > 0) Then
            MsgBox("This Question Paper already Exist")
            conn.Close()
        Else
            sql = "insert into previousQP values('" & T1.Text & "','" & UCase(t2.Text) & "','" & T3.SelectedDate & "','" & pdf & "')"
            datareader.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
            datareader.InsertCommand.ExecuteScalar()
            MsgBox("Question Paper Detail Submitted Sucessfully")
            conn.Close()
        
        End If
                
        
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
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
        
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\civilservices.mdf;Integrated Security=True;User Instance=True")
       
        conn.Open()
        command = New Data.SqlClient.SqlCommand("delete  from previousQP where ename='" & UCase(T2.Text) & "'and dateofqp='" & T3.SelectedDate & "'")
       
        command.Connection = conn
        command.ExecuteScalar()
        MsgBox("Question Paper Detail deleted Sucessfully")
    
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        pdf = "~/pdf/" & FileUpload1.FileName
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\civilservices.mdf;Integrated Security=True;User Instance=True")
       
        conn.Open()
        command = New Data.SqlClient.SqlCommand("update  previousqp set dateofqp   ='" & T3.SelectedDate & "',pdf='" & pdf & "'where ename='" & UCase(t2.Text) & "'and dateofqp='" & T3.SelectedDate & "'")
        command.Connection = conn
        command.ExecuteScalar()
        MsgBox(" Question Paper Detail updated successfully")
     
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        T1.Text = Format(Now, "dd/MM/yyyy")
        T1.Enabled = False
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
	height:672px;
	z-index:1;
	left: 0px;
	top: 0px;
}
#apDiv2 {
	position:absolute;
	width:100%;
	height:36px;
	z-index:1;
	background-color: #2A3F54;
}
#apDiv3 {
	position:absolute;
	width:20%;
	height:566px;
	z-index:2;
	left: -1px;
	top: 38px;
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
	width:1049px;
	height:470px;
	z-index:3;
	left: 265px;
	top: 155px;
	background-color: #FFFFFF;
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
    .style11
    {
	width: 65%;
	height: 23px;
	font-weight: bold;
	color: #666666;
    }
    .style12
    {
        height: 23px;
    }
    .style13
    {
	width: 65%;
	font-size: medium;
	height: 61px;
	font-weight: bold;
	color: #666666;
    }
    .style14
    {
        height: 61px;
    }
.style17 {width: 65%; font-size: medium; font-weight: bold; }
a:link {
	text-decoration: none;
	color: #FFFFFF;
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
.style3 {
	font-size: 24px;
	font-weight: bold;
}
.style18 {width: 65%; font-size: medium; font-weight: bold; color: #666666; }
.style1 {color: #FFFFFF;
	font-weight: bold;
	font-size: 24px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style43 {color: #FFFFFF; font-weight: bold; }
.style44 {color: #000000;
	font-weight: bold;
}
#apDiv9 {
	position:absolute;
	width:80%;
	height:115px;
	z-index:5;
	left: 265px;
	top: 38px;
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
        <td colspan="2"><div align="center">
            <asp:Label ID="Label1" runat="server" ForeColor="Blue" Text="Label"></asp:Label>
            <asp:Label ID="Label2" runat="server" ForeColor="Blue" Text="Label"></asp:Label>
            </div></td>
        <td colspan="2">
            <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Black" 
                onclick="LinkButton1_Click">Logout</asp:LinkButton>          </td>
      </tr>
      
      <tr>
        <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="style3">Previous Question Paper</span>&nbsp;</td>
      </tr>
      
      <tr>
        <td colspan="4"><hr /></td>
      </tr>
      <tr>
        <td colspan="4">&nbsp;</td>
      </tr>
      <tr>
        <td class="style11">Current Date</td>
        <td width="29%" class="style12" colspan="2">          <strong>
            <asp:TextBox ID="T1" runat="server" Height="22px" 
                ValidationGroup="current date"></asp:TextBox>
          </strong> </td>
        <td width="4%" class="style12"></td>
      </tr>
      <tr>
        <td class="style13">Examination Name</td>
        <td class="style14" colspan="2">
            <asp:DropDownList ID="t2" runat="server" DataSourceID="SqlDataSource1" 
                DataTextField="examname" DataValueField="examname">            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [examname] FROM [examnotice]"></asp:SqlDataSource>          </td>
        <td class="style14">&nbsp;</td>
      </tr>
      <tr>
        <td class="style18">Date of Question Paper
        <td colspan="2">          <strong>
            <asp:Calendar ID="T3" runat="server"></asp:Calendar>
          </strong> </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="style18">PDF/Document</td>
        <td colspan="2">
            <asp:FileUpload ID="FileUpload1" runat="server" />          </td>
        <td>&nbsp;</td>
      </tr>
      
      <tr>
        <td class="style17">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Save" 
                Height="29px" Width="49px" />
&nbsp;&nbsp;
            <br />
            <asp:Button ID="Button3" runat="server" Text="Deleted" 
                onclick="Button3_Click" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" Text="Updated" Height="27px" 
                onclick="Button4_Click" />          </td>
        <td colspan="2">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="style17">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
        <td>&nbsp;</td>
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
