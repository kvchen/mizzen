bcrypt   = require 'bcrypt'
mongoose = require 'mongoose'


UserSchema = new mongoose.Schema
  username: 
    type: String
    required: true
    unique: true
  
  password: 
    type: String
    required: true

  first:
    type: String
    required: true

  last:
    type: String
    required: true

  courses: [{type: mongoose.Schema.Types.ObjectId, ref: 'Course'}]


# Middleware for hashing passwords

UserSchema.pre 'save', (next) ->
  user = this

  # Hash the password if it is new
  return next() if !user.isModified 'password'

  # Generate a salt
  bcrypt.genSalt 12, (err, salt) ->
    return next err if err

    # Hash the password using our new salt
    bcrypt.hash user.password, salt, (err, hash) ->
      return next err if err

      # Override the cleartext password with the hash
      user.password = hash
      next()


UserSchema.methods.comparePassword = (candidate, cb) ->
  bcrypt.compare candidate, this.password, (err, match) ->
    return cb err if err
    cb null, match


User = mongoose.model 'User', UserSchema
module.exports = User
