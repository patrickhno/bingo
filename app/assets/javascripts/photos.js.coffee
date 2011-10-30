# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#
# hook up all page elements
#

$('#prev_album').click( () ->
	Album.previous()
)

$('#next_album').click( () ->
	Album.next()
)

$('#prev_photo').click( () ->
	Album.previous_photo()
)

$('#next_photo').click( () ->
	Album.next_photo()
)

