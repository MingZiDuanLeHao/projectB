//
//  VedioModelDislikeReason.m
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioModelDislikeReason.h"


NSString *const kVedioModelDislikeReasonType = @"type";
NSString *const kVedioModelDislikeReasonId = @"id";
NSString *const kVedioModelDislikeReasonTitle = @"title";


@interface VedioModelDislikeReason ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioModelDislikeReason

@synthesize type = _type;
@synthesize dislikeReasonIdentifier = _dislikeReasonIdentifier;
@synthesize title = _title;


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
            self.type = [[self objectOrNilForKey:kVedioModelDislikeReasonType fromDictionary:dict] doubleValue];
            self.dislikeReasonIdentifier = [[self objectOrNilForKey:kVedioModelDislikeReasonId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kVedioModelDislikeReasonTitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kVedioModelDislikeReasonType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dislikeReasonIdentifier] forKey:kVedioModelDislikeReasonId];
    [mutableDict setValue:self.title forKey:kVedioModelDislikeReasonTitle];

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

    self.type = [aDecoder decodeDoubleForKey:kVedioModelDislikeReasonType];
    self.dislikeReasonIdentifier = [aDecoder decodeDoubleForKey:kVedioModelDislikeReasonId];
    self.title = [aDecoder decodeObjectForKey:kVedioModelDislikeReasonTitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_type forKey:kVedioModelDislikeReasonType];
    [aCoder encodeDouble:_dislikeReasonIdentifier forKey:kVedioModelDislikeReasonId];
    [aCoder encodeObject:_title forKey:kVedioModelDislikeReasonTitle];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioModelDislikeReason *copy = [[VedioModelDislikeReason alloc] init];
    
    if (copy) {

        copy.type = self.type;
        copy.dislikeReasonIdentifier = self.dislikeReasonIdentifier;
        copy.title = [self.title copyWithZone:zone];
    }
    
    return copy;
}


@end
