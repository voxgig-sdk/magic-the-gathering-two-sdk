export interface Card {
    artist?: string;
    border?: string;
    cmc?: number;
    colorIdentity?: any[];
    colors?: any[];
    flavor?: string;
    foreignNames?: any[];
    hand?: number;
    id?: string;
    imageUrl?: string;
    layout?: string;
    legalities?: any[];
    life?: number;
    loyalty?: string;
    manaCost?: string;
    multiverseid?: number;
    name?: string;
    names?: any[];
    number?: string;
    originalText?: string;
    originalType?: string;
    power?: string;
    printings?: any[];
    rarity?: string;
    releaseDate?: string;
    reserved?: boolean;
    rulings?: any[];
    set?: string;
    setName?: string;
    source?: string;
    starter?: boolean;
    subtypes?: any[];
    supertypes?: any[];
    text?: string;
    timeshifted?: boolean;
    toughness?: string;
    type?: string;
    types?: any[];
    variations?: any[];
    watermark?: string;
}
export interface CardLoadMatch {
    id: string;
}
export interface CardListMatch {
    artist?: string;
    cmc?: number;
    color?: string;
    color_identity?: string;
    contain?: string;
    flavor?: string;
    game_format?: string;
    id?: string;
    language?: string;
    layout?: string;
    legality?: string;
    loyalty?: string;
    multiverseid?: number;
    name?: string;
    number?: string;
    order_by?: string;
    page?: number;
    page_size?: number;
    power?: string;
    random?: boolean;
    rarity?: string;
    set?: string;
    set_name?: string;
    subtype?: string;
    supertype?: string;
    text?: string;
    toughness?: string;
    type?: string;
}
export interface Format {
    formats?: any[];
}
export interface FormatListMatch {
    formats?: any[];
}
export interface SetType {
    block?: string;
    booster?: any[];
    border?: string;
    code?: string;
    gathererCode?: string;
    id?: string;
    magicCardsInfoCode?: string;
    mkm_id?: number;
    mkm_name?: string;
    name?: string;
    onlineOnly?: boolean;
    releaseDate?: string;
    type?: string;
}
export interface SetLoadMatch {
    id: string;
}
export interface SetListMatch {
    block?: string;
    name?: string;
}
export interface SetBooster {
    artist?: string;
    border?: string;
    cmc?: number;
    colorIdentity?: any[];
    colors?: any[];
    flavor?: string;
    foreignNames?: any[];
    hand?: number;
    id?: string;
    imageUrl?: string;
    layout?: string;
    legalities?: any[];
    life?: number;
    loyalty?: string;
    manaCost?: string;
    multiverseid?: number;
    name?: string;
    names?: any[];
    number?: string;
    originalText?: string;
    originalType?: string;
    power?: string;
    printings?: any[];
    rarity?: string;
    releaseDate?: string;
    reserved?: boolean;
    rulings?: any[];
    set?: string;
    setName?: string;
    source?: string;
    starter?: boolean;
    subtypes?: any[];
    supertypes?: any[];
    text?: string;
    timeshifted?: boolean;
    toughness?: string;
    type?: string;
    types?: any[];
    variations?: any[];
    watermark?: string;
}
export interface SetBoosterListMatch {
    id: string;
}
export interface Subtype {
    subtypes?: any[];
}
export interface SubtypeListMatch {
    subtypes?: any[];
}
export interface Supertype {
    supertypes?: any[];
}
export interface SupertypeListMatch {
    supertypes?: any[];
}
export interface Type {
    types?: any[];
}
export interface TypeListMatch {
    types?: any[];
}
