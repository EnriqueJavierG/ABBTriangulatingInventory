<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="ABBDemo.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABB Log In</title>
    <link rel="stylesheet" href="ABBStyleSheet.css" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" />
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
        }

        .auto-style1 {
            width: 21%;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="background-container">
            <div class="container login-container">
                <div class="login-form">
                    <div class="main-div">
                        <div class="panel">
                            <img alt="ABB" src="Images/logo.png" width="120" height="40" />
                            <h1>Log in</h1>
                            <h4>Please enter your SSO and Password</h4>
                            <div class="form-group">
                                <asp:TextBox BoderColor="gray" ID="TBSSO" runat="server" autocomplete="off" PlaceHolder="   SSO"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox BorderColor="gray" ID="TBPassword" runat="server" TextMode="Password" PlaceHolder="   Password"></asp:TextBox>
                                 <span class="text-danger"></span>
                                </div>
                            <div class="form-group">
                                <asp:Button CssClass="button-login" ID="BtnLogIn" runat="server" OnClick="BtnLogIn_Click" Text="Log in" />
                            <span class="text-danger"></span>
                                </div>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSSO" runat="server" ErrorMessage="Required Field Missing (SSO)" ControlToValidate="TBSSO" EnableClientScript="false"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" ErrorMessage="Password is Required" ControlToValidate="TBPassword" EnableClientScript="false"></asp:RequiredFieldValidator>
                            <br />
                            <asp:Label ID="LblWrong" runat="server" Text="SSO or Password is wrong, Please try again" Visible="False"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
