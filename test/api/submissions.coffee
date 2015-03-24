expect  = require('chai').expect
nconf   = require 'nconf'
request = require 'supertest'

app = require '../../app'


describe '/submissions', ->
  describe 'GET /submissions', ->
    it 'should return all user submissions'

  describe 'POST /submissions/create', ->
    it 'should create a user submission'

  # By submission ID
  describe 'GET /submissions/status/:id', ->
    it 'should return submission status'

  describe 'GET /submissions/details/:id', ->
    it 'should return submission details'

  describe 'POST submissions/update/:id', ->
    it 'should update the submission'

  describe 'POST submissions/destroy/:id', ->
    it 'should delete the submission'


