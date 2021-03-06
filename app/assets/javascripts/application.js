// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require twitter/bootstrap
//= require jquery.ui.autocomplete
//= require chosen-jquery
//= require turbolinks


$(function() {
  $("#tickets_search input").keyup(function() {
    $.get($("#tickets_search").attr("action"), $("#tickets_search").serialize(), null, "script");
    return false;
  });
  $("#users_search input").keyup(function() {
    $.get($("#users_search").attr("action"), $("#users_search").serialize(), null, "script");
    return false;
  });
  $("#assets_search input").keyup(function() {
    $.get($("#assets_search").attr("action"), $("#assets_search").serialize(), null, "script");
    return false;
  });
  $("#softwares_search input").keyup(function() {
    $.get($("#softwares_search").attr("action"), $("#softwares_search").serialize(), null, "script");
    return false;
  });
  $("#purchases_search input").keyup(function() {
    $.get($("#purchases_search").attr("action"), $("#purchases_search").serialize(), null, "script");
    return false;
  });
});