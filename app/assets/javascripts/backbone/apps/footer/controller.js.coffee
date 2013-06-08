@Color.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->
  
  class FooterApp.Controller extends Marionette.Controller
    initialize: (options) ->
      @region = options.region
      
    showFooter: ->
      view = @getFooterView()
      @region.show(view)
      
    getFooterView: ->
      new FooterApp.FooterView
    
    @