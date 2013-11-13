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
    sensorCollection = new SensorCollection();

    sensorCollection.fetch({
      success : function(){
        view = new SensorCollectionView({collection : sensorCollection});
        application.layout.content.show(view);
      },
      error : function(err){
        console.log(err);
      }
    });
  }

});
