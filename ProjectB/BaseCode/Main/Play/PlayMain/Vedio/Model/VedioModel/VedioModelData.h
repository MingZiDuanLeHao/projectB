//
//  VedioModelData.h
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VedioModelData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL hasMore;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, assign) double minTime;
@property (nonatomic, assign) double maxTime;
@property (nonatomic, strong) NSString *tip;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
