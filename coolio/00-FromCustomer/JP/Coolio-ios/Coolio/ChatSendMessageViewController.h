//
//  ChatSendMessageViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "UIViewController+PassLock.h"
#import "GlobalObjects.h"
#import "ImageResizable.h"
#import "CoolioWebService.h"
#import "MyProfiles.h"

@interface ChatSendMessageViewController : UIViewController<UITextViewDelegate, UINavigationControllerDelegate, UIAlertViewDelegate, UIImagePickerControllerDelegate>
{
    CoolioWebService* coolio;
    MyProfiles* account;
}

@property(nonatomic)NSString* userId;

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UITextView *txt_messages;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btn_sendData;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIButton *closeButton;

- (IBAction)pick:(id)sender;
- (IBAction)btn_cancelPush:(id)sender;
- (IBAction)btn_sendMessagePush:(id)sender;
//- (IBAction)btn_cameraLibraryOpen:(id)sender;

@end
