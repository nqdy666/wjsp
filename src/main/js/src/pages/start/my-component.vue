<template>
  <div>
    <p>{{message}}</p>
    <ul>
      <li>您可以给idea添加vue.js插件，这样也可以直接使用.vue文件。</li>
      <li>js和css的语法转换在.vue文件中同样适用。</li>
    </ul>
  </div>
</template>
<script>
  export default {
    data () {
      return {
        message: '该项目已经默认支持Vue。这一章节也是用VUE编写的，你可以尽情的享受VUE带来的编码的快乐。'
      }
    }
  }
</script>
