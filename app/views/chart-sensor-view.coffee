
module.exports = class ChartSensorView extends Backbone.Marionette.ItemView
    id: 'chart-sensor-view',
    template: 'views/templates/chart-sensor'
    
    render : =>
        super
        console.log("Test")
        console.log(@$el.children("#chart-sensor"))
        canvas = @$el.children("#chart-sensor").get(0)
        p = new Processing(canvas, @sketchProc);

    sketchProc : (processing)->
        #// Override draw function, by default it will be called 60 times per second
        processing.setup = ->
            processing.size(1000, 200)
            processing.background(255);
            processing.line 0,
                190,
                1000,
                190
            processing.line 0,
                0,
                0,
                190
        

        


