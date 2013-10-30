application = require('application');

SensorCollection = require('models/sensor-collection');

SensorCollectionView = require('views/sensor-collectionview');

module.exports = Router = Backbone.Router.extend({

  routes : {
    '': 'dashboard',
    'about': 'about',
    'contact': 'contact',
    'signin': 'signin',
    'dashboard': 'dashboard',
    'temperature' : 'temperature'
  },

  dashboard: function(){

    sensorCollection = new TemperatureCollection();
    sensorModels = [ "temperature", "door"];

    sensorModels.forEach(
      function(sensorModel, callback){
        sensorCollection.fetch({
          success : function(){
            if(sensorModel == 'temperature'){
              filteredCollection = new SensorCollection(
                sensorCollection.filter(
                  function(sensor){
                    return (sensor.get('model') == sensorModel);
                  }
                )
              );
            
              view = new SensorCollectionView({collection : filteredCollection});
              application.layout.contentTemperature.show(view);
            }
            
            else {
              filteredCollection = new SensorCollection(
                sensorCollection.filter(
                  function(sensor){
                    return (sensor.get('model') == sensorModel);
                  }
                )
              );

              view = new SensorCollectionView({collection : filteredCollection});
              application.layout.contentDoor.show(view);
            }
        }
      });
    });
    
  }
});
