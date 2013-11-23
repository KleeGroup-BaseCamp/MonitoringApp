module.exports = class MoistureView extends Backbone.Marionette.ItemView
    id: 'moisture-view'
    template: 'views/templates/moisture'
    
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
        
        @p.moistureEnd= Math.round(@model.get("data").value)
    
    sketchProc: (p)->
        p.setup= ->
            @moisture = 7
            @moistureEnd = 50
            @width = 200
            p.size @width, @width
            # Draw arc
            #  
            @drawArc(@moisture)
            
        p.draw= ->

            @width = jQuery("div.col-lg-4").width()
            
            p.size @width, @width

            if (@moistureEnd != @moisture)
              if( @moistureEnd > @moisture)
                @moisture += 1
              else if( @moistureEnd < @moisture)
                @moisture -= 1
              
            @drawArc(@moisture)  
            

        p.drawArc= (moisture)->
            # Set background
            p.background 0, 0  

            
            # Draw center cicle to hide part of the arc
            p.color c = p.color 37, 44, 153
            p.fill c
            p.arc p.width/2, p.width/2, p.width*12/16, p.width*12/16 , -p.PI/2, (moisture/100)*12/8*p.PI
            #p.stroke 37, 44, 153
            #p.rect 0, 0, p.width/4, p.width
            
            p.color c = p.color 255
            p.fill c
            p.noStroke()
            p.ellipse p.width/2, p.width/2, p.width*10/16, p.width*10/16
            
            # Write moisture
            p.color c = p.color  37, 44, 53
            p.fill c
            p.textSize 40
            p.textAlign p.CENTER, p.CENTER
            p.text @moisture.toString() + "%", p.width/2, p.width/2
       
        mouseClicked= ->
            @moistureEnd = Math.round(Math.random()*40) + 10

  

