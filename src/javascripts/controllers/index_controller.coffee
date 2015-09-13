BaseController = require './base_controller.coffee'

module.exports = class IndexController extends BaseController
  
  index: ->
    View = new (Elise.get('Views/home'))
    return