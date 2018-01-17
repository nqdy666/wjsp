'use strict'
const path = require('path')
var glob = require('glob')
const config = require('../config')
const ExtractTextPlugin = require('extract-text-webpack-plugin')
const pkg = require('../package.json')

const rootPathResolve = function () {
  return path.resolve.apply(path.resolve, [__dirname, '..'].concat(Array.prototype.slice.call(arguments)))
}

const pathResolve = {
  root: rootPathResolve,
  src: function () {
    return rootPathResolve.apply(rootPathResolve, ['src'].concat(Array.prototype.slice.call(arguments)))
  },
  dist: function () {
    return rootPathResolve.apply(rootPathResolve, ['../webapp'].concat(Array.prototype.slice.call(arguments)))
  }
}

exports.pathResolve = pathResolve

exports.assetsPath = function (_path) {
  const assetsSubDirectory = process.env.NODE_ENV === 'production'
    ? config.build.assetsSubDirectory
    : config.dev.assetsSubDirectory
  return path.posix.join(assetsSubDirectory, _path)
}

exports.cssLoaders = function (options) {
  options = options || {}

  const cssLoader = {
    loader: 'css-loader',
    options: {
      sourceMap: options.sourceMap
    }
  }

  var postcssLoader = {
    loader: 'postcss-loader',
    options: {
      sourceMap: options.sourceMap
    }
  }

  // generate loader string to be used with extract text plugin
  function generateLoaders (loader, loaderOptions) {
    const loaders = options.usePostCSS ? [cssLoader, postcssLoader] : [cssLoader]
    if (loader) {
      loaders.push({
        loader: loader + '-loader',
        options: Object.assign({}, loaderOptions, {
          sourceMap: options.sourceMap
        })
      })
    }
    // Extract CSS when that option is specified
    // (which is the case during production build)
    if (options.extract) {
      return ExtractTextPlugin.extract({
        use: loaders,
        fallback: 'vue-style-loader'
      })
    } else {
      return ['vue-style-loader'].concat(loaders)
    }
  }

  return {
    css: generateLoaders(),
    postcss: generateLoaders(),
    less: generateLoaders('less'),
    sass: generateLoaders('sass', { indentedSyntax: true }),
    scss: generateLoaders('sass'),
    stylus: generateLoaders('stylus'),
    styl: generateLoaders('stylus')
  }
}

exports.styleLoaders = function (options) {
  const output = []
  const loaders = exports.cssLoaders(options)
  for (const extension in loaders) {
    const loader = loaders[extension]
    output.push({
      test: new RegExp('\\.' + extension + '$'),
      use: loader
    })
  }
  return output
}

exports.createNotifierCallback = function () {
  const notifier = require('node-notifier')

  return (severity, errors) => {
    if (severity !== 'error') {
      return
    }
    const error = errors[0]

    const filename = error.file.split('!').pop()
    notifier.notify({
      title: pkg.name,
      message: severity + ': ' + error.name,
      subtitle: filename || '',
      icon: path.join(__dirname, 'logo.png')
    })
  }
}

exports.getJspMapPath = function () {
  const list = []
  var files = glob.sync(pathResolve.src('pages/**/*.jsp'))
  for (let i = 0; i < files.length; i++) {
    let srcFilePath = path.normalize(files[i])
    list.push({
      src: srcFilePath,
      dist: srcFilePath.replace(pathResolve.src('pages'), pathResolve.dist('WEB-INF/jsp'))
    })
  }
  return list
}
