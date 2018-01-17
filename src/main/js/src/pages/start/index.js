import '@/styles/index.css'
import './dashboard.css'
import $ from 'jquery'
import Vue from 'vue'
import myComponent from './my-component'

// Smooth scrolling using jQuery easing
$('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function () {
  console.log(location.pathname, this.pathname)
  if (location.pathname.replace(/^\//, '') === this.pathname.replace(/^\//, '') && location.hostname === this.hostname) {
    console.log(this.hash)
    var target = $(this.hash)
    target = target.length ? target : $('[name=' + this.hash.slice(1) + ']')
    if (target.length) {
      $('html, body').animate({
        scrollTop: (target.offset().top - 60)
      }, 300)
      return false
    }
  }
})

// Closes responsive menu when a scroll trigger link is clicked
$('.js-scroll-trigger').click(function () {
  $('.navbar-collapse').collapse('hide')
})

// Activate scrollspy to add active class to navbar items on scroll
$('body').scrollspy({
  target: '#sideNav',
  offset: 80
})

new Vue({
  el: '#vue-app',
  components: {
    myComponent
  }
})
