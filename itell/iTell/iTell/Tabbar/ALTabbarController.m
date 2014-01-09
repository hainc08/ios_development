//
//  ALTabbarController.m
//  CouponCard
//
//  Created by bon on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define targetCheckToken @"Check token"
#define targetCheckAndLogout @"Check token and logout"

#import "ALTabbarController.h"
#import "AppDelegate.h"

@implementation UINavigationBar (CustomImage)
- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed: @"bg_title.png"];
    [image drawInRect:CGRectMake(0, 0, 320 , 44)];
}
@end

@implementation ALTabbarController

@synthesize navUserViewController;
@synthesize chatViewController;

@synthesize btn1, btn2, btn3,btn4,btn5;

//Customize tabbarController
- (id)init
{
    if (self = [super init]) {
        
                
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ALTabbarController" owner:self options:nil];
        self = [array objectAtIndex:0];
        for (id nav in self.viewControllers) {
            UINavigationBar *navBar = [(UINavigationController*)nav navigationBar];
            if ([navBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
                [navBar setBackgroundImage:[UIImage imageNamed:@"top_bar.png"] forBarMetrics:UIBarMetricsDefault];
            }
        }
        //using for customize tabbar later
        [self hideTabBar];
        [self addCustomElements];

        self.selectedIndex = 1;

    }
    return self;
}

- (void)hideTabBar
{
	for(UIView *view in self.view.subviews)
	{
		if([view isKindOfClass:[UITabBar class]])
		{
			view.hidden = YES;
            break;
		}
	}
}

- (void)hideNewTabBar 
{
    self.btn1.hidden = 1;
    self.btn2.hidden = 1;
    self.btn3.hidden = 1;
    self.btn4.hidden = 1;
    self.btn5.hidden = 1;
}

- (void)showNewTabBar 
{
    self.btn1.hidden = 0;
    self.btn2.hidden = 0;
    self.btn3.hidden = 0;
    self.btn4.hidden = 0;
    self.btn5.hidden = 0;
}

-(void)addCustomElements
{

    UIImage *imgBar = [UIImage imageNamed:@"nav-bar_bg.png"];
    UIImageView *tabBarView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 480- imgBar.size.height, 320, imgBar.size.height)];
    tabBarView.image = imgBar;
    [self.view addSubview:tabBarView];
    [tabBarView release];

    UIImage *imgBtFriend = [UIImage imageNamed:@"friend_button.png"];
    UIImage *imgBtFriendActive = [UIImage imageNamed:@"friend_button_active.png"];
    
    UIImage *imgBtMap = [UIImage imageNamed:@"map_button.png"];
    UIImage *imgBtMapActive = [UIImage imageNamed:@"map_button_active.png"];
    
    UIImage *imgBtItell = [UIImage imageNamed:@"btnItell_1_1.png"];
    UIImage *imgBtItellActive = [UIImage imageNamed:@"btnItell_1_1.png"];
    
    UIImage *imgBtChat = [UIImage imageNamed:@"chat_button.png"];
    UIImage *imgBtChatActive = [UIImage imageNamed:@"chat_button_active.png"];
    
    UIImage *imgBtSetting = [UIImage imageNamed:@"setting_button.png"];
    UIImage *imgBtSettingActive = [UIImage imageNamed:@"setting_button_active.png"];
	
	
    
	btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
	btn3.frame = CGRectMake(imgBtFriend.size.width + imgBtMap.size.width, 480 - imgBtItell.size.height, imgBtItell.size.width, imgBtItell.size.height);
    btn3.center = CGPointMake(160, 480 - imgBtItell.size.height/2);
	[btn3 setBackgroundImage:imgBtItell forState:UIControlStateNormal];
	[btn3 setBackgroundImage:imgBtItellActive forState:UIControlStateSelected];
	[btn3 setTag:2];
    [btn3 setSelected:TRUE];
    
    
	
	btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
	btn2.frame = CGRectMake(imgBtFriend.size.width, 480 - imgBtMap.size.height, imgBtMap.size.width, imgBtMap.size.height);
    btn2.center = CGPointMake(btn3.center.x - imgBtItell.size.width/2 - imgBtMap.size.width/2, 480 - imgBtMap.size.height/2);
	[btn2 setBackgroundImage:imgBtMap forState:UIControlStateNormal];
	[btn2 setBackgroundImage:imgBtMapActive forState:UIControlStateSelected];
	[btn2 setTag:1];
    
    btn1 = [UIButton buttonWithType:UIButtonTypeCustom]; //Setup the button
	btn1.frame = CGRectMake(0, 480 - imgBtFriend.size.height, imgBtFriend.size.width, imgBtFriend.size.height); // Set the frame (size and position) of the button)
    btn1.center = CGPointMake(btn2.center.x - imgBtFriend.size.width/2 - imgBtMap.size.width/2, 480 - imgBtMap.size.height/2);
	[btn1 setBackgroundImage:imgBtFriend forState:UIControlStateNormal]; // Set the image for the normal state of the button
	[btn1 setBackgroundImage:imgBtFriendActive forState:UIControlStateSelected]; // Set the image for the selected state of the button
	[btn1 setTag:0]; // Assign the button a "tag" so when our "click" event is called we know which button was pressed.

	btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
	btn4.frame = CGRectMake(btn3.center.x + imgBtItell.size.width/2, 480 - imgBtChat.size.height, imgBtChat.size.width, imgBtChat.size.height);
	[btn4 setBackgroundImage:imgBtChat forState:UIControlStateNormal];
	[btn4 setBackgroundImage:imgBtChatActive forState:UIControlStateSelected];
	[btn4 setTag:3];
     
    btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
	btn5.frame = CGRectMake(btn4.center.x + imgBtChat.size.width/2, 480 - imgBtSetting.size.height, imgBtSetting.size.width, imgBtSetting.size.height);
	[btn5 setBackgroundImage:imgBtSetting forState:UIControlStateNormal];
	[btn5 setBackgroundImage:imgBtSettingActive forState:UIControlStateSelected];
	[btn5 setTag:4];
	
	// Add my new buttons to the view
	[self.view addSubview:btn1];
	[self.view addSubview:btn2];
	[self.view addSubview:btn3];
    [self.view addSubview:btn4];
	[self.view addSubview:btn5];
	
	// Setup event handlers so that the buttonClicked method will respond to the touch up inside event.
	[btn1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
	[btn2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
	[btn3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
	[btn5 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClicked:(id)sender
{
	int tagNum = [sender tag];
	[self selectTab:tagNum];
}

- (void)selectTab:(int)tabID
{
	switch(tabID)
	{
		case 0:
        {
			[btn1 setSelected:true];
			[btn2 setSelected:false];
			[btn3 setSelected:false];
            [btn4 setSelected:false];
			[btn5 setSelected:false];
        }
            break;
		case 1:
        {
			[btn1 setSelected:false];
			[btn2 setSelected:true];
			[btn3 setSelected:false];
            [btn4 setSelected:false];
			[btn5 setSelected:false];
        }
            break;
		case 2:
        {
            [self hideTabBar];
			[btn1 setSelected:false];
			[btn2 setSelected:false];
			[btn3 setSelected:true];
            [btn4 setSelected:false];
			[btn5 setSelected:false];
            break;
        }
        case 3:
        {
			[btn1 setSelected:false];
			[btn2 setSelected:false];
			[btn3 setSelected:false];
            [btn4 setSelected:true];
			[btn5 setSelected:false];
            break;
        }
        case 4:
        {
			[btn1 setSelected:false];
			[btn2 setSelected:false];
			[btn3 setSelected:false];
            [btn4 setSelected:false];
			[btn5 setSelected:true];
        }
			break;
	}	
	
	self.selectedIndex = tabID;
    
	for (UINavigationController *nav in [self viewControllers]) {
        [nav popToRootViewControllerAnimated:NO];
    }
	
}
- (void)logout
{
    for (UINavigationController *nav in [self viewControllers]) {
        [nav popToRootViewControllerAnimated:NO];
    }
}


#pragma mark - TabbarDelegate

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    oldTabBar = newTabBar;
    NSArray *array = [NSArray arrayWithObjects:@"Friends", @"Map", @"iTell",@"Chat",@"Setting",  nil];
    newTabBar = [array indexOfObject:[item title]];
    tabBarSelect = [item title];
}
 

- (void) gotoTabBarIndex:(NSInteger)index
{
    
    if (index < 0 || index >= [self.viewControllers count]) {
        return;
    }
    UIView *fromView = self.selectedViewController.view;
    UIView *toView = [[self.viewControllers objectAtIndex:index] view];
    
    // Get the size of the view area.
    CGRect viewSize = fromView.frame;
    BOOL scrollRight = index > self.selectedIndex;
    
    // Add the to view to the tab bar view.
    [fromView.superview addSubview:toView];
    
    // Position it off screen.
    toView.frame = CGRectMake((scrollRight ? 320 : -320), viewSize.origin.y, 320, viewSize.size.height);
    
    [UIView animateWithDuration:0.3 animations: ^{
        // Animate the views on and off the screen. This will appear to slide.
        fromView.frame =CGRectMake((scrollRight ? -320 : 320), viewSize.origin.y, 320, viewSize.size.height);
        toView.frame =CGRectMake(0, viewSize.origin.y, 320, viewSize.size.height);
    } completion:^(BOOL finished) {
        if (finished) {
            
            // Remove the old view from the tabbar view.
            [fromView removeFromSuperview];
            //                             [HomeViewController setOldIndex:[HomeViewController newIndex]];
            //                             [HomeViewController setNewIndex:2];
            self.selectedIndex = index;
        }
    }];
}

-(void)gotoChatTabBar{
    [self gotoTabBarIndex:kChatViewControllerIndex];
}


- (void)dealloc
{

    [chatViewController release];
    [super dealloc];
}

@end
