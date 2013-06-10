@Color.module "EditorApp", (EditorApp, App, Backbone, Marionette, $, _) ->
  
  class EditorApp.EditorView extends Marionette.ItemView
    template: "editor/templates/editor"
    id: "wrapper"
    ui:
      editor: "#editor"
      imageField: "#imageField"
      targetImage: "#target-image"
    
    onRender: ->
      @el.addEventListener 'touchmove', (event) ->
        event.preventDefault()
      hammertime = Hammer @el
      hammertime.on "swipeup", =>
        @ui.editor.css('top', '-10%')
      hammertime.on "swipedown", =>
         @ui.editor.css('top', '0px')
      @ui.imageField.on "change", @handleImageSelect
      
      
    handleImageSelect: (event) =>
      if event.target.files.length == 1 && event.target.files[0].type.indexOf("image/") == 0
        file = event.target.files[0]
        reader = new FileReader
        reader.readAsDataURL file
        reader.onload = @handleReaderLoad
        
    
    handleReaderLoad: (event) =>
      @ui.targetImage.attr('src', event.target.result)
    
    
      