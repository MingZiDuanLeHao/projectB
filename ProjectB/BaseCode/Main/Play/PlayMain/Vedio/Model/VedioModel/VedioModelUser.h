//
//  VedioModelUser.h
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VedioModelUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double userIdentifier;
@property (nonatomic, strong) NSString *userDescription;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, assign) BOOL isFollower;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, assign) double ugcCount;
@property (nonatomic, assign) BOOL isFollowing;
@property (nonatomic, strong) NSString *largeAvatarUrl;
@property (nonatomic, assign) double followings;
@property (nonatomic, assign) double userId;
@property (nonatomic, assign) BOOL userVerified;
@property (nonatomic, assign) double point;
@property (nonatomic, assign) double followers;
@property (nonatomic, assign) double createTime;
@property (nonatomic, assign) double gender;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
