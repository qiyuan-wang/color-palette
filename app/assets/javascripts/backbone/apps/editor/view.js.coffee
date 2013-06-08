@Color.module "EditorApp", (EditorApp, App, Backbone, Marionette, $, _) ->
  
  class EditorApp.EditorView extends Marionette.ItemView
    template: "editor/templates/editor"
    ui:
      editor: "#editor"
    
    onRender: ->
      @el.addEventListener 'touchmove', (event) ->
        event.preventDefault()
      hammertime = Hammer @el
      hammertime.on "swipeup", =>
        @ui.editor.css('bottom', '50px')
        console.log $('#footer')
        # App.request "show:footer"
      hammertime.on "swipedown", =>
         @ui.editor.css('bottom', '0px')
      
      