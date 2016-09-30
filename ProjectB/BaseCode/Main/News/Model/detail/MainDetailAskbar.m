//
//  MainDetailAskbar.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MainDetailAskbar.h"


NSString *const kMainDetailAskbarConcernCount = @"concernCount";
NSString *const kMainDetailAskbarTitle = @"title";
NSString *const kMainDetailAskbarHeadpicurl = @"headpicurl";
NSString *const kMainDetailAskbarName = @"name";
NSString *const kMainDetailAskbarAlias = @"alias";
NSString *const kMainDetailAskbarExpertId = @"expertId";


@interface MainDetailAskbar ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainDetailAskbar

@synthesize concernCount = _concernCount;
@synthesize title = _title;
@synthesize headpicurl = _headpicurl;
@synthesize name = _name;
@synthesize alias = _alias;
@synthesize expertId = _expertId;


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
            self.concernCount = [[self objectOrNilForKey:kMainDetailAskbarConcernCount fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kMainDetailAskbarTitle fromDictionary:dict];
            self.headpicurl = [self objectOrNilForKey:kMainDetailAskbarHeadpicurl fromDictionary:dict];
            self.name = [self objectOrNilForKey:kMainDetailAskbarName fromDictionary:dict];
            self.alias = [self objectOrNilForKey:kMainDetailAskbarAlias fromDictionary:dict];
            self.expertId = [self objectOrNilForKey:kMainDetailAskbarExpertId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.concernCount] forKey:kMainDetailAskbarConcernCount];
    [mutableDict setValue:self.title forKey:kMainDetailAskbarTitle];
    [mutableDict setValue:self.headpicurl forKey:kMainDetailAskbarHeadpicurl];
    [mutableDict setValue:self.name forKey:kMainDetailAskbarName];
    [mutableDict setValue:self.alias forKey:kMainDetailAskbarAlias];
    [mutableDict setValue:self.expertId forKey:kMainDetailAskbarExpertId];

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

    self.concernCount = [aDecoder decodeDoubleForKey:kMainDetailAskbarConcernCount];
    self.title = [aDecoder decodeObjectForKey:kMainDetailAskbarTitle];
    self.headpicurl = [aDecoder decodeObjectForKey:kMainDetailAskbarHeadpicurl];
    self.name = [aDecoder decodeObjectForKey:kMainDetailAskbarName];
    self.alias = [aDecoder decodeObjectForKey:kMainDetailAskbarAlias];
    self.expertId = [aDecoder decodeObjectForKey:kMainDetailAskbarExpertId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_concernCount forKey:kMainDetailAskbarConcernCount];
    [aCoder encodeObject:_title forKey:kMainDetailAskbarTitle];
    [aCoder encodeObject:_headpicurl forKey:kMainDetailAskbarHeadpicurl];
    [aCoder encodeObject:_name forKey:kMainDetailAskbarName];
    [aCoder encodeObject:_alias forKey:kMainDetailAskbarAlias];
    [aCoder encodeObject:_expertId forKey:kMainDetailAskbarExpertId];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainDetailAskbar *copy = [[MainDetailAskbar alloc] init];
    
    if (copy) {

        copy.concernCount = self.concernCount;
        copy.title = [self.title copyWithZone:zone];
        copy.headpicurl = [self.headpicurl copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.alias = [self.alias copyWithZone:zone];
        copy.expertId = [self.expertId copyWithZone:zone];
    }
    
    return copy;
}


@end
