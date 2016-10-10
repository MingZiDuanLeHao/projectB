//
//  BeautyModelItems.m
//
//  Created by   on 2016/10/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BeautyModelItems.h"


NSString *const kBeautyModelItemsComments = @"comments";
NSString *const kBeautyModelItemsWpicSmall = @"wpic_small";
NSString *const kBeautyModelItemsWSensitive = @"w_sensitive";
NSString *const kBeautyModelItemsWpicMWidth = @"wpic_m_width";
NSString *const kBeautyModelItemsIsGif = @"is_gif";
NSString *const kBeautyModelItemsLikes = @"likes";
NSString *const kBeautyModelItemsWpicMiddle = @"wpic_middle";
NSString *const kBeautyModelItemsWpicSHeight = @"wpic_s_height";
NSString *const kBeautyModelItemsWpicSWidth = @"wpic_s_width";
NSString *const kBeautyModelItemsWbody = @"wbody";
NSString *const kBeautyModelItemsWid = @"wid";
NSString *const kBeautyModelItemsWpicMHeight = @"wpic_m_height";
NSString *const kBeautyModelItemsWpicLarge = @"wpic_large";
NSString *const kBeautyModelItemsCmtDisabled = @"cmt_disabled";
NSString *const kBeautyModelItemsUpdateTime = @"update_time";


@interface BeautyModelItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BeautyModelItems

@synthesize comments = _comments;
@synthesize wpicSmall = _wpicSmall;
@synthesize wSensitive = _wSensitive;
@synthesize wpicMWidth = _wpicMWidth;
@synthesize isGif = _isGif;
@synthesize likes = _likes;
@synthesize wpicMiddle = _wpicMiddle;
@synthesize wpicSHeight = _wpicSHeight;
@synthesize wpicSWidth = _wpicSWidth;
@synthesize wbody = _wbody;
@synthesize wid = _wid;
@synthesize wpicMHeight = _wpicMHeight;
@synthesize wpicLarge = _wpicLarge;
@synthesize cmtDisabled = _cmtDisabled;
@synthesize updateTime = _updateTime;


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
            self.comments = [self objectOrNilForKey:kBeautyModelItemsComments fromDictionary:dict];
            self.wpicSmall = [self objectOrNilForKey:kBeautyModelItemsWpicSmall fromDictionary:dict];
            self.wSensitive = [self objectOrNilForKey:kBeautyModelItemsWSensitive fromDictionary:dict];
            self.wpicMWidth = [self objectOrNilForKey:kBeautyModelItemsWpicMWidth fromDictionary:dict];
            self.isGif = [self objectOrNilForKey:kBeautyModelItemsIsGif fromDictionary:dict];
            self.likes = [self objectOrNilForKey:kBeautyModelItemsLikes fromDictionary:dict];
            self.wpicMiddle = [self objectOrNilForKey:kBeautyModelItemsWpicMiddle fromDictionary:dict];
            self.wpicSHeight = [self objectOrNilForKey:kBeautyModelItemsWpicSHeight fromDictionary:dict];
            self.wpicSWidth = [self objectOrNilForKey:kBeautyModelItemsWpicSWidth fromDictionary:dict];
            self.wbody = [self objectOrNilForKey:kBeautyModelItemsWbody fromDictionary:dict];
            self.wid = [self objectOrNilForKey:kBeautyModelItemsWid fromDictionary:dict];
            self.wpicMHeight = [self objectOrNilForKey:kBeautyModelItemsWpicMHeight fromDictionary:dict];
            self.wpicLarge = [self objectOrNilForKey:kBeautyModelItemsWpicLarge fromDictionary:dict];
            self.cmtDisabled = [self objectOrNilForKey:kBeautyModelItemsCmtDisabled fromDictionary:dict];
            self.updateTime = [self objectOrNilForKey:kBeautyModelItemsUpdateTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.comments forKey:kBeautyModelItemsComments];
    [mutableDict setValue:self.wpicSmall forKey:kBeautyModelItemsWpicSmall];
    [mutableDict setValue:self.wSensitive forKey:kBeautyModelItemsWSensitive];
    [mutableDict setValue:self.wpicMWidth forKey:kBeautyModelItemsWpicMWidth];
    [mutableDict setValue:self.isGif forKey:kBeautyModelItemsIsGif];
    [mutableDict setValue:self.likes forKey:kBeautyModelItemsLikes];
    [mutableDict setValue:self.wpicMiddle forKey:kBeautyModelItemsWpicMiddle];
    [mutableDict setValue:self.wpicSHeight forKey:kBeautyModelItemsWpicSHeight];
    [mutableDict setValue:self.wpicSWidth forKey:kBeautyModelItemsWpicSWidth];
    [mutableDict setValue:self.wbody forKey:kBeautyModelItemsWbody];
    [mutableDict setValue:self.wid forKey:kBeautyModelItemsWid];
    [mutableDict setValue:self.wpicMHeight forKey:kBeautyModelItemsWpicMHeight];
    [mutableDict setValue:self.wpicLarge forKey:kBeautyModelItemsWpicLarge];
    [mutableDict setValue:self.cmtDisabled forKey:kBeautyModelItemsCmtDisabled];
    [mutableDict setValue:self.updateTime forKey:kBeautyModelItemsUpdateTime];

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

    self.comments = [aDecoder decodeObjectForKey:kBeautyModelItemsComments];
    self.wpicSmall = [aDecoder decodeObjectForKey:kBeautyModelItemsWpicSmall];
    self.wSensitive = [aDecoder decodeObjectForKey:kBeautyModelItemsWSensitive];
    self.wpicMWidth = [aDecoder decodeObjectForKey:kBeautyModelItemsWpicMWidth];
    self.isGif = [aDecoder decodeObjectForKey:kBeautyModelItemsIsGif];
    self.likes = [aDecoder decodeObjectForKey:kBeautyModelItemsLikes];
    self.wpicMiddle = [aDecoder decodeObjectForKey:kBeautyModelItemsWpicMiddle];
    self.wpicSHeight = [aDecoder decodeObjectForKey:kBeautyModelItemsWpicSHeight];
    self.wpicSWidth = [aDecoder decodeObjectForKey:kBeautyModelItemsWpicSWidth];
    self.wbody = [aDecoder decodeObjectForKey:kBeautyModelItemsWbody];
    self.wid = [aDecoder decodeObjectForKey:kBeautyModelItemsWid];
    self.wpicMHeight = [aDecoder decodeObjectForKey:kBeautyModelItemsWpicMHeight];
    self.wpicLarge = [aDecoder decodeObjectForKey:kBeautyModelItemsWpicLarge];
    self.cmtDisabled = [aDecoder decodeObjectForKey:kBeautyModelItemsCmtDisabled];
    self.updateTime = [aDecoder decodeObjectForKey:kBeautyModelItemsUpdateTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_comments forKey:kBeautyModelItemsComments];
    [aCoder encodeObject:_wpicSmall forKey:kBeautyModelItemsWpicSmall];
    [aCoder encodeObject:_wSensitive forKey:kBeautyModelItemsWSensitive];
    [aCoder encodeObject:_wpicMWidth forKey:kBeautyModelItemsWpicMWidth];
    [aCoder encodeObject:_isGif forKey:kBeautyModelItemsIsGif];
    [aCoder encodeObject:_likes forKey:kBeautyModelItemsLikes];
    [aCoder encodeObject:_wpicMiddle forKey:kBeautyModelItemsWpicMiddle];
    [aCoder encodeObject:_wpicSHeight forKey:kBeautyModelItemsWpicSHeight];
    [aCoder encodeObject:_wpicSWidth forKey:kBeautyModelItemsWpicSWidth];
    [aCoder encodeObject:_wbody forKey:kBeautyModelItemsWbody];
    [aCoder encodeObject:_wid forKey:kBeautyModelItemsWid];
    [aCoder encodeObject:_wpicMHeight forKey:kBeautyModelItemsWpicMHeight];
    [aCoder encodeObject:_wpicLarge forKey:kBeautyModelItemsWpicLarge];
    [aCoder encodeObject:_cmtDisabled forKey:kBeautyModelItemsCmtDisabled];
    [aCoder encodeObject:_updateTime forKey:kBeautyModelItemsUpdateTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    BeautyModelItems *copy = [[BeautyModelItems alloc] init];
    
    if (copy) {

        copy.comments = [self.comments copyWithZone:zone];
        copy.wpicSmall = [self.wpicSmall copyWithZone:zone];
        copy.wSensitive = [self.wSensitive copyWithZone:zone];
        copy.wpicMWidth = [self.wpicMWidth copyWithZone:zone];
        copy.isGif = [self.isGif copyWithZone:zone];
        copy.likes = [self.likes copyWithZone:zone];
        copy.wpicMiddle = [self.wpicMiddle copyWithZone:zone];
        copy.wpicSHeight = [self.wpicSHeight copyWithZone:zone];
        copy.wpicSWidth = [self.wpicSWidth copyWithZone:zone];
        copy.wbody = [self.wbody copyWithZone:zone];
        copy.wid = [self.wid copyWithZone:zone];
        copy.wpicMHeight = [self.wpicMHeight copyWithZone:zone];
        copy.wpicLarge = [self.wpicLarge copyWithZone:zone];
        copy.cmtDisabled = [self.cmtDisabled copyWithZone:zone];
        copy.updateTime = [self.updateTime copyWithZone:zone];
    }
    
    return copy;
}


@end
