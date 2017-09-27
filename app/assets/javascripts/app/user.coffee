modal = (url)->
  App.modal
    url: '/templates/' + url
    css:
      marginTop: 150
    class: 'login-dialog'
    wrapper: 'body'
App.user =
  login: ->
    modal('login')
  register: ->
    modal('register')
