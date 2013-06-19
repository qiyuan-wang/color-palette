@Color.module "ColorApp", (ColorApp, App, Backbone, Marionette, $, _ ) ->
  
  class ColorApp.EditorView extends Marionette.ItemView
    template: "color/templates/template"
    id: "wrapper"
    ui:
      button: "#select-image"
      editor: "#editor"
      imageField: "#image-field"
      targetImage: "#target-image"
      imagePalette: "#image-palette"
    
    onRender: ->
      @el.addEventListener 'touchmove', (event) ->
        event.preventDefault()
      
      # add touch action
      Hammer @el # init a hammer object
      
      # show and hide footer through swipe-up and swipe-down
      @$el.on "swipeup", (event) ->
        $(@).css('top', '-10%')  
      @$el.on "swipedown", (event) ->
         $(@).css('top', '0px')
      
      # return to editor 
      @$el.on "swiperight", "#image-palette", (event) ->
        $("#wrapper").css("transform","translateX(0)")
        $("#target-image").removeAttr('src')
        console.log $("#target-image")[0]
        
      @ui.button.on "click", (event) ->
        $("#image-field").trigger("click")
         
      @ui.imageField.on "change", @handleImageSelect
      
      
    handleImageSelect: (event) ->
      if event.target.files.length == 1 && event.target.files[0].type.indexOf("image/") == 0
        file = event.target.files[0]
        reader = new FileReader
        reader.readAsDataURL file
        reader.onload = (event) ->
          $("#target-image").attr('src', event.target.result)
          $("#wrapper").css("transform","translateX(-50%)")
        
          
    
    
      