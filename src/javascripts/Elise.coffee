
$(document).ready ->
  Elise = 
    Models: require './models/models.coffee'
    Views: require './views/views.coffee'
    Collections: true
    Controllers: require './controllers/controllers.coffee'
    Routers: require './routers/routers.coffee'
    Dom: {Views: {}, Controllers: {}, Models: {}, Collections: {}}
    
  Elise.get = (path, subject = Elise) ->
    stepI = path.indexOf('/')
    if stepI is -1
      subject[path]
    else
      Elise.get path.slice(stepI + 1), subject[path.slice(0, stepI)]
  
  Elise.bind = (alias, data=undefined) ->
    frag = alias.split('/')
    unless Elise.Dom[ frag[0] ][ frag[1] ]?
      view_ptr = Elise.get(alias)
      Elise.Dom[ frag[0] ][ frag[1] ] = (new view_ptr(data))
    Elise.Dom[ frag[0] ][ frag[1] ]
  
  Elise.unbind_views = (alias=undefined) ->
    unless alias?
      for index,obj of Elise.Dom['Views']
        obj.undelegateEvents()
        obj.$el.html('')
        Elise.Dom['Views'][index] = null
      Elise.Dom['Views'] = {}
  
  Elise.get_template = (path, format) ->
    if undefined == format
      format = '.html.js'
    $.get '/javascripts/templates/' + path + format, ((data) ->
      data
    ), 'html'
       
  global.Elise = Elise