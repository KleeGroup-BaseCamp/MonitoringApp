module.exports = SensorModel = Backbone.Model.extend({
	idAttribute: 'sensor_id',
	defaults : {
		data : {
			value : 0
		}
	},
	initialize : function(){
		
		modelName = this.get('model');
		modelName = modelName[0].toUpperCase() + modelName.slice(1);

		this.set('name', modelName);
		
		if(!this.get('data')){
			this.fetch();

		}
	}
});