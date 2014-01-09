//
//  ItellShareStatusController.m
//  iTell
//
//  Created by tranduc on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ItellShareStatusController.h"
#import "ITMarco.h"
#import "Global.h"
#import "ApiRequest.h"
#import "NSDate+Formater.h"
#import <QuartzCore/QuartzCore.h>

#define kSendItell @"k_send_itell"
#define kTagSendItellError 10

#define kMaxType 3

static NSString *nameSharing[kMaxType]={@"All User", @"Friends", @"Other"};
static NSString *nameBg[kMaxType]={@"all-user_bg.png", @"friend_bg.png", @"other_bg.png"};

@interface ItellShareStatusController ()
@property(nonatomic, retain)ApiRequest *apiRequest;
@property(nonatomic, retain)UIAlertView *avAlertView;
@end

@implementation ItellShareStatusController
@synthesize typeSharing;
@synthesize tfMessage;
@synthesize apiRequest;
@synthesize avAlertView;
@synthesize delegate;
@synthesize viewShare;
@synthesize lbType;
@synthesize imBackground;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)createAlert{
    avAlertView = [[UIAlertView alloc] initWithTitle:@"Loading..." message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    UIActivityIndicatorView *indicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite] autorelease];
    indicator.center = CGPointMake(139.5, 75.5);
    [indicator startAnimating];
    [avAlertView addSubview:indicator];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createAlert];
    apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kSendItell];
    
    
    switch (typeSharing) {
        case kItellPolicy_ALL:
            [viewShare.layer setAnchorPoint:CGPointMake(0, 0)];
            viewShare.center = CGPointMake(0, 39);
            break;
        case kItellPolicy_FRIEND_ONLY:
            [viewShare.layer setAnchorPoint:CGPointMake(0, 1)];
            viewShare.center = CGPointMake(0, 460);
            break;
        case kItellPolicy_OTHER_ONLY:
            [viewShare.layer setAnchorPoint:CGPointMake(1, 1)];
            viewShare.center = CGPointMake(320, 460);
            
            break;
            
        default:
            break;
    }
    [imBackground setImage:[UIImage imageNamed:nameBg[typeSharing-1]]];
    lbType.text = nameSharing[typeSharing - 1];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [animation setFromValue:[NSNumber numberWithDouble:160.0f/320]];
    [animation setToValue:[NSNumber numberWithDouble:1.0f]];
    [animation setDuration:0.5];
    [animation setRepeatCount:1];
    
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    [animation setDelegate:self];
    [viewShare.layer addAnimation:animation forKey:@"scaleView"];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        [tfMessage becomeFirstResponder];
    }
}


- (void)viewDidUnload
{
    [self setTfMessage:nil];
    [self setViewShare:nil];
    [self setLbType:nil];
    [self setImBackground:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark - request
-(void)showAlertRetryWithTag:(int)tagAl{
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Network error conection" message:@"Retry?" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    al.tag = tagAl;
    [al show];
    [al release];
}
-(void)requestFailedTarget:(NSString *)target errorMsg:(NSString *)msg{
    if ([target isEqualToString:kSendItell]) {
        [avAlertView dismissWithClickedButtonIndex:0 animated:YES];
        [self showAlertRetryWithTag:kTagSendItellError];
       
    }
}
-(void)requestFinished:(NSDictionary *)dictionData andTarget:(NSString *)target{
    if ([target isEqualToString:kSendItell]) {
        [avAlertView dismissWithClickedButtonIndex:0 animated:YES];
        if (dictionData == 0) {
            [self showAlertRetryWithTag:kTagSendItellError];
            return;
        }
        NSNumber *retval = [dictionData objectForKey:@"retval"];
        
        if (![retval boolValue]) {
            [self showAlertRetryWithTag:kTagSendItellError];
            return;
        }
        
        [Global shareGlobal].latestItellTime = [NSDate timeInterval1970FromString:
                                                [dictionData objectForKey:@"start_time"]];
        [self.delegate shareItell:tfMessage.text withPolicy:typeSharing];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    ITINFO_FUNC
    [textView resignFirstResponder];
}

-(void)sendMessage{
    [avAlertView show];
    UserData *user = [Global shareGlobal].user;
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:user.uuid, @"uuid",
                         [NSNumber numberWithInt:user.userID], @"user_id",
                         tfMessage.text, @"itell",
                         [NSNumber numberWithInt:typeSharing], @"itell_policy", nil];
    [apiRequest requestUsingPostMethod:[NSString stringWithFormat:@"%@itell/post_itell", SERVER_URL] postData:dic];
}

- (IBAction)touchOnBackground:(id)sender {
    //[tfMessage resignFirstResponder];
}


- (IBAction)btSendPressed:(id)sender {
    if(tfMessage.text == nil||[tfMessage.text isEqualToString:@""]){
        ITLOGERROR(@"text is null");
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Itell message is empty" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        al.tag = 0;
        [al show];
        [al release];
        return;
    }else {

        ITLOG(@"Send message here");
        [self sendMessage];
    }
}

- (IBAction)btBackPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc {
    ITINFO_FUNC
    [apiRequest release];
    [avAlertView release];
    [tfMessage release];
    [viewShare release];
    [lbType release];
    [imBackground release];
    [super dealloc];
}

#pragma mark - alert
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (avAlertView.tag == kTagSendItellError) {
        if (buttonIndex == 0) {
            [self sendMessage];
        }
    }
}
@end
