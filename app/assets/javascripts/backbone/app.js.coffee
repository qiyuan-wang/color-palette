@Color = do (Backbone, Marionette) ->
  
  App = new Marionette.Application
  
  App.addRegions
    mainRegion: "#main-region"
  
  App.addInitializer ->
    App.module("ColorApp").start()
  
  App.on "initialize:after", ->
    if Backbone.history
      Backbone.history.start()
  App