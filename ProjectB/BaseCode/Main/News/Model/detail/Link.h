//
//  Link.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Link : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *ref;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *href;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
