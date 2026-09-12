import { MagicTheGatheringTwoEntityBase } from '../MagicTheGatheringTwoEntityBase';
import type { MagicTheGatheringTwoSDK } from '../MagicTheGatheringTwoSDK';
import type { Control } from '../types';
import type { SetBooster, SetBoosterListMatch } from '../MagicTheGatheringTwoTypes';
declare class SetBoosterEntity extends MagicTheGatheringTwoEntityBase<SetBooster> {
    constructor(client: MagicTheGatheringTwoSDK, entopts: any);
    make(this: SetBoosterEntity): SetBoosterEntity;
    list(this: any, reqmatch?: SetBoosterListMatch, ctrl?: Control): Promise<SetBoosterEntity[]>;
}
export { SetBoosterEntity };
