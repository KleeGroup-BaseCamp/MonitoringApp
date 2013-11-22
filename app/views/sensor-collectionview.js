TemperatureView = require('views/temperature-view');
DoorView = require('views/door-view');
MoistureView = require ('views/moisture-view');

module.exports = SensorCollectionView = Backbone.Marionette.CollectionView.extend({

	getItemView : function(sensor){
		if(sensor.get('model') == 'temperature')	return TemperatureView;
		if(sensor.get('model') == 'door')			return DoorView;
		if(sensor.get('model') == 'moisture')		return MoistureView;
		else return TemperatureView;
	}
 });
	