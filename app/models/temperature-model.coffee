# Base class for all models.
module.exports = class TemperatureModel extends Backbone.Model
	defaults :
		room : 'Kitchen'
		temperature : '25°C'