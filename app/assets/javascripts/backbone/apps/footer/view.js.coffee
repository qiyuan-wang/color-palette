@Color.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->
  
  class FooterApp.FooterView extends Marionette.ItemView
    template: "footer/templates/footer"