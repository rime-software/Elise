module.exports = class FooterView extends Backbone.View

  el: 'body > footer'
  template: require '../../templates/partials/footer.html.js'
  
  initialize: =>
    @render()
  
  render: =>
    self = @
    $(self.el).append(_.template(self.template)({}))