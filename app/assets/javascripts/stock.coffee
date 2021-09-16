# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ($) ->
  #data-hrefの属性を持つtrを選択しclassにclickableを付加
  $('tr[data-href]').addClass('clickable').click (e) ->
    #e.targetはクリックした要素自体、それがa要素以外であれば
    if !$(e.target).is('a')
      #その要素の先祖要素で一番近いtrの
      #data-href属性の値に書かれているURLに遷移する
      window.location = $(e.target).closest('tr').data('href')
    return
  return