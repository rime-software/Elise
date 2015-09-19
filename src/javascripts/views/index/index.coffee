
module.exports = class IndexView extends Backbone.View

  el: 'main'
  template: require '../../templates/index/index.html.js'
  
  initialize: =>
    @render()
  
  render: =>
    self = @
    $(self.el).append(_.template(self.template)({}))
    