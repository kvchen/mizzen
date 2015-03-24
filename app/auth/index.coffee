nconf    = require 'nconf'
passport = require 'passport'

BasicStrategy          = require('passport-http').BasicStrategy
BearerStrategy         = require('passport-http-bearer').Strategy
ClientPasswordStrategy = require('passport-oauth2-client-password').Strategy

User = require '../models/user'

OAuthClient  = require '../models/auth/oauth-client'
AccessToken  = require '../models/auth/access-token'
RefreshToken = require '../models/auth/refresh-token'


# Initialize strategies to be used during authentication

passport.use new BasicStrategy (username, password, done) ->
  User.findOne { username: username }, (err, user) ->
    return done err if err
    return done null, false if not user

    user.comparePassword password, (err, match) ->
      return done err if err
      return done null, false if not match

      return done null, user


passport.use new ClientPasswordStrategy (clientId, clientSecret, done) ->
  OAuthClient.findOne { clientId: clientId }, (err, client) ->
    return done err if err
    return done null, false if not client
    return done null, false if client.clientSecret != clientSecret

    return done null, client


passport.use new BearerStrategy (accessToken, done) ->
  AccessToken.findOne { token: accessToken }, (err, token) ->
    return done err if err
    return done null, false if not token

    if Math.round (Date.now()-token.created)/1000 > nconf.get 'auth:tokenLife'
      token.remove (err) ->
        return done err if err
        return done null, false, { message: 'Token expired' }

    User.findById token.userId, (err, user) ->
      return done err if err
      return done null, false, { message: 'Invalid user' } if not user

      info = { scope: '*' }
      done null, user, info


