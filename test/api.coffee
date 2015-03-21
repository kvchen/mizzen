expect  = require('chai').expect
nconf   = require 'nconf'
request = require 'supertest'

app = require '../app'


describe 'API tests', ->
  describe 'Submissions endpoint', ->
    describe 'GET /submissions', ->
      it 'should return all user submissions', (done) ->
        request app
          .get '/submissions'
          .set 'Accept', 'application/json'
          .expect 'Content-Type', /json/
          .expect 200, done

    describe 'POST /submissions/create', ->
      it 'should create a user submission', (done) ->
        request app
          .post '/submissions/create'
          .set 'Accept', 'application/json'
          .expect 'Content-Type', /json/
          .expect 200, done

    # By submission ID
    describe 'GET /submissions/status/:id', ->
      it 'should return submission status'

    describe 'GET /submissions/details/:id', ->
      it 'should return submission details'

    describe 'POST submissions/update/:id', ->
      it 'should update the submission'

    describe 'POST submissions/destroy/:id', ->
      it 'should delete the submission'


  describe 'Authentication endpoint', ->
    describe 'POST /auth/token/create', ->
      it 'should create an authentication token'


