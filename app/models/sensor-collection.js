SensorModel = require('models/sensor-model');

module.exports = SensorCollection = Backbone.Collection.extend({
    url: 'http://127.0.0.1:4000/sensors/',//Pass the url into a config.
    model: SensorModel
});