@Color = do (Backbone, Marionette) ->
  
  App = new Marionette.Application
  
  App.addRegions
    mainRegion: "#main-region"
    footerRegion: "#footer-region"
  
  App.addInitializer ->
    App.module("MainApp").start()
    App.module("FooterApp").start()
  
  App.on "initialize:after", ->
    if Backbone.history
      Backbone.history.start()
  App