
module.exports = class Module extends Backbone.Model

  defaults:
    name:          'Unknown Module'
    path:          '/error'
    bg_color:      'blue'
    is_active:     true
    require_admin: false