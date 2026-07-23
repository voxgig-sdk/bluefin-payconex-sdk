

class BluefinPayconexError extends Error {

  isBluefinPayconexError = true

  sdk = 'BluefinPayconex'

  constructor(code, msg, ctx) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

module.exports = {
  BluefinPayconexError
}

