//
//  VedioModelVideoInfo.h
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VedioModelVideoInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double videoDuration;
@property (nonatomic, strong) NSString *backupUrl;
@property (nonatomic, strong) NSString *coverUrl;
@property (nonatomic, assign) double height;
@property (nonatomic, assign) double width;
@property (nonatomic, strong) NSString *videoUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
