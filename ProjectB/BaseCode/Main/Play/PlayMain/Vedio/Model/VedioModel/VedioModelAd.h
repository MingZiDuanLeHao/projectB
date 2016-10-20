//
//  VedioModelAd.h
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VedioModelLogExtra, VedioModelVideoInfo;

@interface VedioModelAd : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) VedioModelLogExtra *logExtra;
@property (nonatomic, assign) id source;
@property (nonatomic, strong) NSString *openUrl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *gifUrl;
@property (nonatomic, strong) NSString *buttonText;
@property (nonatomic, assign) double displayImageHeight;
@property (nonatomic, assign) double isAd;
@property (nonatomic, strong) NSString *appleid;
@property (nonatomic, strong) NSArray *trackUrlList;
@property (nonatomic, assign) double abShowStyle;
@property (nonatomic, strong) NSString *avatarName;
@property (nonatomic, assign) double hideIfExists;
@property (nonatomic, strong) NSString *trackUrl;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) NSString *webUrl;
@property (nonatomic, strong) NSString *downloadUrl;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) double adIdentifier;
@property (nonatomic, strong) NSString *displayInfo;
@property (nonatomic, assign) double displayType;
@property (nonatomic, strong) NSString *label;
@property (nonatomic, strong) NSString *displayImage;
@property (nonatomic, strong) VedioModelVideoInfo *videoInfo;
@property (nonatomic, strong) NSString *package;
@property (nonatomic, assign) double endTime;
@property (nonatomic, assign) double adId;
@property (nonatomic, assign) double displayImageWidth;
@property (nonatomic, strong) NSString *ipaUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
