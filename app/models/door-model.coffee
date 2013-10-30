module.exports = class DoorModel extends Backbone.Model
	defaults :
		room : 'Kitchen'
		status : 'Opened'
		isOpened : ->
			status == 'Opened'