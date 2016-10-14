//
//  VedioConmmentModelReplyComments.h
//
//  Created by   on 2016/10/14
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VedioConmmentModelReplyComments : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double status;
@property (nonatomic, assign) double replyCommentsIdentifier;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, assign) double userId;
@property (nonatomic, assign) BOOL isUserVerified;
@property (nonatomic, strong) NSString *text;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
