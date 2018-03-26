<h1>WJSP</h1>

## WEBPACK + JSP 构建多页应用

### 概述
传统的JSP页面应用无法有效的使用ES6语法特性，项目打包压缩困难，无法热更新。传统的单页应用在Tomcat等容器下无法进行服务端渲染到达SEO的效果。本项目工程很好融合的传统JSP页面服务端渲染的特点和单页应用开发特性且极易上手使用!

### 源码地址
[源码地址](https://github.com/nqdy666/wjsp)

### Demos与文档
[Demos与文档](http://wjsp.qjzd.net/)

### 特性
* 多页应用
* JSP嵌套
* el表达式
* 服务端渲染(SEO)
* 热部署
* js,css语法转换
* eslint
* 热更新
* 支持Vue
* 打包压缩
* IE9+
支持传统JSP开发所的所有功能；可以通过自定义webpack配置来实现对react的支持；通过引入vue-router和vuex某一个页面完成可以变成一个单页应用。

如果您想要支持IE8，那需要把webpack降级，因为webpack2+是不支持IE8的，以及尽量避免去使用不支持IE8的库，比如jquery2+，lodash4+, Vue等，祝您好运。

### 环境搭建
工欲善其事，必先利其器。

* JDK1.7+
* IntelliJ IDEA，需要安装js相关插件和配置支持es6语法。
* Maven3+
* Tomcat7+，端口默认请使用8080
* Git bash
* npm3+
* node7+

如果您喜欢编辑js和css的时候用vscode也是没有问题，不过编写jsp和java还是推荐用idea。

以下总结环境配置的相关文章，可供参考
[JDK下载地址](https://qjzd.net/topic/5a4e1ef4f918faeb40031460)
[IntelliJ IDEA配置前端开发环境](https://qjzd.net/topic/5a4ee74ff918faeb40031461)
[IntelliJ IDEA配置JAVA WEB的Tomcat环境](https://qjzd.net/topic/5a4eef92f918faeb40031462)
[maven下载安装](https://qjzd.net/topic/5a4ef4f0f918faeb40031463)
[Git Bash下载安装](https://qjzd.net/topic/5a4ef698f918faeb40031464)

### 目录说明
```
├── pom.xml   // maven配置文件
├── src
|  ├── main
|  |  ├── filters
|  |  |  └── resources // java工程资源配置目录
|  |  ├── java // java代码目录
|  |  ├── js // 前端页面工程
|  |  |  ├── build  // 编译相关以及webpack相关配置
|  |  |  |  ├── build.js
|  |  |  |  ├── check-versions.js
|  |  |  |  ├── logo.png
|  |  |  |  ├── utils.js
|  |  |  |  ├── webpack.base.conf.js
|  |  |  |  ├── webpack.dev.conf.js
|  |  |  |  └── webpack.prod.conf.js
|  |  |  ├── config // 配置相关
|  |  |  |  ├── dev.env.js
|  |  |  |  ├── index.js
|  |  |  |  ├── js-jsp-map.js // 配置入口js和jsp的映射
|  |  |  |  └── prod.env.js
|  |  |  ├── package.json // npm配置
|  |  |  ├── src // web项目工程目录
|  |  |  |  ├── pages // jsp页面，最终的jsp文件们会按照pages相对路径打包进webapp/WEB-INF/jsp目录下
|  |  |  |  |  ├── include // 共享的jsp页面，通过jsp:include引入
|  |  |  |  |  |  ├── common_script.jsp
|  |  |  |  |  |  ├── footer.jsp
|  |  |  |  |  |  ├── header.jsp
|  |  |  |  |  |  ├── init.jsp
|  |  |  |  |  |  └── meta.jsp
|  |  |  |  |  ├── index // 页面1
|  |  |  |  |  |  ├── index.js // 需要在在config/js-jsp-map.js配置与jsp的映射关系，这样编译后的js会加载jsp的body下。一般js与jsp在同一个目录下。
|  |  |  |  |  |  └── index.jsp
|  |  |  |  |  └── start // 页面2
|  |  |  |  |     ├── dashboard.css
|  |  |  |  |     ├── index.js
|  |  |  |  |     └── index.jsp
|  |  |     |     └── my-component.vue 支持VUE
|  |  |     ├── polyfills 兼容相关的代码
|  |  |     |  ├── console.js
|  |  |     |  ├── index.js
|  |  |     |  └── promise.js
|  |  |     ├── static // 存在静态文件，最终这些文件会拷贝到webapp目录下
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
|  |  └── webapp // 该目录下的文件不用开发人员手动添加修改，在npm run dev或npm run build的时候自动生成。
|  └── test
|     └── java
```
src/main/js目录下的目录结构是在vue-cli的webpack模板的基础上修改的，如果您使用过该模板创建过项目，那么将很容易会上手。

### 开发
`cd src/main/js`
`npm run dev`

在idea中启动tomcat

在浏览器中打开`http://localhost:8081`

以下几点需要注意一下

首次启动项目，建议先`npm run dev`在启动tomcat。之后其中一个重启，另外一个可以不用重启。
默认情况下`npm run dev`跑在8081端口下，tomcat跑在8080端口下。最终在浏览器访问只需要访问8081的页面，8080页面没有必要。
开发模式下，js引入的css是动态引入的，页面会出现闪变的效果。不用担心，在发布后的环境中是不会出现的。
开发jsp页面的时候，热部署会有延时，具体参看JSP页面这一章节
开发jsp文件务必在pages目录下开发，切勿在webapp目录下开发。否则在切换到pages目录下开发或者打包后或，webapp下的jsp的文件会被覆盖，导致修改的内容丢失。
随着js-jsp-map.js中配置的的入口文件增加，webpack-dev-server的热更新会很慢，建议根据当前开发需要先临时注释掉一些暂未使用的入口文件，保留1至3个即可，会大大提高热更新时间。

### 打包发布
`npm run build`

webapp作为输出目录，static中文件会拷贝到输出目录，pages目录下的jsp文件会作为模板文件拷贝到webapp/WEB-INF/jsp目录下，与jsp关联的js入口会被合并压缩后引入到jsp文件的body中。jsp关联的css会被抽离出一个单个的css文件引入的jsp文件head中。

如果您打包后的应用的Application Context不是/, 比如是`/app`，即访问地址都是基于`http://localhost:8080/app`，那么打包的时候webpack的`publicPath`参数记得配置/app，且jsp页面中所有的地址都需要带上`${pageContext.request.contextPath}/`，在该项目框架中可以简写为`${ctx}/`

### JSP页面
传统的JSP是在`src/main/webapp`下开发，在这个项目框架下开发jsp文件是在`src/main/js/src/pages`下开发。虽然开发目录不一致，但依然拥有传统jsp开发所有的特性。

* 模板嵌套，比如使用`<jsp:include page=''></jsp:include>`或者`<%@include file=""%>`
* el表达式，`<c:set>`, `<c:if>`, `<c:forEach>`等都可以使用
* 嵌入Java代码 比如使用`<% out.println("hello world"); %>`
* 支持热部署。配置好启动tomcat相关参数。在修改完jsp保存文件后，约10秒后刷新页面就可以看到页面的变化。如果等不及10秒或者页面一直不刷新，可以先点击idea菜单`File->Syncronize>`同步文件（快捷键`Ctrl+Alt+Y`），然后在点击Run的左侧第三个按钮后选择`Update classes and resources`手动更新，之后就刷新页面就可以看到最新出的页面。
实际在`npm run dev`的时候，pages目录下的jsp会作为htmlWebpackPlugin插件的模板文件，每次修改pages下的文件都会被输出到`webapp/WEB-INF/jsp`下的相对目录。需要了解具体原理，请前往核心章节

### 自定义标签库
除了标准的c, fmt, fn标签库外，您也可以自定义标签库。

* 首先在static/WEB-INF/tld新建一个tld，比如elftld
* 然后jsp页面引入，`<%@ taglib prefix="elf" uri="/WEB-INF/tld/elfunc.tld" %>`

注意的是，在jsp页面的地址必须以/WEB-INF/开头，而实际开发jsp的路径是在`js/src/pages`目录下，导致idea无法正常解析pages目录下jsp中tld文件路径，在使用自定义标签的时候也无法自动补全。不过可以正常运行，实际开发过程影响不大。如果您有更好的解决方案，请与我们联系。

### 语法转换
因为了使用了webpack作为打包工具，您可以轻松对js和css进行语法转换，目前支持：

* es6, stage-2
* postcss
* less, sass, scss 需要额外装对应的loader即可支持

### 热更新
在开发单页应用的过程中，有一个很棒的特性就是热更新，修改了js文件，页面实时就会触发更新。
在此项目框架下，您依然可以享受到热更新带来的喜悦，在您修改js和css的时候，页面都会实时触发更新。

### VUE
该项目已经默认支持Vue。这一章节也是用VUE编写的，你可以尽情的享受VUE带来的编码的快乐。

* 您可以给idea添加vue.js插件，这样也可以直接使用.vue文件。
* js和css的语法转换在.vue文件中同样适用。

### 核心
该项目融合了webpack和jsp两者的特性实现了多页应用，这很酷。那到底是如何实现的呢。这里我们从搭建项目遇到的问题来讲讲最核心的几个问题是如何解决的。

##### HtmlWebpackPlugin
使用webpack实现多页应用，很容易联想到配置多个entry入口，每一个entry对应一个`HtmlWebpackPlugin`。jsp文件作为`HtmlWebpackPlugin`的模板文件，在entry的js在打包之后会插入到body下。该项目也是按照这样的搭建的。
这里有几点需要注意
* HtmlWebpackPlugin解析jsp文件需要对应的loader，需要在webpack中配置`{ test: /\.jsp$/, loader: 'raw-loader' }`，这里使用`raw-loader`进行纯文本拷贝。如果您有更适合jsp的loader，那么您可以赋予jsp文件特多的特性。
* 因为jsp可以被嵌套，这些被嵌套的jsp，并不是入口的jsp。所有只有是入口的jsp在配合HtmlWebpackPlugin插件的会额外添加{inject: 'body'}参数
* 那如何规定哪些jsp是入口文件呢？我们是通过配置来约定entry的js与jsp的关联关系，配置文件在`config/js-jsp-map.js`中。

### proxy反代
tomcat是跑在8080端口下的，webpack-dev-server是跑在8081端口下的，是两个不同应用。那岂不是开发jsp要在tomcat下编写调试，开发js在webpack-dev-server调试。这样的话岂不是很麻烦。

庆幸的webpack-dev-server有一个proxy参数，我们利用proxy把访问webpack-dev-server的请求都反代到8080下。这样实际开发过程中浏览器只要打开8081端口页面就可以。这样就做到兼顾jsp服务端渲染的功能，以及webpack语法转换，热更新的功能。tomcat只有在必要的时候重启一下就好。
这里有几点需要注意
* `npm run dev`和启动tomcat并没有顺序要求，不过在浏览器访问8081前需要把这两个服务都启动起来。
* 当涉及到jsp文件有新增删除，或者static目录下的文件有新增编辑删除时，需要重新`npm run dev`和重启tomcat。记住一点，如果有文件新增和删除，最好都把这两个服务都重启一下肯定是没有问题的。

### WriteFilePlugin
我们知道webpack-dev-server是使用内存中的文件系统。而jsp页面最终是要发布到tomcat的，内存中的jsp文件并不能被idea监听，这样即使最终输出的jsp发生改变也无法被deploy到tomcat。
庆幸我们找到了一个webpack的插件WriteFilePlugin，它能强制把webpack-dev-server程序的输出的文件写到磁盘文件系统上。
这里有几点需要注意
* 虽然通过WriteFilePlugin的jsp文件输出到磁盘上了，但是因为不是通过idea直接修改，idea还是无法立刻同步这些文件。idea同步并发布jsp文件会有10s的延迟。如果等不及10秒或者页面一直不刷新，可以先点击idea菜单File->Syncronize>同步文件（快捷键Ctrl+Alt+Y），然后在点击Run的左侧第三个按钮后选择Update classes and resources手动更新，之后就刷新页面就可以看到最新出的页面。

### 结语
这个思路其实不仅适用tomcat下的jsp多页应用，同样也是适用node作为服务器的多页应用。Enjoy it!