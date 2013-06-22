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
          #fix the wrong position of wrapper after rotation landscape and back
          window.addEventListener 'orientationchange', @doOnOrientationChange
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
      
    doOnOrientationChange: ->
      notice = document.createElement('div')
      notice.innerHTML = "<h2>仅支持肖像模式 (Protrait mode)</h2><p>麻烦请把手机转回去哈。</p>"
      notice.id = "notice"
      if window.orientation == 90 || window.orientation == -90
        $("#wrapper").hide()
        $("#main-region").append notice
      else if window.orientation == 0
        $("#notice").remove()
        $("#wrapper").show()
        
        
        
