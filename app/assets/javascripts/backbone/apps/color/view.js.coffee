@Color.module "ColorApp", (ColorApp, App, Backbone, Marionette, $, _ ) ->
  
  class ColorApp.ColorView extends Marionette.ItemView
    template: "color/templates/color"
    id: "wrapper"
    ui:
      imageField: "#image-field"
      button: "#select-button"
    
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
      
      # return to selector
      @$el.on "swiperight", "#image-palette", (event) ->
        # wait the translation finish
        setTimeout (-> 
          # delete element
          $("#target-image").remove()
          # clear the style added by jquery
          $("#inner").removeAttr('style')), 400
          
        # slide right
        $("#wrapper").css("transform","translateX(0)")
        
      @ui.button.on "click", (event) ->
        $("#image-field").trigger("click")
         
      @ui.imageField.on "change", @handleImageSelect
      
    handleImageSelect: (event) ->
      if event.target.files.length == 1 && event.target.files[0].type.indexOf("image/") == 0
        
        # read image
        file = event.target.files[0]
        reader = new FileReader
        reader.readAsDataURL file
        
        # when image is ready
        reader.onload = (event) ->
          # create image element and set its attributes
          image = document.createElement('image')
          image.id = "target-image"
          image.src = event.target.result
          
          # when element load the image
          $(image).on "load", ->
            # retrieval colors of image
            colors = createPalette(image, 5)
            _.each colors, (element, index) ->
              $("#color-" + index).css('background-color', 'rgba(' + element.toString() + ',1)' )
            
            # make div#inner center vertically according to image height
            realHeight = $("#inner").height()
            style = 
                    position : 'absolute'
                    height : realHeight
                    top    : 0
                    bottom  : 0
                    margin : 'auto'
            $("#inner").css(style)
            
            # slide left
            $("#wrapper").css("transform","translateX(-50%)")
          
          # insert image to div#inner
          $("#inner").prepend(image)


  class ColorApp.InstallView extends Marionette.ItemView
    template: "color/templates/install"
    id: "preview"

        
  class ColorApp.RequireView extends Marionette.ItemView
    template: "color/templates/require"
    id: "preview"
          
        
          
    
    
      