//
//  RadioDetailListUser.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailListUser.h"


NSString *const kRadioDetailListUserUid = @"uid";
NSString *const kRadioDetailListUserNickname = @"nickname";


@interface RadioDetailListUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailListUser

@synthesize uid = _uid;
@synthesize nickname = _nickname;


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
            self.uid = [[self objectOrNilForKey:kRadioDetailListUserUid fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kRadioDetailListUserNickname fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kRadioDetailListUserUid];
    [mutableDict setValue:self.nickname forKey:kRadioDetailListUserNickname];

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

    self.uid = [aDecoder decodeDoubleForKey:kRadioDetailListUserUid];
    self.nickname = [aDecoder decodeObjectForKey:kRadioDetailListUserNickname];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_uid forKey:kRadioDetailListUserUid];
    [aCoder encodeObject:_nickname forKey:kRadioDetailListUserNickname];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailListUser *copy = [[RadioDetailListUser alloc] init];
    
    if (copy) {

        copy.uid = self.uid;
        copy.nickname = [self.nickname copyWithZone:zone];
    }
    
    return copy;
}


@end
