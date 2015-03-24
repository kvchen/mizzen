validateForm = () ->
  $('.ui.form').form


    username: 
      identifier: 'username'
      rules: [
        { type: 'empty', prompt: 'Please enter a username' }
      ]

    password: 
      identifier: 'password',
      rules: [
        { type: 'empty', prompt : 'Please enter a password' }
        { type: 'length[6]', prompt : 'Your password must be at least 6 characters' }
      ]

    terms:
      identifier: 'terms'
      rules: [
        { type: 'checked', prompt : 'You must agree to the terms and conditions' }
      ]

$(document).ready validateForm