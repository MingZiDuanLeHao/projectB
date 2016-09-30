//
//  RadioDetailListData.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RadioDetailListTracks, RadioDetailListAlbum, RadioDetailListUser;

@interface RadioDetailListData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *viewTab;
@property (nonatomic, strong) RadioDetailListTracks *tracks;
@property (nonatomic, assign) BOOL showFeedButton;
@property (nonatomic, strong) RadioDetailListAlbum *album;
@property (nonatomic, strong) RadioDetailListUser *user;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
