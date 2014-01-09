//
//  ChatMessagesViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageResizable.h"
#import "MyProfiles.h"
#import "CoolioWebService.h"
#import "UITableViewController+PassLock.h"
#import "AccountDetailViewController.h"
#import "GlobalObjects.h"
#import "AppDelegate.h"
#import "ChatSendMessageViewController.h"
#import "NSString+NSStringUtil.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface ChatMessagesViewController : UITableViewController<UINavigationControllerDelegate>
{
    MyProfiles* account;
    CoolioWebService* coolio;
    NSArray* messageList;
    NSString* myId;
    
    //NSMutableDictionary* iconCache;
    //NSMutableDictionary* pictCache;
}
@property (nonatomic)NSString* userId;
@property (strong, nonatomic) IBOutlet UIRefreshControl *refreshControl;


- (IBAction)btn_chatReportPush:(id)sender;
- (void)toNotifyTheChatMessages:(NSNotification *)notification;

@end
