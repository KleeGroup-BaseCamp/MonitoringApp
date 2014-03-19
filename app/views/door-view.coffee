module.exports = class DoorView extends Backbone.Marionette.ItemView
  id: 'door-view',
  template: 'views/templates/door',
  
  initialize: ->
    #this.model.on('change', @render, @)
    this.model.on(
            'change',
            () -> 
                if(!@p)
                    @render
                else
                    @p.temperatureEnd = @p.status= @model.get("data")[0].value
                    @p.loop()
            ,
            @
        )
  events:
    'click #refresh' : 'refresh'

  refresh : ->
    this.model.fetch()

  render : =>
    
    if(!@p)
      super
      canvas = @$el.find(".canvas").get(0)
      @p = new Processing(canvas, @sketchProc)
    @p.width = @$el.width()
    
    if @model.get("data").length > 0
      @p.status= @model.get("data")[0].value
    else
      @p.status= 0

  sketchProc: (p)->

    
    p.setup= ->
      
      @width = 176
      
      p.size @width, @width

      @drawStatus(@status)
      
    p.draw=->

      @width = jQuery("div.col-lg-4").width()

      p.size @width, @width
      
      @drawStatus(@status)
      p.noLoop()

    p.drawStatus=(status) ->
      # Set background
      p.background 0, 0

      # Draw center cicle to hide part of the arc
      p.color c = p.color 37, 44, 53
      p.fill c
      p.noStroke()
      p.ellipse p.width/2, p.width/2, p.width*10/16, p.width*10/16
      
      # Write temperature
      p.color c = p.color 255
      p.fill c

      #Change status from number to status
      if (status == 0)
        status = "Closed"
      else if (status == 1)
        status = "Opened"
      else
        status = "Closed"

      p.textSize 30
      p.textAlign p.CENTER, p.CENTER
      p.text status, p.width/2, p.width/2
