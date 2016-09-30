//
//  MainDetailC20N3VJE000146BE.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MainDetailC20N3VJE000146BE.h"
#import "MainDetailLink.h"
#import "MainDetailAskbar.h"
#import "MainDetailTopiclistNews.h"
#import "MainDetailVideo.h"
#import "MainDetailHuati.h"
#import "MainDetailRelativeSys.h"


NSString *const kMainDetailC20N3VJE000146BEPtime = @"ptime";
NSString *const kMainDetailC20N3VJE000146BESource = @"source";
NSString *const kMainDetailC20N3VJE000146BEEc = @"ec";
NSString *const kMainDetailC20N3VJE000146BELink = @"link";
NSString *const kMainDetailC20N3VJE000146BETitle = @"title";
NSString *const kMainDetailC20N3VJE000146BEAskbar = @"askbar";
NSString *const kMainDetailC20N3VJE000146BEBoboList = @"boboList";
NSString *const kMainDetailC20N3VJE000146BETid = @"tid";
NSString *const kMainDetailC20N3VJE000146BEImg = @"img";
NSString *const kMainDetailC20N3VJE000146BETopiclistNews = @"topiclist_news";
NSString *const kMainDetailC20N3VJE000146BEPicnews = @"picnews";
NSString *const kMainDetailC20N3VJE000146BETemplate = @"template";
NSString *const kMainDetailC20N3VJE000146BEVideo = @"video";
NSString *const kMainDetailC20N3VJE000146BEDocid = @"docid";
NSString *const kMainDetailC20N3VJE000146BESourceUrl = @"source_url";
NSString *const kMainDetailC20N3VJE000146BEReplyBoard = @"replyBoard";
NSString *const kMainDetailC20N3VJE000146BEYdbaike = @"ydbaike";
NSString *const kMainDetailC20N3VJE000146BEReplyCount = @"replyCount";
NSString *const kMainDetailC20N3VJE000146BETopiclist = @"topiclist";
NSString *const kMainDetailC20N3VJE000146BEBody = @"body";
NSString *const kMainDetailC20N3VJE000146BEThreadAgainst = @"threadAgainst";
NSString *const kMainDetailC20N3VJE000146BEVotes = @"votes";
NSString *const kMainDetailC20N3VJE000146BEHuati = @"huati";
NSString *const kMainDetailC20N3VJE000146BEHasNext = @"hasNext";
NSString *const kMainDetailC20N3VJE000146BEVoicecomment = @"voicecomment";
NSString *const kMainDetailC20N3VJE000146BEDkeys = @"dkeys";
NSString *const kMainDetailC20N3VJE000146BEShareLink = @"shareLink";
NSString *const kMainDetailC20N3VJE000146BEUsers = @"users";
NSString *const kMainDetailC20N3VJE000146BEThreadVote = @"threadVote";
NSString *const kMainDetailC20N3VJE000146BERelativeSys = @"relative_sys";
NSString *const kMainDetailC20N3VJE000146BEDigest = @"digest";


@interface MainDetailC20N3VJE000146BE ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainDetailC20N3VJE000146BE

@synthesize ptime = _ptime;
@synthesize source = _source;
@synthesize ec = _ec;
@synthesize link = _link;
@synthesize title = _title;
@synthesize askbar = _askbar;
@synthesize boboList = _boboList;
@synthesize tid = _tid;
@synthesize img = _img;
@synthesize topiclistNews = _topiclistNews;
@synthesize picnews = _picnews;
@synthesize template = _template;
@synthesize video = _video;
@synthesize docid = _docid;
@synthesize sourceUrl = _sourceUrl;
@synthesize replyBoard = _replyBoard;
@synthesize ydbaike = _ydbaike;
@synthesize replyCount = _replyCount;
@synthesize topiclist = _topiclist;
@synthesize body = _body;
@synthesize threadAgainst = _threadAgainst;
@synthesize votes = _votes;
@synthesize huati = _huati;
@synthesize hasNext = _hasNext;
@synthesize voicecomment = _voicecomment;
@synthesize dkeys = _dkeys;
@synthesize shareLink = _shareLink;
@synthesize users = _users;
@synthesize threadVote = _threadVote;
@synthesize relativeSys = _relativeSys;
@synthesize digest = _digest;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.ptime = [self objectOrNilForKey:kMainDetailC20N3VJE000146BEPtime fromDictionary:dict];
            self.source = [self objectOrNilForKey:kMainDetailC20N3VJE000146BESource fromDictionary:dict];
            self.ec = [self objectOrNilForKey:kMainDetailC20N3VJE000146BEEc fromDictionary:dict];
    NSObject *receivedMainDetailLink = [dict objectForKey:kMainDetailC20N3VJE000146BELink];
    NSMutableArray *parsedMainDetailLink = [NSMutableArray array];
    if ([receivedMainDetailLink isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMainDetailLink) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMainDetailLink addObject:[MainDetailLink modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMainDetailLink isKindOfClass:[NSDictionary class]]) {
       [parsedMainDetailLink addObject:[MainDetailLink modelObjectWithDictionary:(NSDictionary *)receivedMainDetailLink]];
    }

    self.link = [NSArray arrayWithArray:parsedMainDetailLink];
            self.title = [self objectOrNilForKey:kMainDetailC20N3VJE000146BETitle fromDictionary:dict];
    NSObject *receivedMainDetailAskbar = [dict objectForKey:kMainDetailC20N3VJE000146BEAskbar];
    NSMutableArray *parsedMainDetailAskbar = [NSMutableArray array];
    if ([receivedMainDetailAskbar isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMainDetailAskbar) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMainDetailAskbar addObject:[MainDetailAskbar modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMainDetailAskbar isKindOfClass:[NSDictionary class]]) {
       [parsedMainDetailAskbar addObject:[MainDetailAskbar modelObjectWithDictionary:(NSDictionary *)receivedMainDetailAskbar]];
    }

    self.askbar = [NSArray arrayWithArray:parsedMainDetailAskbar];
            self.boboList = [self objectOrNilForKey:kMainDetailC20N3VJE000146BEBoboList fromDictionary:dict];
            self.tid = [self objectOrNilForKey:kMainDetailC20N3VJE000146BETid fromDictionary:dict];
            self.img = [self objectOrNilForKey:kMainDetailC20N3VJE000146BEImg fromDictionary:dict];
    NSObject *receivedMainDetailTopiclistNews = [dict objectForKey:kMainDetailC20N3VJE000146BETopiclistNews];
    NSMutableArray *parsedMainDetailTopiclistNews = [NSMutableArray array];
    if ([receivedMainDetailTopiclistNews isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMainDetailTopiclistNews) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMainDetailTopiclistNews addObject:[MainDetailTopiclistNews modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMainDetailTopiclistNews isKindOfClass:[NSDictionary class]]) {
       [parsedMainDetailTopiclistNews addObject:[MainDetailTopiclistNews modelObjectWithDictionary:(NSDictionary *)receivedMainDetailTopiclistNews]];
    }

    self.topiclistNews = [NSArray arrayWithArray:parsedMainDetailTopiclistNews];
            self.picnews = [[self objectOrNilForKey:kMainDetailC20N3VJE000146BEPicnews fromDictionary:dict] boolValue];
            self.template = [self objectOrNilForKey:kMainDetailC20N3VJE000146BETemplate fromDictionary:dict];
    NSObject *receivedMainDetailVideo = [dict objectForKey:kMainDetailC20N3VJE000146BEVideo];
    NSMutableArray *parsedMainDetailVideo = [NSMutableArray array];
    if ([receivedMainDetailVideo isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMainDetailVideo) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMainDetailVideo addObject:[MainDetailVideo modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMainDetailVideo isKindOfClass:[NSDictionary class]]) {
       [parsedMainDetailVideo addObject:[MainDetailVideo modelObjectWithDictionary:(NSDictionary *)receivedMainDetailVideo]];
    }

    self.video = [NSArray arrayWithArray:parsedMainDetailVideo];
            self.docid = [self objectOrNilForKey:kMainDetailC20N3VJE000146BEDocid fromDictionary:dict];
            self.sourceUrl = [self objectOrNilForKey:kMainDetailC20N3VJE000146BESourceUrl fromDictionary:dict];
            self.replyBoard = [self objectOrNilForKey:kMainDetailC20N3VJE000146BEReplyBoard fromDictionary:dict];
            self.ydbaike = [self objectOrNilForKey:kMainDetailC20N3VJE000146BEYdbaike fromDictionary:dict];
            self.replyCount = [[self objectOrNilForKey:kMainDetailC20N3VJE000146BEReplyCount fromDictionary:dict] doubleValue];
            self.topiclist = [self objectOrNilForKey:kMainDetailC20N3VJE000146BETopiclist fromDictionary:dict];
            self.body = [self objectOrNilForKey:kMainDetailC20N3VJE000146BEBody fromDictionary:dict];
            self.threadAgainst = [[self objectOrNilForKey:kMainDetailC20N3VJE000146BEThreadAgainst fromDictionary:dict] doubleValue];
            self.votes = [self objectOrNilForKey:kMainDetailC20N3VJE000146BEVotes fromDictionary:dict];
    NSObject *receivedMainDetailHuati = [dict objectForKey:kMainDetailC20N3VJE000146BEHuati];
    NSMutableArray *parsedMainDetailHuati = [NSMutableArray array];
    if ([receivedMainDetailHuati isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMainDetailHuati) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMainDetailHuati addObject:[MainDetailHuati modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMainDetailHuati isKindOfClass:[NSDictionary class]]) {
       [parsedMainDetailHuati addObject:[MainDetailHuati modelObjectWithDictionary:(NSDictionary *)receivedMainDetailHuati]];
    }

    self.huati = [NSArray arrayWithArray:parsedMainDetailHuati];
            self.hasNext = [[self objectOrNilForKey:kMainDetailC20N3VJE000146BEHasNext fromDictionary:dict] boolValue];
            self.voicecomment = [self objectOrNilForKey:kMainDetailC20N3VJE000146BEVoicecomment fromDictionary:dict];
            self.dkeys = [self objectOrNilForKey:kMainDetailC20N3VJE000146BEDkeys fromDictionary:dict];
            self.shareLink = [self objectOrNilForKey:kMainDetailC20N3VJE000146BEShareLink fromDictionary:dict];
            self.users = [self objectOrNilForKey:kMainDetailC20N3VJE000146BEUsers fromDictionary:dict];
            self.threadVote = [[self objectOrNilForKey:kMainDetailC20N3VJE000146BEThreadVote fromDictionary:dict] doubleValue];
    NSObject *receivedMainDetailRelativeSys = [dict objectForKey:kMainDetailC20N3VJE000146BERelativeSys];
    NSMutableArray *parsedMainDetailRelativeSys = [NSMutableArray array];
    if ([receivedMainDetailRelativeSys isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMainDetailRelativeSys) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMainDetailRelativeSys addObject:[MainDetailRelativeSys modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMainDetailRelativeSys isKindOfClass:[NSDictionary class]]) {
       [parsedMainDetailRelativeSys addObject:[MainDetailRelativeSys modelObjectWithDictionary:(NSDictionary *)receivedMainDetailRelativeSys]];
    }

    self.relativeSys = [NSArray arrayWithArray:parsedMainDetailRelativeSys];
            self.digest = [self objectOrNilForKey:kMainDetailC20N3VJE000146BEDigest fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.ptime forKey:kMainDetailC20N3VJE000146BEPtime];
    [mutableDict setValue:self.source forKey:kMainDetailC20N3VJE000146BESource];
    [mutableDict setValue:self.ec forKey:kMainDetailC20N3VJE000146BEEc];
    NSMutableArray *tempArrayForLink = [NSMutableArray array];
    for (NSObject *subArrayObject in self.link) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLink addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLink addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLink] forKey:kMainDetailC20N3VJE000146BELink];
    [mutableDict setValue:self.title forKey:kMainDetailC20N3VJE000146BETitle];
    NSMutableArray *tempArrayForAskbar = [NSMutableArray array];
    for (NSObject *subArrayObject in self.askbar) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAskbar addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAskbar addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAskbar] forKey:kMainDetailC20N3VJE000146BEAskbar];
    NSMutableArray *tempArrayForBoboList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.boboList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBoboList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBoboList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBoboList] forKey:kMainDetailC20N3VJE000146BEBoboList];
    [mutableDict setValue:self.tid forKey:kMainDetailC20N3VJE000146BETid];
    NSMutableArray *tempArrayForImg = [NSMutableArray array];
    for (NSObject *subArrayObject in self.img) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImg addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImg addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImg] forKey:kMainDetailC20N3VJE000146BEImg];
    NSMutableArray *tempArrayForTopiclistNews = [NSMutableArray array];
    for (NSObject *subArrayObject in self.topiclistNews) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTopiclistNews addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTopiclistNews addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTopiclistNews] forKey:kMainDetailC20N3VJE000146BETopiclistNews];
    [mutableDict setValue:[NSNumber numberWithBool:self.picnews] forKey:kMainDetailC20N3VJE000146BEPicnews];
    [mutableDict setValue:self.template forKey:kMainDetailC20N3VJE000146BETemplate];
    NSMutableArray *tempArrayForVideo = [NSMutableArray array];
    for (NSObject *subArrayObject in self.video) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForVideo addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForVideo addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForVideo] forKey:kMainDetailC20N3VJE000146BEVideo];
    [mutableDict setValue:self.docid forKey:kMainDetailC20N3VJE000146BEDocid];
    [mutableDict setValue:self.sourceUrl forKey:kMainDetailC20N3VJE000146BESourceUrl];
    [mutableDict setValue:self.replyBoard forKey:kMainDetailC20N3VJE000146BEReplyBoard];
    NSMutableArray *tempArrayForYdbaike = [NSMutableArray array];
    for (NSObject *subArrayObject in self.ydbaike) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForYdbaike addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForYdbaike addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForYdbaike] forKey:kMainDetailC20N3VJE000146BEYdbaike];
    [mutableDict setValue:[NSNumber numberWithDouble:self.replyCount] forKey:kMainDetailC20N3VJE000146BEReplyCount];
    NSMutableArray *tempArrayForTopiclist = [NSMutableArray array];
    for (NSObject *subArrayObject in self.topiclist) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTopiclist addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTopiclist addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTopiclist] forKey:kMainDetailC20N3VJE000146BETopiclist];
    [mutableDict setValue:self.body forKey:kMainDetailC20N3VJE000146BEBody];
    [mutableDict setValue:[NSNumber numberWithDouble:self.threadAgainst] forKey:kMainDetailC20N3VJE000146BEThreadAgainst];
    NSMutableArray *tempArrayForVotes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.votes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForVotes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForVotes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForVotes] forKey:kMainDetailC20N3VJE000146BEVotes];
    NSMutableArray *tempArrayForHuati = [NSMutableArray array];
    for (NSObject *subArrayObject in self.huati) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHuati addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHuati addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHuati] forKey:kMainDetailC20N3VJE000146BEHuati];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasNext] forKey:kMainDetailC20N3VJE000146BEHasNext];
    [mutableDict setValue:self.voicecomment forKey:kMainDetailC20N3VJE000146BEVoicecomment];
    [mutableDict setValue:self.dkeys forKey:kMainDetailC20N3VJE000146BEDkeys];
    [mutableDict setValue:self.shareLink forKey:kMainDetailC20N3VJE000146BEShareLink];
    NSMutableArray *tempArrayForUsers = [NSMutableArray array];
    for (NSObject *subArrayObject in self.users) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForUsers addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForUsers addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUsers] forKey:kMainDetailC20N3VJE000146BEUsers];
    [mutableDict setValue:[NSNumber numberWithDouble:self.threadVote] forKey:kMainDetailC20N3VJE000146BEThreadVote];
    NSMutableArray *tempArrayForRelativeSys = [NSMutableArray array];
    for (NSObject *subArrayObject in self.relativeSys) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRelativeSys addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRelativeSys addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRelativeSys] forKey:kMainDetailC20N3VJE000146BERelativeSys];
    [mutableDict setValue:self.digest forKey:kMainDetailC20N3VJE000146BEDigest];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.ptime = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEPtime];
    self.source = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BESource];
    self.ec = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEEc];
    self.link = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BELink];
    self.title = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BETitle];
    self.askbar = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEAskbar];
    self.boboList = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEBoboList];
    self.tid = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BETid];
    self.img = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEImg];
    self.topiclistNews = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BETopiclistNews];
    self.picnews = [aDecoder decodeBoolForKey:kMainDetailC20N3VJE000146BEPicnews];
    self.template = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BETemplate];
    self.video = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEVideo];
    self.docid = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEDocid];
    self.sourceUrl = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BESourceUrl];
    self.replyBoard = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEReplyBoard];
    self.ydbaike = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEYdbaike];
    self.replyCount = [aDecoder decodeDoubleForKey:kMainDetailC20N3VJE000146BEReplyCount];
    self.topiclist = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BETopiclist];
    self.body = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEBody];
    self.threadAgainst = [aDecoder decodeDoubleForKey:kMainDetailC20N3VJE000146BEThreadAgainst];
    self.votes = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEVotes];
    self.huati = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEHuati];
    self.hasNext = [aDecoder decodeBoolForKey:kMainDetailC20N3VJE000146BEHasNext];
    self.voicecomment = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEVoicecomment];
    self.dkeys = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEDkeys];
    self.shareLink = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEShareLink];
    self.users = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEUsers];
    self.threadVote = [aDecoder decodeDoubleForKey:kMainDetailC20N3VJE000146BEThreadVote];
    self.relativeSys = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BERelativeSys];
    self.digest = [aDecoder decodeObjectForKey:kMainDetailC20N3VJE000146BEDigest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ptime forKey:kMainDetailC20N3VJE000146BEPtime];
    [aCoder encodeObject:_source forKey:kMainDetailC20N3VJE000146BESource];
    [aCoder encodeObject:_ec forKey:kMainDetailC20N3VJE000146BEEc];
    [aCoder encodeObject:_link forKey:kMainDetailC20N3VJE000146BELink];
    [aCoder encodeObject:_title forKey:kMainDetailC20N3VJE000146BETitle];
    [aCoder encodeObject:_askbar forKey:kMainDetailC20N3VJE000146BEAskbar];
    [aCoder encodeObject:_boboList forKey:kMainDetailC20N3VJE000146BEBoboList];
    [aCoder encodeObject:_tid forKey:kMainDetailC20N3VJE000146BETid];
    [aCoder encodeObject:_img forKey:kMainDetailC20N3VJE000146BEImg];
    [aCoder encodeObject:_topiclistNews forKey:kMainDetailC20N3VJE000146BETopiclistNews];
    [aCoder encodeBool:_picnews forKey:kMainDetailC20N3VJE000146BEPicnews];
    [aCoder encodeObject:_template forKey:kMainDetailC20N3VJE000146BETemplate];
    [aCoder encodeObject:_video forKey:kMainDetailC20N3VJE000146BEVideo];
    [aCoder encodeObject:_docid forKey:kMainDetailC20N3VJE000146BEDocid];
    [aCoder encodeObject:_sourceUrl forKey:kMainDetailC20N3VJE000146BESourceUrl];
    [aCoder encodeObject:_replyBoard forKey:kMainDetailC20N3VJE000146BEReplyBoard];
    [aCoder encodeObject:_ydbaike forKey:kMainDetailC20N3VJE000146BEYdbaike];
    [aCoder encodeDouble:_replyCount forKey:kMainDetailC20N3VJE000146BEReplyCount];
    [aCoder encodeObject:_topiclist forKey:kMainDetailC20N3VJE000146BETopiclist];
    [aCoder encodeObject:_body forKey:kMainDetailC20N3VJE000146BEBody];
    [aCoder encodeDouble:_threadAgainst forKey:kMainDetailC20N3VJE000146BEThreadAgainst];
    [aCoder encodeObject:_votes forKey:kMainDetailC20N3VJE000146BEVotes];
    [aCoder encodeObject:_huati forKey:kMainDetailC20N3VJE000146BEHuati];
    [aCoder encodeBool:_hasNext forKey:kMainDetailC20N3VJE000146BEHasNext];
    [aCoder encodeObject:_voicecomment forKey:kMainDetailC20N3VJE000146BEVoicecomment];
    [aCoder encodeObject:_dkeys forKey:kMainDetailC20N3VJE000146BEDkeys];
    [aCoder encodeObject:_shareLink forKey:kMainDetailC20N3VJE000146BEShareLink];
    [aCoder encodeObject:_users forKey:kMainDetailC20N3VJE000146BEUsers];
    [aCoder encodeDouble:_threadVote forKey:kMainDetailC20N3VJE000146BEThreadVote];
    [aCoder encodeObject:_relativeSys forKey:kMainDetailC20N3VJE000146BERelativeSys];
    [aCoder encodeObject:_digest forKey:kMainDetailC20N3VJE000146BEDigest];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainDetailC20N3VJE000146BE *copy = [[MainDetailC20N3VJE000146BE alloc] init];
    
    if (copy) {

        copy.ptime = [self.ptime copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.ec = [self.ec copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.askbar = [self.askbar copyWithZone:zone];
        copy.boboList = [self.boboList copyWithZone:zone];
        copy.tid = [self.tid copyWithZone:zone];
        copy.img = [self.img copyWithZone:zone];
        copy.topiclistNews = [self.topiclistNews copyWithZone:zone];
        copy.picnews = self.picnews;
        copy.template = [self.template copyWithZone:zone];
        copy.video = [self.video copyWithZone:zone];
        copy.docid = [self.docid copyWithZone:zone];
        copy.sourceUrl = [self.sourceUrl copyWithZone:zone];
        copy.replyBoard = [self.replyBoard copyWithZone:zone];
        copy.ydbaike = [self.ydbaike copyWithZone:zone];
        copy.replyCount = self.replyCount;
        copy.topiclist = [self.topiclist copyWithZone:zone];
        copy.body = [self.body copyWithZone:zone];
        copy.threadAgainst = self.threadAgainst;
        copy.votes = [self.votes copyWithZone:zone];
        copy.huati = [self.huati copyWithZone:zone];
        copy.hasNext = self.hasNext;
        copy.voicecomment = [self.voicecomment copyWithZone:zone];
        copy.dkeys = [self.dkeys copyWithZone:zone];
        copy.shareLink = [self.shareLink copyWithZone:zone];
        copy.users = [self.users copyWithZone:zone];
        copy.threadVote = self.threadVote;
        copy.relativeSys = [self.relativeSys copyWithZone:zone];
        copy.digest = [self.digest copyWithZone:zone];
    }
    
    return copy;
}


@end
