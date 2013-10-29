application = require 'application'
FooterView = require 'views/footer-view'
HomeView = require 'views/home-view'
AboutView = require 'views/about-view'
ContactView = require 'views/contact-view'
SigninView = require 'views/signin-view'
TemperatureView = require 'views/temperature-view'

TemperatureCollectionView = require 'views/temperature-collectionview'

TemperatureModel = require 'models/temperature-model'

TemperatureCollection = require 'models/temperature-collection'

module.exports = class Router extends Backbone.Router

	routes:
    '': 'home'
    'about': 'about'
    'contact': 'contact'
    'signin': 'signin'
    'temperature': 'temperature'
  home: =>
    view = new HomeView()
    application.layout.content.show(view)
    application.layout.footer.show(
      new FooterView
        model: new Backbone.Model
          name: 'home'
          time: moment().format('MMMM Do YYYY, h:mm:ss a')
      )

  about: =>
    view = new AboutView()
    application.layout.content.show(view)
    application.layout.footer.show(
      new FooterView
        model: new Backbone.Model
          name: 'about'
          time: moment().format('MMMM Do YYYY, h:mm:ss a')
    )

  contact: =>
    view = new ContactView()
    application.layout.content.show(view)
    application.layout.footer.show(
      new FooterView
        model: new Backbone.Model
          name: 'contact'
          time: moment().format('MMMM Do YYYY, h:mm:ss a')
      )

  signin: =>
    view = new SigninView()
    application.layout.content.show(view)
    application.layout.footer.show(
      new FooterView
        model: new Backbone.Model
          name: 'signin'
          time: moment().format('MMMM Do YYYY, h:mm:ss a')
      )

  temperature: =>
    temperatureModel1 = new TemperatureModel
      room : "Bathroom"
      temperature : "27°C"
    temperatureModel2 = new TemperatureModel
      room : "Bedroom"
      temperature : "23°C"
    temperatureCollection = new TemperatureCollection [temperatureModel1, temperatureModel2]
    view = new TemperatureCollectionView(collection :   temperatureCollection)
    application.layout.content.show(view)
    application.layout.footer.show(
      new FooterView
        model: new Backbone.Model
          name: 'temperature'
          time: moment().format('MMMM Do YYYY, h:mm:ss a')
      )