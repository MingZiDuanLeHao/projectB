//
//  MainDetailHuati.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MainDetailHuati : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *topicId;
@property (nonatomic, strong) NSString *topicName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
