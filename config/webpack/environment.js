const { environment } = require('@rails/webpacker')
const typescript =  require('./loaders/typescript')
const vue =  require('./loaders/vue')

environment.loaders.append('vue', vue)
environment.loaders.append('typescript', typescript)

// FIXME: Vue.js v15 で必要; Webpacker の対応待ち
const VueLoaderPlugin = require('vue-loader/lib/plugin')
environment.plugins.append('VueLoaderPlugin', new VueLoaderPlugin())

module.exports = environment
