//
//  RadioDetailListList.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RadioDetailListList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double likes;
@property (nonatomic, assign) double userSource;
@property (nonatomic, assign) double duration;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) double processState;
@property (nonatomic, strong) NSString *coverMiddle;
@property (nonatomic, strong) NSString *playPathHq;
@property (nonatomic, assign) double shares;
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, strong) NSString *playPathAacv224;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *smallLogo;
@property (nonatomic, assign) double albumId;
@property (nonatomic, assign) double playtimes;
@property (nonatomic, strong) NSString *playUrl64;
@property (nonatomic, strong) NSString *playPathAacv164;
@property (nonatomic, strong) NSString *playUrl32;
@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *coverSmall;
@property (nonatomic, strong) NSString *coverLarge;
@property (nonatomic, assign) double comments;
@property (nonatomic, assign) double trackId;
@property (nonatomic, assign) double opType;
@property (nonatomic, assign) BOOL isPublic;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
