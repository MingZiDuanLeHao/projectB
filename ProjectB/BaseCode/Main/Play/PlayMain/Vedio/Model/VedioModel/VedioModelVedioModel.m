//
//  VedioModelVedioModel.m
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioModelVedioModel.h"
#import "VedioModelData.h"


NSString *const kVedioModelVedioModelMessage = @"message";
NSString *const kVedioModelVedioModelData = @"data";


@interface VedioModelVedioModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioModelVedioModel

@synthesize message = _message;
@synthesize data = _data;


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
            self.message = [self objectOrNilForKey:kVedioModelVedioModelMessage fromDictionary:dict];
            self.data = [VedioModelData modelObjectWithDictionary:[dict objectForKey:kVedioModelVedioModelData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kVedioModelVedioModelMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kVedioModelVedioModelData];

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

    self.message = [aDecoder decodeObjectForKey:kVedioModelVedioModelMessage];
    self.data = [aDecoder decodeObjectForKey:kVedioModelVedioModelData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kVedioModelVedioModelMessage];
    [aCoder encodeObject:_data forKey:kVedioModelVedioModelData];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioModelVedioModel *copy = [[VedioModelVedioModel alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
