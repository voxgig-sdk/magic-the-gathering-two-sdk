import { MagicTheGatheringTwoEntityBase } from '../MagicTheGatheringTwoEntityBase';
import type { MagicTheGatheringTwoSDK } from '../MagicTheGatheringTwoSDK';
import type { Control } from '../types';
import type { Subtype, SubtypeListMatch } from '../MagicTheGatheringTwoTypes';
declare class SubtypeEntity extends MagicTheGatheringTwoEntityBase<Subtype> {
    constructor(client: MagicTheGatheringTwoSDK, entopts: any);
    make(this: SubtypeEntity): SubtypeEntity;
    list(this: any, reqmatch?: SubtypeListMatch, ctrl?: Control): Promise<SubtypeEntity[]>;
}
export { SubtypeEntity };
