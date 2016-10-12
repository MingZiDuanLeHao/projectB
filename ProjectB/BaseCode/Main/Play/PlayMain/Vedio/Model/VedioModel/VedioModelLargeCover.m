//
//  VedioModelLargeCover.m
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioModelLargeCover.h"
#import "VedioModelUrlList.h"


NSString *const kVedioModelLargeCoverUrlList = @"url_list";
NSString *const kVedioModelLargeCoverUri = @"uri";


@interface VedioModelLargeCover ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioModelLargeCover

@synthesize urlList = _urlList;
@synthesize uri = _uri;


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
    NSObject *receivedVedioModelUrlList = [dict objectForKey:kVedioModelLargeCoverUrlList];
    NSMutableArray *parsedVedioModelUrlList = [NSMutableArray array];
    if ([receivedVedioModelUrlList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedVedioModelUrlList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedVedioModelUrlList addObject:[VedioModelUrlList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedVedioModelUrlList isKindOfClass:[NSDictionary class]]) {
       [parsedVedioModelUrlList addObject:[VedioModelUrlList modelObjectWithDictionary:(NSDictionary *)receivedVedioModelUrlList]];
    }

    self.urlList = [NSArray arrayWithArray:parsedVedioModelUrlList];
            self.uri = [self objectOrNilForKey:kVedioModelLargeCoverUri fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForUrlList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.urlList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForUrlList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForUrlList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUrlList] forKey:kVedioModelLargeCoverUrlList];
    [mutableDict setValue:self.uri forKey:kVedioModelLargeCoverUri];

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

    self.urlList = [aDecoder decodeObjectForKey:kVedioModelLargeCoverUrlList];
    self.uri = [aDecoder decodeObjectForKey:kVedioModelLargeCoverUri];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_urlList forKey:kVedioModelLargeCoverUrlList];
    [aCoder encodeObject:_uri forKey:kVedioModelLargeCoverUri];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioModelLargeCover *copy = [[VedioModelLargeCover alloc] init];
    
    if (copy) {

        copy.urlList = [self.urlList copyWithZone:zone];
        copy.uri = [self.uri copyWithZone:zone];
    }
    
    return copy;
}


@end
