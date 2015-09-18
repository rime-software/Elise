

  IndexController = new (Elise.get('Controllers/index'))
  
  Router.on 'route:default', () ->
    IndexController.index()
  
  Router.on 'route:testRoute', (id) ->
    IndexController.test(id)