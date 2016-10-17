//
//  VedioConmmentModelVedioConmmentModel.m
//
//  Created by   on 2016/10/14
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioConmmentModelVedioConmmentModel.h"
#import "VedioConmmentModelData.h"


NSString *const kVedioConmmentModelVedioConmmentModelHasMore = @"has_more";
NSString *const kVedioConmmentModelVedioConmmentModelMessage = @"message";
NSString *const kVedioConmmentModelVedioConmmentModelData = @"data";
NSString *const kVedioConmmentModelVedioConmmentModelGroupId = @"group_id";
NSString *const kVedioConmmentModelVedioConmmentModelNewComment = @"new_comment";
NSString *const kVedioConmmentModelVedioConmmentModelTotalNumber = @"total_number";


@interface VedioConmmentModelVedioConmmentModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioConmmentModelVedioConmmentModel

@synthesize hasMore = _hasMore;
@synthesize message = _message;
@synthesize data = _data;
@synthesize groupId = _groupId;
@synthesize newComment = _newComment;
@synthesize totalNumber = _totalNumber;


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
            self.hasMore = [[self objectOrNilForKey:kVedioConmmentModelVedioConmmentModelHasMore fromDictionary:dict] boolValue];
            self.message = [self objectOrNilForKey:kVedioConmmentModelVedioConmmentModelMessage fromDictionary:dict];
            self.data = [VedioConmmentModelData modelObjectWithDictionary:[dict objectForKey:kVedioConmmentModelVedioConmmentModelData]];
            self.groupId = [[self objectOrNilForKey:kVedioConmmentModelVedioConmmentModelGroupId fromDictionary:dict] intValue];
            self.newComment = [[self objectOrNilForKey:kVedioConmmentModelVedioConmmentModelNewComment fromDictionary:dict] boolValue];
            self.totalNumber = [[self objectOrNilForKey:kVedioConmmentModelVedioConmmentModelTotalNumber fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasMore] forKey:kVedioConmmentModelVedioConmmentModelHasMore];
    [mutableDict setValue:self.message forKey:kVedioConmmentModelVedioConmmentModelMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kVedioConmmentModelVedioConmmentModelData];
    [mutableDict setValue:[NSNumber numberWithInt:self.groupId] forKey:kVedioConmmentModelVedioConmmentModelGroupId];
    [mutableDict setValue:[NSNumber numberWithBool:self.newComment] forKey:kVedioConmmentModelVedioConmmentModelNewComment];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalNumber] forKey:kVedioConmmentModelVedioConmmentModelTotalNumber];

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

    self.hasMore = [aDecoder decodeBoolForKey:kVedioConmmentModelVedioConmmentModelHasMore];
    self.message = [aDecoder decodeObjectForKey:kVedioConmmentModelVedioConmmentModelMessage];
    self.data = [aDecoder decodeObjectForKey:kVedioConmmentModelVedioConmmentModelData];
    self.groupId = [aDecoder decodeIntegerForKey:kVedioConmmentModelVedioConmmentModelGroupId];
    self.newComment = [aDecoder decodeBoolForKey:kVedioConmmentModelVedioConmmentModelNewComment];
    self.totalNumber = [aDecoder decodeDoubleForKey:kVedioConmmentModelVedioConmmentModelTotalNumber];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_hasMore forKey:kVedioConmmentModelVedioConmmentModelHasMore];
    [aCoder encodeObject:_message forKey:kVedioConmmentModelVedioConmmentModelMessage];
    [aCoder encodeObject:_data forKey:kVedioConmmentModelVedioConmmentModelData];
    [aCoder encodeInteger:_groupId forKey:kVedioConmmentModelVedioConmmentModelGroupId];
    [aCoder encodeBool:_newComment forKey:kVedioConmmentModelVedioConmmentModelNewComment];
    [aCoder encodeDouble:_totalNumber forKey:kVedioConmmentModelVedioConmmentModelTotalNumber];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioConmmentModelVedioConmmentModel *copy = [[VedioConmmentModelVedioConmmentModel alloc] init];
    
    if (copy) {

        copy.hasMore = self.hasMore;
        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.groupId = self.groupId;
        copy.newComment = self.newComment;
        copy.totalNumber = self.totalNumber;
    }
    
    return copy;
}


@end
