//
//  MainDetailBaseClass.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MainDetailC20N3VJE000146BE;

@interface MainDetailBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) MainDetailC20N3VJE000146BE *c20N3VJE000146BE;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict key:(NSString *)key;
- (instancetype)initWithDictionary:(NSDictionary *)dict key:(NSString *)key;
- (NSDictionary *)dictionaryRepresentation;

@end
