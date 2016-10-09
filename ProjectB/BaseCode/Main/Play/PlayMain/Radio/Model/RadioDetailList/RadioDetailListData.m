//
//  RadioDetailListData.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailListData.h"
#import "RadioDetailListTracks.h"
#import "RadioDetailListAlbum.h"
#import "RadioDetailListUser.h"


NSString *const kRadioDetailListDataViewTab = @"viewTab";
NSString *const kRadioDetailListDataTracks = @"tracks";
NSString *const kRadioDetailListDataShowFeedButton = @"showFeedButton";
NSString *const kRadioDetailListDataAlbum = @"album";
NSString *const kRadioDetailListDataUser = @"user";


@interface RadioDetailListData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailListData

@synthesize viewTab = _viewTab;
@synthesize tracks = _tracks;
@synthesize showFeedButton = _showFeedButton;
@synthesize album = _album;
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
            self.viewTab = [self objectOrNilForKey:kRadioDetailListDataViewTab fromDictionary:dict];
            self.tracks = [RadioDetailListTracks modelObjectWithDictionary:[dict objectForKey:kRadioDetailListDataTracks]];
            self.showFeedButton = [[self objectOrNilForKey:kRadioDetailListDataShowFeedButton fromDictionary:dict] boolValue];
            self.album = [RadioDetailListAlbum modelObjectWithDictionary:[dict objectForKey:kRadioDetailListDataAlbum]];
            self.user = [RadioDetailListUser modelObjectWithDictionary:[dict objectForKey:kRadioDetailListDataUser]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.viewTab forKey:kRadioDetailListDataViewTab];
    [mutableDict setValue:[self.tracks dictionaryRepresentation] forKey:kRadioDetailListDataTracks];
    [mutableDict setValue:[NSNumber numberWithBool:self.showFeedButton] forKey:kRadioDetailListDataShowFeedButton];
    [mutableDict setValue:[self.album dictionaryRepresentation] forKey:kRadioDetailListDataAlbum];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kRadioDetailListDataUser];

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

    self.viewTab = [aDecoder decodeObjectForKey:kRadioDetailListDataViewTab];
    self.tracks = [aDecoder decodeObjectForKey:kRadioDetailListDataTracks];
    self.showFeedButton = [aDecoder decodeBoolForKey:kRadioDetailListDataShowFeedButton];
    self.album = [aDecoder decodeObjectForKey:kRadioDetailListDataAlbum];
    self.user = [aDecoder decodeObjectForKey:kRadioDetailListDataUser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_viewTab forKey:kRadioDetailListDataViewTab];
    [aCoder encodeObject:_tracks forKey:kRadioDetailListDataTracks];
    [aCoder encodeBool:_showFeedButton forKey:kRadioDetailListDataShowFeedButton];
    [aCoder encodeObject:_album forKey:kRadioDetailListDataAlbum];
    [aCoder encodeObject:_user forKey:kRadioDetailListDataUser];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailListData *copy = [[RadioDetailListData alloc] init];
    
    if (copy) {

        copy.viewTab = [self.viewTab copyWithZone:zone];
        copy.tracks = [self.tracks copyWithZone:zone];
        copy.showFeedButton = self.showFeedButton;
        copy.album = [self.album copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
    }
    
    return copy;
}


@end
