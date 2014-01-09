//
//  ChatSendMessageViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "ChatSendMessageViewController.h"

@interface ChatSendMessageViewController ()

@end

@implementation ChatSendMessageViewController

@synthesize txt_messages;
@synthesize toolbar;
@synthesize btn_sendData;
@synthesize imageView;
@synthesize closeButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self openPasscodeView];
    
    self.txt_messages.text = nil;
    self.txt_messages.delegate = self;
    self.txt_messages.keyboardType = UIKeyboardTypeDefault;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    self.txt_messages.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.txt_messages becomeFirstResponder];
    
    [self.btn_sendData setEnabled:NO];
    coolio = [[CoolioWebService alloc] init];
    account = [[MyProfiles alloc] init];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    NSLog(@"viewDidAppear");
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void) textViewDidBeginEditing:(UITextView *)textView{
    //[self.txt_messages becomeFirstResponder];
}



- (void)keyboardWillShow:(NSNotification*)notification
{
    //NSLog(@"Call UIKeyboardDidShowNotification:");
    CGFloat toolbarHeight = self.toolbar.frame.size.height;
    CGFloat navibarHeight = self.navigationBar.frame.size.height;
    //CGFloat navigationHeight = self.navigationController.navigationBar.frame.size.height;
    
    
    NSDictionary *info = [notification userInfo];
    NSValue *keyValue = info[UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [keyValue CGRectValue].size;
    
    float textViewSize = self.view.frame.size.height - keyboardSize.height - navibarHeight - toolbarHeight;
    //NSInteger textViewSize = self.view.frame.size.height - keyboardSize.height - 44;
    #if DEBUG
    //if(DEBUG == 1){
        NSLog(@"self.view.frame.size.height: %f", self.view.frame.size.height);
        NSLog(@"TextViewHeight: %f", textViewSize);
        //NSLog(@"キーボードサイズ: %0f", keyboardSize.height);
        //NSLog(@"toolbarHeight: %0f", toolbarHeight);
        NSLog(@"navibarHeight: %0f", navibarHeight);
    //}
    #endif
    
    
    //NSLog(@"mode change");
    //UITextInputMode *tinput = [UITextInputMode currentInputMode];
    //NSLog(@"mode = %@",[tinput primaryLanguage]);
    //if ([[tinput primaryLanguage] isEqualToString:@"ja-JP"] ) {
    //NSLog(@"日本語入力キーボード");
    //120
    //txt_traningContents.frame = CGRectMake(0, 0, 320, textViewSize);
    //toolbar.frame = CGRectMake(0, textViewSize, 320, 44);
    
    //self.txt_messages.frame = CGRectMake(0, self.navigationBar.frame.origin.y + 1, 320, textViewSize);
    CGRect textViewRect = self.txt_messages.frame;
    textViewRect.size.height = textViewSize;
    self.txt_messages.frame = textViewRect;
    
    CGRect toolbarRect = self.toolbar.frame;
    toolbarRect.origin.y = (self.txt_messages.frame.origin.y + self.txt_messages.frame.size.height + 1);
    self.toolbar.frame = toolbarRect;

    CGRect scrollViewRect = self.scrollView.frame;
    scrollViewRect.origin.y = (toolbarRect.size.height + toolbarRect.origin.y + 8.0f);
    scrollViewRect.size.height =  self.view.frame.size.height - (self.txt_messages.frame.size.height + self.navigationBar.frame.size.height + self.toolbar.frame.size.height);

    self.scrollView.frame = scrollViewRect;
    
    #if DEBUG
        NSLog(@"scrollView-Y: %0f", self.scrollView.frame.origin.y);
    #endif
    
    //}else if([[tinput primaryLanguage] isEqualToString:@"en-US"] ){
    //NSLog(@"英語入力キーボード");
    //160
    //txt_messages.frame = CGRectMake(0, 44, 320, textViewSize-44);
    //toolbar.frame = CGRectMake(0, textViewSize, 320, 44);
    
    //}else{
    //NSLog(@"ios4");
    //self.view.frame = CGRectMake(0, -8 + 44 + 36, 320, 167);
    //}

}

#pragma textview delegate
-(void)textViewDidChange:(UITextView *)textView
{
    int len = [textView.text length];
    if(len > 0){
        [self.btn_sendData setEnabled:YES];
    }else{
        if(self.imageView.image != nil){
            [self.btn_sendData setEnabled:YES];
            return;
        }
        [self.btn_sendData setEnabled:NO];
    }
    //self.txt_messages.selectedRange = NSMakeRange(textView.text.length, 0);
    /*
    int len = TEXT_FIELD_LIMIT - [textView.text length];
    NSString* strTextLen = [NSString stringWithFormat:@"%d", len];
    btnItem_stringLimit.title = strTextLen;
    if(len < 0){
        [self.btnItem_stringLimit setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],UITextAttributeTextColor, nil] forState:UIControlStateDisabled];
        [self.btnItem_stringLimit setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],UITextAttributeTextColor,[UIFont systemFontOfSize:16],UITextAttributeFont, nil] forState:UIControlStateNormal];
        btn_sendData.enabled = NO;
    }else if([textView.text length] == 0){
        [self.btnItem_stringLimit setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor, nil] forState:UIControlStateDisabled];
        [self.btnItem_stringLimit setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],UITextAttributeTextColor,[UIFont systemFontOfSize:16],UITextAttributeFont, nil] forState:UIControlStateNormal];
        btn_sendData.enabled = NO;
    } else{
        [self.btnItem_stringLimit setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor, nil] forState:UIControlStateDisabled];
        [self.btnItem_stringLimit setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,[UIFont systemFontOfSize:16],UITextAttributeFont, nil] forState:UIControlStateNormal];
        btn_sendData.enabled = YES;
    }
    */
}

- (IBAction)btn_sendMessagePush:(id)sender
{
    NSString* strVal = [self.txt_messages text];
    NSString* myId = [account getEmailProfile];
    //NSString* userId = _userId;
    UIImage* imgData = nil;
    
    if(self.imageView.image != nil){
        imgData = self.imageView.image;
    }
    
    if(strVal != nil || ![strVal isEqualToString:@""]){
        [coolio sendMessage:myId userId:self.userId message:strVal picture:imgData];
        [self dismissViewControllerAnimated:YES completion:nil];
    }else if(self.txt_messages.contentSize.height >= 1000){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Line breaks too many." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else if(imgData != nil){
        strVal = @"";
        [coolio sendMessage:myId userId:self.userId message:strVal picture:imgData];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else{
        //UIAlertView* alert = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"ALERT_POST_MESSAGE_RULE_TITLE", nil) message:NSLocalizedString(@"ALERT_POST_MESSAGE_RULE", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Empty messages." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}


- (IBAction)btn_cancelPush:(id)sender {
    //[self.txt_messages resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void) toNotifyPostMessage:(NSNotification*)notification
{
    //NSLog(@"ToNotifyPostMessage return");
    NSString* returnString = [notification object];
    //NSLog(@"%@", returnString);
    //NSString* returnString =  [array objectAtIndex:0];
    //NSLog(@"%@", returnString);
    dispatch_sync(dispatch_get_main_queue(), ^{
        if([returnString isEqualToString:@"failure"]){
            NSString* _message = NSLocalizedString(@"ALERT_POST_MESSAGE", nil);
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:_message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}




- (IBAction)pick:(id)sender
{
    [self.txt_messages resignFirstResponder];

    //カメラが使用できるかどうか判定。可なら生成して呼び出す
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *ipc = [[UIImagePickerController alloc] init];  // 生成
        ipc.delegate = self;  // デリゲートを自分自身に設定
        ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;  // 画像の取得先をカメラに設定
        //ipc.allowsEditing = YES;  // 画像取得後編集する
        [self presentViewController:ipc animated:YES completion:nil];
        // モーダルビューとしてカメラ画面を呼び出す
    }

}

//画像が選択された時に呼ばれるデリゲートメソッド
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingImage:(UIImage*)_image editingInfo:(NSDictionary*)editingInfo
{
    // モーダルビューを閉じる
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // 渡されてきた画像をフォトアルバムに保存する
    //UIImageWriteToSavedPhotosAlbum(image, self, @selector(targetImage:didFinishSavingWithError:contextInfo:),NULL);
    CGSize newSize;
    newSize.height = 300.0f;
    newSize.width = 300.0f;
    
    /*
     UIImageView* imageView = [[UIImageView alloc] initWithImage:img];
     imageView.contentMode = UIViewContentModeScaleAspectFit;
     //imageView.layer.cornerRadius = 5;
     imageView.clipsToBounds = YES;
     imageView.frame = CGRectMake( IMG_WIDHT * i++, 0, IMG_WIDHT, IMG_HEIGHT);
     [self.scrollView addSubview:imageView];
     self.scrollView.contentSize = CGSizeMake(IMG_WIDHT*i, IMG_HEIGHT);
     */
    
    UIImage* image = [ImageResizable imageWithImage:_image scaledToSizeWithSameAspectRatio:newSize];
    //UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    //imageView.clipsToBounds = YES;
    //imageView.contentMode = UIViewContentModeScaleAspectFit;
    //imageView.frame = CGRectMake(20, 20, 280, 280);
    self.imageView.image = image;
    
    
    // UIButtonをUIImageViewに追加
    self.closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
    [self.closeButton setBackgroundImage:[UIImage imageNamed:@"circlex"] forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(deleteButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.imageView addSubview:closeButton];
    
    
    CGRect toolbarRect = self.toolbar.frame;
    toolbarRect.origin.y = self.txt_messages.frame.origin.y + self.txt_messages.frame.size.height + 1;
    self.toolbar.frame = toolbarRect;
    
    float scrollViewHeight =  self.view.frame.size.height - (self.txt_messages.frame.size.height + self.navigationBar.frame.size.height + self.toolbar.frame.size.height);
    
    CGRect scrollViewRect = self.scrollView.frame;
    scrollViewRect.size.height = scrollViewHeight;
    scrollViewRect.origin.y = self.toolbar.frame.origin.y + self.toolbar.frame.size.height + 20;
    
    //[self.scrollView addSubview:imageView];
    self.scrollView.frame = scrollViewRect;

    [self.btn_sendData setEnabled:YES];
    //NSArray* scrollSubViews = self.scrollView.subviews;
    //for (int i=0 ; i<[scrollSubViews count]; i++) {
    //}
    //int height = //self.scrollView.frame.origin.y + 20;
    //self.txt_messages.frame.size.height + self.toolbar.frame.size.height + 20 + self.navigationBar.frame.size.height;
    //[self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    //self.imageView.frame = CGRectMake(20, height, 280, 280);
    //[self.imageView sizeToFit];
}

//画像の保存完了時に呼ばれるメソッド
-(void)targetImage:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)context{
    
    if(error){
        // 保存失敗時
    }else{
        // 保存成功時
    }
}

//画像の選択がキャンセルされた時に呼ばれる
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)deleteButtonPressed
{
    //UIButton* closeButton = (UIButton *)sender;
    //UIImageView* imageView = (UIImageView *)[closeButton superview];
    
    //imageView.image = nil;
    //[closeButton setBackgroundImage:nil forState:UIControlStateNormal];
    //[closeButton removeFromSuperview];
    [self.closeButton setBackgroundImage:nil forState:UIControlStateNormal];
    [self.closeButton removeFromSuperview];
    [self.imageView setImage:nil];
}


@end
