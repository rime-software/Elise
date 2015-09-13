class BaseController

  constructor: (render_header = true, render_footer = true)->
    @get_header() if render_header
    @get_footer() if render_footer
     
  get_header: ->
    Elise.get_template('_partials/header').done (src) ->
      $('html > body > header').html(src)
  
  get_footer: ->
    Elise.get_template('_partials/footer').done (src) ->
      $('html > body > footer').html(src)      
    
module.exports = BaseController