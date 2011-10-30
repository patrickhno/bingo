
$(document).ready ->

	tree =
		themes:
			theme: "apple",
			dots:  false, 
			icons: false
		plugins: ["themes","html_data","ui"]

	$("#tree-view").jstree(tree).bind("select_node.jstree", (event, data) ->
		Album.selected(data.rslt.obj.attr("id").replace(/_/g,"/"))
		$.ajax(
			url: data.rslt.obj.attr("id").replace(/_/g,"/"),
			context: document.body,
			success: (html) ->
				$("#photo-view").replaceWith(html)
		)
	).bind("loaded.jstree", (event, data) ->
			Album.initialize()
		)

