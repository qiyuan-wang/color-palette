@Color.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false
  
  MainApp.on "start", ->
    controller = new MainApp.Controller
                          region: App.mainRegion
    controller.showMain()