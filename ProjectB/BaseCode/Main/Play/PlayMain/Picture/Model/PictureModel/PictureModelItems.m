//
//  PictureModelItems.m
//
//  Created by   on 2016/10/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PictureModelItems.h"


NSString *const kPictureModelItemsComments = @"comments";
NSString *const kPictureModelItemsWpicSmall = @"wpic_small";
NSString *const kPictureModelItemsUid = @"uid";
NSString *const kPictureModelItemsWSensitive = @"w_sensitive";
NSString *const kPictureModelItemsWpicMWidth = @"wpic_m_width";
NSString *const kPictureModelItemsIsGif = @"is_gif";
NSString *const kPictureModelItemsLikes = @"likes";
NSString *const kPictureModelItemsWpicMiddle = @"wpic_middle";
NSString *const kPictureModelItemsWpicSHeight = @"wpic_s_height";
NSString *const kPictureModelItemsWpicSWidth = @"wpic_s_width";
NSString *const kPictureModelItemsWbody = @"wbody";
NSString *const kPictureModelItemsWid = @"wid";
NSString *const kPictureModelItemsWpicMHeight = @"wpic_m_height";
NSString *const kPictureModelItemsWpicLarge = @"wpic_large";
NSString *const kPictureModelItemsUserName = @"user_name";
NSString *const kPictureModelItemsUserAvatar = @"user_avatar";
NSString *const kPictureModelItemsUpdateTime = @"update_time";


@interface PictureModelItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PictureModelItems

@synthesize comments = _comments;
@synthesize wpicSmall = _wpicSmall;
@synthesize uid = _uid;
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
@synthesize userName = _userName;
@synthesize userAvatar = _userAvatar;
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
            self.comments = [self objectOrNilForKey:kPictureModelItemsComments fromDictionary:dict];
            self.wpicSmall = [self objectOrNilForKey:kPictureModelItemsWpicSmall fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kPictureModelItemsUid fromDictionary:dict];
            self.wSensitive = [self objectOrNilForKey:kPictureModelItemsWSensitive fromDictionary:dict];
            self.wpicMWidth = [self objectOrNilForKey:kPictureModelItemsWpicMWidth fromDictionary:dict];
            self.isGif = [self objectOrNilForKey:kPictureModelItemsIsGif fromDictionary:dict];
            self.likes = [self objectOrNilForKey:kPictureModelItemsLikes fromDictionary:dict];
            self.wpicMiddle = [self objectOrNilForKey:kPictureModelItemsWpicMiddle fromDictionary:dict];
            self.wpicSHeight = [self objectOrNilForKey:kPictureModelItemsWpicSHeight fromDictionary:dict];
            self.wpicSWidth = [self objectOrNilForKey:kPictureModelItemsWpicSWidth fromDictionary:dict];
            self.wbody = [self objectOrNilForKey:kPictureModelItemsWbody fromDictionary:dict];
            self.wid = [self objectOrNilForKey:kPictureModelItemsWid fromDictionary:dict];
            self.wpicMHeight = [self objectOrNilForKey:kPictureModelItemsWpicMHeight fromDictionary:dict];
            self.wpicLarge = [self objectOrNilForKey:kPictureModelItemsWpicLarge fromDictionary:dict];
            self.userName = [self objectOrNilForKey:kPictureModelItemsUserName fromDictionary:dict];
            self.userAvatar = [self objectOrNilForKey:kPictureModelItemsUserAvatar fromDictionary:dict];
            self.updateTime = [self objectOrNilForKey:kPictureModelItemsUpdateTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.comments forKey:kPictureModelItemsComments];
    [mutableDict setValue:self.wpicSmall forKey:kPictureModelItemsWpicSmall];
    [mutableDict setValue:self.uid forKey:kPictureModelItemsUid];
    [mutableDict setValue:self.wSensitive forKey:kPictureModelItemsWSensitive];
    [mutableDict setValue:self.wpicMWidth forKey:kPictureModelItemsWpicMWidth];
    [mutableDict setValue:self.isGif forKey:kPictureModelItemsIsGif];
    [mutableDict setValue:self.likes forKey:kPictureModelItemsLikes];
    [mutableDict setValue:self.wpicMiddle forKey:kPictureModelItemsWpicMiddle];
    [mutableDict setValue:self.wpicSHeight forKey:kPictureModelItemsWpicSHeight];
    [mutableDict setValue:self.wpicSWidth forKey:kPictureModelItemsWpicSWidth];
    [mutableDict setValue:self.wbody forKey:kPictureModelItemsWbody];
    [mutableDict setValue:self.wid forKey:kPictureModelItemsWid];
    [mutableDict setValue:self.wpicMHeight forKey:kPictureModelItemsWpicMHeight];
    [mutableDict setValue:self.wpicLarge forKey:kPictureModelItemsWpicLarge];
    [mutableDict setValue:self.userName forKey:kPictureModelItemsUserName];
    [mutableDict setValue:self.userAvatar forKey:kPictureModelItemsUserAvatar];
    [mutableDict setValue:self.updateTime forKey:kPictureModelItemsUpdateTime];

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

    self.comments = [aDecoder decodeObjectForKey:kPictureModelItemsComments];
    self.wpicSmall = [aDecoder decodeObjectForKey:kPictureModelItemsWpicSmall];
    self.uid = [aDecoder decodeObjectForKey:kPictureModelItemsUid];
    self.wSensitive = [aDecoder decodeObjectForKey:kPictureModelItemsWSensitive];
    self.wpicMWidth = [aDecoder decodeObjectForKey:kPictureModelItemsWpicMWidth];
    self.isGif = [aDecoder decodeObjectForKey:kPictureModelItemsIsGif];
    self.likes = [aDecoder decodeObjectForKey:kPictureModelItemsLikes];
    self.wpicMiddle = [aDecoder decodeObjectForKey:kPictureModelItemsWpicMiddle];
    self.wpicSHeight = [aDecoder decodeObjectForKey:kPictureModelItemsWpicSHeight];
    self.wpicSWidth = [aDecoder decodeObjectForKey:kPictureModelItemsWpicSWidth];
    self.wbody = [aDecoder decodeObjectForKey:kPictureModelItemsWbody];
    self.wid = [aDecoder decodeObjectForKey:kPictureModelItemsWid];
    self.wpicMHeight = [aDecoder decodeObjectForKey:kPictureModelItemsWpicMHeight];
    self.wpicLarge = [aDecoder decodeObjectForKey:kPictureModelItemsWpicLarge];
    self.userName = [aDecoder decodeObjectForKey:kPictureModelItemsUserName];
    self.userAvatar = [aDecoder decodeObjectForKey:kPictureModelItemsUserAvatar];
    self.updateTime = [aDecoder decodeObjectForKey:kPictureModelItemsUpdateTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_comments forKey:kPictureModelItemsComments];
    [aCoder encodeObject:_wpicSmall forKey:kPictureModelItemsWpicSmall];
    [aCoder encodeObject:_uid forKey:kPictureModelItemsUid];
    [aCoder encodeObject:_wSensitive forKey:kPictureModelItemsWSensitive];
    [aCoder encodeObject:_wpicMWidth forKey:kPictureModelItemsWpicMWidth];
    [aCoder encodeObject:_isGif forKey:kPictureModelItemsIsGif];
    [aCoder encodeObject:_likes forKey:kPictureModelItemsLikes];
    [aCoder encodeObject:_wpicMiddle forKey:kPictureModelItemsWpicMiddle];
    [aCoder encodeObject:_wpicSHeight forKey:kPictureModelItemsWpicSHeight];
    [aCoder encodeObject:_wpicSWidth forKey:kPictureModelItemsWpicSWidth];
    [aCoder encodeObject:_wbody forKey:kPictureModelItemsWbody];
    [aCoder encodeObject:_wid forKey:kPictureModelItemsWid];
    [aCoder encodeObject:_wpicMHeight forKey:kPictureModelItemsWpicMHeight];
    [aCoder encodeObject:_wpicLarge forKey:kPictureModelItemsWpicLarge];
    [aCoder encodeObject:_userName forKey:kPictureModelItemsUserName];
    [aCoder encodeObject:_userAvatar forKey:kPictureModelItemsUserAvatar];
    [aCoder encodeObject:_updateTime forKey:kPictureModelItemsUpdateTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    PictureModelItems *copy = [[PictureModelItems alloc] init];
    
    if (copy) {

        copy.comments = [self.comments copyWithZone:zone];
        copy.wpicSmall = [self.wpicSmall copyWithZone:zone];
        copy.uid = [self.uid copyWithZone:zone];
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
        copy.userName = [self.userName copyWithZone:zone];
        copy.userAvatar = [self.userAvatar copyWithZone:zone];
        copy.updateTime = [self.updateTime copyWithZone:zone];
    }
    
    return copy;
}


@end
