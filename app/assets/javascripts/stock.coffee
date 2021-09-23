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

  if $('#stock').length > 0
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

$ ->
  $('.table-index-tr').click (e) ->
    if $('.loader001').length == 0
      $('#stock-chart').append("<div class='loader001'></div>")
      $('.loader001').css('top','-50%')

    $('.loader001').show()
    ajax_disp_chart e.currentTarget.dataset.stockid, e.currentTarget.dataset.mylistid
    sleep(2000)
    $('.loader001').fadeOut()

# When right click stock list
$ ->
  $(document).on 'contextmenu', '.table-index-tr', (e) ->
    e.preventDefault()
    $('#mylist-dropdown').css(top: e.pageY)
    $('#mylist-dropdown').css(left: e.pageX)
    $('#mylist-dropdown').fadeIn()

    $('#trd-idea-link').attr("href", e.currentTarget.dataset.href)
    $('.add-list').attr('data-stockid', e.currentTarget.dataset.stockid)
    $('#stock_id_for_id').val(e.currentTarget.dataset.stockid)
    return
  return

# When touch keys
$ ->
  $(document).keydown ivnt_keydown
  return

ivnt_keydown = (e) ->
  # ESCAPE key pressed
  if e.keyCode == 27
    $('#mylist-dropdown').fadeOut()

  return

# When Add stock MyList
$ ->
  $(document).on 'click', '.add-list', (e) ->
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

# Slide Show
$ ->
  $('#gooey-button').click (e) ->
    $('.icon-movie').hide()
    $('.slide-load').show()
    pics_src = $('.table-index-tr')
    max = pics_src.length - 1
    num = 0

    ajax_disp_chart pics_src[num].dataset.stockid, pics_src[num].dataset.mylistid

    slideshow_timer = ->
      num++
      
      if max == num
        clearInterval slideshow_timer

      ajax_disp_chart pics_src[num].dataset.stockid, pics_src[num].dataset.mylistid

    setInterval slideshow_timer, 10000
  return

# function: get tradingview chart for stock page
ajax_disp_chart = (stock_id, mylist_id) ->
  data = {
    stock_id: stock_id
    mylist_id: mylist_id
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

# $ ->
#   $('#mylist-dropdown').click (e) ->
#     if e.currentTarget.id == 'mylist-dropdown'
#       return
#     $('#mylist-dropdown').fadeOut()
#     return