mongoose = require 'mongoose'


RefreshTokenSchema = new mongoose.Schema
  userID:
    type: String
    required: true
  
  clientID: 
    type: String
    required: true

  token:
    type: String
    unique: true
    required: true

  created:
    type: Date
    default: Date.now


RefreshToken = mongoose.model 'RefreshToken', RefreshTokenSchema
module.exports = RefreshToken
