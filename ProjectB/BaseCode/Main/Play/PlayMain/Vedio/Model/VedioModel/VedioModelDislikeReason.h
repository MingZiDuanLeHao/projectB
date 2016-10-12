//
//  VedioModelDislikeReason.h
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VedioModelDislikeReason : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double type;
@property (nonatomic, assign) double dislikeReasonIdentifier;
@property (nonatomic, strong) NSString *title;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
