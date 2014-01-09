//
//  ALTabbarController.h
//  CouponCard
//
//  Created by bon on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kChatViewControllerIndex 3

@class ChatViewController;

@interface ALTabbarController : UITabBarController
{
    NSInteger oldTabBar, newTabBar;
    NSString *tabBarSelect;
}

@property (nonatomic, strong) UINavigationController *navUserViewController;
@property (retain, nonatomic) IBOutlet ChatViewController *chatViewController;

@property (nonatomic, retain) UIButton *btn1;
@property (nonatomic, retain) UIButton *btn2;
@property (nonatomic, retain) UIButton *btn3;
@property (nonatomic, retain) UIButton *btn4;
@property (nonatomic, retain) UIButton *btn5;

- (void) backTabBar;
- (void) gotoUserViewController;
- (void) gotoTabBarIndex:(NSInteger)index;
- (void) gotoChatTabBar;


-(void) hideTabBar;
-(void) addCustomElements;
-(void) selectTab:(int)tabID;

-(void) hideNewTabBar;
-(void) showNewTabBar;
@end
