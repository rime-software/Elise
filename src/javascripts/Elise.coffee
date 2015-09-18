
$(document).ready ->
  Elise = 
    Models: require './models/models.coffee'
    Views: require './views/views.coffee'
    Collections: true
    Controllers: require './controllers/controllers.coffee'
    Routers: require './routers/routers.coffee'
    
  Elise.get = (path, subject = Elise) ->
    stepI = path.indexOf('/')
    if stepI is -1
      subject[path]
    else
      Elise.get path.slice(stepI + 1), subject[path.slice(0, stepI)]
  
  Elise.get_template = (path, format) ->
    if undefined == format
      format = '.html.js'
    $.get '/javascripts/templates/' + path + format, ((data) ->
      data
    ), 'html'
       
  global.Elise = Elise