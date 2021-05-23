<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome to UPSC</title>
<script runat="server">
    Dim conn As New Data.SqlClient.SqlConnection
    Dim command As New Data.SqlClient.SqlCommand
    Dim datareader As New Data.SqlClient.SqlDataAdapter
    Dim sql As String
    Dim count As New Integer
    Dim pdfname As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        conn = New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\civilservices.mdf;Integrated Security=True;User Instance=True")
        conn.Open()
        command = New Data.SqlClient.SqlCommand("select eid from eidtemp")
        command.Connection = conn
        l1.Text = command.ExecuteScalar
        command = New Data.SqlClient.SqlCommand("select fullname from appconform where eid='" & l1.Text & "'")
        command.Connection = conn
        l2.Text = command.ExecuteScalar
        command = New Data.SqlClient.SqlCommand("select gender from appconform where eid='" & l1.Text & "'")
        command.Connection = conn
        l4.Text = command.ExecuteScalar
        command = New Data.SqlClient.SqlCommand("select mno from appconform where eid='" & l1.Text & "'")
        command.Connection = conn
        l6.Text = command.ExecuteScalar
        command = New Data.SqlClient.SqlCommand("select email from appconform where eid='" & l1.Text & "'")
        command.Connection = conn
        l5.Text = command.ExecuteScalar
        command = New Data.SqlClient.SqlCommand("select reapp from appconform where eid='" & l1.Text & "'")
        command.Connection = conn
        l7.Text = command.ExecuteScalar
        command = New Data.SqlClient.SqlCommand("select fname from Table2 where email='" & l5.Text & "'")
        command.Connection = conn
        l3.Text = command.ExecuteScalar
        command = New Data.SqlClient.SqlCommand("select examcode from gradecard where encid='" & l1.Text & "'")
        command.Connection = conn
        l10.Text = command.ExecuteScalar
        
        
        conn.Close()
        
    End Sub
</script>
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	width:100%;
	height:491px;
	z-index:1;
	left: 0;
	top: 0;
}
#apDiv2 {
	position:absolute;
	width:100%;
	height:101px;
	z-index:1;
	left: 0px;
}
.style1 {	font-size: 30px;
	font-weight: bold;
	color: #154979;
}
.style2 {	font-size: 24px;
	font-weight: bold;
}
#apDiv3 {
	position:absolute;
	width:80%;
	height:368px;
	z-index:2;
	left: 117px;
	top: 103px;
}
.style3 {
	color: #FF0000;
	font-weight: bold;
	font-size: 18px;
}
.style4 {
	color: #FFFFFF;
	font-weight: bold;
}
    .style5
    {
        height: 24px;
    }
    .style6
    {
        height: 25px;
    }
    .style7
    {
        height: 23px;
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
    <table width="100%" border="0">
      <tr>
        <td colspan="4"><span class="style3">Admit Card</span></td>
      </tr>
      <tr>
        <td colspan="4"><hr /></td>
      </tr>
      <tr>
        <td colspan="4" bgcolor="#2A3F54"><span class="style4">Candidate Detail</span></td>
      </tr>
      <tr>
        <td width="21%" bgcolor="#CCCCCC" class="style5"><strong>Enrollment ID</strong></td>
        <td width="34%" class="style5">
            <asp:Label ID="l1" runat="server" Text="Label"></asp:Label>
          </td>
        <td width="16%" bgcolor="#CCCCCC" class="style5"><strong>Photo</strong></td>
        <td width="29%" class="style5"></td>
      </tr>
      <tr>
        <td bgcolor="#CCCCCC"><strong>Candidate Name</strong></td>
        <td>
            <asp:Label ID="l2" runat="server" Text="Label"></asp:Label>
          </td>
        <td rowspan="5">
            <asp:Image ID="Image1" runat="server" />
          </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td bgcolor="#CCCCCC" class="style7"><strong>Father Name</strong></td>
        <td class="style7">
            <asp:Label ID="l3" runat="server" Text="Label"></asp:Label>
          </td>
        <td class="style7"></td>
      </tr>
      <tr>
        <td height="28" bgcolor="#CCCCCC"><strong>Gender</strong></td>
        <td>
            <asp:Label ID="l4" runat="server" Text="Label"></asp:Label>
          </td>
        <td bgcolor="#CCCCCC"><strong>Signature</strong></td>
      </tr>
      <tr>
        <td bgcolor="#CCCCCC" class="style6"><strong>Email</strong></td>
        <td class="style6">
            <asp:Label ID="l5" runat="server" Text="Label"></asp:Label>
          </td>
        <td rowspan="2">
            <asp:Image ID="Image2" runat="server" />
          </td>
      </tr>
      <tr>
        <td bgcolor="#CCCCCC"><strong>Contact No</strong></td>
        <td>
            <asp:Label ID="l6" runat="server" Text="Label"></asp:Label>
          </td>
      </tr>
      <tr>
        <td colspan="4"><hr /></td>
      </tr>
      <tr>
        <td colspan="4" bgcolor="#2A3F54"><span class="style4">Examination Application Detail</span></td>
      </tr>
      <tr>
        <td bgcolor="#CCCCCC"><strong>Examination Name</strong></td>
        <td>
            <asp:Label ID="l7" runat="server" Text="Label"></asp:Label>
          </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td bgcolor="#CCCCCC"><strong>Post</strong></td>
        <td>
            <asp:Label ID="l8" runat="server" Text="Label"></asp:Label>
          </td>
        <td bgcolor="#CCCCCC"><strong>Exam Date</strong></td>
        <td>
            <asp:Label ID="l12" runat="server" Text="Label"></asp:Label>
          </td>
      </tr>
      <tr>
        <td bgcolor="#CCCCCC"><strong>City</strong></td>
        <td>
            <asp:Label ID="l9" runat="server" Text="Label"></asp:Label>
          </td>
        <td bgcolor="#CCCCCC"><strong>Exam Time</strong></td>
        <td>
            <asp:Label ID="l13" runat="server" Text="Label"></asp:Label>
          </td>
      </tr>
      <tr>
        <td bgcolor="#CCCCCC"><strong>Center Code</strong></td>
        <td>
            <asp:Label ID="l10" runat="server" Text="Label"></asp:Label>
          </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td bgcolor="#CCCCCC"><strong>Center Address</strong></td>
        <td>
            <asp:Label ID="l11" runat="server" Text="Label"></asp:Label>
          </td>
        <td>&nbsp;</td>
        <td>
            <asp:Button ID="Button1" runat="server" BackColor="#154979" Font-Bold="True" 
                ForeColor="White" Text="Print" />
          </td>
      </tr>
    </table>
  </div>
</div>
    </form>
</body>
</html>
