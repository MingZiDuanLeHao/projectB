//
//  VedioModelLogExtra.h
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VedioModelLogExtra : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *adPrice;
@property (nonatomic, assign) double rit;
@property (nonatomic, strong) NSString *reqId;
@property (nonatomic, assign) double convertId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
