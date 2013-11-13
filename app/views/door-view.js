module.exports = DoorView = Backbone.Marionette.ItemView.extend({
	id: 'door-view',
	template: 'views/templates/door',

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
  

