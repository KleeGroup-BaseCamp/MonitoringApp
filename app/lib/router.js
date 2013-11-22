application = require('application');

SensorCollection = require('models/sensor-collection');
RoomCollection = require('models/room-collection');

ChartJSSensorView = require('views/chartjs-sensor-view');
SensorCollectionView = require('views/sensor-collectionview');
RoomsCollectionView = require('views/rooms-collectionview');

module.exports = Router = Backbone.Router.extend({

  routes : {
    '': 'dashboard',
    'stats' : 'stats',
    'dashboard': 'dashboard',
    'rooms' : 'rooms'
  },

  stats: function(){
    $("#menu a").removeClass("active");
    $("#menu a#menu-stats").addClass("active");
    view = new ChartJSSensorView();
    application.layout.content.show(view);
  },

  rooms: function(){
    $("#menu a").removeClass("active");
    $("#menu a#menu-rooms").addClass("active");
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
    $("#menu a").removeClass("active");
    $("#menu a#menu-dashboard").addClass("active");
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
