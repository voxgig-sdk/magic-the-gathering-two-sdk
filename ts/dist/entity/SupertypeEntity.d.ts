import { MagicTheGatheringTwoEntityBase } from '../MagicTheGatheringTwoEntityBase';
import type { MagicTheGatheringTwoSDK } from '../MagicTheGatheringTwoSDK';
import type { Control } from '../types';
import type { Supertype, SupertypeListMatch } from '../MagicTheGatheringTwoTypes';
declare class SupertypeEntity extends MagicTheGatheringTwoEntityBase<Supertype> {
    constructor(client: MagicTheGatheringTwoSDK, entopts: any);
    make(this: SupertypeEntity): SupertypeEntity;
    list(this: any, reqmatch?: SupertypeListMatch, ctrl?: Control): Promise<SupertypeEntity[]>;
}
export { SupertypeEntity };
