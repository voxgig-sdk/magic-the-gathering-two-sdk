import { MagicTheGatheringTwoEntityBase } from '../MagicTheGatheringTwoEntityBase';
import type { MagicTheGatheringTwoSDK } from '../MagicTheGatheringTwoSDK';
import type { Control } from '../types';
import type { Card, CardLoadMatch, CardListMatch } from '../MagicTheGatheringTwoTypes';
declare class CardEntity extends MagicTheGatheringTwoEntityBase<Card> {
    constructor(client: MagicTheGatheringTwoSDK, entopts: any);
    make(this: CardEntity): CardEntity;
    load(this: any, reqmatch?: CardLoadMatch, ctrl?: Control): Promise<CardEntity>;
    list(this: any, reqmatch?: CardListMatch, ctrl?: Control): Promise<CardEntity[]>;
}
export { CardEntity };
