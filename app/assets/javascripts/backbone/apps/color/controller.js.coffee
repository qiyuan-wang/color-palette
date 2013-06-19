@Color.module "ColorApp", (ColorApp, App, Backbone, Marionette, $, _) ->
  
  class ColorApp.Controller extends Marionette.Controller
    initialize: (options) ->
      @region = options.region
      
    showColor: ->
      view = @getColorView()
      @region.show(view)
      
    getColorView: ->
      new ColorApp.ColorView
      
    showRequirement: ->
      view = @getRequirementView()
      @region.show(view)
      
    getRequirementView: ->
      new ColorApp.RequirementView