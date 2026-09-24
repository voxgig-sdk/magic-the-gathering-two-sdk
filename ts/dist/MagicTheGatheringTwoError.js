"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.MagicTheGatheringTwoError = void 0;
class MagicTheGatheringTwoError extends Error {
    isMagicTheGatheringTwoError = true;
    sdk = 'MagicTheGatheringTwo';
    code;
    ctx;
    status = -1;
    // `err.notFound` rather than a magic number at every call site.
    get notFound() { return 404 === this.status; }
    constructor(code, msg, ctx) {
        super(msg);
        this.code = code;
        this.ctx = ctx;
    }
}
exports.MagicTheGatheringTwoError = MagicTheGatheringTwoError;
//# sourceMappingURL=MagicTheGatheringTwoError.js.map