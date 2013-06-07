@Color.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  
  class MainApp.MainView extends Marionette.ItemView
    template: "main/templates/main"