$ ->
	url = window.location.pathname
	key = 'formSaveAndRestore'
	data = localStorage.getItem(key)
	return unless data
	savedData = JSON.parse(data)
	return unless savedData[url]
	saved = savedData[url]


	# INPUT ELEMENTS

	for name, savedInputs of saved.inputs
		# find all inputs with this name and loop through them
		inputs = $('input[name="'+name+'"]')
		i = 0
		for input in inputs
			++i
			# only set a value if a value was saved for it
			if i of savedInputs
				val = savedInputs[i]

				# set the value based on this elements type
				switch $(input).attr('type')
					when 'checkbox','radio'
						$(input).prop('checked', val == 'checked').change()
					when 'text','password','date','datetime','datetime-local','email','color','month','number','range','tel','url','week'
						$(input).val(val).change()



	# TEXTAREA ELEMENTS

	for name, savedTexts of saved.texts
		# find all texts with this name and loop through them
		texts = $('textarea[name="'+name+'"]')
		i = 0
		for textarea in texts
			++i
			# only set a value if a value was saved for it
			if i of savedTexts
				$(textarea).val(savedTexts[i]).change()



	# SELECT ELEMENTS

	for name, savedSelects of saved.selects
		# find all selects with this name and looop through them
		selects = $('select[name="'+name+'"]')
		i = 0
		for select in selects
			++i
			# only set a value if a value was saved for it
			if i of savedSelects
				$(select).val(savedSelects[i]).change()


