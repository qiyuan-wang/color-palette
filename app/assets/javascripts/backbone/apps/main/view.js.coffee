@Color.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  
  class MainApp.MainView extends Marionette.ItemView
    template: "main/templates/main"
    
    onRender: ->
      @el.addEventListener "touchstart", (event) ->
        console.log event.pageX, event.pageY
      
      @el.addEventListener "touchend", (event) ->
        console.log event.pageX, event.pageY
      
      