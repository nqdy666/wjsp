<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@include file="../include/init.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <title>WEBPACK-JSP</title>
  <jsp:include page="../include/meta.jsp"></jsp:include>
<link href="/static/css/start.b8461899480bd085bb2e0be4aa16de99.css?69dc70d6fe2ca9a837cf" rel="stylesheet"></head>

<jsp:include page="../include/lowie.jsp"></jsp:include>
<body>
<!--头部-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!--/头部-->
<div class="container">
  <div class="row">
    <div class="col-sm-3 col-md-2 sidebar bs-js-navbar-scrollspy" id="sideNav">
      <ul class="nav nav-sidebar">
        <li><a class="js-scroll-trigger" href="#overview">介绍</a></li>
        <li><a class="js-scroll-trigger" href="#environment">环境搭建</a></li>
        <li><a class="js-scroll-trigger" href="#directory">目录说明</a></li>
        <li><a class="js-scroll-trigger" href="#development">开发</a></li>
        <li><a class="js-scroll-trigger" href="#package">打包发布</a></li>
      </ul>
      <ul class="nav nav-sidebar">
        <li><a class="js-scroll-trigger" href="#jsp-page">JSP页面</a></li>
        <li><a class="js-scroll-trigger" href="#expression-language-func">自定义EL表达式函数</a></li>
      </ul>
      <ul class="nav nav-sidebar">
        <li><a class="js-scroll-trigger" href="#language-transform">语法转换</a></li>
        <li><a class="js-scroll-trigger" href="#hot-reload">热更新</a></li>
        <li><a class="js-scroll-trigger" href="#vue-support">VUE</a></li>
      </ul>
      <ul class="nav nav-sidebar">
        <li><a class="js-scroll-trigger" href="#core-idea">核心</a></li>
      </ul>
    </div>
  </div>
  <div class="main">
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 section" id="overview">
      <h1 class="page-header">介绍</h1>
      <p>传统的JSP页面应用无法有效的使用ES6语法特性，项目打包压缩困难，无法热更新。传统的单页应用在Tomcat等容器下无法进行服务端渲染从而达到SEO的效果。本项目工程很好融合的传统JSP页面服务端渲染的特点和单页应用开发特性且极易上手使用!</p>
      <p>特性</p>
      <ul>
        <li>多页应用</li>
        <li>JSP嵌套</li>
        <li>el表达式</li>
        <li>服务端渲染(SEO)</li>
        <li>热部署</li>
        <li>js,css语法转换</li>
        <li>eslint</li>
        <li>热更新</li>
        <li>支持Vue</li>
        <li>打包压缩</li>
        <li>IE9+</li>
      </ul>
      <p>支持传统JSP开发所的所有功能；可以通过自定义webpack配置来实现对react的支持；通过引入vue-router和vuex某一个页面完成可以变成一个单页应用。</p>
      <p>如果您想要支持IE8，那需要把webpack降级，因为webpack2+是<a href="https://github.com/webpack/webpack/issues/3070">不支持IE8</a>的，以及尽量避免去使用不支持IE8的库，比如jquery2+，lodash4+, Vue等，祝您好运。</p>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 section" id="environment">
      <h1 class="page-header">环境搭建</h1>
      <p>工欲善其事，必先利其器。</p>
      <ul>
        <li>JDK1.7+</li>
        <li>IntelliJ IDEA，需要安装js相关插件和配置支持es6语法。</li>
        <li>Maven3+</li>
        <li>Tomcat7+，端口默认请使用8080</li>
        <li>Git bash</li>
        <li>npm3+</li>
        <li>node7+</li>
      </ul>
      <p>如果您喜欢编辑js和css的时候用vscode也是没有问题，不过编写jsp和java还是推荐用idea。</p>
      <p>以下总结环境配置的相关文章，可供参考</p>
      <li><a href="https://qjzd.net/topic/5a4e1ef4f918faeb40031460">JDK下载地址</a></li>
      <li><a href="https://qjzd.net/topic/5a4ee74ff918faeb40031461">IntelliJ IDEA配置前端开发环境</a></li>
      <li><a href="https://qjzd.net/topic/5a4eef92f918faeb40031462">IntelliJ IDEA配置JAVA WEB的Tomcat环境</a></li>
      <li><a href="https://qjzd.net/topic/5a4ef4f0f918faeb40031463">maven下载安装</a></li>
      <li><a href="https://qjzd.net/topic/5a4ef698f918faeb40031464">Git Bash下载安装</a></li>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 section dir-desc" id="directory">
      <h1 class="page-header">目录说明</h1>
      <pre>
├── pom.xml   <span>// maven配置文件</span>
├── src
|  ├── main
|  |  ├── filters
|  |  |  └── resources <span>// java工程资源配置目录</span>
|  |  ├── java <span>// java代码目录</span>
|  |  ├── js <span>// 前端页面工程</span>
|  |  |  ├── build  <span>// 编译相关以及webpack相关配置</span>
|  |  |  |  ├── build.js
|  |  |  |  ├── check-versions.js
|  |  |  |  ├── logo.png
|  |  |  |  ├── utils.js
|  |  |  |  ├── webpack.base.conf.js
|  |  |  |  ├── webpack.dev.conf.js
|  |  |  |  └── webpack.prod.conf.js
|  |  |  ├── config <span>// 配置相关</span>
|  |  |  |  ├── dev.env.js
|  |  |  |  ├── index.js
|  |  |  |  ├── js-jsp-map.js <span>// 配置入口js和jsp的映射</span>
|  |  |  |  └── prod.env.js
|  |  |  ├── package.json <span>// npm配置</span>
|  |  |  ├── src <span>// web项目工程目录</span>
|  |  |  |  ├── pages <span>// jsp页面，最终的jsp文件们会按照pages相对路径打包进webapp/WEB-INF/jsp目录下</span>
|  |  |  |  |  ├── include <span>// 共享的jsp页面，通过jsp:include引入</span>
|  |  |  |  |  |  ├── common_script.jsp
|  |  |  |  |  |  ├── footer.jsp
|  |  |  |  |  |  ├── header.jsp
|  |  |  |  |  |  ├── init.jsp
|  |  |  |  |  |  └── meta.jsp
|  |  |  |  |  ├── index <span>// 页面1</span>
|  |  |  |  |  |  ├── index.js <span>// 需要在在config/js-jsp-map.js配置与jsp的映射关系，这样编译后的js会加载jsp的body下。一般js与jsp在同一个目录下。</span>
|  |  |  |  |  |  └── index.jsp
|  |  |  |  |  └── start <span>// 页面2</span>
|  |  |  |  |     ├── dashboard.css
|  |  |  |  |     ├── index.js
|  |  |  |  |     └── index.jsp
|  |  |     |     └── my-component.vue <span>支持VUE</span>
|  |  |     ├── polyfills <span>兼容相关的代码</span>
|  |  |     |  ├── console.js
|  |  |     |  ├── index.js
|  |  |     |  └── promise.js
|  |  |     ├── static <span>// 存在静态文件，最终这些文件会拷贝到webapp目录下</span>
|  |  |     |  ├── favicon.ico
|  |  |     |  ├── images
|  |  |     |  |  ├── jsp.svg
|  |  |     |  |  └── webpack.svg
|  |  |     |  ├── js
|  |  |     |  |  └── lib
|  |  |     |  |     └── jquery.min.js
|  |  |     |  └── WEB-INF
|  |  |     |     ├── tld
|  |  |     |     └── web.xml
|  |  |     └── styles
|  |  └── webapp <span>// 该目录下的文件不用开发人员手动添加修改，在npm run dev或npm run build的时候自动生成。</span>
|  └── test
|     └── java
      </pre>
      <p>src/main/js目录下的目录结构是在vue-cli的webpack模板的基础上修改的，如果您使用过该模板创建过项目，那么将很容易会上手。</p>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 section" id="development">
      <h1 class="page-header">开发</h1>
      <p><code>cd src/main/js </code></p>
      <p><code>npm run dev</code></p>
      <p>在idea中启动tomcat</p>
      <p>在浏览器中打开<code>http://localhost:8081</code></p>
      <p>以下几点需要注意一下</p>
      <ul>
        <li>首次启动项目，建议先npm run dev在启动tomcat。之后其中一个重启，另外一个可以不用重启。</li>
        <li>默认情况下npm run dev跑在8081端口下，tomcat跑在8080端口下。最终在浏览器访问只需要访问8081的页面，8080页面没有必要。</li>
        <li>开发模式下，js引入的css是动态引入的，页面会出现闪变的效果。不用担心，在发布后的环境中是不会出现的。</li>
        <li>开发jsp页面的时候，热部署会有延时，具体参看<a href="#jsp-page">JSP页面</a>这一章节</li>
        <li>开发jsp文件务必在pages目录下开发，切勿在webapp目录下开发。否则在切换到pages目录下开发或者打包后或，webapp下的jsp的文件会被覆盖，导致修改的内容丢失。</li>
      </ul>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 section" id="package">
      <h1 class="page-header">打包发布</h1>
      <p><code>npm run build</code></p>
      <p>webapp作为输出目录，static中文件会拷贝到输出目录，pages目录下的jsp文件会作为模板文件拷贝到webapp/WEB-INF/jsp目录下，与jsp关联的js入口会被合并压缩后引入到jsp文件的body中。jsp关联的css会被抽离出一个单个的css文件引入的jsp文件head中。</p>
      <p>以下几点需要注意一下</p>
      <ul>
        <li>如果您打包后的应用的Application Context不是<code>/</code>, 比如是<code>/app</code>，即访问地址都是基于<code>http://localhost:8080/app</code>，那么打包的时候webpack的<code>publicPath</code>参数记得配置/app，且jsp页面中所有的地址都需要带上<code>${'$'}{pageContext.request.contextPath}/</code>，在该项目框架中可以简写为<code>${'$'}{ctx}/</code></li>
        <li>如果您在打包后发现某些文件无法访问，请检查一下是否在tomcat环境下是否限制了某些文件类型的访问，比如检查一下web.xml中的相关配置。</li>
      </ul>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 section" id="jsp-page">
      <h1 class="page-header">JSP页面</h1>
      <p>传统的JSP是在src/main/webapp下开发，在这个项目框架下开发jsp文件是在<strong>src/main/js/src/pages</strong>下开发。虽然开发目录不一致，但依然拥有传统jsp开发所有的特性。</p>
      <ul>
        <li>模板嵌套，比如使用<code>${fn:escapeXml("<jsp:include page=''></jsp:include>")}</code>或者<code>&lt;%@include file=""%&gt;</code></li>
        <li>el表达式，<code>${fn:escapeXml("<c:set>, <c:if> <c:forEach")}</code>等都可以使用</li>
        <li>嵌入Java代码 比如使用<code>&lt;% out.println("hello world"); %&gt;</code></li>
        <li>支持热部署。配置好启动tomcat相关参数。在修改完jsp保存文件后，约10秒后刷新页面就可以看到页面的变化。如果等不及10秒或者页面一直不刷新，可以先点击idea菜单<code>File->Syncronize</code>>同步文件（快捷键Ctrl+Alt+Y），然后在点击Run的左侧第三个按钮后选择<code>Update classes and resources</code>手动更新，之后就刷新页面就可以看到最新出的页面。</li>
      </ul>
      <p>实际在npm run dev的时候，pages目录下的jsp会作为htmlWebpackPlugin插件的模板文件，每次修改pages下的文件都会被输出到webapp/WEB-INF/jsp下的相对目录。需要了解具体原理，请前往<a href="#core-idea">核心</a>章节</p>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 section" id="expression-language-func">
      <h1 class="page-header">自定义标签库</h1>
      <p>除了标准的<code>c, fmt, fn</code>标签库外，您也可以自定义标签库。</p>
      <ul>
        <li>首先在static/WEB-INF/tld新建一个tld，比如elftld</li>
        <li>然后jsp页面引入，<code>&lt;%@ taglib prefix="elf" uri="/WEB-INF/tld/elfunc.tld" %&gt;</code></li>
      </ul>
      <p>注意的是，在jsp页面的地址必须以/WEB-INF/开头，而实际开发jsp的路径是在js/src/pages目录下，导致idea无法正常解析pages目录下jsp中tld文件路径，在使用自定义标签的时候也无法自动补全。不过可以正常运行，实际开发过程影响不大。如果您有更好的解决方案，请与我们联系。</p>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 section" id="language-transform">
      <h1 class="page-header">语法转换</h1>
      <p>因为了使用了webpack作为打包工具，您可以轻松对js和css进行语法转换，目前支持：</p>
      <ul>
        <li>es6, stage-2</li>
        <li>postcss</li>
        <li>less, sass, scss 需要额外装对应的loader即可支持</li>
      </ul>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 section" id="hot-reload">
      <h1 class="page-header">热更新</h1>
      <p>在开发单页应用的过程中，有一个很棒的特性就是热更新，修改了js文件，页面实时就会触发更新。</p>
      <p>在此项目框架下，您依然可以享受到热更新带来的喜悦，在您修改js和css的时候，页面都会实时触发更新。</p>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 section" id="vue-support">
      <h1 class="page-header">VUE</h1>
      <div id="vue-app">
        <my-component></my-component>
      </div>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 section" id="core-idea">
      <h1 class="page-header">核心</h1>
      <p>该项目融合了webpack和jsp两者的特性实现了多页应用，这很酷。那到底是如何实现的呢。这里我们从搭建项目遇到的问题来讲讲最核心的几个问题是如何解决的。</p>
      <h3>HtmlWebpackPlugin</h3>
      <p>使用webpack实现多页应用，很容易联想到配置多个entry入口，每一个entry对应一个HtmlWebpackPlugin。jsp文件作为HtmlWebpackPlugin的模板文件，在entry的js在打包之后会插入到body下。该项目也是按照这样的搭建的。</p>
      <p>这里有几点需要注意</p>
      <ul>
        <li>HtmlWebpackPlugin解析jsp文件需要对应的loader，需要在webpack中配置<code>{ test: /\.jsp$/, loader: 'raw-loader' }</code>，这里使用raw-loader进行纯文本拷贝。如果您有更适合jsp的loader，那么您可以赋予jsp文件特多的特性。</li>
        <li>因为jsp可以被嵌套，这些被嵌套的jsp，并不是入口的jsp。所有只有是入口的jsp在配合HtmlWebpackPlugin插件的会额外添加<code>{inject: 'body'}</code>参数</li>
        <li>那如何规定哪些jsp是入口文件呢？我们是通过配置来约定entry的js与jsp的关联关系，配置文件在config/js-jsp-map.js中。</li>
      </ul>
      <h3>proxy反代</h3>
      <p>tomcat是跑在8080端口下的，webpack-dev-server是跑在8081端口下的，是两个不同应用。那岂不是开发jsp要在tomcat下编写调试，开发js在webpack-dev-server调试。这样的话岂不是很麻烦。</p>
      <p>庆幸的webpack-dev-server有一个proxy参数，我们利用proxy把访问webpack-dev-server的请求都反代到8080下。这样实际开发过程中浏览器只要打开8081端口页面就可以。这样就做到兼顾jsp服务端渲染的功能，以及webpack语法转换，热更新的功能。tomcat只有在必要的时候重启一下就好。</p>
      <p>这里有几点需要注意</p>
      <ul>
        <li>npm run dev和启动tomcat并没有顺序要求，不过在浏览器访问8081前需要把这两个服务都启动起来。</li>
        <li>当涉及到jsp文件有新增删除，或者static目录下的文件有新增编辑删除时，需要重新npm run dev和重启tomcat。记住一点，如果有文件新增和删除，最好都把这两个服务都重启一下肯定是没有问题的。</li>
      </ul>
      <h3>WriteFilePlugin</h3>
      <p>我们知道webpack-dev-server是使用内存中的文件系统。而jsp页面最终是要发布到tomcat的，内存中的jsp文件并不能被idea监听，这样即使最终输出的jsp发生改变也无法被deploy到tomcat。</p>
      <p>庆幸我们找到了一个webpack的插件<a href="https://github.com/gajus/write-file-webpack-plugin">WriteFilePlugin</a>，它能强制把webpack-dev-server程序的输出的文件写到磁盘文件系统上。</p>
      <p>这里有几点需要注意</p>
      <ul>
        <li>虽然通过WriteFilePlugin的jsp文件输出到磁盘上了，但是因为不是通过idea直接修改，idea还是无法立刻同步这些文件。idea同步并发布jsp文件会有10s的延迟。如果等不及10秒或者页面一直不刷新，可以先点击idea菜单<code>File->Syncronize</code>>同步文件（快捷键Ctrl+Alt+Y），然后在点击Run的左侧第三个按钮后选择<code>Update classes and resources</code>手动更新，之后就刷新页面就可以看到最新出的页面。</li>
      </ul>
      <h3>结语</h3>
      <p>这个思路其实不仅适用tomcat下的jsp多页应用，同样也是适用node作为服务器的多页应用。Enjoy it!</p>
    </div>
  </div>
</div>
<!--/滚屏-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<jsp:include page="../include/common_script.jsp"></jsp:include>
<script type="text/javascript" src="/static/js/manifest.e1cd96d399653e0cb183.js?69dc70d6fe2ca9a837cf"></script><script type="text/javascript" src="/static/js/vendor.21901c8e20b7cffc1319.js?69dc70d6fe2ca9a837cf"></script><script type="text/javascript" src="/static/js/start.312ed0f8927ecf9ae0df.js?69dc70d6fe2ca9a837cf"></script></body>

</html>
