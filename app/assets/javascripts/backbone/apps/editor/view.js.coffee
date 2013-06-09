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
        @ui.editor.css('top', '-80px')
        console.log @ui.editor.css(['width', 'height'])
      hammertime.on "swipedown", =>
         @ui.editor.css('top', '0px')
      
      