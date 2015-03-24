mongoose = require 'mongoose'


OAuthClientSchema = new mongoose.Schema
  name:
    type: String
    unique: true
    required: true
  
  clientID: 
    type: String
    unique: true
    required: true

  clientSecret:
    type: String
    required: true


OAuthClient = mongoose.model 'OAuthClient', OAuthClientSchema
module.exports = OAuthClient
