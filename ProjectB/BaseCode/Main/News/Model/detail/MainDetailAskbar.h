//
//  MainDetailAskbar.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MainDetailAskbar : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double concernCount;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *headpicurl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) NSString *expertId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
