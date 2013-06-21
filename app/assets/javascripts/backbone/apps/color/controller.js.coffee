@Color.module "ColorApp", (ColorApp, App, Backbone, Marionette, $, _) ->
  
  class ColorApp.Controller extends Marionette.Controller
    initialize: (options) ->
      @region = options.region
      App.height = $(window).height()
      
    showColor: ->
      ua = window.navigator.userAgent
      
      # open with mobile Safari on iPhone
      if ua.indexOf('iPhone') >= 0 && ua.indexOf('Safari') >= 0 && ua.indexOf('Android') == 0
        if window.navigator.standalone
          view = @getColorView()
          @region.show(view)
        else
          view = @getRequirementView()
          @region.show(view)
      # others(iPad Safari, Android, PC etc.)
      
    getColorView: ->
      new ColorApp.ColorView
      
    showRequirement: ->
      view = @getRequirementView()
      @region.show(view)
      
    getRequirementView: ->
      new ColorApp.RequirementView