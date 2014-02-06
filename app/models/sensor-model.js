module.exports = SensorModel = Backbone.Model.extend({
	idAttribute: 'sensor_id',
	defaults: {
		data: []
	},
	initialize: function() {

		modelName = this.get('model');
		modelName = modelName[0].toUpperCase() + modelName.slice(1);

		this.set('name', modelName);

		if (this.get('data').length === 0) {
			this.fetch();

		}
		//Code problem: => Need a callback function.
		var model = this;
		window.setInterval(function() {
			model.fetch();//Strange...
		}, 10000);
	}
});