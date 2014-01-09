//
//  ThreadCell.h
//  MessageBubbles
//
//  Created by cwiles on 6/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreadCell : UITableViewCell {
    NSString *msgText;
    NSString *imgName;
    UIImageView *imgAva;
    BOOL fromSelf;
    NSData *dataImageFriend;
    UIImageView *imgAvatar;
}

@property (nonatomic, retain) NSString *msgText;
@property (nonatomic, retain) NSString *imgName;
@property (nonatomic, retain) UIImageView *imgAva;
@property (nonatomic, assign) BOOL fromSelf;
@property (nonatomic, retain) UIImageView *imgAvatar;
@property (nonatomic, retain) NSData *dataImageFriend;

+ (CGSize)calcTextHeight:(NSString *)str;
- (void)loadDataForCell;

@end
