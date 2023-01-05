<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="MTN.DashBoard" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div id="dash">
        <div class="side-bar">
            <ul style="padding: 0;">
                <li>
                    <img src="/assets/images/dashboard.png" alt="">
                    &nbsp; Dashboard</li>
                <li>
                    <img src="/assets/images/payment.png" alt="">
                    &nbsp; Payment</li>
                <li>
                    <img src="/assets/images/help.png" alt="">
                    &nbsp; Help</li>
                <li>
                    <img src="/assets/images/setting.png" alt="">
                    &nbsp; Setting</li>
            </ul>
        </div>
        <div class="container">
            <div class="content">
                <style>
                    @media only screen and (max-width:880px) {
                        #dash {
                            flex-direction: column
                        }

                        .side-bar {
                            width: 100% !important;
                            min-height: auto;
                            align-items: center;
                        }

                        .container {
                            width: 100%;
                            height: auto;
                        }

                        .content {
                            overflow-x: scroll;
                        }
                    }

                    #dash {
                        display: flex;
                    }

                    table {
                        width: 100%;
                    }

                    td, th {
                        width: 25% !important;
                    }

                    .result {
                        background: #eee;
                        margin: 15px;
                        padding: 10px 15px;
                        border-radius: 12px;
                        min-height: 20vh;
                        box-shadow: 25px 25px 20px -30px #808080;
                        border: 1px solid #ddd;
                        display: flex;
                        justify-content: space-evenly;
                    }

                        .result > * {
                            width: 100%;
                            display: flex;
                            justify-content: space-evenly;
                        }

                            .result > * > * {
                                width: 30%;
                            }

                    select, input {
                        margin: auto 0;
                        width: 30%;
                        border-radius: .375rem;
                        border: 1px solid orange;
                        line-height: 1.5;
                        padding: .375rem .75rem;
                    }

                        input:focus {
                            background: white;
                            box-shadow: 0 0 0 0.2rem rgb(254 189 0 / 25%);
                            border: 1px solid rgb(254 189 0);
                            outline: 0;
                        }

                    .aspNetHidden {
                        display: none
                    }
                </style>
                <table>
                    <thead>
                        <tr>
                            <th>الاسم</th>
                            <th>المبلغ</th>
                            <th>تاريخ الاستحقاق</th>
                            <th>رقم الهاتف</th>
                        </tr>
                    </thead>
                    <%for (int i = 0; i < 10; i++)
                        {
                            if (Data[i, 1] == null) break;%>
                    <tr>
                        <td userid="<%=Data[i,1].Split('-')[1]%>"><%=Data[i,1].Split('-')[0]%></td>
                        <td><%=Data[i,3]%></td>
                        <td><%=Data[i,4]%></td>
                        <td><%=Data[i,5]%></td>
                    </tr>
                    <%} %>
                </table>
                <div class="result" style="flex-direction: column;">
                    <form id="showform" style="display: flex; justify-content: space-evenly;" runat="server">
                        <asp:DropDownList ID="list" runat="server">
                        </asp:DropDownList>
                        <asp:Button Text="أرسل" OnClick="ShowForm" runat="server" />
                        <div style="visibility: hidden"></div>
                    </form>
                    <hr style="border-top: 1px solid orange; width: 100%;" />
                    <div>
                        <div>
                            <p>الاسم</p>
                        </div>
                        <div>
                            <p>الرقم</p>
                        </div>
                        <div>
                            <p>المبلغ</p>
                        </div>
                    </div>
                    <div runat="server" id="result">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
