module.exports = class FooterView extends Backbone.View

  el: 'body > footer'
  
  initialize: =>
    @render()
  
  render: =>
    self = @
    Elise.get_template('partials/footer').done (data) ->
      $(self.el).append(_.template(data)({}))