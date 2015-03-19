winston = require 'winston'

logger = new winston.Logger
logger.add winston.transports.Console
logger.add winston.transports.DailyRotateFile, {filename: './logs/outfile.log'}

module.exports = logger