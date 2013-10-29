TemperatureModel = require 'models/temperature-model'

module.exports = class TemperatureCollection extends Backbone.Collection
	model : TemperatureModel