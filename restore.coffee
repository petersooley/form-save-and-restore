$ ->
	inputData = JSON.parse(localStorage.getItem('inputData'))
	taData = JSON.parse(localStorage.getItem('taData'))
	optionData = JSON.parse(localStorage.getItem('optionData'))

	console.log 'restoring...'

	i = 0
	for input in $('input')
		$input = $(input)
		if inputData[i] == null
			i++
			continue

		type = $input.attr('type')
		switch type
			when 'text', 'password'
				$input.val(inputData[i]).change()
			when 'checkbox', 'radio'
				$input.attr('checked', 'checked').change()
		i++

	j = 0
	for textarea in $('textarea')
		$(textarea).val(taData[j]).change()
		j++

	k = 0
	for option in $('option')
		if optionData[k] != null
			$(option).attr('selected', 'selected').change()
		k++