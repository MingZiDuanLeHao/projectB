//
//  RadioTwoData.m
//
//  Created by   on 2016/10/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioTwoData.h"
#import "RadioTwoDetail.h"
#import "RadioTwoRecs.h"
#import "RadioTwoUser.h"


NSString *const kRadioTwoDataShowFeedButton = @"showFeedButton";
NSString *const kRadioTwoDataDetail = @"detail";
NSString *const kRadioTwoDataRecs = @"recs";
NSString *const kRadioTwoDataUser = @"user";


@interface RadioTwoData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioTwoData

@synthesize showFeedButton = _showFeedButton;
@synthesize detail = _detail;
@synthesize recs = _recs;
@synthesize user = _user;


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
            self.showFeedButton = [[self objectOrNilForKey:kRadioTwoDataShowFeedButton fromDictionary:dict] boolValue];
            self.detail = [RadioTwoDetail modelObjectWithDictionary:[dict objectForKey:kRadioTwoDataDetail]];
            self.recs = [RadioTwoRecs modelObjectWithDictionary:[dict objectForKey:kRadioTwoDataRecs]];
            self.user = [RadioTwoUser modelObjectWithDictionary:[dict objectForKey:kRadioTwoDataUser]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.showFeedButton] forKey:kRadioTwoDataShowFeedButton];
    [mutableDict setValue:[self.detail dictionaryRepresentation] forKey:kRadioTwoDataDetail];
    [mutableDict setValue:[self.recs dictionaryRepresentation] forKey:kRadioTwoDataRecs];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kRadioTwoDataUser];

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

    self.showFeedButton = [aDecoder decodeBoolForKey:kRadioTwoDataShowFeedButton];
    self.detail = [aDecoder decodeObjectForKey:kRadioTwoDataDetail];
    self.recs = [aDecoder decodeObjectForKey:kRadioTwoDataRecs];
    self.user = [aDecoder decodeObjectForKey:kRadioTwoDataUser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_showFeedButton forKey:kRadioTwoDataShowFeedButton];
    [aCoder encodeObject:_detail forKey:kRadioTwoDataDetail];
    [aCoder encodeObject:_recs forKey:kRadioTwoDataRecs];
    [aCoder encodeObject:_user forKey:kRadioTwoDataUser];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioTwoData *copy = [[RadioTwoData alloc] init];
    
    if (copy) {

        copy.showFeedButton = self.showFeedButton;
        copy.detail = [self.detail copyWithZone:zone];
        copy.recs = [self.recs copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
    }
    
    return copy;
}


@end
