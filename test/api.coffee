expect = require('chai').expect

describe 'API tests', ->
  describe 'Submissions endpoint', ->
    describe 'POST /submissions', ->
      it 'should add a user submission'

    describe 'GET /submissions', ->
      it 'should return all user submissions'

    describe 'GET /submissions/:id', ->
      it 'should return a JSON containing submission info and status'

    describe 'PATCH /submissions/:id', ->
      it 'should modify the submission'

  describe 'Rate-limiting by IP address', ->
    it 'should restrict an IP to 1 request every 15 seconds'


