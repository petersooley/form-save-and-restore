$ ->
	inputData = []
	i = 0
	for input in $('input')
		$input = $(input)

		type = $input.attr('type')
		switch type
			when 'text','password'
				if $input.val() != ''
					inputData[i] = $input.val()
			when 'checkbox', 'radio'
				if $input.is(':checked')
					inputData[i] = 'checked'
		i += 1

	taData = []
	j = 0
	for textarea in $('textarea')
		taData[j] = $(textarea).val()
		j += 1

	optionData = []
	k = 0
	for option in $('option')
		if $(option).is(':selected')
			optionData[k] = 'selected'
		k++


	localStorage.setItem('inputData', JSON.stringify(inputData))
	localStorage.setItem('taData', JSON.stringify(taData))
	localStorage.setItem('optionData', JSON.stringify(optionData))
