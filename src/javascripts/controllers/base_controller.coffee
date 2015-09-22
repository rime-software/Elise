class BaseController
  
  header_view:  false
  footer_view:  false
  default_view: false
  
  constructor: (render_header = true, render_footer = true)->
    @default_view = "Views/"+@constructor.name.substring(0, @constructor.name.length - 10)
    @get_header() if render_header
    @get_footer() if render_footer
     
  get_header: ->
    @header_view = (new (Elise.get('Views/Header')))
  
  get_footer: ->
    @footer_view = (new (Elise.get('Views/Footer')))
      
  render: (view = null, attrs = undefined)->
    view_ptr = null
    if view == null
      view_ptr = Elise.get(@default_view)
    else
      view_ptr = Elise.get(view)
    
    (new view_ptr(attrs))
    
    
module.exports = BaseController