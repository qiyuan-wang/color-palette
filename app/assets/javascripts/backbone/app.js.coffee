@Color = do (Backbone, Marionette) ->
  
  App = new Marionette.Application
  
  App.addRegions
    mainRegion: "#main-region"
    
  App.on "initialize:after", ->
    if Backbone.history
      Backbone.history.start()
  App