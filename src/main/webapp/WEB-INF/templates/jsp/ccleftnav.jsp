<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<link rel="icon" href="${path}/assets/images/favicon.ico">
<link href="${path}/assets/css/style.css" rel="stylesheet">


<div class="sidebar">
	<div class="logo">
		<a href="${path}/cc/welcomeCC"> <img src="${path}/assets/images/logo.png"
			alt="">
		</a>
	</div>

	<div class="sidebar-nav">
		<ul class="">
			<li><a href="${path}/cc/welcomeCC"><span class="icon-fa archive"><i class="fas fa-home"></i></span>Dashboard</a></li>
			
			<li class="parent"><a href="#"><span class="icon view"></span>View
					Question Assignment <span
					class="arrow glyphicon glyphicon-menu-down"></span></a>
				<ul class="sub-nav">
					<li><a href="${path}/cc/assignQuestions.html">Pending Question</a></li>
				</ul></li>
			
			<li class="parent"><a href="#"><span class="icon check"></span>View
					& Edit Answer <span class="arrow glyphicon glyphicon-menu-down"></span></a>
				<ul class="sub-nav">
					<li><a href="${path}/cc/assignAnswer.html">Pending Answer</a></li>
				</ul>
			</li>
			<li class="parent">
				<a href="#"><span class="icon report"></span>View	Report Assignment <span
					class="arrow glyphicon glyphicon-menu-down"></span></a>
				<ul class="sub-nav">
					<li><a href="${path}/cc/pendingReport.html">Pending Report</a></li>
					<li><a href="${path}/cc/pendingReportAnswer.html">Pending Report Answer</a></li>
				</ul>
			</li>
			<li class="parent">
				<a href="#"><span class="icon check"></span>Send Notes to Answered Question<span class="arrow glyphicon glyphicon-menu-down"></span></a>
				<ul class="sub-nav">
					<li><a href="${path}/cc/canSendNotesList.html">Send Notes</a></li>
				</ul>
			</li>
			<%-- <li class="parent">
				<a href="#"><span class="icon check"></span>Answer Activity Log<span class="arrow glyphicon glyphicon-menu-down"></span></a>
				<ul class="sub-nav">
					<li><a href="${path}/cc/answerActivityList.html">Answer Changed</a></li>
				</ul>
			</li> --%>
			<%-- <li><a href="${path}/cc/getArchiveList.html"><span class="icon archive"></span>Archive</a></li> --%>
			<li class="parent">
				<a href="#"><span class="icon archive"></span>Archive
				<span class="arrow glyphicon glyphicon-menu-down"></span></a>
				<ul class="sub-nav">
					<li><a href="${path}/cc/getArchiveList">Question Archive</a></li>
					<li><a href="${path}/cc/getReportArchiveList">Report Archive</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>
