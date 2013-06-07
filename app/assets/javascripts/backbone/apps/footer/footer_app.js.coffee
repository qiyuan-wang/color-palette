@Color.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false
  
  FooterApp.on "start", ->
    controller = new FooterApp.Controller
                          region: App.footerRegion
    controller.showFooter()