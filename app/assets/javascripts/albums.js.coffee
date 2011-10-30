# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class @Album
	this.initialize = () ->
		window.album  = 0
		window.photo = 0
		window.albums = []

		args =
			type: 'GET'
			url: "/albums/",
			dataType: 'json',
			success: (data) ->
				data.forEach((item) ->
					window.albums.push(item)
				)
				Album.paint()
			data: {}
			async: false

		$.ajax(args)

	this.album = (n = -1) ->
		this.initialize() unless window.album?

		if n >= 0
			window.album = n
			window.photo = 0
		return window.album

	this.photo = (n = -1) ->
		this.initialize() unless window.photo?

		window.photo = n if n >= 0
		return window.photo

	this.previous = () ->
		this.album((this.album()+window.albums.length-1) % window.albums.length)
		this.paint()

	this.next = () ->
		this.album((this.album()+1) % window.albums.length)
		this.paint()

	this.previous_photo = () ->
		this.photo((this.photo()+window.albums[this.album()].photos.length-1) % window.albums[this.album()].photos.length)
		this.paint()

	this.next_photo = () ->
		this.photo((this.photo()+1) % window.albums[this.album()].photos.length)
		this.paint()

	this.paint = () ->
		$("#tree-view").jstree("deselect_all")
		path = "#albums_" + window.albums[this.album()].id + "_photos_" + window.albums[this.album()].photos[this.photo()]
		$("#tree-view").jstree("select_node", $(path))

	this.selected = (id) ->
		this.initialize() unless window.album?

		album_id = id.split('/')[1]
		photo_id = id.split('/')[3]

		a_n = 0
		window.albums.forEach((album) ->
			if album.id == album_id
				p_n = 0
				album.photos.forEach((photo) ->
					if photo == photo_id
						window.album = a_n
						window.photo = p_n
					p_n += 1
				)
			a_n += 1
		)
