bcrypt   = require 'bcrypt'
mongoose = require 'mongoose'


userSchema = new mongoose.Schema
  _id: mongoose.Schema.Types.ObjectId

  username: 
    type: String
    required: true
    index: 
      unique: true
  
  password: 
    type: String
    required: true


# Middleware for hashing passwords

userSchema.pre 'save', (next) ->
  # Hash the password if it is new
  return next() if !this.isModified 'password'

  # Generate a salt
  bcrypt.genSalt SALT_WORK_FACTOR, (err, salt) ->
    return next err if err

    # Hash the password using our new salt
    bcrypt.hash this.password, salt, (err, hash) ->
      return next err if err

      # Override the cleartext password with the hash
      this.password = hash
      next()


userSchema.methods.comparePassword = (candidate, cb) ->
  bcrypt.compare candidate, this.password, (err, match) ->
    return cb err if err
    cb null, match


User = mongoose.model 'User', userSchema
module.exports = userSchema
