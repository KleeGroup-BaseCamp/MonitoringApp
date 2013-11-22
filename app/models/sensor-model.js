module.exports = SensorModel = Backbone.Model.extend({
	idAttribute: 'sensor_id',
	defaults : {
		room : 'Kitchen',
		data : {
			value : 0
		}
	},
	initialize : function(){
		if(!this.get('data')){
			console.log(this.get('model'));
			console.log("Fetching data for new model");
			this.fetch();
		}
	}
});