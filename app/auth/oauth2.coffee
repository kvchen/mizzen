oauth2orize = require 'oauth2orize'
passport    = require 'passport'
crypto      = require 'crypto'

User         = require '../models/user'
OAuthClient  = require '../models/auth/oauth-client'
AccessToken  = require '../models/auth/access-token'
RefreshToken = require '../models/auth/refresh-token'


# Create the OAuth server
server = oauth2orize.createServer()


server.exchange oauth2orize.exchange.password (client, username, password, scope, done) ->
  User.findOne { username: username }, (err, user) ->
    return done err if err
    return done null, false if not user

    user.comparePassword password, (err, match) ->
      return done err if err
      return done null, false if not match

      RefreshToken.remove {userId: user.id, clientId: client.clientId }, (err) ->
        return done err if err

      AccessToken.remove {userId: user.id, clientId: client.clientId }, (err) ->
        return done err if err

      tokenValue = crypto.randomBytes(32).toString 'base64'
      refreshTokenValue = crypto.randomBytes(32).toString 'base64'

      token = new AccessToken
        token: tokenValue
        clientId: client.clientId
        userId: user.id

      refreshToken = new RefreshToken
        token: refreshTokenValue
        clientId: client.clientId
        userId: user.id

      refreshToken.save (err) ->
        return done err if err

      info = { scope: '*' }
      token.save (err, token) ->
        return done err if err
        done null, tokenValue, refreshTokenValue, 
          'expires_in': nconf.get 'auth:tokenLife'


server.exchange oauth2orize.exchange.refreshToken (client, refreshToken, scope, done) ->
  RefreshToken.findOne { token: refreshToken }, (err, token) ->
    return done err if err
    return done null, false if not token

    User.findById token.userId, (err, user) ->
      return done err if err
      return done null, false if not user

      RefreshToken.remove { userId: user.id, clientId: client.clientId }, (err) ->
        return done err if err

      AccessToken.remove { userId: user.id, clientId: client.clientId }, (err) ->
        return done err if err

      tokenValue = crypto.randomBytes(32).toString 'base64'
      refreshTokenValue = crypto.randomBytes(32).toString 'base64'

      token = new AccessToken
        token: tokenValue
        clientId: client.clientId
        userId: user.id

      refreshToken = new RefreshToken
        token: refreshTokenValue
        clientId: client.clientId
        userId: user.id

      refreshToken.save (err) ->
        return done err if err

      info = { scope: '*' }
      token.save (err, token) ->
        return done err if err
        done null, tokenValue, refreshTokenValue, 
          'expires_in': nconf.get 'auth:tokenLife'

module.exports.token = [
  passport.authenticate ['basic', 'oauth2-client-password'], { session: false },
  server.token()
  server.errorHandler()
]

