expect   = require('chai').expect
mongoose = require 'mongoose'
nconf    = require 'nconf'

app = require '../app'
User = require '../app/models/user'


describe 'User authentication', ->
  it 'should authenticate with password \'hunter2\''
  it 'should fail authentication with password \'foobar\''


