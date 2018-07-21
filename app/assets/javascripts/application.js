// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.

import Rails from 'rails-ujs'
import Vue from 'vue/dist/vue.esm'

import App from './components/app.vue'

Rails.start()

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#app',
    components: { App },
    template: '<app></app>'
  })
})
