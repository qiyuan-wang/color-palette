@Color.module "EditorApp", (EditorApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false
  
  EditorApp.on "start", ->
    controller = new EditorApp.Controller
                          region: App.mainRegion
    controller.showEditor()