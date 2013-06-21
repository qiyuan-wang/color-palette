@Color.module "ColorApp", (ColorApp, App, Backbone, Marionette, $, _) ->
  
  class ColorApp.Controller extends Marionette.Controller
    initialize: (options) ->
      @region = options.region
      App.height = $(window).height()
      
    showColor: ->
      if window.navigator.standalone
        view = @getColorView()
        @region.show(view)
      else
        view = @getRequirementView()
        @region.show(view)
      
    getColorView: ->
      new ColorApp.ColorView
      
    showRequirement: ->
      view = @getRequirementView()
      @region.show(view)
      
    getRequirementView: ->
      new ColorApp.RequirementView