<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>UPSC | Admin Registration</title>
<script runat="server">
    Dim conn As New Data.SqlClient.SqlConnection
    Dim command As New Data.SqlClient.SqlCommand
    Dim datareader As New Data.SqlClient.SqlDataAdapter
    Dim sql As String
    Dim count As New Integer
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If T8.Text <> "Civil852" Then
            MsgBox("Admin Code Not Match")
            T8.Text = ""
            Exit Sub
        End If
        If T4.Text <> T5.Text Then
            MsgBox("Password & Reenter Password Not Match")
            T4.Text = ""
            T5.Text = ""
            Exit Sub
        End If
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\civilservices.mdf;Integrated Security=True;User Instance=True")
       
        conn.Open()
        command = New Data.SqlClient.SqlCommand("select count (*) from admin where email='" & T3.Text & "'")
        command.Connection = conn
        count = command.ExecuteScalar
        If (count > 0) Then
            MsgBox("This admin reg detail already Exist")
            T3.Text = ""
            conn.Close()
        Else
            sql = "insert into admin values('" & T1.Text & "','" & T2.Text & "','" & T3.Text & "','" & T4.Text & "','" & T5.Text & "', '" & D1.Text & "','" & T6.Text & "', '" & D2.Text & "', '" & T7.Text & "')"
            datareader.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
            datareader.InsertCommand.ExecuteScalar()
            MsgBox("admin reg  Detail Submitted Sucessfully")
            conn.Close()
            T1.Text = ""
            T2.Text = ""
            T3.Text = ""
            T4.Text = ""
            T5.Text = ""
            T6.Text = ""
            T7.Text = ""
         
        End If
                
        
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
       
        
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    
            
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs)
       
        
        
        
         
        
        
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
      
    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs)
      
            
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
	height:35px;
	z-index:1;
	background-color: #2A3F54;
}
#apDiv3 {
	position:absolute;
	width:20%;
	height:566px;
	z-index:2;
	left: -8px;
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
	width:1069px;
	height:459px;
	z-index:3;
	left: 257px;
	top: 147px;
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
	width: 37%;
	height: 23px;
	font-weight: bold;
	color: #666666;
    }
    .style12
    {
        height: 23px;
    }
    .style24 {
	color: #000000;
	font-weight: bold;
}
.style25 {width: 65%; font-size: medium; font-weight: bold; color: #000000; }
.style27 {height: 23px; font-weight: bold; color: #000000; }
.style28 {color: #000000}
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
    .style42
    {
        height: 23px;
        width: 127px;
    }
    .style44
    {
        width: 127px;
    }
    .style45
    {
	width: 37%;
	font-size: medium;
	font-weight: bold;
	color: #666666;
	height: 26px;
    }
    .style46
    {
        width: 127px;
        height: 26px;
    }
    .style47
    {
        height: 26px;
    }
.style1 {color: #FFFFFF;
	font-weight: bold;
	font-size: 24px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style43 {color: #FFFFFF; font-weight: bold; }
.style48 {
	font-size: 18px;
	font-weight: bold;
}
.style49 {width: 37%; font-size: medium; font-weight: bold; color: #666666; }
#apDiv9 {	position:absolute;
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
        <td colspan="2" bgcolor="#FFFFFF"><span class="style24">Admin Panel</span></td>
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
    <table width="98%" border="0">
      <tr>
        <td colspan="4"> <div align="center" class="style48">Admin Registration</div></td>
      </tr>
      
      <tr>
        <td colspan="4"><hr /></td>
      </tr>
      <tr>
        <td colspan="4">&nbsp;</td>
      </tr>
      <tr>
        <td class="style11">First Name</td>
        <td class="style42">          <span class="style24">
            <asp:TextBox ID="T1" runat="server" Height="22px" 
                ValidationGroup="current date"></asp:TextBox>
          </span></td>
        <td width="19%" class="style12">Last Name</td>
        <td width="19%" class="style12">
            <asp:TextBox ID="T2" runat="server"></asp:TextBox>          </td>
      </tr>
      <tr>
        <td class="style49">Email<td class="style44">
            <asp:TextBox ID="T3" runat="server"></asp:TextBox>
          </td>
        <td colspan="2">&nbsp;</td>
      </tr>
      
      
      <tr>
        <td class="style49">Admin Code<td class="style44"><span class="style27">
          <asp:TextBox ID="T8" runat="server" Height="22px" 
                ValidationGroup="current date" TextMode="Password"></asp:TextBox>
        </span></td>
        <td colspan="2">&nbsp;</td>
      </tr>
      
      
      <tr>
        <td class="style49">Password
        <td class="style44"><span class="style27">
          <asp:TextBox ID="T4" runat="server" Height="22px" 
                ValidationGroup="current date" TextMode="Password"></asp:TextBox>
        </span></td>
        <td colspan="2">&nbsp;</td>
      </tr>
      
      
      <tr>
        <td class="style49">Reenter Password</td>
        <td class="style44"><span class="style27">
          <asp:TextBox ID="T5" runat="server" Height="22px" 
                ValidationGroup="current date" TextMode="Password"></asp:TextBox>
        </span></td>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td class="style49">Gender</td>
        <td class="style44">
            <asp:DropDownList ID="D1" runat="server">
                <asp:ListItem Value="Select Any One"></asp:ListItem>
                <asp:ListItem Value="Male"></asp:ListItem>
                <asp:ListItem Value="Female"></asp:ListItem>
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>          </td>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td class="style49">Mobile NO</td>
        <td class="style44">
            <asp:TextBox ID="T6" runat="server"></asp:TextBox>          </td>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td class="style49">Security Ques</td>
        <td class="style44">
            <asp:DropDownList ID="D2" runat="server">
                <asp:ListItem Value="Select Any One"></asp:ListItem>
                <asp:ListItem Value="Your Best Friend Name"></asp:ListItem>
                <asp:ListItem Value="Your Favourite Food"></asp:ListItem>
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>          </td>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td class="style45">Answer</td>
        <td class="style46"><span class="style27">
          <asp:TextBox ID="T7" runat="server" Height="22px" 
                ValidationGroup="current date"></asp:TextBox>
        </span></td>
        <td colspan="2" class="style47"></td>
      </tr>
      <tr>
        <td colspan="4" class="style25"><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" 
                Height="29px" Width="49px" />        &nbsp;&nbsp;<br />
          &nbsp;&nbsp;&nbsp;<span class="style28"></span></td>
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
                              <p><span class="style5"> This Website Designed &amp; Developed By Shaheen bano</p>
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
