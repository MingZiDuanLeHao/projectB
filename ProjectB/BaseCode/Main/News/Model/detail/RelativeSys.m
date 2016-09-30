//
//  RelativeSys.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RelativeSys.h"


NSString *const kRelativeSysSource = @"source";
NSString *const kRelativeSysPtime = @"ptime";
NSString *const kRelativeSysImgsrc = @"imgsrc";
NSString *const kRelativeSysId = @"id";
NSString *const kRelativeSysFrom = @"from";
NSString *const kRelativeSysTitle = @"title";
NSString *const kRelativeSysHref = @"href";
NSString *const kRelativeSysDocID = @"docID";
NSString *const kRelativeSysType = @"type";


@interface RelativeSys ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RelativeSys

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
            self.source = [self objectOrNilForKey:kRelativeSysSource fromDictionary:dict];
            self.ptime = [self objectOrNilForKey:kRelativeSysPtime fromDictionary:dict];
            self.imgsrc = [self objectOrNilForKey:kRelativeSysImgsrc fromDictionary:dict];
            self.relativeSysIdentifier = [self objectOrNilForKey:kRelativeSysId fromDictionary:dict];
            self.from = [self objectOrNilForKey:kRelativeSysFrom fromDictionary:dict];
            self.title = [self objectOrNilForKey:kRelativeSysTitle fromDictionary:dict];
            self.href = [self objectOrNilForKey:kRelativeSysHref fromDictionary:dict];
            self.docID = [self objectOrNilForKey:kRelativeSysDocID fromDictionary:dict];
            self.type = [self objectOrNilForKey:kRelativeSysType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.source forKey:kRelativeSysSource];
    [mutableDict setValue:self.ptime forKey:kRelativeSysPtime];
    [mutableDict setValue:self.imgsrc forKey:kRelativeSysImgsrc];
    [mutableDict setValue:self.relativeSysIdentifier forKey:kRelativeSysId];
    [mutableDict setValue:self.from forKey:kRelativeSysFrom];
    [mutableDict setValue:self.title forKey:kRelativeSysTitle];
    [mutableDict setValue:self.href forKey:kRelativeSysHref];
    [mutableDict setValue:self.docID forKey:kRelativeSysDocID];
    [mutableDict setValue:self.type forKey:kRelativeSysType];

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

    self.source = [aDecoder decodeObjectForKey:kRelativeSysSource];
    self.ptime = [aDecoder decodeObjectForKey:kRelativeSysPtime];
    self.imgsrc = [aDecoder decodeObjectForKey:kRelativeSysImgsrc];
    self.relativeSysIdentifier = [aDecoder decodeObjectForKey:kRelativeSysId];
    self.from = [aDecoder decodeObjectForKey:kRelativeSysFrom];
    self.title = [aDecoder decodeObjectForKey:kRelativeSysTitle];
    self.href = [aDecoder decodeObjectForKey:kRelativeSysHref];
    self.docID = [aDecoder decodeObjectForKey:kRelativeSysDocID];
    self.type = [aDecoder decodeObjectForKey:kRelativeSysType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_source forKey:kRelativeSysSource];
    [aCoder encodeObject:_ptime forKey:kRelativeSysPtime];
    [aCoder encodeObject:_imgsrc forKey:kRelativeSysImgsrc];
    [aCoder encodeObject:_relativeSysIdentifier forKey:kRelativeSysId];
    [aCoder encodeObject:_from forKey:kRelativeSysFrom];
    [aCoder encodeObject:_title forKey:kRelativeSysTitle];
    [aCoder encodeObject:_href forKey:kRelativeSysHref];
    [aCoder encodeObject:_docID forKey:kRelativeSysDocID];
    [aCoder encodeObject:_type forKey:kRelativeSysType];
}

- (id)copyWithZone:(NSZone *)zone
{
    RelativeSys *copy = [[RelativeSys alloc] init];
    
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
