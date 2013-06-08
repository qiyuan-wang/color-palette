@Color.module "EditorApp", (EditorApp, App, Backbone, Marionette, $, _) ->
  
  class EditorApp.Controller extends Marionette.Controller
    initialize: (options) ->
      @region = options.region
      
    showEditor: ->
      view = @getEditorView()
      @region.show(view)
      
    getEditorView: ->
      new EditorApp.EditorView