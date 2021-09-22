# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# You can use CoffeeScript in this file: http://coffeescript.org/
# jQuery ($) ->
#   #data-hrefの属性を持つtrを選択しclassにclickableを付加
#   $('tr[data-href]').addClass('clickable').click (e) ->
#     #e.targetはクリックした要素自体、それがa要素以外であれば
#     if !$(e.target).is('a')
#       #その要素の先祖要素で一番近いtrの
#       #data-href属性の値に書かれているURLに遷移する
#       window.open($(e.target).closest('tr').data('href'), "_blank");
#     return
#   return

$ ->
  $('#mylist-dropdown').hide()

  data = {
    stock_id: 1
    mylist_id: 1
  }
  $.ajax '/stock/ajax_disp_chart',
    type: 'POST'
    dataType: 'html'
    data: data
    error: (jqXHR, textStatus, errorThrown) ->
      $('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
      $('#chart_container').html(data)
      $('.tradingview-widget-container').css('height','400px')
      $('.tradingview-widget-copyright').html('銘柄を選択時、チャートが表示されます')

$ ->
  $('.table-index-tr').click (e) ->
    data = {
      stock_id: e.currentTarget.dataset.stockid
      mylist_id: e.currentTarget.dataset.mylistid
    }
    $.ajax '/stock/ajax_disp_chart',
      type: 'POST'
      dataType: 'html'
      data: data
      error: (jqXHR, textStatus, errorThrown) ->
        $('body').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        $('#stock-chart').html(data)
        $('.tradingview-widget-container').css('height','400px')
        $('.tradingview-widget-copyright').remove()
    
    $('#mylist-dropdown').css(top: e.pageY)
    $('#mylist-dropdown').css(left: e.pageX)
    $('#mylist-dropdown').fadeIn()

    $('#trd-idea-link').attr("href", e.currentTarget.dataset.href)
    $('.add-list').attr('data-stockid', e.currentTarget.dataset.stockid)
    return
  return

ivnt_keydown = (e) ->
  # ESCAPE key pressed
  if e.keyCode == 27
    $('#mylist-dropdown').fadeOut()

  return

$ ->
  $(document).keydown ivnt_keydown
  return

$ ->
  $('.add-list').click (e) ->
    data = {
      stock_id: e.currentTarget.dataset.stockid
      mylist_id: e.currentTarget.dataset.mylistid
    }

    $.ajax '/stock/add_stock_mylist',
      type: 'POST'
      dataType: 'html'
      data: data
      error: (jqXHR, textStatus, errorThrown) ->
        $('body').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        $('body').append "Successful AJAX call: #{data}"

    $('#mylist-dropdown').fadeOut()

# $ ->
#   $('#mylist-dropdown').click (e) ->
#     if e.currentTarget.id == 'mylist-dropdown'
#       return
#     $('#mylist-dropdown').fadeOut()
#     return