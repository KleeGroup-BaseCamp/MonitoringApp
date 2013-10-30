TemperatureView = require('views/temperature-view');
DoorView = require('views/door-view');

module.exports = SensorCollectionView = Backbone.Marionette.CollectionView.extend({

	getItemView : function(sensor){
		if(sensor.get('model') == 'temperature')	return TemperatureView;
		if(sensor.get('model') == 'door')			return DoorView;
	}
 });
	
