@Color.module "ColorApp", (ColorApp, App, Backbone, Marionette, $, _) ->
  
  class ColorApp.Controller extends Marionette.Controller
    initialize: (options) ->
      @region = options.region
      
    showEditor: ->
      view = @getEditorView()
      @region.show(view)
      
    getEditorView: ->
      new ColorApp.EditorView