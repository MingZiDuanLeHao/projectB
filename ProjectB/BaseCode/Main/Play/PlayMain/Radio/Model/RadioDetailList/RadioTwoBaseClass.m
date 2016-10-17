//
//  RadioTwoBaseClass.m
//
//  Created by   on 2016/10/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioTwoBaseClass.h"
#import "RadioTwoData.h"


NSString *const kRadioTwoBaseClassRet = @"ret";
NSString *const kRadioTwoBaseClassData = @"data";
NSString *const kRadioTwoBaseClassMsg = @"msg";


@interface RadioTwoBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioTwoBaseClass

@synthesize ret = _ret;
@synthesize data = _data;
@synthesize msg = _msg;


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
            self.ret = [[self objectOrNilForKey:kRadioTwoBaseClassRet fromDictionary:dict] doubleValue];
            self.data = [RadioTwoData modelObjectWithDictionary:[dict objectForKey:kRadioTwoBaseClassData]];
            self.msg = [self objectOrNilForKey:kRadioTwoBaseClassMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kRadioTwoBaseClassRet];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kRadioTwoBaseClassData];
    [mutableDict setValue:self.msg forKey:kRadioTwoBaseClassMsg];

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

    self.ret = [aDecoder decodeDoubleForKey:kRadioTwoBaseClassRet];
    self.data = [aDecoder decodeObjectForKey:kRadioTwoBaseClassData];
    self.msg = [aDecoder decodeObjectForKey:kRadioTwoBaseClassMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ret forKey:kRadioTwoBaseClassRet];
    [aCoder encodeObject:_data forKey:kRadioTwoBaseClassData];
    [aCoder encodeObject:_msg forKey:kRadioTwoBaseClassMsg];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioTwoBaseClass *copy = [[RadioTwoBaseClass alloc] init];
    
    if (copy) {

        copy.ret = self.ret;
        copy.data = [self.data copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
    }
    
    return copy;
}


@end
