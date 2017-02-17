// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require jquery.ui.datepicker
//= require_self
//= require_tree .

var formattedDate = function(date){
  d = new Date(date || Date.now()) 
  month = '' + (d.getMonth() + 1) 
  day = '' + d.getDate() 
  year = d.getFullYear()

  if (month.length < 2) 
    month = '0' + month
  if (day.length < 2) 
    day = '0' + day

  return [day, month, year].join('/')
} 