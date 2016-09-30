//
//  RelativeSys.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RelativeSys : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *ptime;
@property (nonatomic, strong) NSString *imgsrc;
@property (nonatomic, strong) NSString *relativeSysIdentifier;
@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *href;
@property (nonatomic, strong) NSString *docID;
@property (nonatomic, strong) NSString *type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
