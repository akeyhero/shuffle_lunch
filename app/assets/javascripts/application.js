// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.

import Rails from 'rails-ujs'
import Vue from 'vue/dist/vue.esm'
import vueCustomElement from 'vue-custom-element'
import 'document-register-element'

import ChatOptions from './components/chat.vue'

Rails.start()

Vue.use(vueCustomElement)

// 動作テスト用
Vue.customElement('v-chat', ChatOptions)
