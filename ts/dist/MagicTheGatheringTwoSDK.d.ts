import { CardEntity } from './entity/CardEntity';
import { FormatEntity } from './entity/FormatEntity';
import { SetEntity } from './entity/SetEntity';
import { SetBoosterEntity } from './entity/SetBoosterEntity';
import { SubtypeEntity } from './entity/SubtypeEntity';
import { SupertypeEntity } from './entity/SupertypeEntity';
import { TypeEntity } from './entity/TypeEntity';
export type * from './MagicTheGatheringTwoTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { MagicTheGatheringTwoEntityBase } from './MagicTheGatheringTwoEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
declare class MagicTheGatheringTwoSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    _rawRequest(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    Card(entopts?: Record<string, any>): CardEntity;
    Format(entopts?: Record<string, any>): FormatEntity;
    Set(entopts?: Record<string, any>): SetEntity;
    SetBooster(entopts?: Record<string, any>): SetBoosterEntity;
    Subtype(entopts?: Record<string, any>): SubtypeEntity;
    Supertype(entopts?: Record<string, any>): SupertypeEntity;
    Type(entopts?: Record<string, any>): TypeEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): MagicTheGatheringTwoSDK;
    tester(testopts?: any, sdkopts?: any): MagicTheGatheringTwoSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof MagicTheGatheringTwoSDK;
export { stdutil, config, BaseFeature, MagicTheGatheringTwoEntityBase, MagicTheGatheringTwoSDK, SDK, };
