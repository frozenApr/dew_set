# http://github.hubspot.com/messenger/docs/welcome/
#
# 用法
#   messenger.success('成功')
#   messenger.error('失败')
#   messenger.info('您有通知')

#= require messenger

Messenger.options =
  extraClasses: 'messenger-fixed messenger-on-top'
  theme: 'ice'

window.messenger =
  self: -> Messenger()
  defaultOption:
    showCloseButton: true
    hideAfter: false
  parseArg: (arg, type=null) ->
    if ($.isPlainObject(arg))
      opt = _.extend({}, @defaultOption, arg)
    else if ($.type(arg) == "string")
      opt = _.extend({}, @defaultOption, {message: arg})
    if type != null
      opt.type = type
    return opt
  post: (arg, timeout=2000) ->
    m = @self().post(@parseArg(arg))
    setTimeout ->
      m.hide()
    , timeout
  success: (arg) ->
    @post(@parseArg(arg, 'success'), 2000)
  error: (arg) ->
    console.dir(arg)
    @post(@parseArg(arg, 'error'), 4000)
  info: (arg) ->
    @post(@parseArg(arg, 'info'), 2000)
