//
//  RadioTwoUser.h
//
//  Created by   on 2016/10/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RadioTwoUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *smallLogo;
@property (nonatomic, assign) double tracks;
@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) BOOL isVerified;
@property (nonatomic, assign) double albums;
@property (nonatomic, assign) double followers;
@property (nonatomic, strong) NSString *personalSignature;
@property (nonatomic, assign) BOOL isFollowed;
@property (nonatomic, assign) double followings;
@property (nonatomic, strong) NSString *personDescribe;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
