<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--[if lte IE 8]>
<body class="lower-ie">
<style>
  html {
    height: 100%;
  }

  body {
    background-color: #2a3c54;
    width: 100%;
    height: 100%;
    overflow: hidden;
  }

  .lower-ie #lowie-main {
    height: 100%;
    width: 100%;
    padding: 200px 0 100px;
  }

  .lower-ie #lowie-main img {
    display: block;
    width: 60%;
    margin: 0 auto;
  }
</style>
<div id="lowie-main"><img src="${ctx}/images/forie.png" alt="ie tip"></div>
<script type="text/javascript">
  window.onload = function (a) {
    var childNodes = document.getElementsByTagName('body')[0].children
    for (var i = 0; i < childNodes.length; i++) {
      console.log(childNodes[i].nodeName, childNodes[i].nodeType)
      if (childNodes[i].nodeType != 8 && childNodes[i].nodeName !== 'STYLE' && childNodes[i].nodeName !== 'SCRIPT') {
        if (childNodes[i].getAttribute('id') !== 'lowie-main') {
          childNodes[i].style.display = 'none'
        }
      }
    }
  }
</script>
</body>
<![endif]-->
