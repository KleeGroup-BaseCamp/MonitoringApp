application = require('application');

SensorCollection = require('models/sensor-collection');
RoomCollection = require('models/room-collection');

SensorCollectionView = require('views/sensor-collectionview');
RoomsCollectionView = require('views/rooms-collectionview');

module.exports = Router = Backbone.Router.extend({

  routes : {
    '': 'dashboard',

    'dashboard': 'dashboard',
    'rooms' : 'rooms'
  },

  rooms: function(){
    roomCollection = new RoomCollection();
    
    roomCollection.fetch({
      success : function(){
        console.log(roomCollection.models);
        view = new RoomsCollectionView({collection : roomCollection});
        application.layout.content.show(view);
        console.log(roomCollection.models);
      },
      error : function(err){
        console.log(err);
      }
    });
  },

  dashboard: function(){

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
