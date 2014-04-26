# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#micropost_content').on 'keyup change', (e) ->
		elt = $ e.target
		max = elt.attr 'maxlength'
		left = max - elt.val().length
		chars_left = $ '#chars_left'
		if left >= 0
			chars_left.text left
		else
			elt.val elt.val().slice(0,max)