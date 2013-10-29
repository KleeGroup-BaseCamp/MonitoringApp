
module.exports = class TemperatureModel extends Backbone.Model
	#urlRoot: 'http://127.0.0.1:4000/sensor'
	defaults :
		room : 'Kitchen'
		temperature : '25°C'

