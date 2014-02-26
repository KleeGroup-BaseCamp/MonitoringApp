TemperatureView = require('views/temperature-view');
DoorView = require('views/door-view');
MoistureView = require('views/moisture-view');
PresenceView = require('views/presence-view');

module.exports = SensorCollectionView = Backbone.Marionette.CollectionView.extend({

    getItemView: function(sensor) {

        if (sensor.get('model')['name'] == 'temperature') return TemperatureView;
        if (sensor.get('model')['name'] == 'door') return DoorView;
        if (sensor.get('model')['name'] == 'moisture') return MoistureView;

        else return TemperatureView;
    }
});