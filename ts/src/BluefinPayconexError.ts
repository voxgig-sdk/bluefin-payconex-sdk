
import { Context } from './Context'


class BluefinPayconexError extends Error {

  isBluefinPayconexError = true

  sdk = 'BluefinPayconex'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  BluefinPayconexError
}

