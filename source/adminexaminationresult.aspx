<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>UPSC | Admin EXAM RESULT</title>
<script runat="server">
    Dim conn As New Data.SqlClient.SqlConnection
    Dim command As New Data.SqlClient.SqlCommand
    Dim datareader As New Data.SqlClient.SqlDataAdapter
    Dim sql As String
    Dim count As New Integer
    Dim fname As String
    Dim lname As String
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If T1.Text = "" Or T2.Text = "select any one" Or T3.Text = "" Or T4.Text = "" Or T5.Text = "" Or T6.Text = "" Or T7.Text = "" Or T8.Text = "" Or T9.Text = "" Or T10.Text = "" Or T11.Text = "" Then
         MsgBox("Please Fill All Records")
            Exit Sub
        End If
        If IsNumeric(T3.Text) Then
            MsgBox("please fill Fname")
            T3.Text = ""
            Exit Sub
        End If
        If IsNumeric(T6.Text) Then
            MsgBox("please fill Contact")
            T6.Text = ""
            Exit Sub
        End If
        If IsNumeric(T7.Text) Then
            MsgBox("please fill Examination Name")
            T7.Text = ""
            Exit Sub
        End If
        If IsNumeric(T7.Text) Then
            MsgBox("please fill Candinate Name")
            T7.Text = ""
            Exit Sub
        End If
           
        If Not IsNumeric(T10.Text) Then
            MsgBox("please fill Marks")
            T10.Text = ""
            Exit Sub
        End If
        If Not IsNumeric(T11.Text) Then
            MsgBox("please fill Total Marks")
            T11.Text = ""
            Exit Sub
        End If
        
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\civilservices.mdf;Integrated Security=True;User Instance=True")
       
        conn.Open()
        command = New Data.SqlClient.SqlCommand("select count (*) from post where examname='" & UCase(T2.Text) & "'")
        command.Connection = conn
        count = command.ExecuteScalar
        If (count > 0) Then
            MsgBox("Examination detail already Exist")
            conn.Close()
        Else
            sql = "insert into post values('" & T1.Text & "','" & UCase(T2.Text) & "','" & T3.Text & "')"
            datareader.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
            datareader.InsertCommand.ExecuteScalar()
            MsgBox("Examination  Detail Submitted Sucessfully")
            conn.Close()
   
        End If
                
        
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
       
        
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\civilservices.mdf;Integrated Security=True;User Instance=True")
       
        conn.Open()
        command = New Data.SqlClient.SqlCommand("delete  from post where examname='" & UCase(T2.Text) & "'")
        command.Connection = conn
        command.ExecuteScalar()
        MsgBox("Examination  Detail deleted Sucessfully")
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\civilservices.mdf;Integrated Security=True;User Instance=True")
       
        conn.Open()
        command = New Data.SqlClient.SqlCommand("update  post set postname ='" & T3.Text & "', Cyear='" & T1.Text & "' where examname='" & UCase(T2.Text) & "'")
        command.Connection = conn
        command.ExecuteScalar()
        MsgBox(" Examination  Detail updated successfully")
     
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        T1.Text = Format(Now, "dd/MM/yyyy")
        T1.Enabled = False
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

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\civilservices.mdf;Integrated Security=True;User Instance=True")
       
        conn.Open()
        command = New Data.SqlClient.SqlCommand("select count(*) from post where examname='" & UCase(T2.Text) & "' and postname='" & UCase(T3.Text) & "'")
        command.Connection = conn
        count = command.ExecuteScalar()
        If (count > 0) Then
           
           
            command = New Data.SqlClient.SqlCommand("select  postname  from post where examname='" & UCase(T2.Text) & "'")
            command.Connection = conn
            conn.Close()
        Else

        End If
        MsgBox("Examination detail not successfully")
        conn.Close()
            
    End Sub

    Protected Sub T2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\civilservices.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        command = New Data.SqlClient.SqlCommand("select fullname from appconform where eid='" & T2.Text & "'")
        command.Connection = conn
        T7.Text = command.ExecuteScalar
        command = New Data.SqlClient.SqlCommand("select cno from appconform where eid='" & T2.Text & "'")
        command.Connection = conn
        T4.Text = command.ExecuteScalar
        command = New Data.SqlClient.SqlCommand("select email from appconform where eid='" & T2.Text & "'")
        command.Connection = conn
        T8.Text = command.ExecuteScalar
        command = New Data.SqlClient.SqlCommand("select fname from Table2 where email='" & T8.Text & "'")
        command.Connection = conn
        T3.Text = command.ExecuteScalar
        command = New Data.SqlClient.SqlCommand("select dob from Table2 where email='" & T8.Text & "'")
        command.Connection = conn
        T5.Text = command.ExecuteScalar
        command = New Data.SqlClient.SqlCommand("select post from Table2 where email='" & T8.Text & "'")
        command.Connection = conn
        T9.Text = command.ExecuteScalar
        command = New Data.SqlClient.SqlCommand("select totalmarksws from cuttoffmarks where ename='" & t6.Text & "' and vac='" & T9.Text & "'")
        command.Connection = conn
        T11.Text = command.ExecuteScalar
        conn.Close()
    End Sub

    Protected Sub T1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub T3_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)

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
   
    Protected Sub t6_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
       
    End Sub
</script>
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	width:100%;
	height:691px;
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
}
#apDiv3 {
	position:absolute;
	width:20%;
	height:566px;
	z-index:2;
	left: -2px;
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
	left: 264px;
	top: 153px;
	background-color: #FFFFFF;
}
#apDiv7 {
	position:absolute;
	width:100%;
	height:30px;
	z-index:4;
	left: 0px;
	top: 639px;
}
#apDiv8 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:2;
}
    .style10
    {
        width: 65%;
        font-size: medium;
        height: 26px;
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
	font-weight: bold;
	color: #000000;
    }
.style16 {
	color: #FFFFFF;
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
body,td,th {
	color: #0000FF;
}
.style25 {
	color: #000000;
	font-weight: bold;
}
.style26 {width: 65%; font-size: medium; font-weight: bold; color: #000000; }
.style28 {height: 23px; font-weight: bold; color: #000000; }
.style29 {color: #000000}
    .style32
    {
        height: 26px;
    }
    .style33
    {
        color: #FFFFFF;
    }
.style1 {color: #FFFFFF;
	font-weight: bold;
	font-size: 24px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
#apDiv9 {
	position:absolute;
	width:80%;
	height:115px;
	z-index:5;
	left: 264px;
	top: 37px;
	background-color: #cccccc;
}
.style34 {
	width: 65%;
	font-size: medium;
	height: 26px;
	color: #666666;
	font-weight: bold;
}
.style35 {width: 65%; font-size: medium; font-weight: bold; color: #666666; }
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
        <td colspan="2"><span class="style16">Welcome</span><span class="style16"> Administrator!!!</span></td>
      </tr>
      <tr>
        <td colspan="2" bgcolor="#FFFFFF"><span class="style25">Admin Panel</span></td>
      </tr>
      <tr>
        <td width="15%"><div align="center"><img src="../Images/home.png" alt="" width="25" height="25" /></div></td>
        <td width="85%"><a href="admindashboard.aspx"><span class="style16">Home</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../Images/examination.png" width="25" height="23" /></div></td>
        <td><span class="style16"><a href="adminexamnotice.aspx">Examination Notice</a></span></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../Images/req.png" width="25" height="24" /></div></td>
        <td bordercolor="#0000FF" class="style16">Recuritment Application</td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/logos/a.png" width="25" height="25" /></div></td>
        <td><a href="adminexamcenter.aspx"><span class="style16">Examination Centre</span></a></td>
      </tr>
      <tr>
        <td height="29"><div align="center"><img src="../images/Untitled-1.png" width="25" height="25" /></div></td>
        <td><a href="admincarddetail.aspx"><span class="style16">Grade Card Detail</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../Images/examinationcenter.png" width="25" height="25" /></div></td>
        <td><span class="style16">Examination Result</span></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/cut of marks.png" width="25" height="25" /></div></td>
        <td><a href="admincuttoffmarks.aspx"><span class="style16">Cut Off Marks</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/sllybus.png" width="25" height="25" /></div></td>
        <td><a href="adminexamsyllabus.aspx"><span class="style16">Syllabus</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/pvr.png" width="25" height="25" /></div></td>
        <td><a href="adminprevques.aspx"><span class="style16">Previous Question Paper</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/about us.png" width="25" height="25" /></div></td>
        <td><a href="adminaboutus.aspx"><span class="style16">About Us</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/forms.png" width="25" height="25" /></div></td>
        <td><a href="adminformsupload.aspx"><span class="style16">Forms and Download</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/faqs.png" width="25" height="25" /></div></td>
        <td><a href="FAQDetail.aspx"><span class="style16">FAQ's</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/news.png" width="25" height="25" /></div></td>
        <td><a href="adminnew.aspx"><span class="style16">Current News </span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/RTI.png" width="25" height="25" /></div></td>
        <td><span class="style16"><a href="adminrti.aspx">RTI</a></span></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/logos/efg.png" width="25" height="25" /></div></td>
        <td><a href="adminexamfinal.aspx"><span class="style16">Upcoming Examination</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/ex vghhjujkj.png" width="25" height="25" /></div></td>
        <td><a href="admininterview.aspx"><span class="style16">Written Result</span></a></td>
      </tr>
      <tr>
        <td><div align="center"><img src="../images/intrer.png" width="25" height="25" /></div></td>
        <td><a href="admininterview.aspx"><span class="style16">Interview Result</span></a></td>
      </tr>
    </table>
  </div>
  <div id="apDiv6">
    <table width="100%" border="0">
      <tr>
        <td colspan="2" bgcolor="#000000"> <div align="left" class="style16">
          <div align="center" style="width: 80px">
              <asp:Label ID="Label1" runat="server" ForeColor="Blue" Text="Label"></asp:Label>
              <asp:Label ID="Label2" runat="server" BackColor="White" ForeColor="Blue" 
                  Text="Label"></asp:Label>
            </div>
        </div></td>
        <td colspan="2" bgcolor="#000000"> 
          <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Black" 
                onclick="LinkButton1_Click">Logout</asp:LinkButton>          </td>
      </tr>
      
      <tr>
        <td colspan="4" bgcolor="#2A3F54" class="style33"> <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Examination 
            Written Result</strong></td>
      </tr>
      
      <tr>
        <td colspan="4"><hr /></td>
      </tr>
      <tr>
        <td colspan="4">&nbsp;</td>
      </tr>
      <tr>
        <td class="style11">Current Year</td>
        <td width="29%" class="style12" colspan="2">          <span class="style25">
            <asp:TextBox ID="T1" runat="server" Height="22px" 
                ValidationGroup="current date" ontextchanged="T1_TextChanged"></asp:TextBox>
           </span></td>
        <td width="4%" class="style12"></td>
      </tr>
      
      <tr>
        <td class="style34">Examination Name<td class="style32" colspan="2">
          <asp:DropDownList ID="t6" runat="server" DataSourceID="SqlDataSource1" 
              DataTextField="examname" DataValueField="examname" 
              onselectedindexchanged="t6_SelectedIndexChanged">          </asp:DropDownList>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
              SelectCommand="SELECT [examname] FROM [examnotice]"></asp:SqlDataSource>
          </td>
        <td class="style32">&nbsp;</td>
      </tr>
      
      <tr>
        <td class="style10"><span class="style13">Enrollement Id</span>      
        <td class="style32" colspan="2"><span class="style14">
          <asp:DropDownList ID="T2" runat="server" 
                onselectedindexchanged="T2_SelectedIndexChanged" AutoPostBack="True" 
                DataSourceID="SqlDataSource2" DataTextField="eid" DataValueField="eid">
            <asp:ListItem>Select Any One</asp:ListItem>
              <asp:ListItem></asp:ListItem>
          </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [eid] FROM [appconform] WHERE ([reapp] = @reapp)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="t6" Name="reapp" PropertyName="SelectedValue" 
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </span></td>
        <td class="style32"></td>
      </tr>
      <tr>
        <td class="style35">Father Name
        <td colspan="2"><span class="style28">
          <asp:TextBox ID="T3" runat="server" Height="22px" 
                ValidationGroup="current date" ontextchanged="T3_TextChanged"></asp:TextBox>
        </span></td>
        <td>&nbsp;</td>
      </tr>
      
      
      <tr>
        <td class="style35">Contact No</td>
        <td colspan="2"><span class="style28">
          <asp:TextBox ID="T4" runat="server" Height="22px" 
                ValidationGroup="current date"></asp:TextBox>
        </span></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="style35">Date of Birth</td>
        <td colspan="2"><span class="style28">
          <asp:TextBox ID="T5" runat="server" Height="22px" 
                ValidationGroup="current date"></asp:TextBox>
        </span></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="style35">Candinate Name</td>
        <td colspan="2"><span class="style28">
          <asp:TextBox ID="T7" runat="server" Height="22px" 
                ValidationGroup="current date"></asp:TextBox>
        </span></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="style35">Email</td>
        <td colspan="2"><span class="style28">
          <asp:TextBox ID="T8" runat="server" Height="22px" 
                ValidationGroup="current date"></asp:TextBox>
        </span></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="style35">Post Name</td>
        <td colspan="2"><span class="style28">
          <asp:TextBox ID="T9" runat="server" Height="22px" 
                ValidationGroup="current date"></asp:TextBox>
        </span></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="4" bgcolor="#2A3F54" class="style26"> Stage 1</td>
        </tr>
      <tr>
        <td class="style26">Marks Obtain</td>
        <td colspan="2"><span class="style28">
          <asp:TextBox ID="T10" runat="server" Height="22px" 
                ValidationGroup="current date"></asp:TextBox>
        </span></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="style26">Total Marks at Written Exam</td>
        <td colspan="2"><span class="style28">
          <asp:TextBox ID="T11" runat="server" Height="22px" 
                ValidationGroup="current date"></asp:TextBox>
        </span></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="style26"><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" 
                Height="29px" Width="49px" />                  &nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" Text="Search" onclick="Button5_Click" />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Deleted" 
                onclick="Button3_Click" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" Text="Updated" Height="27px" 
                onclick="Button4_Click" />          </td>
        <td colspan="2"><span class="style29"></span></td>
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
