//
//  VedioConmmentModelTopComments.h
//
//  Created by   on 2016/10/14
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VedioConmmentModelTopComments : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userProfileUrl;
@property (nonatomic, assign) NSInteger groupId;
@property (nonatomic, assign) double isDigg;
@property (nonatomic, assign) double userBury;
@property (nonatomic, assign) double status;
@property (nonatomic, assign) double userId;
@property (nonatomic, assign) double createTime;
@property (nonatomic, assign) double diggCount;
@property (nonatomic, assign) double shareType;
@property (nonatomic, assign) double buryCount;
@property (nonatomic, assign) BOOL userVerified;
@property (nonatomic, strong) NSString *shareUrl;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) NSString *platformId;
@property (nonatomic, assign) double topCommentsIdentifier;
@property (nonatomic, strong) NSString *platform;
@property (nonatomic, assign) double userDigg;
@property (nonatomic, strong) NSString *userProfileImageUrl;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSArray *replyComments;
@property (nonatomic, strong) NSString *topCommentsDescription;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
