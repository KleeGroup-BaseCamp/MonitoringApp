RoomModel = require('models/room-model');

module.exports = RoomCollection = Backbone.Collection.extend({
    url: 'http://127.0.0.1:4000/rooms/',
    model: RoomModel

});