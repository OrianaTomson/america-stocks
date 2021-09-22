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
    $('.blog-card').css('width', '100%') if $('.grid-select option:selected').val() == '1'
    $('.blog-card').css('width', '32%') if $('.grid-select option:selected').val() == '2'
    return
  return

$ ->
  $('.btn-circle-3d').click (e) ->
    data = {
      stock_id: e.currentTarget.dataset.stockid
      mylist_id: e.currentTarget.dataset.mylistid
    }

    $.ajax '/chart/ajax_delete_from_mylist',
      type: 'POST'
      dataType: 'html'
      data: data
      error: (jqXHR, textStatus, errorThrown) ->
        $('body').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        $('body').append "Successful AJAX call: #{data}"

    e.currentTarget.parentElement.remove()