<%@page contentType="text/html; utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Responsive Admin Dashboard Template">
    <meta name="keywords" content="admin,dashboard">
    <meta name="author" content="stacks">
    <!-- The above 6 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Space - Responsive Admin Dashboard Template</title>
    <jsp:include page="css.jsp"/>
</head>
<body>

<!-- Page Container -->
<div class="page-container">
    <!-- Page Sidebar -->
    <jsp:include page="pagesidebar.jsp"/>
    <!-- /Page Sidebar -->

    <!-- Page Content -->
    <div class="page-content">
        <!-- Page Header -->
        <div class="page-header">
            <div class="search-form">
                <form action="#" method="GET">
                    <div class="input-group">
                        <input type="text" name="search" class="form-control search-input"
                               placeholder="Type something...">
                        <span class="input-group-btn">
                                    <button class="btn btn-default" id="close-search" type="button"><i
                                            class="icon-close"></i></button>
                                </span>
                    </div>
                </form>
            </div>
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <div class="logo-sm">
                            <a href="javascript:void(0)" id="sidebar-toggle-button"><i class="fa fa-bars"></i></a>
                            <a class="logo-box" href="index.html"><span>Space</span></a>
                        </div>
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <i class="fa fa-angle-down"></i>
                        </button>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->

                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="javascript:void(0)" id="collapsed-sidebar-toggle-button"><i
                                    class="fa fa-bars"></i></a></li>
                            <li><a href="javascript:void(0)" id="toggle-fullscreen"><i class="fa fa-expand"></i></a>
                            </li>
                            <li><a href="javascript:void(0)" id="search-button"><i class="fa fa-search"></i></a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </div><!-- /Page Header -->
        <!-- Page Inner -->
        <div class="page-inner">
            <div class="page-title">
                <h3 class="breadcrumb-header">Blank Page</h3>
            </div>
            <div id="main-wrapper">
                <div class="row">

                </div><!-- Row -->
            </div><!-- Main Wrapper -->
            <div class="page-footer">
                <p>Made with <i class="fa fa-heart"></i> by stacks</p>
            </div>
        </div><!-- /Page Inner -->
        <div class="page-right-sidebar" id="main-right-sidebar">
            <div class="page-right-sidebar-inner">
                <div class="right-sidebar-top">
                    <div class="right-sidebar-tabs">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active" id="chat-tab"><a href="#chat" aria-controls="chat"
                                                                                    role="tab"
                                                                                    data-toggle="tab">聊天</a></li>
                            <li role="presentation" id="settings-tab"><a href="#settings" aria-controls="settings"
                                                                         role="tab" data-toggle="tab">settings</a></li>
                        </ul>
                    </div>
                    <a href="javascript:void(0)" class="right-sidebar-toggle right-sidebar-close"
                       data-sidebar-id="main-right-sidebar"><i class="icon-close"></i></a>
                </div>
                <div class="right-sidebar-content">
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="chat">
                            <div class="chat-list">
                                <span class="chat-title">Recent</span>
                                <a href="javascript:void(0);" class="right-sidebar-toggle chat-item unread"
                                   data-sidebar-id="chat-right-sidebar">
                                    <div class="user-avatar">
                                        <img src="http://via.placeholder.com/40x40" alt="">
                                    </div>
                                    <div class="chat-info">
                                        <span class="chat-author">David</span>
                                        <span class="chat-text">where u at?</span>
                                        <span class="chat-time">08:50</span>
                                    </div>
                                </a>
                                <a href="javascript:void(0);" class="right-sidebar-toggle chat-item unread active-user"
                                   data-sidebar-id="chat-right-sidebar">
                                    <div class="user-avatar">
                                        <img src="http://via.placeholder.com/40x40" alt="">
                                    </div>
                                    <div class="chat-info">
                                        <span class="chat-author">Daisy</span>
                                        <span class="chat-text">Daisy sent a photo.</span>
                                        <span class="chat-time">11:34</span>
                                    </div>
                                </a>
                            </div>
                            <div class="chat-list">
                                <span class="chat-title">Older</span>
                                <a href="javascript:void(0);" class="right-sidebar-toggle chat-item"
                                   data-sidebar-id="chat-right-sidebar">
                                    <div class="user-avatar">
                                        <img src="http://via.placeholder.com/40x40" alt="">
                                    </div>
                                    <div class="chat-info">
                                        <span class="chat-author">Tom</span>
                                        <span class="chat-text">You: ok</span>
                                        <span class="chat-time">2d</span>
                                    </div>
                                </a>
                                <a href="javascript:void(0);" class="right-sidebar-toggle chat-item active-user"
                                   data-sidebar-id="chat-right-sidebar">
                                    <div class="user-avatar">
                                        <img src="http://via.placeholder.com/40x40" alt="">
                                    </div>
                                    <div class="chat-info">
                                        <span class="chat-author">Anna</span>
                                        <span class="chat-text">asdasdasd</span>
                                        <span class="chat-time">4d</span>
                                    </div>
                                </a>
                                <a href="javascript:void(0);" class="right-sidebar-toggle chat-item active-user"
                                   data-sidebar-id="chat-right-sidebar">
                                    <div class="user-avatar">
                                        <img src="http://via.placeholder.com/40x40" alt="">
                                    </div>
                                    <div class="chat-info">
                                        <span class="chat-author">Liza</span>
                                        <span class="chat-text">asdasdasd</span>
                                        <span class="chat-time">&nbsp;</span>
                                    </div>
                                </a>
                                <a href="javascript:void(0);" class="load-more-messages" data-toggle="tooltip"
                                   data-placement="bottom" title="Load More">&bull;&bull;&bull;</a>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="settings">
                            <div class="right-sidebar-settings">
                                <span class="settings-title">General Settings</span>
                                <ul class="sidebar-setting-list list-unstyled">
                                    <li>
                                        <span class="settings-option">Notifications</span><input type="checkbox"
                                                                                                 class="js-switch"
                                                                                                 checked/>
                                    </li>
                                    <li>
                                        <span class="settings-option">Activity log</span><input type="checkbox"
                                                                                                class="js-switch"
                                                                                                checked/>
                                    </li>
                                    <li>
                                        <span class="settings-option">Automatic updates</span><input type="checkbox"
                                                                                                     class="js-switch"/>
                                    </li>
                                    <li>
                                        <span class="settings-option">Allow backups</span><input type="checkbox"
                                                                                                 class="js-switch"/>
                                    </li>
                                </ul>
                                <span class="settings-title">Account Settings</span>
                                <ul class="sidebar-setting-list list-unstyled">
                                    <li>
                                        <span class="settings-option">Chat</span><input type="checkbox"
                                                                                        class="js-switch" checked/>
                                    </li>
                                    <li>
                                        <span class="settings-option">Incognito mode</span><input type="checkbox"
                                                                                                  class="js-switch"/>
                                    </li>
                                    <li>
                                        <span class="settings-option">Public profile</span><input type="checkbox"
                                                                                                  class="js-switch"/>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-right-sidebar" id="chat-right-sidebar">
            <div class="page-right-sidebar-inner">
                <div class="right-sidebar-top">
                    <div class="chat-top-info">
                        <span class="chat-name">Noah</span>
                        <span class="chat-state">2h ago</span>
                    </div>
                    <a href="javascript:void(0)" class="right-sidebar-toggle chat-sidebar-close pull-right"
                       data-sidebar-id="chat-right-sidebar"><i class="icon-keyboard_arrow_right"></i></a>
                </div>
                <div class="right-sidebar-content">
                    <div class="right-sidebar-chat slimscroll">
                        <div class="chat-bubbles">
                            <div class="chat-start-date">02/06/2017 5:58PM</div>
                            <div class="chat-bubble them">
                                <div class="chat-bubble-img-container">
                                    <img src="http://via.placeholder.com/38x38" alt="">
                                </div>
                                <div class="chat-bubble-text-container">
                                    <span class="chat-bubble-text">Hello</span>
                                </div>
                            </div>
                            <div class="chat-bubble me">
                                <div class="chat-bubble-text-container">
                                    <span class="chat-bubble-text">Hello!</span>
                                </div>
                            </div>
                            <div class="chat-start-date">03/06/2017 4:22AM</div>
                            <div class="chat-bubble me">
                                <div class="chat-bubble-text-container">
                                    <span class="chat-bubble-text">lorem</span>
                                </div>
                            </div>
                            <div class="chat-bubble them">
                                <div class="chat-bubble-img-container">
                                    <img src="http://via.placeholder.com/38x38" alt="">
                                </div>
                                <div class="chat-bubble-text-container">
                                    <span class="chat-bubble-text">ipsum dolor sit amet</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="chat-write">
                        <form class="form-horizontal" action="javascript:void(0);">
                            <input type="text" class="form-control" placeholder="Say something">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /Page Content -->
</div><!-- /Page Container -->


<!-- Javascripts -->
<script src="assets/plugins/jquery/jquery-3.1.0.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/plugins/uniform/js/jquery.uniform.standalone.js"></script>
<script src="assets/plugins/switchery/switchery.min.js"></script>
<script src="assets/js/space.min.js"></script>
</body>
</html>