<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@include file="../include/init.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <title>WEBPACK-JSP</title>
  <jsp:include page="../include/meta.jsp"></jsp:include>
<link href="/static/css/contact.b75a81cb6c21185eb4839cb6e9c4c146.css?f08fbfaa8a5d8df04579" rel="stylesheet"></head>

<jsp:include page="../include/lowie.jsp"></jsp:include>
<body>
<!--头部-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!--/头部-->
<div class="container contact-main">
  <div class="row placeholders">
    <div class="col-sm-4 placeholder">
      <img src="${ctx}/images/qrcode_weibo_nnbwq.png" width="400" height="400" class="img-responsive" alt="Generic placeholder thumbnail">
      <h4>新浪微博-念念不忘秦</h4>
      <span class="text-muted">欢迎关注</span>
    </div>
    <div class="col-sm-4 placeholder">
      <img src="${ctx}/images/qrcode_weixin_qjzd.jpg" width="400" height="400" class="img-responsive" alt="Generic placeholder thumbnail">
      <h4>微信公众号-秦晋之巅</h4>
      <span class="text-muted">欢迎关注</span>
    </div>
    <div class="col-sm-4 placeholder">
      <img src="${ctx}/images/qrcode_alipay_nq.png" width="400" height="400" class="img-responsive" alt="Generic placeholder thumbnail">
      <h4>支付宝-付款码</h4>
      <span class="text-muted">如果觉得这对您有帮助可以请我喝一杯咖啡</span>
    </div>
  </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<jsp:include page="../include/common_script.jsp"></jsp:include>
<script type="text/javascript" src="/static/js/manifest.js?f08fbfaa8a5d8df04579"></script><script type="text/javascript" src="/static/js/vendor.js?f08fbfaa8a5d8df04579"></script><script type="text/javascript" src="/static/js/contact.js?f08fbfaa8a5d8df04579"></script><script type="text/javascript" src="/static/js/polyfill.js?f08fbfaa8a5d8df04579"></script></body>

</html>
