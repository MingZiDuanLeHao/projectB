//
//  MainDetailRelativeSys.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MainDetailRelativeSys.h"


NSString *const kMainDetailRelativeSysSource = @"source";
NSString *const kMainDetailRelativeSysPtime = @"ptime";
NSString *const kMainDetailRelativeSysImgsrc = @"imgsrc";
NSString *const kMainDetailRelativeSysId = @"id";
NSString *const kMainDetailRelativeSysFrom = @"from";
NSString *const kMainDetailRelativeSysTitle = @"title";
NSString *const kMainDetailRelativeSysHref = @"href";
NSString *const kMainDetailRelativeSysDocID = @"docID";
NSString *const kMainDetailRelativeSysType = @"type";


@interface MainDetailRelativeSys ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainDetailRelativeSys

@synthesize source = _source;
@synthesize ptime = _ptime;
@synthesize imgsrc = _imgsrc;
@synthesize relativeSysIdentifier = _relativeSysIdentifier;
@synthesize from = _from;
@synthesize title = _title;
@synthesize href = _href;
@synthesize docID = _docID;
@synthesize type = _type;


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
            self.source = [self objectOrNilForKey:kMainDetailRelativeSysSource fromDictionary:dict];
            self.ptime = [self objectOrNilForKey:kMainDetailRelativeSysPtime fromDictionary:dict];
            self.imgsrc = [self objectOrNilForKey:kMainDetailRelativeSysImgsrc fromDictionary:dict];
            self.relativeSysIdentifier = [self objectOrNilForKey:kMainDetailRelativeSysId fromDictionary:dict];
            self.from = [self objectOrNilForKey:kMainDetailRelativeSysFrom fromDictionary:dict];
            self.title = [self objectOrNilForKey:kMainDetailRelativeSysTitle fromDictionary:dict];
            self.href = [self objectOrNilForKey:kMainDetailRelativeSysHref fromDictionary:dict];
            self.docID = [self objectOrNilForKey:kMainDetailRelativeSysDocID fromDictionary:dict];
            self.type = [self objectOrNilForKey:kMainDetailRelativeSysType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.source forKey:kMainDetailRelativeSysSource];
    [mutableDict setValue:self.ptime forKey:kMainDetailRelativeSysPtime];
    [mutableDict setValue:self.imgsrc forKey:kMainDetailRelativeSysImgsrc];
    [mutableDict setValue:self.relativeSysIdentifier forKey:kMainDetailRelativeSysId];
    [mutableDict setValue:self.from forKey:kMainDetailRelativeSysFrom];
    [mutableDict setValue:self.title forKey:kMainDetailRelativeSysTitle];
    [mutableDict setValue:self.href forKey:kMainDetailRelativeSysHref];
    [mutableDict setValue:self.docID forKey:kMainDetailRelativeSysDocID];
    [mutableDict setValue:self.type forKey:kMainDetailRelativeSysType];

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

    self.source = [aDecoder decodeObjectForKey:kMainDetailRelativeSysSource];
    self.ptime = [aDecoder decodeObjectForKey:kMainDetailRelativeSysPtime];
    self.imgsrc = [aDecoder decodeObjectForKey:kMainDetailRelativeSysImgsrc];
    self.relativeSysIdentifier = [aDecoder decodeObjectForKey:kMainDetailRelativeSysId];
    self.from = [aDecoder decodeObjectForKey:kMainDetailRelativeSysFrom];
    self.title = [aDecoder decodeObjectForKey:kMainDetailRelativeSysTitle];
    self.href = [aDecoder decodeObjectForKey:kMainDetailRelativeSysHref];
    self.docID = [aDecoder decodeObjectForKey:kMainDetailRelativeSysDocID];
    self.type = [aDecoder decodeObjectForKey:kMainDetailRelativeSysType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_source forKey:kMainDetailRelativeSysSource];
    [aCoder encodeObject:_ptime forKey:kMainDetailRelativeSysPtime];
    [aCoder encodeObject:_imgsrc forKey:kMainDetailRelativeSysImgsrc];
    [aCoder encodeObject:_relativeSysIdentifier forKey:kMainDetailRelativeSysId];
    [aCoder encodeObject:_from forKey:kMainDetailRelativeSysFrom];
    [aCoder encodeObject:_title forKey:kMainDetailRelativeSysTitle];
    [aCoder encodeObject:_href forKey:kMainDetailRelativeSysHref];
    [aCoder encodeObject:_docID forKey:kMainDetailRelativeSysDocID];
    [aCoder encodeObject:_type forKey:kMainDetailRelativeSysType];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainDetailRelativeSys *copy = [[MainDetailRelativeSys alloc] init];
    
    if (copy) {

        copy.source = [self.source copyWithZone:zone];
        copy.ptime = [self.ptime copyWithZone:zone];
        copy.imgsrc = [self.imgsrc copyWithZone:zone];
        copy.relativeSysIdentifier = [self.relativeSysIdentifier copyWithZone:zone];
        copy.from = [self.from copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.href = [self.href copyWithZone:zone];
        copy.docID = [self.docID copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
