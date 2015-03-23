passport      = require 'passport'
LocalStrategy = require('passport-local').Strategy

User = require '../models/user'


passport.use new LocalStrategy (username, password, done) ->
  User.findOne { username: username }, (err, user) ->
    return done err if err

    if (!user)
      return done null, false, { message: 'Authentication error' }

    user.comparePassword password, (err, match) ->
      return done err if err
      if match
        return done null, user
      else
        return done null, false, { message: 'Authentication error' }


passport.serializeUser (user, done) ->
  done null, user.id


passport.deserializeUser (id, done) ->
  User.findById id, (err, user) ->
    done err, user


