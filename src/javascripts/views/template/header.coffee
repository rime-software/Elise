module.exports = class HeaderView extends Backbone.View

  el: 'header'
  template: require '../../templates/partials/header.html.js'
  
  initialize: =>
    @render()
  
  events:
    'click span.searchbox-icon': 'toggle_search_bar'
  
  toggle_search_bar: ()->
    $('.searchbox').toggleClass('searchbox-open');
  
  render: =>
    self = @
    $(self.el).html(_.template(self.template)({}))