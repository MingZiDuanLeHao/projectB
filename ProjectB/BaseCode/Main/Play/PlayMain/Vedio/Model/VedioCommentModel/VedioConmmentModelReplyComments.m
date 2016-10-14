//
//  VedioConmmentModelReplyComments.m
//
//  Created by   on 2016/10/14
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioConmmentModelReplyComments.h"


NSString *const kVedioConmmentModelReplyCommentsStatus = @"status";
NSString *const kVedioConmmentModelReplyCommentsId = @"id";
NSString *const kVedioConmmentModelReplyCommentsUserName = @"user_name";
NSString *const kVedioConmmentModelReplyCommentsUserId = @"user_id";
NSString *const kVedioConmmentModelReplyCommentsIsUserVerified = @"is_user_verified";
NSString *const kVedioConmmentModelReplyCommentsText = @"text";


@interface VedioConmmentModelReplyComments ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioConmmentModelReplyComments

@synthesize status = _status;
@synthesize replyCommentsIdentifier = _replyCommentsIdentifier;
@synthesize userName = _userName;
@synthesize userId = _userId;
@synthesize isUserVerified = _isUserVerified;
@synthesize text = _text;


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
            self.status = [[self objectOrNilForKey:kVedioConmmentModelReplyCommentsStatus fromDictionary:dict] doubleValue];
            self.replyCommentsIdentifier = [[self objectOrNilForKey:kVedioConmmentModelReplyCommentsId fromDictionary:dict] doubleValue];
            self.userName = [self objectOrNilForKey:kVedioConmmentModelReplyCommentsUserName fromDictionary:dict];
            self.userId = [[self objectOrNilForKey:kVedioConmmentModelReplyCommentsUserId fromDictionary:dict] doubleValue];
            self.isUserVerified = [[self objectOrNilForKey:kVedioConmmentModelReplyCommentsIsUserVerified fromDictionary:dict] boolValue];
            self.text = [self objectOrNilForKey:kVedioConmmentModelReplyCommentsText fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kVedioConmmentModelReplyCommentsStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.replyCommentsIdentifier] forKey:kVedioConmmentModelReplyCommentsId];
    [mutableDict setValue:self.userName forKey:kVedioConmmentModelReplyCommentsUserName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kVedioConmmentModelReplyCommentsUserId];
    [mutableDict setValue:[NSNumber numberWithBool:self.isUserVerified] forKey:kVedioConmmentModelReplyCommentsIsUserVerified];
    [mutableDict setValue:self.text forKey:kVedioConmmentModelReplyCommentsText];

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

    self.status = [aDecoder decodeDoubleForKey:kVedioConmmentModelReplyCommentsStatus];
    self.replyCommentsIdentifier = [aDecoder decodeDoubleForKey:kVedioConmmentModelReplyCommentsId];
    self.userName = [aDecoder decodeObjectForKey:kVedioConmmentModelReplyCommentsUserName];
    self.userId = [aDecoder decodeDoubleForKey:kVedioConmmentModelReplyCommentsUserId];
    self.isUserVerified = [aDecoder decodeBoolForKey:kVedioConmmentModelReplyCommentsIsUserVerified];
    self.text = [aDecoder decodeObjectForKey:kVedioConmmentModelReplyCommentsText];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kVedioConmmentModelReplyCommentsStatus];
    [aCoder encodeDouble:_replyCommentsIdentifier forKey:kVedioConmmentModelReplyCommentsId];
    [aCoder encodeObject:_userName forKey:kVedioConmmentModelReplyCommentsUserName];
    [aCoder encodeDouble:_userId forKey:kVedioConmmentModelReplyCommentsUserId];
    [aCoder encodeBool:_isUserVerified forKey:kVedioConmmentModelReplyCommentsIsUserVerified];
    [aCoder encodeObject:_text forKey:kVedioConmmentModelReplyCommentsText];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioConmmentModelReplyComments *copy = [[VedioConmmentModelReplyComments alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.replyCommentsIdentifier = self.replyCommentsIdentifier;
        copy.userName = [self.userName copyWithZone:zone];
        copy.userId = self.userId;
        copy.isUserVerified = self.isUserVerified;
        copy.text = [self.text copyWithZone:zone];
    }
    
    return copy;
}


@end
