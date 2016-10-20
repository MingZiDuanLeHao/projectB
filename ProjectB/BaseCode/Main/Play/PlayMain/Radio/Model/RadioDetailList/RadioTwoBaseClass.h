//
//  RadioTwoBaseClass.h
//
//  Created by   on 2016/10/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RadioTwoData;

@interface RadioTwoBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double ret;
@property (nonatomic, strong) RadioTwoData *data;
@property (nonatomic, strong) NSString *msg;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
