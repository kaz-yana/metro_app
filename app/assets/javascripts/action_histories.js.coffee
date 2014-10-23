# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  # 選択した旅履歴で更新
  $('.past-trip').click ->
    # TODO: 旅番号を取得する処理
    trip_no = $(this).data('trip-no')

    # ajaxで非同期に過去の旅情報を取得する
    $.ajax
      type: 'GET'
      url: '/action_histories/trip_histories_api'
      dataType: 'html'
      data: 
        'trip_no': trip_no
      success: (data, status, xhr) ->
        # 取得した情報で$('#trip_histoires')領域を更新する
        trip_histories = $(data)
        $('#trip_histories').remove()
        $('#trip_div').append(trip_histories)
      error: (xhr, status, error) ->
      complete: (xhr, status) ->

# Turbolinksによるajaxページ遷移のため再度イベントを設定
$(document).ready(ready)
$(document).on('page:load', ready)