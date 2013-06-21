@Color.module "ColorApp", (ColorApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false
  
  ColorApp.on "start", ->
    controller = new ColorApp.Controller
                          region: App.mainRegion
    controller.showColor()