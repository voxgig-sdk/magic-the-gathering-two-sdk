import { MagicTheGatheringTwoEntityBase } from '../MagicTheGatheringTwoEntityBase';
import type { MagicTheGatheringTwoSDK } from '../MagicTheGatheringTwoSDK';
import type { Control } from '../types';
import type { Type, TypeListMatch } from '../MagicTheGatheringTwoTypes';
declare class TypeEntity extends MagicTheGatheringTwoEntityBase<Type> {
    constructor(client: MagicTheGatheringTwoSDK, entopts: any);
    make(this: TypeEntity): TypeEntity;
    list(this: any, reqmatch?: TypeListMatch, ctrl?: Control): Promise<TypeEntity[]>;
}
export { TypeEntity };
