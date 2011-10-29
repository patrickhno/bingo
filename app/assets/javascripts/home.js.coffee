
$(document).ready ->

	tree =
		themes:
			theme: "apple",
			dots:  false, 
			icons: false
		plugins: ["themes","html_data","ui"]

	$("#tree-view").jstree(tree).bind("select_node.jstree", (event, data) ->
		path = data.rslt.obj.attr("id")
		args =
			format: "json"
		$.getJSON("/albums/",args, (data) ->
			album_id = path.split('/')[1]
			photo_id = path.split('/')[3]

			album_i = 0
			photo_i = 0
			n = 0
			data.forEach((item) ->
				if item.id == album_id
					album_i = n
					p_n = 0
					item.photos.forEach((photo) ->
						if photo_id == photo
							photo_i = p_n
						p_n += 1
					)
				n += 1
			)

			$.ajax(
					url: path,
					context: document.body,
					success: (html) ->
						$("#photo-view").replaceWith(html)
						$("#current_album").val(album_i)
						$("#current_photo").val(photo_i)
				)
		)
	)
