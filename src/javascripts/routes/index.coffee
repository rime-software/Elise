

  IndexController = new (Elise.get('Controllers/index'))

  Router.route '', 'default', IndexController['index']
  Router.route 'home', 'home', IndexController['index']