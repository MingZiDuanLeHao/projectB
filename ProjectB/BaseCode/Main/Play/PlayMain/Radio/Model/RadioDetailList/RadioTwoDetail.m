//
//  RadioTwoDetail.m
//
//  Created by   on 2016/10/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioTwoDetail.h"


NSString *const kRadioTwoDetailTags = @"tags";
NSString *const kRadioTwoDetailIntroRich = @"introRich";
NSString *const kRadioTwoDetailAlbumId = @"albumId";
NSString *const kRadioTwoDetailIntro = @"intro";


@interface RadioTwoDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioTwoDetail

@synthesize tags = _tags;
@synthesize introRich = _introRich;
@synthesize albumId = _albumId;
@synthesize intro = _intro;


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
            self.tags = [self objectOrNilForKey:kRadioTwoDetailTags fromDictionary:dict];
            self.introRich = [self objectOrNilForKey:kRadioTwoDetailIntroRich fromDictionary:dict];
            self.albumId = [[self objectOrNilForKey:kRadioTwoDetailAlbumId fromDictionary:dict] doubleValue];
            self.intro = [self objectOrNilForKey:kRadioTwoDetailIntro fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tags forKey:kRadioTwoDetailTags];
    [mutableDict setValue:self.introRich forKey:kRadioTwoDetailIntroRich];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kRadioTwoDetailAlbumId];
    [mutableDict setValue:self.intro forKey:kRadioTwoDetailIntro];

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

    self.tags = [aDecoder decodeObjectForKey:kRadioTwoDetailTags];
    self.introRich = [aDecoder decodeObjectForKey:kRadioTwoDetailIntroRich];
    self.albumId = [aDecoder decodeDoubleForKey:kRadioTwoDetailAlbumId];
    self.intro = [aDecoder decodeObjectForKey:kRadioTwoDetailIntro];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tags forKey:kRadioTwoDetailTags];
    [aCoder encodeObject:_introRich forKey:kRadioTwoDetailIntroRich];
    [aCoder encodeDouble:_albumId forKey:kRadioTwoDetailAlbumId];
    [aCoder encodeObject:_intro forKey:kRadioTwoDetailIntro];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioTwoDetail *copy = [[RadioTwoDetail alloc] init];
    
    if (copy) {

        copy.tags = [self.tags copyWithZone:zone];
        copy.introRich = [self.introRich copyWithZone:zone];
        copy.albumId = self.albumId;
        copy.intro = [self.intro copyWithZone:zone];
    }
    
    return copy;
}


@end
