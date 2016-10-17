//
//  RadioTwoData.h
//
//  Created by   on 2016/10/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RadioTwoDetail, RadioTwoRecs, RadioTwoUser;

@interface RadioTwoData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL showFeedButton;
@property (nonatomic, strong) RadioTwoDetail *detail;
@property (nonatomic, strong) RadioTwoRecs *recs;
@property (nonatomic, strong) RadioTwoUser *user;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
