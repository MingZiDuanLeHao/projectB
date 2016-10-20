//
//  VedioModelOriginVideo.h
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VedioModelOriginVideo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *urlList;
@property (nonatomic, assign) double width;
@property (nonatomic, strong) NSString *uri;
@property (nonatomic, assign) double height;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
