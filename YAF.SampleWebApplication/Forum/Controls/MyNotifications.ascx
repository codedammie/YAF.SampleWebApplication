﻿<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="true" Inherits="YAF.Controls.MyNotifications"
    CodeBehind="MyNotifications.ascx.cs" %>

<YAF:Pager ID="PagerTop" runat="server" OnPageChange="PagerTop_PageChange" />

<div class="row">
    <div class="col">
        <div class="card mb-3 mt-2" id="activity">
            <div class="card-header">
                <div class="row justify-content-between align-items-center">
                    <div class="col-auto">
                        <YAF:IconHeader runat="server"
                                        IconName="bell"
                                        LocalizedTag="YOUR_NOTIFIY" />
                    </div>
                    <div class="col-auto">
                        <div class="btn-group" role="group" aria-label="Filters">
                            <YAF:ThemeButton runat="server"
                                             CssClass="dropdown-toggle"
                                             DataToggle="dropdown"
                                             Size="Small"
                                             Type="Secondary"
                                             Icon="filter"
                                             TextLocalizedTag="FILTER_DROPDOWN"
                                             TextLocalizedPage="ADMIN_USERS">
                            </YAF:ThemeButton>
                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-left">
                                <div class="px-3 py-1">
                                    <div class="mb-3">
                                        <div class="form-check form-switch">
                                            <asp:CheckBox runat="server" ID="WasMentioned" 
                                                          Checked="True"/>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <div class="form-check form-switch">
                                            <asp:CheckBox runat="server" ID="ReceivedThanks" 
                                                          Checked="True"/>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <div class="form-check form-switch">
                                            <asp:CheckBox runat="server" ID="WasQuoted" 
                                                          Checked="True"/>
                                        </div>
                                    </div>
                                    <YAF:ThemeButton runat="server" ID="Update"
                                                     OnClick="UpdateFilterClick"
                                                     TextLocalizedTag="UPDATE"
                                                     CssClass="mr-2"
                                                     Size="Small"
                                                     Icon="sync">
                                    </YAF:ThemeButton>
                                    <YAF:ThemeButton ID="Reset" runat="server"
                                                     OnClick="ResetClick"
                                                     TextLocalizedTag="CLEAR"
                                                     Type="Secondary"
                                                     Size="Small"
                                                     Icon="trash">
                                    </YAF:ThemeButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Repeater runat="server" ID="ActivityStream" 
                          OnItemDataBound="ActivityStream_OnItemDataBound" 
                          OnItemCommand="ActivityStream_OnItemCommand">
                    <HeaderTemplate>
                        <ul class="list-group list-group-flush">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li class="list-group-item list-group-item-action">
                            <asp:Label runat="server" ID="Icon"
                                       CssClass="fa-stack"></asp:Label>
                            <asp:PlaceHolder runat="server" ID="Message"></asp:PlaceHolder>
                            <YAF:Icon runat="server" 
                                      IconName="calendar-day"
                                      IconType="text-secondary"
                                      IconNameBadge="clock" 
                                      IconBadgeType="text-secondary"></YAF:Icon>
                            <YAF:DisplayDateTime id="DisplayDateTime" runat="server"></YAF:DisplayDateTime>
                            <YAF:ThemeButton runat="server" ID="MarkRead"
                                             Type="Secondary"
                                             Size="Small"
                                             CssClass="float-right"
                                             TextLocalizedTag="MARK_ASREAD"
                                             CommandName="read"
                                             Icon="glasses"
                                             Visible="False">
                            </YAF:ThemeButton>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            <asp:Panel runat="server" ID="NoItems" Visible="False" CssClass="card-body">
                <YAF:Alert runat="server" Type="info">
                    <YAF:Icon runat="server" 
                              IconName="check"
                              IconType="text-success"></YAF:Icon>
                    <YAF:LocalizedLabel runat="server"
                                        LocalizedTag="NO_ENTRY"></YAF:LocalizedLabel>
                </YAF:Alert>
            </asp:Panel>
            <div class="card-footer">
                <div class="row justify-content-between align-items-center">
                    <div class="col-auto">
                        <div class="input-group mb-1">
                            <div class="input-group-text">
                                <YAF:LocalizedLabel ID="SinceLabel" runat="server"
                                                    LocalizedTag="ITEMS"/>:
                            </div>
                            <asp:DropDownList ID="PageSize" runat="server" 
                                              AutoPostBack="True"
                                              OnSelectedIndexChanged="PageSizeSelectedIndexChanged" 
                                              CssClass="form-select">
                                <asp:ListItem Text="5" Value="5" />
                                <asp:ListItem Text="10" Value="10" Selected="True" />
                                <asp:ListItem Text="20" Value="20" />
                                <asp:ListItem Text="30" Value="30" />
                                <asp:ListItem Text="40" Value="40" />
                                <asp:ListItem Text="50" Value="50" />
                            </asp:DropDownList>
                            
                        </div>
                    </div>
                    <div class="col-auto">
                        <div class="btn-group" role="group" aria-label="Tools">
                            <YAF:ThemeButton runat="server" ID="MarkAll"
                                             OnClick="MarkAll_Click"
                                             TextLocalizedTag="MARK_ALL_ASREAD" TextLocalizedPage="DEFAULT"
                                             Type="Secondary"
                                             Size="Small"
                                             Icon="glasses"/>
                        </div>
                    </div>
                </div>
                
                
            </div>
        </div>
        <YAF:Pager ID="PagerBottom" runat="server" LinkedPager="PagerTop" />
    </div>
</div>