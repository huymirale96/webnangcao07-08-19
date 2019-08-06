<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebForm1.aspx.cs" Inherits="Bai21.WebForm1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Web test</title>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script type="text/javascript">
      function Insert() {            
            
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
            xhttp.open("POST", "WebForm1.aspx/Insert", true);
            xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
            // xhttp.send('{LaixeID: "' + LaixeID + '", SoSao: "' + soSao + '", Ngay:"' + time + '"}');
             xhttp.send();
            
        }
       


    </script>
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager runat="server" ID="sm" EnablePartialRendering="true" EnablePageMethods="true">
        </asp:ScriptManager>
        <p>
        AN VAO DAY
    </p>
    <button type="button" onclick="Insert()">OK</button>
    <p>Suggestions: <span id="txtHint"> tt</span></p>
        <div>
        </div>
    </form>
    <p id="id11"></p>
    
    
</body>
</html>
