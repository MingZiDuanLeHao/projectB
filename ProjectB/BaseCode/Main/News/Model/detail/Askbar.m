//
//  Askbar.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Askbar.h"


NSString *const kAskbarConcernCount = @"concernCount";
NSString *const kAskbarTitle = @"title";
NSString *const kAskbarHeadpicurl = @"headpicurl";
NSString *const kAskbarName = @"name";
NSString *const kAskbarAlias = @"alias";
NSString *const kAskbarExpertId = @"expertId";


@interface Askbar ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Askbar

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
            self.concernCount = [[self objectOrNilForKey:kAskbarConcernCount fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kAskbarTitle fromDictionary:dict];
            self.headpicurl = [self objectOrNilForKey:kAskbarHeadpicurl fromDictionary:dict];
            self.name = [self objectOrNilForKey:kAskbarName fromDictionary:dict];
            self.alias = [self objectOrNilForKey:kAskbarAlias fromDictionary:dict];
            self.expertId = [self objectOrNilForKey:kAskbarExpertId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.concernCount] forKey:kAskbarConcernCount];
    [mutableDict setValue:self.title forKey:kAskbarTitle];
    [mutableDict setValue:self.headpicurl forKey:kAskbarHeadpicurl];
    [mutableDict setValue:self.name forKey:kAskbarName];
    [mutableDict setValue:self.alias forKey:kAskbarAlias];
    [mutableDict setValue:self.expertId forKey:kAskbarExpertId];

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

    self.concernCount = [aDecoder decodeDoubleForKey:kAskbarConcernCount];
    self.title = [aDecoder decodeObjectForKey:kAskbarTitle];
    self.headpicurl = [aDecoder decodeObjectForKey:kAskbarHeadpicurl];
    self.name = [aDecoder decodeObjectForKey:kAskbarName];
    self.alias = [aDecoder decodeObjectForKey:kAskbarAlias];
    self.expertId = [aDecoder decodeObjectForKey:kAskbarExpertId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_concernCount forKey:kAskbarConcernCount];
    [aCoder encodeObject:_title forKey:kAskbarTitle];
    [aCoder encodeObject:_headpicurl forKey:kAskbarHeadpicurl];
    [aCoder encodeObject:_name forKey:kAskbarName];
    [aCoder encodeObject:_alias forKey:kAskbarAlias];
    [aCoder encodeObject:_expertId forKey:kAskbarExpertId];
}

- (id)copyWithZone:(NSZone *)zone
{
    Askbar *copy = [[Askbar alloc] init];
    
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
