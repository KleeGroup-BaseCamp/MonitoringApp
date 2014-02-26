module.exports = class DoorView extends Backbone.Marionette.ItemView
    id: 'door-view',
    template: 'views/templates/door',
    
    initialize: ->
             this.model.on('change', @render, @)

    events: 
        'click #refresh' : 'refresh'

    refresh : ->
        this.model.fetch()