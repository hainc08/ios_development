//
//  ChattingViewController.h
//  iTell
//
//  Created by mai van hai on 8/10/12.
//
//

#import <UIKit/UIKit.h>
#import "UserData.h"
#import "HPGrowingTextView.h"
#import "ViewStamps.h"
#import "SocketIO.h"
#import "SRWebSocket.h"
#import "ApiRequest.h"
#import "FriendData.h"

#define URL @"http://49.212.140.145/"

#define kDateTimeValueTag 2
#define ALIGHT_LEFT     2
#define ALIGHT_RIGHT    318


@interface ChattingViewController : UIViewController <UITextViewDelegate,UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource,HPGrowingTextViewDelegate, SocketIODelegate,ApiRequestDelegate> {
    IBOutlet UITableView *tblView;
    IBOutlet UITextView *txtView;
    IBOutlet UILabel *lbTitle;
    IBOutlet UIButton *btEmotion;
    IBOutlet UIButton *btSend;
    IBOutlet UIView *viewBar;
    IBOutlet UIImageView *backgroundChatbar;
    IBOutlet UIImageView *backgroundChatbox;
    IBOutlet UITextField *txtField;
    HPGrowingTextView *textView;
    FriendData *userData;
    NSMutableArray		*smsArray;
    
    BOOL				isMySpeaking;
    NSData *dataImageFriend;
    ViewStamps *viewStamps;
    
    ApiRequest *_apiRequest;
    //for chat
    SocketIO *socketIO;
    SRWebSocket *_webSocket;
    
    NSString * linkHost;
    int         port;
    
    int userId;
    NSString* uuid;
    IBOutlet UILabel *lbTime;
}
@property (retain, nonatomic) FriendData *userData;
@property(nonatomic, retain) IBOutlet UIButton *btEmotion;
@property(nonatomic, retain) IBOutlet UIButton *btSend;
@property(nonatomic, retain) IBOutlet UIView *viewBar;
@property(nonatomic, retain) NSMutableArray		*smsArray;
- (id)chattingWithUser:(UserData *)user;
- (IBAction)viewChat:(id)sender;
- (IBAction)viewSrote:(id)sender;
- (IBAction)resignTextView:(id)sender;
- (IBAction)showStamp:(id)sender;
- (UIView *)bubbleView:(NSString *)text from:(BOOL)fromSelf;
@end
