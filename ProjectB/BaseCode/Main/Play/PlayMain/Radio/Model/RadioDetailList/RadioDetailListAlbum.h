//
//  RadioDetailListAlbum.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RadioDetailListAlbum : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double serialState;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *coverWebLarge;
@property (nonatomic, strong) NSString *coverMiddle;
@property (nonatomic, assign) BOOL hasNew;
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) BOOL isVerified;
@property (nonatomic, assign) BOOL isRecordDesc;
@property (nonatomic, assign) double shares;
@property (nonatomic, strong) NSString *avatarPath;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, assign) double lastUptrackAt;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, assign) double albumId;
@property (nonatomic, strong) NSString *detailCoverPath;
@property (nonatomic, strong) NSString *coverSmall;
@property (nonatomic, strong) NSString *coverLarge;
@property (nonatomic, strong) NSString *coverOrigin;
@property (nonatomic, assign) double uid;
@property (nonatomic, assign) double tracks;
@property (nonatomic, assign) double playTrackId;
@property (nonatomic, assign) BOOL isFavorite;
@property (nonatomic, strong) NSString *coverLargePop;
@property (nonatomic, assign) double serializeStatus;
@property (nonatomic, assign) double categoryId;
@property (nonatomic, assign) double playTimes;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
