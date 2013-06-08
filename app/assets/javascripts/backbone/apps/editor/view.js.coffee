@Color.module "EditorApp", (EditorApp, App, Backbone, Marionette, $, _) ->
  
  class EditorApp.EditorView extends Marionette.ItemView
    template: "editor/templates/editor"
    
    onRender: ->
      @el.addEventListener "touchstart", (event) ->
        console.log event.pageX, event.pageY
      
      @el.addEventListener "touchend", (event) ->
        console.log event.pageX, event.pageY
      
      