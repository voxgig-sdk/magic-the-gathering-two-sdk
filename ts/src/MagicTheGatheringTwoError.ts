
import { Context } from './Context'


class MagicTheGatheringTwoError extends Error {

  isMagicTheGatheringTwoError = true

  sdk = 'MagicTheGatheringTwo'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  MagicTheGatheringTwoError
}

