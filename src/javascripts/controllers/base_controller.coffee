class BaseController

  constructor: (render_header = true, render_footer = true)->
    @default_view = "Views/"+@constructor.name.substring(0, @constructor.name.length - 10)
    #@get_header() if render_header
    #@get_footer() if render_footer
     
  get_header: ->
    Elise.get_template('_partials/header').done (src) ->
      $('html > body > header').html(src)
  
  get_footer: ->
    Elise.get_template('_partials/footer').done (src) ->
      $('html > body > footer').html(src)
      
  render: (view = null, attrs = undefined)->
    view_ptr = null
    if view == null
      view_ptr = Elise.get(@default_view)
    else
      view_ptr = Elise.get(view)
    
    (new view_ptr())
    
    
    
module.exports = BaseController