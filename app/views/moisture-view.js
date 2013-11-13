module.exports = MoistureView = Backbone.Marionette.ItemView.extend({
	id: 'moisture-view',
	template: 'views/templates/moisture',

	initialize: function(){
           this.model.on('change', this.render, this);
    },

	events: {
		'click #refresh' : 'refresh'
	},

	refresh : function(){
		this.model.fetch();
	}
});
  

