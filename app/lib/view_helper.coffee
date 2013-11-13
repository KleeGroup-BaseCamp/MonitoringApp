# Put your handlebars.js helpers here.

Handlebars.registerHelper 'pick', (val, options) ->
	return options.hash[val]

Handlebars.registerHelper 'isOpened', (doorOpened, options) ->
  	if (doorOpened == "1")
    	return options.fn(this)
    else
    	return options.inverse(this)