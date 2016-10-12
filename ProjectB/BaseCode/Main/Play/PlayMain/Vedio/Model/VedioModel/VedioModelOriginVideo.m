//
//  VedioModelOriginVideo.m
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioModelOriginVideo.h"
#import "VedioModelUrlList.h"


NSString *const kVedioModelOriginVideoUrlList = @"url_list";
NSString *const kVedioModelOriginVideoWidth = @"width";
NSString *const kVedioModelOriginVideoUri = @"uri";
NSString *const kVedioModelOriginVideoHeight = @"height";


@interface VedioModelOriginVideo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioModelOriginVideo

@synthesize urlList = _urlList;
@synthesize width = _width;
@synthesize uri = _uri;
@synthesize height = _height;


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
    NSObject *receivedVedioModelUrlList = [dict objectForKey:kVedioModelOriginVideoUrlList];
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
            self.width = [[self objectOrNilForKey:kVedioModelOriginVideoWidth fromDictionary:dict] doubleValue];
            self.uri = [self objectOrNilForKey:kVedioModelOriginVideoUri fromDictionary:dict];
            self.height = [[self objectOrNilForKey:kVedioModelOriginVideoHeight fromDictionary:dict] doubleValue];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUrlList] forKey:kVedioModelOriginVideoUrlList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kVedioModelOriginVideoWidth];
    [mutableDict setValue:self.uri forKey:kVedioModelOriginVideoUri];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kVedioModelOriginVideoHeight];

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

    self.urlList = [aDecoder decodeObjectForKey:kVedioModelOriginVideoUrlList];
    self.width = [aDecoder decodeDoubleForKey:kVedioModelOriginVideoWidth];
    self.uri = [aDecoder decodeObjectForKey:kVedioModelOriginVideoUri];
    self.height = [aDecoder decodeDoubleForKey:kVedioModelOriginVideoHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_urlList forKey:kVedioModelOriginVideoUrlList];
    [aCoder encodeDouble:_width forKey:kVedioModelOriginVideoWidth];
    [aCoder encodeObject:_uri forKey:kVedioModelOriginVideoUri];
    [aCoder encodeDouble:_height forKey:kVedioModelOriginVideoHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioModelOriginVideo *copy = [[VedioModelOriginVideo alloc] init];
    
    if (copy) {

        copy.urlList = [self.urlList copyWithZone:zone];
        copy.width = self.width;
        copy.uri = [self.uri copyWithZone:zone];
        copy.height = self.height;
    }
    
    return copy;
}


@end
