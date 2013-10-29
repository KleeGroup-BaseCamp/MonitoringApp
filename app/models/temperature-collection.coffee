TemperatureModel = require 'models/temperature-model'

module.exports = class TemperatureCollection extends Backbone.Collection
	url: 'http://127.0.0.1:4000/sensor/'
	model : TemperatureModel