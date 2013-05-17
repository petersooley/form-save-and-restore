$ ->
	$('#save-button').click(->
		chrome.tabs.executeScript(null,
			file: 'jquery.js'
		)
		chrome.tabs.executeScript(null,
			file: 'save.js'
		)
		window.close();
	)
	$('#restore-button').click(->
		chrome.tabs.executeScript(null,
			file: 'jquery.js'
		)
		chrome.tabs.executeScript(null,
			file: 'restore.js'
		)
		window.close();
	)