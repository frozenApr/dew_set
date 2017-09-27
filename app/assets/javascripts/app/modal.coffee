wrappers = {
  base: (html)->
    """
      <div class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            #{html}
          </div>
        </div>
      </div>
    """
  body: (html)->
    @base """
      <div class="modal-body">
        #{html}
      </div>
    """
}


$modalWapper = null
$modal = null

initWapper = ->
  unless $modalWapper
    $modalWapper = $('body').append('<div id="modal"></div>').find('#modal')
  $modalWapper

modal = (html, opts)->
  initWapper()
  if $modal
    $modal.modal('hide')
    $modal.on('hidden.bs.modal', ->
      show(html, opts)
    )
  else
    show(html, opts)

show = (html, opts)->
  $modalWapper.html wrappers[opts.wrapper](html)
  $modal = $modalWapper.find('.modal')
  $modal.find('.modal-dialog').css(opts.css).addClass(opts.class)
  $modal.on('hidden.bs.modal', ->
    $modal = null
  )
  $modal.modal('show') if opts.show

App.modal = (opts={})->
  opts = $.extend({
    css: {}
    show: true
    class: ''
    wrapper: 'base'
  }, opts)
  if opts.url
    $.get(opts.url).then((data) ->
      modal(data, opts)
    )
  else if opts.html
    modal(opts.html, opts)
