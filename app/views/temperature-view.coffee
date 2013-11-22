module.exports = class TemperatureView extends Backbone.Marionette.ItemView
    id: 'temperature-view',
    template: 'views/templates/temperature',
    
    initialize: ->
             this.model.on('change', @render, @)

    events: 
        'click #refresh' : 'refresh'

    refresh : ->
        this.model.fetch()

    render : =>
        super
        canvas = @$el.find(".canvas").get(0)
        p = new Processing(canvas, @sketchProc);
        p.temperatureEnd= Math.round(@model.get("data").value)
        p.width = canvas.width
        #p.temperature = @model.get("value")

    sketchProc: (p)->

        
        p.setup= ->
            
            @temperature = 0
            @temperatureEnd = 0
            @width = 200
            p.size @width, @width
            # Draw arc
            #  
            @drawArc(@temperature)
            
        p.draw=->
            if (@temperatureEnd != @temperature)
              if( @temperatureEnd > @temperature)
                @temperature += 1
              else if( @temperatureEnd < @temperature)
                @temperature -= 1
              
            @drawArc(@temperature)  
            

        p.drawArc= (temperature)->
            # Set background
            p.background 0, 0

            if (temperature > 26)
              p.color c = p.color 220, 0, 0
            else if (temperature < 18)
              p.color c = p.color 0, 0, 220
            else
              p.color c = p.color 0, 220, 0
            
            p.fill c
            p.noStroke()
            p.arc p.width/2, p.width/2, p.width*12/16, p.width*12/16 , -p.PI/2, (temperature/50)*12/8*p.PI
            
            # Draw center cicle to hide part of the arc
            p.color c = p.color 37, 44, 53
            p.fill c
            p.noStroke()
            p.ellipse p.width/2, p.width/2, p.width*10/16, p.width*10/16
            
            # Write temperature
            p.color c = p.color 255
            p.fill c
         
            p.textSize 40
            p.textAlign p.CENTER, p.CENTER
            p.text @temperature.toString() + "°C", p.width/2, p.width/2
            
        p.mouseClicked= ->
            @temperatureEnd = Math.round(Math.random()*40) + 10
     
