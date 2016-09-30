//
//  BaseClass.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class C20N3VJE000146BE;

@interface detailBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) C20N3VJE000146BE *c20N3VJE000146BE;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
