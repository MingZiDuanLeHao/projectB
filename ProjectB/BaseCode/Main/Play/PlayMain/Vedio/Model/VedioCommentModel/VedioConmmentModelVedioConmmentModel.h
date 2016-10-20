//
//  VedioConmmentModelVedioConmmentModel.h
//
//  Created by   on 2016/10/14
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VedioConmmentModelData;

@interface VedioConmmentModelVedioConmmentModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL hasMore;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) VedioConmmentModelData *data;
@property (nonatomic, assign) NSInteger groupId;
@property (nonatomic, assign) BOOL newComment;
@property (nonatomic, assign) double totalNumber;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
