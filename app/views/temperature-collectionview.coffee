TemperatureView = require 'views/temperature-view'

module.exports = class TemperatureCollectionView extends Backbone.Marionette.CollectionView
	itemView : TemperatureView