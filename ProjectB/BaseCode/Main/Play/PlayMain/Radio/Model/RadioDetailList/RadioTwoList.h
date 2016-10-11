//
//  RadioTwoList.h
//
//  Created by   on 2016/10/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RadioTwoList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double updatedAt;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, assign) double tracks;
@property (nonatomic, assign) double uid;
@property (nonatomic, assign) double playsCounts;
@property (nonatomic, strong) NSString *recSrc;
@property (nonatomic, strong) NSString *coverSmall;
@property (nonatomic, strong) NSString *coverMiddle;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double playTimes;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, assign) double albumId;
@property (nonatomic, strong) NSString *recTrack;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
