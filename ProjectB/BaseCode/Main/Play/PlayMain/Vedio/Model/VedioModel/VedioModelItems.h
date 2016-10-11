//
//  VedioModelItems.h
//
//  Created by   on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VedioModelItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *views;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) NSString *vpicSmall;
@property (nonatomic, assign) id uid;
@property (nonatomic, strong) NSString *wSensitive;
@property (nonatomic, strong) NSString *siteCode;
@property (nonatomic, strong) NSString *likes;
@property (nonatomic, strong) NSString *fetchPlayUrl;
@property (nonatomic, strong) NSString *noCopyright;
@property (nonatomic, strong) NSString *vpicMiddle;
@property (nonatomic, strong) NSString *vplayUrl;
@property (nonatomic, strong) NSString *wbody;
@property (nonatomic, strong) NSString *wid;
@property (nonatomic, assign) id userName;
@property (nonatomic, assign) id userAvatar;
@property (nonatomic, strong) NSString *vsourceUrl;
@property (nonatomic, strong) NSString *updateTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
