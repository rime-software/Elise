module.exports = class HeaderView extends Backbone.View

  el: 'header'
  
  initialize: =>
    @render()
  
  events:
    'click span.searchbox-icon': 'toggle_search_bar'
  
  toggle_search_bar: ()->
    console.log("Search Toggled")
    $('.searchbox').toggleClass('searchbox-open');
  
  render: =>
    self = @
    Elise.get_template('partials/header').done (data) ->
      $(self.el).html(_.template(data)({}))
    self