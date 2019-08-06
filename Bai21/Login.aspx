<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Bai21.Login" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/style.css" rel="stylesheet" />
    <script type="text/javascript">


        function Insert() {            
            alert('insert  ');
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    alert('200');
                    alert("Url" + this.responseURL);
                    alert("Response" + xhttp.responseText);
                    var json = JSON.parse(this.responseText);
                    alert(json.d);
                    if (json.d == true) {
                        alert('Thêm thành công');
                    }
                    else {
                        alert('Thất bại');
                    }

                }
            };
            xhttp.open("POST", "Login.aspx/Insert", true);
            xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
            // xhttp.send('{LaixeID: "' + LaixeID + '", SoSao: "' + soSao + '", Ngay:"' + time + '"}');
             xhttp.send();
            
        }
    </script>
</head>
<body>
    <button onclick="Insert()">BTN</button>
    <form id="form1" runat="server">
        <div class="container login-container">
            <div class="row justify-content-center">
                <div class="col-lg-6 center">
                <h3>Login for Form</h3>
                    <div class="form-group">
                        <h4><asp:Label ID="lbloi" runat="server"></asp:Label></h4>
                    </div>
                <div class="form-group">
                    <b><asp:Label Text="User name" ID="lblUsername" runat="server" /></b>
                    <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder="Your User name *"></asp:TextBox>
                </div>
                <div class="form-group">
                    <b><asp:Label Text="User name" ID="Label1" runat="server" /></b>
                    <asp:TextBox ID="txtPass" type="password" runat="server" class="form-control" placeholder="Your Password *"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button runat="server" CssClass="btn btn-info btn-rounded btn-block center" ID="btnLogin" Text="Login" OnClick="btnLogin_Click" />
                </div>
            </div>
            </div>
        </div>
    </form>
</body>
</html>
