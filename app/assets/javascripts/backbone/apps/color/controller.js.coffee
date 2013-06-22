@Color.module "ColorApp", (ColorApp, App, Backbone, Marionette, $, _) ->
  
  class ColorApp.Controller extends Marionette.Controller
    initialize: (options) ->
      @region = options.region
       
    showColor: ->
      ua = window.navigator.userAgent
      # open with mobile Safari(webview or web clip) on iPhone
      if ua.indexOf('iPhone') >= 0 && ua.indexOf('Android') == -1 && ua.indexOf('CriOS') == -1
        # safari
        if ua.indexOf('Safari') >= 0
          view = @getInstallView()
        # web clip (already installed)
        else if window.navigator.standalone
          view = @getColorView()
        # webviews
        else
          view = @getRequireView()
      # others(iPad Safari, Android, PC etc.)
      else
        view = @getRequireView()
      
      @region.show(view)
      
    getColorView: ->
      new ColorApp.ColorView
      
    getInstallView: ->
      new ColorApp.InstallView
      
    getRequireView: ->
      new ColorApp.RequireView