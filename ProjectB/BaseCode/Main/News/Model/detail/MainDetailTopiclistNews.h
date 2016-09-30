//
//  MainDetailTopiclistNews.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MainDetailTopiclistNews : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *tname;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, assign) BOOL hasCover;
@property (nonatomic, strong) NSString *subnum;
@property (nonatomic, strong) NSString *ename;
@property (nonatomic, strong) NSString *tid;
@property (nonatomic, strong) NSString *cid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
