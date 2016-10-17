//
//  RadioTwoDetail.h
//
//  Created by   on 2016/10/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RadioTwoDetail : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *tags;
@property (nonatomic, strong) NSString *introRich;
@property (nonatomic, assign) double albumId;
@property (nonatomic, strong) NSString *intro;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
