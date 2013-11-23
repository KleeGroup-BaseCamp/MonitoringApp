
module.exports = class ChartJSSensorView extends Backbone.Marionette.ItemView

    id: 'chart-sensor-view',
    template: 'views/templates/chart-sensor'
    
    fetch: ->
        console.log @model
        url =  'http://127.0.0.1:4000/sensor/' + 'TEMP_1' + '/all/'
        $.get url, 
            success: (data) ->
                console.log data
                #model.set('data', data.)
            error : (error) ->
                console.log "Fetch failed"
        return

    initialize: ->
        this.fetch()
                


    render : =>
        super
        `        var data = {
            labels : ["January","February","March","April","May","June","July"],
        datasets : [
        {
            fillColor : "rgba(220,220,220,0.5)",
            strokeColor : "rgba(220,220,220,1)",
            pointColor : "rgba(220,220,220,1)",
            pointStrokeColor : "#fff",
            data : [65,59,90,81,56,55,40]
        },
        {
            fillColor : "rgba(151,187,205,0.5)",
            strokeColor : "rgba(151,187,205,1)",
            pointColor : "rgba(151,187,205,1)",
            pointStrokeColor : "#fff",
            data : [28,48,40,19,96,27,100]
        }
    ]
}`
        ctx = @$el.children("#chart-sensor").get(0).getContext("2d")
        @chart = new Chart(ctx).Line(data,{});
