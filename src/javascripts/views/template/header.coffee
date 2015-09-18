module.exports = class HeaderView extends Backbone.View

  el: 'body > header'
  
  initialize: =>
    @render()
  
  render: =>
    self = @
    Elise.get_template('partials/header').done (data) ->
      $(self.el).append(_.template(data)({}))