import { Context } from './Context';
declare class MagicTheGatheringTwoError extends Error {
    isMagicTheGatheringTwoError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { MagicTheGatheringTwoError };
