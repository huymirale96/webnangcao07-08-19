<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bai21_Ajax.aspx.cs" Inherits="Bai21.Bai21_Ajax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function myFunction() {
            var r = confirm("Xác nhận đánh giá!");
            if (r == true) {
                return true;
            } else {
                return false;
            }
        }
        var LaixeID =1;
       /*window.onload = function () {
            var Select = document.getElementById("DDLLaixe");
            Select.addEventListener("change", function () {
                LaixeID = Select.options[Select.selectedIndex].value.toString();
                var radio = document.getElementsByName("RBL");
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var json = JSON.parse(xhttp.responseText);
                        console.log(json.d.toString());

                       
                        if (json.d.toString() == "false") {
                            for (var i = 0; i < radio.length; i++) {
                                document.getElementById("txtbNgay").value = "";
                                radio[i].checked = false;
                            }
                        }
                        else {
                            var result = JSON.parse(json.d);
                            var soSao = result[0]["iSosao"];
                            var time = result[0]["dNgaydanhgia"];


                            for (var i = 0; i < radio.length; i++) {
                                if (radio[i].value == soSao)
                                    radio[i].checked = true;
                            }

                            document.getElementById("txtbNgay").value = time.slice(0, 10);

                        }

                    }
                };
                xhttp.open("Get", "Bai21_Ajax.aspx/SelectedIndexChanged", true);
                //.setRequestHeader("Content-type", "application/json; charset=utf-8");
                xhttp.send('{LaixeID: ' + LaixeID + '}');

            });
        }*/
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
            xhttp.open("POST", "Bai21_Ajax.aspx/Insert", true);
            xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
            // xhttp.send('{LaixeID: "' + LaixeID + '", SoSao: "' + soSao + '", Ngay:"' + time + '"}');
             xhttp.send();
            
        }

       //function Insert() {
       //     var r = confirm("Xác nhận đánh giá!");
       //     if (r == true) {
       //         var radio = document.getElementsByName("RBL");
       //         var soSao;
       //         for (var i = 0; i < radio.length; i++) {
       //             if (radio[i].checked == true) {
       //                 soSao = radio[i].value;
       //             }
       //         }

       //         var time = document.getElementById('txtbNgay').value;
       //         alert(LaixeID+"--"+soSao + ": " + time);

       //         xhttp.onreadystatechange = function () {
       //             if (this.readyState == 4 && this.status == 200) {
       //                 var json = JSON.parse(xhttp.responseText);
       //                 if (json.d == true) {
       //                     alert('Thêm thành công');
       //                 }
       //                 else {
       //                     alert('Thất bại');
       //                 }

       //             }
       //         };
       //         xhttp.open("POST", "Bai21_Ajax.aspx/Insert", true);
       //         xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
       //         xhttp.send('{LaixeID: ' + LaixeID + ', SoSao: ' + soSao + ', Ngay:' + time + '}');

       //     } else {
       //         return false;
       //     }
       // }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Lái xe
            <asp:DropDownList ID="DDLLaixe" runat="server"></asp:DropDownList>
            <br />
            Ngày
            <asp:TextBox ID="txtbNgay" runat="server" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" ControlToValidate="txtbNgay"></asp:RequiredFieldValidator>
            <br />
            Đánh giá
            <asp:RadioButtonList ID="RBL" runat="server">
                <asp:ListItem Value="1">1 sao</asp:ListItem>
                <asp:ListItem Value="2">2 sao</asp:ListItem>
                <asp:ListItem Value="3">3 sao</asp:ListItem>
                <asp:ListItem Value="4">4 sao</asp:ListItem>
                <asp:ListItem Value="5">5 sao</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" ControlToValidate="RBL"></asp:RequiredFieldValidator><br />
            <button id="ThucHien" onclick="Insert()">Thực hiện</button>
            <input type="reset" value="Hủy" />
        </div>
    </form>
    <button id="ThucHien2" onclick="Insert()">Thực hiện2/button>
</body>
</html>
