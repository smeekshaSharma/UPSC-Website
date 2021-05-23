<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>UPSC | Admin Cut Off Marks</title>
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
        If T1.Text = "" Or t2.Text = "select any one" Or d1.Text = "select any one" Or d2.Text = "select any one" Or T3.Text = "select any one" Or T4.Text = "" Or T5.Text = "" Or T6.Text = "" Or T7.Text = "" Or T8.Text = "" Or t9.FileName = "" Then
            MsgBox("Please Fill All Records")
            Exit Sub
        End If
        If IsNumeric(T4.Text) Then
            MsgBox("please fill Vacancy")
            T4.Text = ""
            Exit Sub
        End If
        pdf = "~/pdf/" & t9.FileName
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\civilservices.mdf;Integrated Security=True;User Instance=True")
       
        conn.Open()
        command = New Data.SqlClient.SqlCommand("select count (*) from cuttoffmarks where ename='" & UCase(t2.Text) & "'")
        command.Connection = conn
        command.ExecuteScalar()
        If (count > 0) Then
            MsgBox("Cutoff Marks already Exist")
          
            conn.Close()
        Else
            sql = "insert into cuttoffmarks values('" & T1.Text & "','" & UCase(t2.Text) & "','" & (T3.Text) & "','" & T4.Text & "','" & T5.Text & "','" & T6.Text & "','" & T7.Text & "','" & T8.Text & "','" & pdf & "','" & d1.Text & "','" & d2.Text & "')"
            datareader.InsertCommand = New Data.SqlClient.SqlCommand(sql, conn)
            datareader.InsertCommand.ExecuteScalar()
            MsgBox("Marks Detail Submitted Sucessfully")
            conn.Close()
            
        End If
                
        
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\civilservices.mdf;Integrated Security=True;User Instance=True")
       
        conn.Open()
        command = New Data.SqlClient.SqlCommand("delete  from cuttoffmarks where ename='" & UCase(T2.Text) & "'")
        command.Connection = conn
        command.ExecuteScalar()
        MsgBox("Marks Detail deleted Sucessfully")
    
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        pdf = "~/pdf/" & t9.FileName
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\civilservices.mdf;Integrated Security=True;User Instance=True")
       
        conn.Open()
        command = New Data.SqlClient.SqlCommand("update cuttoffmarks set cate ='" & T3.Text & "',vac='" & t4.Text & "',minqualsws ='" & T5.Text & "',totalmarksws='" & T6.Text & "',cutoffmarksfs='" & T7.Text & "',totalmarksfs='" & T8.Text & "',pdfdocument='" & pdf & "',state='" & d1.Text & "',city='" & d2.Text & "'where ename='" & UCase(t2.Text) & "'")
        command.Connection = conn
        command.ExecuteScalar()
        MsgBox("  Marks Detail updated successfully")
     
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
        command = New Data.SqlClient.SqlCommand("select count(*) from cuttoffmarks where ename ='" & UCase(t2.Text) & "'")
        command.Connection = conn
        count = command.ExecuteScalar
        If (count > 0) Then
                       
            command = New Data.SqlClient.SqlCommand("select  cate from cuttoffmarks where ename ='" & UCase(t2.Text) & "'")
            command.Connection = conn
            T3.Text = command.ExecuteScalar("select  cate from cuttoffmarks where ename ='" & UCase(t2.Text) & "'")
            command.Connection = conn
            t4.Text = command.ExecuteScalar("select  vac from cuttoffmarks where ename ='" & UCase(t2.Text) & "'")
            command.Connection = conn
            T5.Text = command.ExecuteScalar("select  minqualsws from cuttoffmarks where ename ='" & UCase(t2.Text) & "'")
            command.Connection = conn
            T6.Text = command.ExecuteScalar("select totalmarksfs from cuttoffmarks where ename ='" & UCase(t2.Text) & "'")
            command.Connection = conn
            T7.Text = command.ExecuteScalar("select curoffmarksfs from cuttoffmarks where ename ='" & UCase(t2.Text) & "'")
            command.Connection = conn
            T8.Text = command.ExecuteScalar("select  marksfs from cuttoffmarks where ename ='" & UCase(t2.Text) & "'")
            command.Connection = conn
            conn.Close()
        Else
            MsgBox("Aboutus detail not successfully")
            
            conn.Close()
        End If
    End Sub

    Protected Sub d1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        d2.Items.Clear()
        If d1.Text = "Andhra Pradesh" Then
            d2.Items.Add("Dadam")
            d2.Items.Add("Thinsa")
            d2.Items.Add("sola")
            d2.Items.Add("khela")
            d2.Items.Add("ranglum")
        ElseIf d1.Text = "Arunacha Pradesh" Then
            d2.Items.Add("Hawai")
            d2.Items.Add("Jairampur")
            d2.Items.Add("tawang")
            d2.Items.Add("Changlang")
            d2.Items.Add("Pasighat")
        ElseIf d1.Text = "Assam" Then
            d2.Items.Add("Patna")
            d2.Items.Add("Gaya")
            d2.Items.Add("Haflong")
            d2.Items.Add("Dergaon")
            d2.Items.Add("lakhipur")
        ElseIf d1.Text = "Bihar" Then
            d2.Items.Add("Patna")
            d2.Items.Add("gaya")
            d2.Items.Add("Ara")
            d2.Items.Add("Chapra")
            d2.Items.Add("Hajipur")
        ElseIf d1.Text = "Chattisgarh" Then
            d2.Items.Add("Jashpur")
            d2.Items.Add("Durg")
            d2.Items.Add("Koriya")
            d2.Items.Add("Raysis")
            d2.Items.Add("Bilaspur")
        ElseIf d1.Text = "Goa" Then
            d2.Items.Add("Gama")
            d2.Items.Add("Curchorem")
            d2.Items.Add("Ponda")
            d2.Items.Add("Mormugao,")
            d2.Items.Add("Valpoi")
        ElseIf d1.Text = "Gujrat" Then
            d2.Items.Add("Morvi")
            d2.Items.Add("Anand")
            d2.Items.Add("Surat")
            d2.Items.Add("Jamnanagar")
            d2.Items.Add("Rajkot")
        ElseIf d1.Text = "Harayana" Then
            d2.Items.Add("Hisar")
            d2.Items.Add("Rohtak")
            d2.Items.Add("Ambala")
            d2.Items.Add("Jind")
            d2.Items.Add("Kosli")
            
        ElseIf d1.Text = "HP" Then
            d2.Items.Add("badsar")
            d2.Items.Add("Una")
            d2.Items.Add("Kullu Manali")
            d2.Items.Add("Rohtang Pass")
            d2.Items.Add("Kufri")
        ElseIf d1.Text = "Jarkhand" Then
            d2.Items.Add("Ranchi")
            d2.Items.Add("Deoghar")
            d2.Items.Add("Phusro")
            d2.Items.Add("Palamu")
            d2.Items.Add("Dhanbad")
        ElseIf d1.Text = "karnatka" Then
            d2.Items.Add("Bidar")
            d2.Items.Add("Hassan")
            d2.Items.Add("Mandya")
            d2.Items.Add("Kolara")
            d2.Items.Add("Haveri")
        ElseIf d1.Text = "kerala" Then
            d2.Items.Add("Kochi")
            d2.Items.Add("Alleppey")
            d2.Items.Add("Munnar")
            d2.Items.Add("Kovalam")
            d2.Items.Add("ldukki")
        ElseIf d1.Text = "Madhya Pradesh" Then
            d2.Items.Add("Bhopal")
            d2.Items.Add("Kanha")
            d2.Items.Add("Baihar")
            d2.Items.Add("Gwaliaor")
            d2.Items.Add("Ujjain")
        ElseIf d1.Text = "Maharashtra" Then
            d2.Items.Add("Pune")
            d2.Items.Add("Shirdi")
            d2.Items.Add("Mumabi")
            d2.Items.Add("Nagpur")
            d2.Items.Add("Aurangabad")
        ElseIf d1.Text = "Manipur" Then
            d2.Items.Add("Senapati")
            d2.Items.Add("Kumbi")
            d2.Items.Add("Lamlai")
            d2.Items.Add("Lilong")
            d2.Items.Add("Chandel")
        ElseIf d1.Text = "Meghalaya" Then
            d2.Items.Add("Shilong")
            d2.Items.Add("Jowai")
            d2.Items.Add("Dawki")
            d2.Items.Add("Jorabat")
            d2.Items.Add("Baghmara")
        ElseIf d1.Text = "Nagaland" Then
            d2.Items.Add("Dimapur")
            d2.Items.Add("Kohima")
            d2.Items.Add("Mon")
            d2.Items.Add("Peren")
            d2.Items.Add("Phek")
            
        ElseIf d1.Text = "Odhisha" Then
            d2.Items.Add("Bisahupur")
            d2.Items.Add("Chandel")
            d2.Items.Add("Lilong")
            d2.Items.Add("Lamlai")
            d2.Items.Add("Senapati")
        ElseIf d1.Text = "Punjab" Then
            d2.Items.Add("Amritsar")
            d2.Items.Add("Ludhiana")
            d2.Items.Add("Patiala")
            d2.Items.Add("Jlandhar")
            d2.Items.Add("Batala")
        ElseIf d1.Text = "Rajasthan" Then
            d2.Items.Add("Jaipur")
            d2.Items.Add("Jodpur")
            d2.Items.Add("Vadipur")
            d2.Items.Add("Bharatpur")
            d2.Items.Add("Ajmer")
             

        ElseIf d1.Text = "Sikkim" Then
            d2.Items.Add("Gangtok")
            d2.Items.Add("Pelling")
            d2.Items.Add("Lachess")
            d2.Items.Add("Ravanger")
            d2.Items.Add("Lachisng")
            



        ElseIf d1.Text = "Tamil Nadu" Then
            d2.Items.Add("Chennai")
            d2.Items.Add("Vellore")
            d2.Items.Add("Salem")
            d2.Items.Add("Madurai")
            d2.Items.Add("Tirupper")
            
        ElseIf d1.Text = "Uttarakhand" Then
            d2.Items.Add("Dehradun")
            d2.Items.Add("Haridwar")
            d2.Items.Add("Alorme")
            d2.Items.Add("Srinagar")
            d2.Items.Add("Mussori")
        ElseIf d1.Text = "Uttar Pradesh" Then
            d2.Items.Add("Lucknow")
            d2.Items.Add("Kanpur")
            d2.Items.Add("Meerut")
            d2.Items.Add("Varanasi")
            d2.Items.Add("Noida")
            
        ElseIf d1.Text = "West Bengal" Then
            d2.Items.Add("Kolkata")
            d2.Items.Add("Asansad")
            d2.Items.Add("Durgapur")
            d2.Items.Add("Hakra")
            d2.Items.Add("Shantipur")
            
            
            
            
                         
            
            
            
            
            
        End If
    End Sub

    Protected Sub t2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
       
        
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
	height:704px;
	z-index:1;
	left: 0px;
	top: 0px;
}
#apDiv2 {
	position:absolute;
	width:100%;
	height:37px;
	z-index:1;
	background-color: #2A3F54;
}
#apDiv3 {
	position:absolute;
	width:20%;
	height:566px;
	z-index:2;
	left: -3px;
	top: 40px;
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
	width:1041px;
	height:510px;
	z-index:3;
	left: 262px;
	top: 148px;
	background-color: #FFFFFF;
}
#apDiv7 {
	position:absolute;
	width:100%;
	height:30px;
	z-index:4;
	left: 0px;
	top: 663px;
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
    .style16
    {
        height: 26px;
    }
    .style17
    {
	width: 65%;
	font-size: medium;
	height: 68px;
	font-weight: bold;
	color: #000000;
    }
    .style18
    {
        height: 68px;
    }
.style21 {
	color: #000000;
	font-weight: bold;
        width: 79px;
    }
.style22 {
	height: 23px;
	font-weight: bold;
	color: #000000;
}
.style25 {
	height: 68px;
	font-weight: bold;
	color: #000000;
}
.style27 {color: #000000}
.style44 {	color: #000000;
	font-weight: bold;
}
.style43 {color: #FFFFFF; font-weight: bold; }
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
.style1 {color: #FFFFFF;
	font-weight: bold;
	font-size: 24px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
#apDiv9 {
	position:absolute;
	width:80%;
	height:108px;
	z-index:5;
	left: 263px;
	top: 39px;
	background-color: #cccccc;
}
.style45 {font-size: 24px}
.style46 {width: 65%; font-size: medium; font-weight: bold; color: #666666; }
.style47 {width: 65%; font-size: medium; height: 26px; font-weight: bold; color: #666666; }
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
    <table width="100%" border="0" style="margin-left: 0px">
      <tr>
        <td colspan="2"><div align="center" class="style21">
            <asp:Label ID="Label1" runat="server" ForeColor="Blue" Text="Label"></asp:Label>
            <asp:Label ID="Label2" runat="server" ForeColor="Blue" Text="Label"></asp:Label>
            </div></td>
        <td colspan="2" bgcolor="#000000">
          <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Black" 
                onclick="LinkButton1_Click" style="font-weight: 700">Logout</asp:LinkButton>          </td>
      </tr>
      
      <tr>
        <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="style45">Cut-off Marks</span></strong></td>
      </tr>
      
      <tr>
        <td colspan="4"><hr /></td>
      </tr>
      <tr>
        <td colspan="4">&nbsp;</td>
      </tr>
      <tr>
        <td class="style11">Current Date</td>
        <td width="29%" class="style22" colspan="2">
            <p>
              <asp:TextBox ID="T1" runat="server" Height="22px" 
                validationgroup="current date"></asp:TextBox>
            </p>          </td>
        <td width="4%" class="style12"></td>
      </tr>
      <tr>
        <td class="style13">Examination Name</td>
        <td class="style14" colspan="2">
            <asp:DropDownList ID="t2" runat="server" DataSourceID="SqlDataSource1" 
                DataTextField="examname" DataValueField="examname" 
                onselectedindexchanged="t2_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [examname] FROM [examnotice]"></asp:SqlDataSource>          </td>
        <td class="style14">&nbsp;</td>
      </tr>
      <tr>
        <td class="style46">State
        <td colspan="2">
            <asp:DropDownList ID="d1" runat="server" AutoPostBack="True" 
                onselectedindexchanged="d1_SelectedIndexChanged">
                <asp:ListItem>Select Any One</asp:ListItem>
                <asp:ListItem>Andhra Pradesh</asp:ListItem>
                <asp:ListItem Value="HP">Arunachal Pradesh</asp:ListItem>
                <asp:ListItem>Assam</asp:ListItem>
                <asp:ListItem>Bihar</asp:ListItem>
                <asp:ListItem>Chhatisgarh</asp:ListItem>
                <asp:ListItem>Goa</asp:ListItem>
                <asp:ListItem>Gujrat</asp:ListItem>
                <asp:ListItem Value="Haryana"></asp:ListItem>
                <asp:ListItem Value="HP"></asp:ListItem>
                <asp:ListItem Value="Jharkhand"></asp:ListItem>
                <asp:ListItem Value="Kerala"></asp:ListItem>
                <asp:ListItem>Madhya Pradesh</asp:ListItem>
                <asp:ListItem>Maharashtra</asp:ListItem>
                <asp:ListItem>Manipur</asp:ListItem>
                <asp:ListItem>Meghalaya</asp:ListItem>
                <asp:ListItem>Ngaland</asp:ListItem>
                <asp:ListItem>Odisha</asp:ListItem>
                <asp:ListItem>Punjab</asp:ListItem>
                <asp:ListItem>Rajasthan</asp:ListItem>
                <asp:ListItem>Sikkim</asp:ListItem>
                <asp:ListItem Value="Tamil Nadu"></asp:ListItem>
                <asp:ListItem>Uttarakhand</asp:ListItem>
                <asp:ListItem>Uttar Pradesh</asp:ListItem>
                <asp:ListItem>West Bengal</asp:ListItem>
                <asp:ListItem>Karnataka</asp:ListItem>
            </asp:DropDownList>          </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="style46">City
        <td colspan="2">
            <asp:DropDownList ID="d2" runat="server">
                <asp:ListItem>Select Any One</asp:ListItem>
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>          </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="style46">Category
        <td colspan="2">
            <asp:DropDownList ID="T3" runat="server">
                <asp:ListItem>Select Any One</asp:ListItem>
                <asp:ListItem>Gen</asp:ListItem>
                <asp:ListItem>SCEWS</asp:ListItem>
                <asp:ListItem>OBC</asp:ListItem>
                <asp:ListItem>ST</asp:ListItem>
            </asp:DropDownList>          </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="style47">Vacancy</td>
        <td class="style16" colspan="2">          
            <asp:DropDownList ID="t4" runat="server" DataSourceID="SqlDataSource2" 
                DataTextField="postname" DataValueField="postname">            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [postname] FROM [post] WHERE ([examname] = @examname)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="t2" Name="examname" 
                        PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>          </td>
        <td class="style16"></td>
      </tr>
      <tr>
        <td class="style46">Minimum Qualifying Standards at Written Stages </td>
        <td colspan="2"><span class="style27"><strong>
          <asp:TextBox ID="T5" runat="server" Height="22px" 
                validationgroup="current date"></asp:TextBox>
        </strong></span></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="style46">Total Marks at Written Stage</td>
        <td colspan="2"><span class="style27"><strong>
          <asp:TextBox ID="T6" runat="server" Height="22px" 
                validationgroup="current date"></asp:TextBox>
        </strong></span></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="style46">Cutt off Marks at Final Stage</td>
        <td colspan="2"><span class="style27"><strong>
          <asp:TextBox ID="T7" runat="server" Height="22px" 
                validationgroup="current date"></asp:TextBox>
        </strong></span></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="style46">Total Marks at Final Stage</td>
        <td colspan="2"><span class="style27"><strong>
          <asp:TextBox ID="T8" runat="server" Height="22px" 
                validationgroup="current date"></asp:TextBox>
        </strong></span></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="style47">PDF\Document</td>
        <td class="style16" colspan="2">
            <asp:FileUpload ID="t9" runat="server" />          </td>
        <td class="style16"></td>
      </tr>
      
      <tr>
        <td class="style17">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Save" 
                Height="29px" Width="49px" />
&nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" Text="Search" onclick="Button5_Click" 
                style="width: 61px" />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Deleted" 
                onclick="Button3_Click" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" Text="Updated" Height="27px" 
                onclick="Button4_Click" />          </td>
        <td class="style25" colspan="2"></td>
        <td class="style18"></td>
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
                              <p><span class="style5"> This Website Designed &amp; Developed By Shaheen Bano
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
