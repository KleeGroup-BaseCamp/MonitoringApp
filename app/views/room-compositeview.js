SensorCollection = require('models/sensor-collection');

module.exports = RoomView = Backbone.Marionette.CompositeView.extend({
	template: 'views/templates/room',
	getItemView: function(sensor) {
		console.log("Getting itemView");
		if (sensor.get('model') == 'temperature') return TemperatureView;
		if (sensor.get('model') == 'door') return DoorView;
		if (sensor.get('model') == 'moisture') return MoistureView;

	},
	//itemViewContainer : 'div.sensors',
	appendHtml: function(collectionView, itemView, index) {
		console.log(itemView.el);
		collectionView.$("div.sensors.row").append(itemView.el);
	},


	initialize: function() {
		this.collection = new SensorCollection(this.model.get('sensors'));
		console.log("Collection :");
		console.log(this.collection);

	}
});