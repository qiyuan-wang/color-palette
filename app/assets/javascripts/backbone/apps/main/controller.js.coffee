@Color.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  
  class MainApp.Controller extends Marionette.Controller
    initialize: (options) ->
      @region = options.region
      
    showMain: ->
      view = @getMainView()
      @region.show(view)
      
    getMainView: ->
      new MainApp.MainView