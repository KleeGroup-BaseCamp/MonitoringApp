module.exports = class PresenceView extends Backbone.Marionette.ItemView
    id: 'presence-view',
    template: 'views/templates/presence',
    
    initialize: ->
             this.model.on('change', @render, @)

    events: 
        'click #refresh' : 'refresh'

    refresh : ->
        this.model.fetch()

    render : =>
        
        if(!@p)
            super
            canvas = @$el.find(".canvas").get(0)
            @p = new Processing(canvas, @sketchProc);
        @p.width = @$el.width()
       # console.log "Div width: " + @$el.find("div.col-lg-3").width()
        console.log @model
        if @model.get("data").length > 0
            @p.presence= @model.get("data")[0].value
        else
            @p.presence= 1

    sketchProc: (p)->

        
        p.setup= ->
            
            @width = 176

            @radius = 0
            @count = 0
            @side = 1
            
            p.size @width, @width
            # Move arc
            #  
            @drawDisc(@presence)
            
        p.draw=->

            @width = jQuery("div.col-lg-4").width()
            
            p.size @width, @width

            @count += 1
            if (@count == 2)
                @radius = @radius + @side
                if (@radius == 100)
                    @side = -2
                else if (@radius == 0)
                    @side = 2
                @count = 0
            @drawDisc(@presence, @radius) 
            

        p.drawDisc= (presence, radius)->
            # Set background
            p.background 0, 0

            if (presence == 0)
              p.color c = p.color 224, 224, 224
            else if (presence == 1)
              p.color c = p.color 255, 165, 0
            else
              p.color c = p.color 224, 224, 224
            
            # Draw static disc
            p.fill c
            p.noStroke()
            p.ellipse p.width/2, p.width/2, p.width*10/16, p.width*10/16
            
            # Draw Dynamic disc
            if (presence == 1)
                p.fill c
                p.noStroke()
                p.ellipse p.width/2, p.width/2, p.width*(10+2*radius/100)/16, p.width*(10+2*radius/100)/16
            
            # Write presence
            p.color c = p.color 255
            p.fill c
            
            if (presence == 0)
              presence = "No Motion"
            else if (presence == 1)
              presence = "Motion"
            else
              presence = "No Motion"

            p.textSize 30
            p.textAlign p.CENTER, p.CENTER
            p.text presence, p.width/2, p.width/2