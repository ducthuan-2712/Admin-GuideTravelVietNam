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
//= require_tree .

'use strict';

function remove_unicode(str)
{
   str= str.toLowerCase();
   str= str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g,"a");
   str= str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g,"e");
   str= str.replace(/ì|í|ị|ỉ|ĩ/g,"i");
   str= str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g,"o");
   str= str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g,"u");
   str= str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g,"y");
   str= str.replace(/đ/g,"d");
   str= str.replace(/!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'| |\"|\&|\#|\[|\]|~|$|_/g,"-");

   str= str.replace(/-+-/g,"-"); //thay thế 2- thành 1-
   str= str.replace(/^\-+|\-+$/g,"");

   return str;
}

$(document).ready(function() {
  $(document).on('click', '.mdc-list-item-open-diablog', function() {
    $('#mdc-dialog-with-list').toggleClass('mdc-dialog--open');
    $('body').addClass('mdc-dialog-scroll-lock');
  })

  $(document).on('click', '#close-modal', function() {
    $(this).closest('.mdc-dialog').toggleClass('mdc-dialog--open');
    $('body').removeClass('mdc-dialog-scroll-lock');
  })

  $(document).on('submit', '#submit-destination-form', function(e) {
    e.preventDefault();
    var name = $("#destination_name").val();
    $("#destination_format_name").val(remove_unicode(name.split(' ').join('-').toLowerCase()));
    $("#submit-destination-form").trigger('submit.rails');
  })
  $(document).on('keyup', '#destination_name', function() {
    var name = $(this).val();
    $("#destination_format_name").val(remove_unicode(name.split(' ').join('-').toLowerCase()));
  })

  $(document).on('submit', '#submit-destination-type-form', function(e) {
    e.preventDefault();
    var name = $("#destination_type_name").val();
    $("#destination_type_format_name").val(remove_unicode(name.split(' ').join('-').toLowerCase()));
    $("#submit-destination-form").trigger('submit.rails');
  })
  $(document).on('keyup', '#destination_type_name', function() {
    var name = $(this).val();
    $("#destination_type_format_name").val(remove_unicode(name.split(' ').join('-').toLowerCase()));
  })

  $(document).on('submit', '#submit-place-form', function(e) {
    e.preventDefault();
    var name = $("#place_name").val();
    $("#place_format_name").val(remove_unicode(name.split(' ').join('-').toLowerCase()));
    $("#submit-place-form").trigger('submit.rails');
  })
  $(document).on('keyup', '#place_name', function() {
    var name = $(this).val();
    $("#place_format_name").val(remove_unicode(name.split(' ').join('-').toLowerCase()));
  })

  // Block Material JS
  window.mdc.autoInit();
  var tabBar = new mdc.tabBar.MDCTabBar(document.querySelector('.mdc-tab-bar'));
  var contentEls = document.querySelectorAll('.content');
  tabBar.listen('MDCTabBar:activated', function(event) {
    // Hide currently-active content
    document.querySelector('.content--active').classList.remove('content--active');
    // Show content for newly-activated tab
    contentEls[event.detail.index].classList.add('content--active');
  });
  // End Block Material JS
})
