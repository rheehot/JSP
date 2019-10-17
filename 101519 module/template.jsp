<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="template.css"/>

<% String contentPage = request.getParameter("CONTENTPAGE");
   if (contentPage==null){
	   contentPage="content.jsp";
   }%>

<header>
  <jsp:include page="module/top.jsp" flush="false" />
</header>
<div id="content">
  <section id="areaSub">
    <jsp:include page="module/left.jsp" flush="false" />
  </section>
  <section id="areaMain"> 
    <jsp:include page='<%= "module/" +contentPage %>' flush="false" /> 
  </section>
</div>
<footer>
  <jsp:include page="module/bottom.jsp" flush="false" />
</footer>
