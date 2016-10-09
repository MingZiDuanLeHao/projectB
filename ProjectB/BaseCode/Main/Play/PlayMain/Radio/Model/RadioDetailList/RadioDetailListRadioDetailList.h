//
//  RadioDetailListRadioDetailList.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RadioDetailListData;

@interface RadioDetailListRadioDetailList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double ret;
@property (nonatomic, strong) RadioDetailListData *data;
@property (nonatomic, strong) NSString *msg;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
