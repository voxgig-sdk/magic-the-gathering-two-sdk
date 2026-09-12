import { MagicTheGatheringTwoEntityBase } from '../MagicTheGatheringTwoEntityBase';
import type { MagicTheGatheringTwoSDK } from '../MagicTheGatheringTwoSDK';
import type { Control } from '../types';
import type { SetType, SetLoadMatch, SetListMatch } from '../MagicTheGatheringTwoTypes';
declare class SetEntity extends MagicTheGatheringTwoEntityBase<SetType> {
    constructor(client: MagicTheGatheringTwoSDK, entopts: any);
    make(this: SetEntity): SetEntity;
    load(this: any, reqmatch?: SetLoadMatch, ctrl?: Control): Promise<SetEntity>;
    list(this: any, reqmatch?: SetListMatch, ctrl?: Control): Promise<SetEntity[]>;
}
export { SetEntity };
