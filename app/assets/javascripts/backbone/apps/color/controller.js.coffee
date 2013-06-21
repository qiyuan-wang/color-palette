@Color.module "ColorApp", (ColorApp, App, Backbone, Marionette, $, _) ->
  
  class ColorApp.Controller extends Marionette.Controller
    initialize: (options) ->
      @region = options.region
       
    showColor: ->
      ua = window.navigator.userAgent
      # open with mobile Safari on iPhone
      if ua.indexOf('iPhone') >= 0 && ua.indexOf('Safari') >= 0 && ua.indexOf('Android') == -1
        if window.navigator.standalone
          view = @getColorView()
          @region.show(view)
        else
          view = @getInstallView()
          @region.show(view)
      # others(iPad Safari, Android, PC etc.)
      
    getColorView: ->
      new ColorApp.ColorView
      
    getInstallView: ->
      new ColorApp.InstallView