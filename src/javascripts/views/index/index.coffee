module.exports = class IndexView extends Backbone.View

  el: 'main'
  
  initialize: =>
    @render()
  
  render: =>
    self = @
    Elise.get_template('index/index').done (data) ->
      $(self.el).append(_.template(data)({}))