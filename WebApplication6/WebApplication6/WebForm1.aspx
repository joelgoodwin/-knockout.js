<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication6.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Knockout Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>First Name: <span data-bind="text: firstName" /></p>
            <p>Last Name: <span data-bind="text: lastName" /></p>
        </div>
        <hr />
        <div>
            <p>First Name:&nbsp;<asp:TextBox ID="txtFirst" runat="server" data-bind="value: firstName"></asp:TextBox>
            </p>
            <p>Last Name: <asp:TextBox ID="TxtPassword" runat="server" data-bind="value: lastName"/></p>
        </div>
        <hr />
        <p>Full Name: <span data-bind="text: fullName" /></p>
    </form>
    <script src="Scripts/knockout-3.4.2.js"></script>
    <script type="text/javascript">
        var vm = {
            firstName: ko.observable(),
            lastName: ko.observable()
        };

        vm.fullName = ko.dependentObservable(function () {
            return vm.firstName() + " " + vm.lastName()
        });

        vm.firstName.subscribe(function(val) {
            console.log("First Name updated as " + val);

        });

        ko.applyBindings(vm); //bind view model to the application
    </script>
</body>
</html>
