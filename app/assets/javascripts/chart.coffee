# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#area_id').change ->
    $('form').attr 'action', '/chart/index'
    $('form').submit()
    return
  return

$ ->
  $('.grid-select').change ->
    $('.blog-card').css('width', '100%') if $('.grid-select option:selected').val() == '2'
    $('.blog-card').css('width', '30%') if $('.grid-select option:selected').val() == '1'
    return
  return