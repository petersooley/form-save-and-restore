$ ->


	# INPUT ELEMENTS

	inputs = {}
	for input in $('input')

		# skip hidden elements
		continue unless $(input).is(':visible')

		name = $(input).attr('name')
		type = $(input).attr('type')

		# skip it if we already got the values for this name
		continue if name of inputs

		# get values for each input with this name
		# these will be indexed instead of hashed
		foundInputs = {}
		i = 0
		foundOne = false
		for input in $('input[name="'+name+'"]')
			++i
			continue unless $(input).is(':visible')
			switch type
				when 'checkbox','radio'
					foundInputs[i] = if $(input).is(':checked') then 'checked' else ''
					foundOne = true
				when 'text','password','date','datetime','datetime-local','email','color','month','number','range','tel','url','week'
					foundInputs[i] = $(input).val()
					foundOne = true

		# save by name
		if foundOne
			inputs[name] = foundInputs



	# TEXTAREA ELEMENTS

	texts = {}
	for textarea in $('textarea')

		# skip hidden elements
		continue unless $('textarea').is(':visible')

		name = $(textarea).attr('name')

		# skip it if we already got the values for this name
		continue if name of texts

		# get values for each textarea with this name
		# these will be indexed instead of hashed
		foundTexts = {}
		i = 0
		foundOne = false
		for textarea in $('textarea[name="'+name+'"]')
			++i
			continue unless $(textarea).is(':visible')
			foundTexts[i] = $(textarea).val()
			foundOne = true

		# save by name
		if foundOne
			texts[name] = foundTexts



	# SELECT ELEMENTS

	selects = {}
	for select in $('select')

		# skip hidden elements
		continue unless $(select).is(':visible')

		name = $(select).attr('name')

		# skip it if we already got the values for this name
		continue if name of selects

		# get values for each textarea with this name
		# these will be indexed instead of hashed
		foundSelects = {}
		i = 0
		foundOne = false
		for select in $('select[name="'+name+'"]')
			++i
			continue unless $(select).is(':visible')
			val = $(select).val()
			foundOne = true
			if val instanceof Array
				foundSelects[i] = val
			else
				foundSelects[i] = [val]

		# save by name
		if foundOne
			selects[name] = foundSelects



	# SAVE DATA

	url = window.location.pathname
	key = 'formSaveAndRestore'
	data = localStorage.getItem(key)
	savedData = if data then JSON.parse(data) else {}

	savedData[url] =
		inputs: inputs
		texts: texts
		selects: selects

	localStorage.setItem(key, JSON.stringify(savedData))
