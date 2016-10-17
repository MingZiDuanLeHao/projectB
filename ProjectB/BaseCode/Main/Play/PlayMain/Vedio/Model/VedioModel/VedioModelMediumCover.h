//
//  VedioModelMediumCover.h
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VedioModelMediumCover : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *urlList;
@property (nonatomic, strong) NSString *uri;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
