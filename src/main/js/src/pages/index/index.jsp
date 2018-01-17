<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@include file="../include/init.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <title>WEBPACK-JSP</title>
  <jsp:include page="../include/meta.jsp"></jsp:include>
</head>

<jsp:include page="../include/lowie.jsp"></jsp:include>
<body>
<!--头部-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!--/头部-->
<!-- Jumbotron -->
<header class="jumbotron">
  <div class="container">
    <img src="${ctx}/images/webpack.svg" width="128" height="128"/>
    <img src="${ctx}/images/jsp.svg" width="128" height="128"/>
    <h1 class="lead">WEBPACK + JSP 构建多页应用</h1>
    <h4 class="sub-title">传统的JSP页面应用无法有效的使用ES6语法特性，项目打包压缩困难，无法热更新。传统的单页应用在Tomcat等容器下无法进行服务端渲染到达SEO的效果。本项目工程很好融合的传统JSP页面服务端渲染的特点和单页应用开发特性且极易上手使用!</h4>
    <p><a class="btn btn-lg btn-default btn-getting-started" href="${ctx}/start" role="button">开始使用</a>
    </p>
  </div>
</header>

<main class="benefits container">
  <!-- Example row of columns -->
  <div class="row text">
    <div class="col-md-4">
      <h2>WEBPACK</h2>
      <p>语法转换，打包，压缩，热更新</p>
    </div>
    <div class="col-md-4">
      <h2>JSP</h2>
      <p>热部署，服务端渲染SEO</p>
    </div>
    <div class="col-md-4">
      <h2>鱼与熊掌兼得</h2>
      <p>吸收WEBPACK和JSP优点，使用简单</p>
    </div>
  </div>
</main>
<!--/滚屏-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<jsp:include page="../include/common_script.jsp"></jsp:include>
</body>

</html>
