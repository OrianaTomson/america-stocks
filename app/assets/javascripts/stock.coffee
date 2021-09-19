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

$ ->
  $('.table-index-tr').click (e) ->
    $('#mylist-dropdown').css(top: e.pageY)
    $('#mylist-dropdown').css(left: e.pageX)
    $('#mylist-dropdown').show()

    $('#trd-idea-link').attr("href", e.currentTarget.dataset.href)
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