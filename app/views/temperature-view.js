module.exports = TemperatureView = Backbone.Marionette.ItemView.extend({
	id: 'temperature-view',
	template: 'views/templates/temperature',
    
    initialize: function(){
           this.model.on('change', this.render, this);
    },

    events: {
        'click #refresh' : 'refresh',
    },

    refresh : function(){
        this.model.fetch();
    },
});
