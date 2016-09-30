//
//  T1441074311424.m
//
//  Created by   on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "T1441074311424.h"
#import "LiveInfo.h"


NSString *const kT1441074311424Alias = @"alias";
NSString *const kT1441074311424ImgType = @"imgType";
NSString *const kT1441074311424ReplyCount = @"replyCount";
NSString *const kT1441074311424Lmodify = @"lmodify";
NSString *const kT1441074311424HasCover = @"hasCover";
NSString *const kT1441074311424Subtitle = @"subtitle";
NSString *const kT1441074311424Pixel = @"pixel";
NSString *const kT1441074311424Url = @"url";
NSString *const kT1441074311424Ltitle = @"ltitle";
NSString *const kT1441074311424Ptime = @"ptime";
NSString *const kT1441074311424Editor = @"editor";
NSString *const kT1441074311424Postid = @"postid";
NSString *const kT1441074311424Votecount = @"votecount";
NSString *const kT1441074311424HasHead = @"hasHead";
NSString *const kT1441074311424Priority = @"priority";
NSString *const kT1441074311424Digest = @"digest";
NSString *const kT1441074311424Tname = @"tname";
NSString *const kT1441074311424Template = @"template";
NSString *const kT1441074311424HasAD = @"hasAD";
NSString *const kT1441074311424SkipType = @"skipType";
NSString *const kT1441074311424Imgsrc = @"imgsrc";
NSString *const kT1441074311424Source = @"source";
NSString *const kT1441074311424Ename = @"ename";
NSString *const kT1441074311424HasIcon = @"hasIcon";
NSString *const kT1441074311424Order = @"order";
NSString *const kT1441074311424Url3w = @"url_3w";
NSString *const kT1441074311424Cid = @"cid";
NSString *const kT1441074311424Boardid = @"boardid";
NSString *const kT1441074311424Docid = @"docid";
NSString *const kT1441074311424TAG = @"TAG";
NSString *const kT1441074311424HasImg = @"hasImg";
NSString *const kT1441074311424LiveInfo = @"live_info";
NSString *const kT1441074311424Title = @"title";
NSString *const kT1441074311424TAGS = @"TAGS";
NSString *const kT1441074311424SkipID = @"skipID";


@interface T1441074311424 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation T1441074311424

@synthesize alias = _alias;
@synthesize imgType = _imgType;
@synthesize replyCount = _replyCount;
@synthesize lmodify = _lmodify;
@synthesize hasCover = _hasCover;
@synthesize subtitle = _subtitle;
@synthesize pixel = _pixel;
@synthesize url = _url;
@synthesize ltitle = _ltitle;
@synthesize ptime = _ptime;
@synthesize editor = _editor;
@synthesize postid = _postid;
@synthesize votecount = _votecount;
@synthesize hasHead = _hasHead;
@synthesize priority = _priority;
@synthesize digest = _digest;
@synthesize tname = _tname;
@synthesize template = _template;
@synthesize hasAD = _hasAD;
@synthesize skipType = _skipType;
@synthesize imgsrc = _imgsrc;
@synthesize source = _source;
@synthesize ename = _ename;
@synthesize hasIcon = _hasIcon;
@synthesize order = _order;
@synthesize url3w = _url3w;
@synthesize cid = _cid;
@synthesize boardid = _boardid;
@synthesize docid = _docid;
@synthesize tAG = _tAG;
@synthesize hasImg = _hasImg;
@synthesize liveInfo = _liveInfo;
@synthesize title = _title;
@synthesize tAGS = _tAGS;
@synthesize skipID = _skipID;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.alias = [self objectOrNilForKey:kT1441074311424Alias fromDictionary:dict];
            self.imgType = [[self objectOrNilForKey:kT1441074311424ImgType fromDictionary:dict] doubleValue];
            self.replyCount = [[self objectOrNilForKey:kT1441074311424ReplyCount fromDictionary:dict] doubleValue];
            self.lmodify = [self objectOrNilForKey:kT1441074311424Lmodify fromDictionary:dict];
            self.hasCover = [[self objectOrNilForKey:kT1441074311424HasCover fromDictionary:dict] boolValue];
            self.subtitle = [self objectOrNilForKey:kT1441074311424Subtitle fromDictionary:dict];
            self.pixel = [self objectOrNilForKey:kT1441074311424Pixel fromDictionary:dict];
            self.url = [self objectOrNilForKey:kT1441074311424Url fromDictionary:dict];
            self.ltitle = [self objectOrNilForKey:kT1441074311424Ltitle fromDictionary:dict];
            self.ptime = [self objectOrNilForKey:kT1441074311424Ptime fromDictionary:dict];
            self.editor = [self objectOrNilForKey:kT1441074311424Editor fromDictionary:dict];
            self.postid = [self objectOrNilForKey:kT1441074311424Postid fromDictionary:dict];
            self.votecount = [[self objectOrNilForKey:kT1441074311424Votecount fromDictionary:dict] doubleValue];
            self.hasHead = [[self objectOrNilForKey:kT1441074311424HasHead fromDictionary:dict] doubleValue];
            self.priority = [[self objectOrNilForKey:kT1441074311424Priority fromDictionary:dict] doubleValue];
            self.digest = [self objectOrNilForKey:kT1441074311424Digest fromDictionary:dict];
            self.tname = [self objectOrNilForKey:kT1441074311424Tname fromDictionary:dict];
            self.template = [self objectOrNilForKey:kT1441074311424Template fromDictionary:dict];
            self.hasAD = [[self objectOrNilForKey:kT1441074311424HasAD fromDictionary:dict] doubleValue];
            self.skipType = [self objectOrNilForKey:kT1441074311424SkipType fromDictionary:dict];
            self.imgsrc = [self objectOrNilForKey:kT1441074311424Imgsrc fromDictionary:dict];
            self.source = [self objectOrNilForKey:kT1441074311424Source fromDictionary:dict];
            self.ename = [self objectOrNilForKey:kT1441074311424Ename fromDictionary:dict];
            self.hasIcon = [[self objectOrNilForKey:kT1441074311424HasIcon fromDictionary:dict] boolValue];
            self.order = [[self objectOrNilForKey:kT1441074311424Order fromDictionary:dict] doubleValue];
            self.url3w = [self objectOrNilForKey:kT1441074311424Url3w fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kT1441074311424Cid fromDictionary:dict];
            self.boardid = [self objectOrNilForKey:kT1441074311424Boardid fromDictionary:dict];
            self.docid = [self objectOrNilForKey:kT1441074311424Docid fromDictionary:dict];
            self.tAG = [self objectOrNilForKey:kT1441074311424TAG fromDictionary:dict];
            self.hasImg = [[self objectOrNilForKey:kT1441074311424HasImg fromDictionary:dict] doubleValue];
            self.liveInfo = [LiveInfo modelObjectWithDictionary:[dict objectForKey:kT1441074311424LiveInfo]];
            self.title = [self objectOrNilForKey:kT1441074311424Title fromDictionary:dict];
            self.tAGS = [self objectOrNilForKey:kT1441074311424TAGS fromDictionary:dict];
            self.skipID = [self objectOrNilForKey:kT1441074311424SkipID fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.alias forKey:kT1441074311424Alias];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgType] forKey:kT1441074311424ImgType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.replyCount] forKey:kT1441074311424ReplyCount];
    [mutableDict setValue:self.lmodify forKey:kT1441074311424Lmodify];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasCover] forKey:kT1441074311424HasCover];
    [mutableDict setValue:self.subtitle forKey:kT1441074311424Subtitle];
    [mutableDict setValue:self.pixel forKey:kT1441074311424Pixel];
    [mutableDict setValue:self.url forKey:kT1441074311424Url];
    [mutableDict setValue:self.ltitle forKey:kT1441074311424Ltitle];
    [mutableDict setValue:self.ptime forKey:kT1441074311424Ptime];
    NSMutableArray *tempArrayForEditor = [NSMutableArray array];
    for (NSObject *subArrayObject in self.editor) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForEditor addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForEditor addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEditor] forKey:kT1441074311424Editor];
    [mutableDict setValue:self.postid forKey:kT1441074311424Postid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.votecount] forKey:kT1441074311424Votecount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasHead] forKey:kT1441074311424HasHead];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priority] forKey:kT1441074311424Priority];
    [mutableDict setValue:self.digest forKey:kT1441074311424Digest];
    [mutableDict setValue:self.tname forKey:kT1441074311424Tname];
    [mutableDict setValue:self.template forKey:kT1441074311424Template];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasAD] forKey:kT1441074311424HasAD];
    [mutableDict setValue:self.skipType forKey:kT1441074311424SkipType];
    [mutableDict setValue:self.imgsrc forKey:kT1441074311424Imgsrc];
    [mutableDict setValue:self.source forKey:kT1441074311424Source];
    [mutableDict setValue:self.ename forKey:kT1441074311424Ename];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIcon] forKey:kT1441074311424HasIcon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.order] forKey:kT1441074311424Order];
    [mutableDict setValue:self.url3w forKey:kT1441074311424Url3w];
    [mutableDict setValue:self.cid forKey:kT1441074311424Cid];
    [mutableDict setValue:self.boardid forKey:kT1441074311424Boardid];
    [mutableDict setValue:self.docid forKey:kT1441074311424Docid];
    [mutableDict setValue:self.tAG forKey:kT1441074311424TAG];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasImg] forKey:kT1441074311424HasImg];
    [mutableDict setValue:[self.liveInfo dictionaryRepresentation] forKey:kT1441074311424LiveInfo];
    [mutableDict setValue:self.title forKey:kT1441074311424Title];
    [mutableDict setValue:self.tAGS forKey:kT1441074311424TAGS];
    [mutableDict setValue:self.skipID forKey:kT1441074311424SkipID];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.alias = [aDecoder decodeObjectForKey:kT1441074311424Alias];
    self.imgType = [aDecoder decodeDoubleForKey:kT1441074311424ImgType];
    self.replyCount = [aDecoder decodeDoubleForKey:kT1441074311424ReplyCount];
    self.lmodify = [aDecoder decodeObjectForKey:kT1441074311424Lmodify];
    self.hasCover = [aDecoder decodeBoolForKey:kT1441074311424HasCover];
    self.subtitle = [aDecoder decodeObjectForKey:kT1441074311424Subtitle];
    self.pixel = [aDecoder decodeObjectForKey:kT1441074311424Pixel];
    self.url = [aDecoder decodeObjectForKey:kT1441074311424Url];
    self.ltitle = [aDecoder decodeObjectForKey:kT1441074311424Ltitle];
    self.ptime = [aDecoder decodeObjectForKey:kT1441074311424Ptime];
    self.editor = [aDecoder decodeObjectForKey:kT1441074311424Editor];
    self.postid = [aDecoder decodeObjectForKey:kT1441074311424Postid];
    self.votecount = [aDecoder decodeDoubleForKey:kT1441074311424Votecount];
    self.hasHead = [aDecoder decodeDoubleForKey:kT1441074311424HasHead];
    self.priority = [aDecoder decodeDoubleForKey:kT1441074311424Priority];
    self.digest = [aDecoder decodeObjectForKey:kT1441074311424Digest];
    self.tname = [aDecoder decodeObjectForKey:kT1441074311424Tname];
    self.template = [aDecoder decodeObjectForKey:kT1441074311424Template];
    self.hasAD = [aDecoder decodeDoubleForKey:kT1441074311424HasAD];
    self.skipType = [aDecoder decodeObjectForKey:kT1441074311424SkipType];
    self.imgsrc = [aDecoder decodeObjectForKey:kT1441074311424Imgsrc];
    self.source = [aDecoder decodeObjectForKey:kT1441074311424Source];
    self.ename = [aDecoder decodeObjectForKey:kT1441074311424Ename];
    self.hasIcon = [aDecoder decodeBoolForKey:kT1441074311424HasIcon];
    self.order = [aDecoder decodeDoubleForKey:kT1441074311424Order];
    self.url3w = [aDecoder decodeObjectForKey:kT1441074311424Url3w];
    self.cid = [aDecoder decodeObjectForKey:kT1441074311424Cid];
    self.boardid = [aDecoder decodeObjectForKey:kT1441074311424Boardid];
    self.docid = [aDecoder decodeObjectForKey:kT1441074311424Docid];
    self.tAG = [aDecoder decodeObjectForKey:kT1441074311424TAG];
    self.hasImg = [aDecoder decodeDoubleForKey:kT1441074311424HasImg];
    self.liveInfo = [aDecoder decodeObjectForKey:kT1441074311424LiveInfo];
    self.title = [aDecoder decodeObjectForKey:kT1441074311424Title];
    self.tAGS = [aDecoder decodeObjectForKey:kT1441074311424TAGS];
    self.skipID = [aDecoder decodeObjectForKey:kT1441074311424SkipID];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_alias forKey:kT1441074311424Alias];
    [aCoder encodeDouble:_imgType forKey:kT1441074311424ImgType];
    [aCoder encodeDouble:_replyCount forKey:kT1441074311424ReplyCount];
    [aCoder encodeObject:_lmodify forKey:kT1441074311424Lmodify];
    [aCoder encodeBool:_hasCover forKey:kT1441074311424HasCover];
    [aCoder encodeObject:_subtitle forKey:kT1441074311424Subtitle];
    [aCoder encodeObject:_pixel forKey:kT1441074311424Pixel];
    [aCoder encodeObject:_url forKey:kT1441074311424Url];
    [aCoder encodeObject:_ltitle forKey:kT1441074311424Ltitle];
    [aCoder encodeObject:_ptime forKey:kT1441074311424Ptime];
    [aCoder encodeObject:_editor forKey:kT1441074311424Editor];
    [aCoder encodeObject:_postid forKey:kT1441074311424Postid];
    [aCoder encodeDouble:_votecount forKey:kT1441074311424Votecount];
    [aCoder encodeDouble:_hasHead forKey:kT1441074311424HasHead];
    [aCoder encodeDouble:_priority forKey:kT1441074311424Priority];
    [aCoder encodeObject:_digest forKey:kT1441074311424Digest];
    [aCoder encodeObject:_tname forKey:kT1441074311424Tname];
    [aCoder encodeObject:_template forKey:kT1441074311424Template];
    [aCoder encodeDouble:_hasAD forKey:kT1441074311424HasAD];
    [aCoder encodeObject:_skipType forKey:kT1441074311424SkipType];
    [aCoder encodeObject:_imgsrc forKey:kT1441074311424Imgsrc];
    [aCoder encodeObject:_source forKey:kT1441074311424Source];
    [aCoder encodeObject:_ename forKey:kT1441074311424Ename];
    [aCoder encodeBool:_hasIcon forKey:kT1441074311424HasIcon];
    [aCoder encodeDouble:_order forKey:kT1441074311424Order];
    [aCoder encodeObject:_url3w forKey:kT1441074311424Url3w];
    [aCoder encodeObject:_cid forKey:kT1441074311424Cid];
    [aCoder encodeObject:_boardid forKey:kT1441074311424Boardid];
    [aCoder encodeObject:_docid forKey:kT1441074311424Docid];
    [aCoder encodeObject:_tAG forKey:kT1441074311424TAG];
    [aCoder encodeDouble:_hasImg forKey:kT1441074311424HasImg];
    [aCoder encodeObject:_liveInfo forKey:kT1441074311424LiveInfo];
    [aCoder encodeObject:_title forKey:kT1441074311424Title];
    [aCoder encodeObject:_tAGS forKey:kT1441074311424TAGS];
    [aCoder encodeObject:_skipID forKey:kT1441074311424SkipID];
}

- (id)copyWithZone:(NSZone *)zone
{
    T1441074311424 *copy = [[T1441074311424 alloc] init];
    
    if (copy) {

        copy.alias = [self.alias copyWithZone:zone];
        copy.imgType = self.imgType;
        copy.replyCount = self.replyCount;
        copy.lmodify = [self.lmodify copyWithZone:zone];
        copy.hasCover = self.hasCover;
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.pixel = [self.pixel copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.ltitle = [self.ltitle copyWithZone:zone];
        copy.ptime = [self.ptime copyWithZone:zone];
        copy.editor = [self.editor copyWithZone:zone];
        copy.postid = [self.postid copyWithZone:zone];
        copy.votecount = self.votecount;
        copy.hasHead = self.hasHead;
        copy.priority = self.priority;
        copy.digest = [self.digest copyWithZone:zone];
        copy.tname = [self.tname copyWithZone:zone];
        copy.template = [self.template copyWithZone:zone];
        copy.hasAD = self.hasAD;
        copy.skipType = [self.skipType copyWithZone:zone];
        copy.imgsrc = [self.imgsrc copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.ename = [self.ename copyWithZone:zone];
        copy.hasIcon = self.hasIcon;
        copy.order = self.order;
        copy.url3w = [self.url3w copyWithZone:zone];
        copy.cid = [self.cid copyWithZone:zone];
        copy.boardid = [self.boardid copyWithZone:zone];
        copy.docid = [self.docid copyWithZone:zone];
        copy.tAG = [self.tAG copyWithZone:zone];
        copy.hasImg = self.hasImg;
        copy.liveInfo = [self.liveInfo copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.tAGS = [self.tAGS copyWithZone:zone];
        copy.skipID = [self.skipID copyWithZone:zone];
    }
    
    return copy;
}


@end
