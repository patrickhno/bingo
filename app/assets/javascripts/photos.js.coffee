# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('#prev_album').click( () ->

	args =
		format: "json"
	$.getJSON("/albums/",args, (data) ->
		albums = []
		data.forEach((item) ->
			albums.push(item)
		)

		album_i = parseInt($("#current_album").val())
		prev_i  = (album_i-1+albums.length) % albums.length

		ajax =
  			url: "/albums/" + albums[prev_i].id + "/photos/" + albums[prev_i].photos[0],
  			context: document.body,
  			success: (html) ->
    			$("#photo-view").replaceWith(html)
    			$("#current_album").val(prev_i)
    			$("#current_photo").val(0)

		$.ajax(ajax)
	)

)

$('#next_album').click( () ->

	args =
		format: "json"
	$.getJSON("/albums/",args, (data) ->
		albums = []
		data.forEach((item) ->
			albums.push(item)
		)

		album_i = parseInt($("#current_album").val())
		next_i = (album_i + 1) % albums.length

		ajax =
  			url: "/albums/" + albums[next_i].id + "/photos/" + albums[next_i].photos[0],
  			context: document.body,
  			success: (html) ->
    			$("#photo-view").replaceWith(html)
    			$("#current_album").val(next_i)
    			$("#current_photo").val(0)

		$.ajax(ajax)
	)

)

$('#prev_photo').click( () ->

	args =
		format: "json"
	$.getJSON("/albums/",args, (data) ->
		albums = []
		data.forEach((item) ->
			albums.push(item)
		)

		album_i = parseInt($("#current_album").val())
		photo_i = parseInt($("#current_photo").val())
		prev_i = (photo_i-1+albums[album_i].photos.length) % albums[album_i].photos.length

		ajax =
  			url: "/albums/" + albums[album_i].id + "/photos/" + albums[album_i].photos[prev_i],
  			context: document.body,
  			success: (html) ->
    			$("#photo-view").replaceWith(html)
    			$("#current_photo").val(prev_i)

		$.ajax(ajax)
	)

)

$('#next_photo').click( () ->

	args =
		format: "json"
	$.getJSON("/albums/",args, (data) ->
		albums = []
		data.forEach((item) ->
			albums.push(item)
		)

		album_i = parseInt($("#current_album").val())
		photo_i = parseInt($("#current_photo").val())
		next_i = (photo_i+1) % albums[album_i].photos.length

		ajax =
  			url: "/albums/" + albums[album_i].id + "/photos/" + albums[album_i].photos[next_i],
  			context: document.body,
  			success: (html) ->
    			$("#photo-view").replaceWith(html)
    			$("#current_photo").val(next_i)

		$.ajax(ajax)
	)

)
