DoorView = require 'views/door-view'

module.exports = class DoorCollectionView extends Backbone.Marionette.CollectionView
	itemView : DoorView