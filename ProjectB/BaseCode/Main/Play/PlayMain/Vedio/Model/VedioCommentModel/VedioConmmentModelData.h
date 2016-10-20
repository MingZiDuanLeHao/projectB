//
//  VedioConmmentModelData.h
//
//  Created by   on 2016/10/14
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VedioConmmentModelData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *topComments;
@property (nonatomic, strong) NSArray *recentComments;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
