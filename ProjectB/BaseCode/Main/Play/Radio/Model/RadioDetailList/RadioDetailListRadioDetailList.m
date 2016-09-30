//
//  RadioDetailListRadioDetailList.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailListRadioDetailList.h"
#import "RadioDetailListData.h"


NSString *const kRadioDetailListRadioDetailListRet = @"ret";
NSString *const kRadioDetailListRadioDetailListData = @"data";
NSString *const kRadioDetailListRadioDetailListMsg = @"msg";


@interface RadioDetailListRadioDetailList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailListRadioDetailList

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
            self.ret = [[self objectOrNilForKey:kRadioDetailListRadioDetailListRet fromDictionary:dict] doubleValue];
            self.data = [RadioDetailListData modelObjectWithDictionary:[dict objectForKey:kRadioDetailListRadioDetailListData]];
            self.msg = [self objectOrNilForKey:kRadioDetailListRadioDetailListMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kRadioDetailListRadioDetailListRet];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kRadioDetailListRadioDetailListData];
    [mutableDict setValue:self.msg forKey:kRadioDetailListRadioDetailListMsg];

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

    self.ret = [aDecoder decodeDoubleForKey:kRadioDetailListRadioDetailListRet];
    self.data = [aDecoder decodeObjectForKey:kRadioDetailListRadioDetailListData];
    self.msg = [aDecoder decodeObjectForKey:kRadioDetailListRadioDetailListMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ret forKey:kRadioDetailListRadioDetailListRet];
    [aCoder encodeObject:_data forKey:kRadioDetailListRadioDetailListData];
    [aCoder encodeObject:_msg forKey:kRadioDetailListRadioDetailListMsg];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailListRadioDetailList *copy = [[RadioDetailListRadioDetailList alloc] init];
    
    if (copy) {

        copy.ret = self.ret;
        copy.data = [self.data copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
    }
    
    return copy;
}


@end
