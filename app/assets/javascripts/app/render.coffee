# App render使用方法
#
# 需要在在页面渲染时调用的代码
# App.on('render', ->
#   # 你的代码
# )
#
# 在部份页面渲染触发App渲染代码
# App.render($dom)

# 触发App渲染代码
# @param [jQuery] $root jQuery对像，默认为$body
# @return $root
App.render = ($root=@$body)->
  if _.isString($root)
    $root = $ $root
  @emit('render', $root)
  $root

$(->
  App.$body = $('body')
  App.render(App.$body)
)
