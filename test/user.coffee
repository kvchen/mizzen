expect   = require('chai').expect
mongoose = require 'mongoose'
nconf    = require 'nconf'

app = require '../app'
User = require '../app/models/user'


describe 'User tests', ->
	before (done) ->
		mongoose.connection.db.dropDatabase done

	describe 'Test authentication', ->
		before (done) ->
			testUser = new User
				username: 'keffcat'
				password: 'hunter2'

			testUser.save (err) ->
				throw err if err
				done()
		
		it 'should authenticate with password \'hunter2\'', (done) ->
			User.findOne { username: 'keffcat' }, (err, user) ->
				throw err if err

				user.comparePassword 'hunter2', (err, match) ->
					throw err if err
					expect(match).to.be.true
					done()

		it 'should fail authentication with password \'foobar\'', (done) ->
			User.findOne { username: 'keffcat' }, (err, user) ->
				throw err if err

				user.comparePassword 'foobar', (err, match) ->
					throw err if err
					expect(match).to.be.false
					done()

