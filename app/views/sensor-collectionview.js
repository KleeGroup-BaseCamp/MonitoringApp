TemperatureView = require('views/temperature-view');
DoorView = require('views/door-view');
MoistureView = require('views/moisture-view');
PresenceView = require('views/presence-view');

module.exports = SensorCollectionView = Backbone.Marionette.CollectionView.extend({

    getItemView: function(sensor) {
    	//Use a switch function
        if (sensor.get('model') == 'temperature') return TemperatureView;
        if (sensor.get('model') == 'door') return DoorView;
        if (sensor.get('model') == 'moisture') return MoistureView;
        if (sensor.get('model') == 'presence') return PresenceView;
        else return TemperatureView;
    }
});