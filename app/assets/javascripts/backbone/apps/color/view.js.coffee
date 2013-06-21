@Color.module "ColorApp", (ColorApp, App, Backbone, Marionette, $, _ ) ->
  
  class ColorApp.ColorView extends Marionette.ItemView
    template: "color/templates/color"
    id: "wrapper"
    ui:
      imageField: "#image-field"
      button: "#select-button"
    
    onRender: ->
      @$el.addClass('frame')
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
        $("#target-image").remove()
        $("#inner").removeAttr('style')
        $("#wrapper").css("transform","translateX(0)")
        
      @ui.button.on "click", (event) ->
        $("#image-field").trigger("click")
         
      @ui.imageField.on "change", @handleImageSelect
      
    handleImageSelect: (event) ->
      if event.target.files.length == 1 && event.target.files[0].type.indexOf("image/") == 0
        file = event.target.files[0]
        reader = new FileReader
        reader.readAsDataURL file
        reader.onload = (event) ->
          image = document.createElement('image')
          image.id = "target-image"
          image.src = event.target.result
          $(image).on "load", ->
            colors = createPalette(image, 5)
            _.each colors, (element, index) ->
              $("#color-" + index).css('background-color', 'rgba(' + element.toString() + ',1)' )
            $("#wrapper").css("transform","translateX(-50%)")
          $("#inner").prepend(image)
          realHeight = $("#inner").height()
          console.log realHeight
          style = 
                  position : 'absolute'
                  height : realHeight
                  top    : 0
                  bottom  : 0
                  margin : 'auto'
          $("#inner").css(style)
  
  class ColorApp.RequirementView extends Marionette.ItemView
    template: "color/templates/require"
    id: "preview"
    class: "frame"
    
    onRender: ->
      console.log @el
      @$el.addClass('frame')
      @el.addEventListener 'touchmove', (event) ->
        event.preventDefault()
    
          
        
          
    
    
      