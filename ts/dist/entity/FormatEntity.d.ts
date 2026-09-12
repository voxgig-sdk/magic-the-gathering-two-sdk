import { MagicTheGatheringTwoEntityBase } from '../MagicTheGatheringTwoEntityBase';
import type { MagicTheGatheringTwoSDK } from '../MagicTheGatheringTwoSDK';
import type { Control } from '../types';
import type { Format, FormatListMatch } from '../MagicTheGatheringTwoTypes';
declare class FormatEntity extends MagicTheGatheringTwoEntityBase<Format> {
    constructor(client: MagicTheGatheringTwoSDK, entopts: any);
    make(this: FormatEntity): FormatEntity;
    list(this: any, reqmatch?: FormatListMatch, ctrl?: Control): Promise<FormatEntity[]>;
}
export { FormatEntity };
