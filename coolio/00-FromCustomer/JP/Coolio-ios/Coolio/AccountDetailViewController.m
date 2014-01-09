//
//  AccountDetailViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/05/16.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "AccountDetailViewController.h"

@interface AccountDetailViewController ()

@end

@implementation AccountDetailViewController

#define kFontSize 17
#define DATEFORMAT_UTC @"yyyy-MM-dd'T'HH:mm:ssZZZZ"
#define DEFAULT_CELL_HEIGHT 44.0f
#define PERSONARITY_CELL_HEIGHT 54.0f

@synthesize isMyIdTaped = _isMyIdTaped;
@synthesize myId = _myId;
//@synthesize userInfoDict = _userInfoDict;
@synthesize userProfile = _userProfile;

@synthesize cell_picture;
@synthesize cell_command;
@synthesize cell_status;

@synthesize cell_nickName;
@synthesize cell_age;
@synthesize cell_height;
@synthesize cell_weight;
@synthesize cell_sexuallity;
@synthesize cell_race;
@synthesize cell_country;

@synthesize cell_style;
@synthesize cell_styleLabel;
@synthesize cell_lookingFor;
@synthesize cell_lookingForLabel;

@synthesize cell_comment;
@synthesize cell_commentLabel;

@synthesize cell_bodyShape;
@synthesize cell_muscle;
@synthesize cell_bodyHair;
@synthesize cell_hairStyle;
@synthesize cell_hairColor;

@synthesize cell_otherCharacteristicsLabel;
@synthesize cell_otherCharacteristics;

@synthesize cell_p0;
@synthesize cell_p1;
@synthesize cell_p2;
@synthesize cell_p3;
@synthesize cell_p4;
@synthesize cell_p5;
@synthesize cell_p6;
@synthesize cell_p7;
@synthesize cell_p8;
@synthesize cell_p9;
@synthesize cell_p10;
@synthesize cell_p11;
@synthesize cell_p12;
@synthesize cell_p13;
@synthesize cell_p14;
@synthesize cell_p15;
@synthesize cell_p16;
@synthesize cell_p17;
@synthesize cell_p18;

@synthesize p0;
@synthesize p1;
@synthesize p2;
@synthesize p3;
@synthesize p4;
@synthesize p5;
@synthesize p6;
@synthesize p7;
@synthesize p8;
@synthesize p9;
@synthesize p10;
@synthesize p11;
@synthesize p12;
@synthesize p13;
@synthesize p14;
@synthesize p15;
@synthesize p16;
@synthesize p17;
@synthesize p18;

@synthesize cell_gayCareer;
@synthesize cell_comingout;
@synthesize cell_loveStyle;
@synthesize cell_expect;

@synthesize cell_job;
@synthesize cell_living;
@synthesize cell_lifePolicy;
@synthesize cell_lifePolicyLabel;

@synthesize cell_sexPosition;
@synthesize cell_pSize;
@synthesize cell_penisThickness;
@synthesize cell_phimosis;
@synthesize cell_sadomasochism;
@synthesize cell_fetish;
@synthesize cell_fetishLabel;

@synthesize scrollView = _scrollView;
//@synthesize av = _av;

#define IMG_WIDHT 300.0f
#define IMG_HEIGHT 219.0f
#define IMG_NUM 5

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    account = [[MyProfiles alloc] init];
    coolio = [[CoolioWebService alloc] init];
    self.userProfile = [[UserProfile alloc] init];
    
    self.myId = [account getEmailProfile];
    
    [self openPasscodeView];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheViewAccount:) name:@"ToNotifyTheAccountDetail" object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheMyId:) name:@"ToNotifyTheAccountDetail_SendMyId" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheUserOne:) name:@"ToNotifyTheUserOne" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheIsFriend:) name:@"ToNotifyTheIsFriend" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheIsSilentMatch:) name:@"ToNotifyTheIsSilentMatch" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheIsBlock:) name:@"ToNotifyTheIsBlock" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheRemoveFriend:) name:@"ToNotifyFriendRemove" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheRemoveSilentMatch:) name:@"ToNotifySilentMatchRemove" object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheIsState:) name:@"ToNotifyTheIsState" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheSendReport:) name:@"ToNotifyReportRequest" object:nil];
    

    //self.av = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    //背景色を透明にする
    //self.txt_profile.backgroundColor = [UIColor clearColor];
    //self.txt_publish.backgroundColor = [UIColor clearColor];
    
    //if(userInfoGlobal != nil){
    //    self.userInfoDict = userInfoGlobal;
    //    userProfile.userProfileInfo = userInfoGlobal;
    //}
    
    [self.pageControl setCurrentPage:0];
    //[self.scrollView addSubview:self.pageControl];

    // ページごとのスクロールにする
    self.scrollView.pagingEnabled = YES;

    // スクロールバーを非表示にする
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;

    // ステータスバータップでトップにスクロールする機能をOFFにする
    self.scrollView.scrollsToTop = NO;
    self.scrollView.clipsToBounds = NO;

    // delaysContentTouches (set to YES) and canCancelContentTouches (set to NO)
    self.scrollView.delaysContentTouches = YES;
    self.scrollView.canCancelContentTouches = NO;
    
    // ページングスクロールビューのdelegateメソッドを使えるように設定
    self.scrollView.delegate = self;
    self.scrollView.layer.cornerRadius = 5;
    
    if(_iconCacheDict == nil){
        _iconCacheDict = [NSMutableDictionary dictionary];
    }
    
    //}
    //[self toNotifyTheViewAccount:nil];

    //self.txt_style.delegate = self;
    //self.txt_comment.delegate = self;
    //self.txt_fetish.delegate = self;
    //self.txt_lookingFor.delegate = self;
    //self.txt_lifePolicy.delegate = self;
    //self.txt_otherCharacteristics.delegate = self;

    //self.tableView.delegate = self;
    //self.tableView.dataSource = self;

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setToolbarHidden:YES animated:NO];
    if([AppDelegate NetworkCheckConnect] == NO){
        [AppDelegate showDisconnectAlert];
    }else{
        if(self.myId != nil && self.userId != nil && ![self.myId isEqual:[NSNull null]] && ![self.userId isEqual:[NSNull null]]){
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
            [SVProgressHUD show];
            //[SVProgressHUD showWithStatus:@"Loading data..." maskType:SVProgressHUDMaskTypeBlack];
            
            dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(q_global, ^{
                [coolio getUserOne:self.myId userId:self.userId];
            });
        }
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //return 0;
    int rows = 0;
    switch (section) {
        case 0:
            //#ifdef DEBUG
            //    rows = 2;
            //    break;
            //#endif
            {
                NSString* _email = [self.userProfile getEmail];
                if([self.myId isEqualToString:_email] == YES)
                {
                    rows = 1;
                    self.navigationItem.rightBarButtonItem = nil;
                }else{ //if(isBlockAnswer == YES || isBeBlock == YES){
                    rows = 2;
                }
            }
            break;
        case 1:
            rows = 2;
            break;
        case 2:
            rows = 7;
            break;
        case 3:
            rows = 4;
            break;
        case 4:
            rows = 2;
            break;
        case 5:
            rows = 7;
            break;
        case 6:
            rows = 19;
            break;
        case 7:
            rows = 4;
            break;
        case 8:
            rows = 4;
            break;
        case 9:
            rows = 7;
            break;
        default:
            break;
    }
    return rows;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    //UITableViewCell* currentCell = [tableView cellForRowAtIndexPath:indexPath];
    CGFloat cellHeight = DEFAULT_CELL_HEIGHT;
    //float cellLittleExtraPadding = 24.0f;
    NSString* cellString = nil;
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0: cellHeight = 239.0f; break;
                default:
                    break;
            }
        case 1:
            break;
        case 2:
            break;
        case 3:
            switch (indexPath.row) {
                case 1:
                    cellString = [self.userProfile getStyle];
                    if(cellString == nil){
                        cellString = @"";
                    }
                    cellHeight = [self cellHeight:cellString];// + cellLittleExtraPadding + 8.0f;
                    //NSLog(@"Sytle Cell Height: %f", cellHeight);
                    break;
                case 3:
                    cellString = [self.userProfile getLookingFor];
                    if(cellString == nil){
                        cellString = @"";
                    }
                    cellHeight = [self cellHeight:cellString];// + cellLittleExtraPadding + 8.0f;
                    //NSLog(@"LookingFor Cell Height: %f", cellHeight);
                    break;
                default: break;
            }
            break;
        case 4:
            switch (indexPath.row) {
                    //case 0: cell = cell_commentLabel; break;
                case 1:
                    cellString = [self.userProfile getComment];
                    if(cellString == nil){
                        cellString = @"";
                    }
                    cellHeight = [self cellHeight:cellString];// + cellLittleExtraPadding;
                    break;
                default: break;
            }
            break;
        case 5:
            switch (indexPath.row) {
                case 1:
                    cellHeight = 70.0f;
                    break;
                case 6:
                    cellString = [self.userProfile getOtherCharacteristics];
                    if(cellString == nil){
                        cellString = @"";
                    }
                    cellHeight = [self cellHeight:cellString];// + cellLittleExtraPadding;
                    //NSLog(@"OtherCell: %f", cellHeight);
                    break;
                default: break;
            }
            break;
        case 6:
            if([currentLanguage isEqualToString:@"ja"]){
                switch (indexPath.row) {
                    case 0:
                    case 1:
                    case 2:
                        cellHeight = PERSONARITY_CELL_HEIGHT;
                        break;
                    case 3:
                        cellHeight = 70.0f;
                        break;
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                    case 8:
                    case 9:
                    case 10:
                    case 11:
                    case 12:
                    case 13:
                    case 14:
                    case 15:
                    case 16:
                        cellHeight = PERSONARITY_CELL_HEIGHT;
                        break;
                    case 17:
                        cellHeight = 70.0f;
                        break;
                    case 18:
                        cellHeight = 70.0f;
                        break;
                    default:
                        cellHeight = 70.0f;
                        break;
                }
            }else{
                switch (indexPath.row) {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                    case 8:
                    case 9:
                    case 10:
                    case 11:
                    case 12:
                    case 13:
                    case 14:
                    case 15:
                    case 16:
                        cellHeight = PERSONARITY_CELL_HEIGHT;
                        break;
                    case 17:
                        cellHeight = 70.0f;
                        break;
                    case 18:
                        cellHeight = PERSONARITY_CELL_HEIGHT;
                        break;
                    default:
                        cellHeight = PERSONARITY_CELL_HEIGHT;
                        break;
                }
            
            }
            break;
        case 7:
            switch (indexPath.row) {
                //case 0: cellHeight = 70.0f; break;
                case 1: cellHeight = 70.0f; break;
                //case 2: break;
                case 3: cellHeight = 70.0f; break;
                default:
                    cellHeight = DEFAULT_CELL_HEIGHT;
                    break;
            }
            break;
        case 8:
            switch (indexPath.row) {
                case 2:
                    cellHeight = DEFAULT_CELL_HEIGHT;
                    break;
                case 3:
                    cellHeight = [self cellHeight:[self.userProfile getLifePolicy]];// + cellLittleExtraPadding + 8.0f;
                    break;
                default:
                    cellHeight = 70.0f;
                    break;
            }
            break;

        case 9:
            switch (indexPath.row) {
                case 5:
                    cellHeight = DEFAULT_CELL_HEIGHT;
                    break;
                case 6:
                    cellHeight = [self cellHeight:[self.userProfile getFetish]];// + 8.0f; //+ cellLittleExtraPadding + 8.0f;
                    break;
                default:
                    cellHeight = 70.0f;
                    break;
            }
            break;
        //case 10:
        //    break;
        default:
            break;
    }
    //NSLog(@"CellHeight: %d/%d  %f", indexPath.section, indexPath.row, cellHeight);
    return cellHeight;
}

- (CGFloat)cellHeight:(NSString*)text{
    float cellHeight = 0.0f;
    float verticalPadding = 24.0f;
    //float verticalPadding = 24.0f;
    //CGSize _size = CGSizeMake(320, 999999.0f);
    float _textContentSize = [NSString stringWithHeight:text];
    //CGSize _textContentSize = [text sizeWithFont:[UIFont systemFontOfSize:kFontSize] constrainedToSize:_size lineBreakMode:NSLineBreakByWordWrapping];
    
    if(_textContentSize > 0.0f){
        cellHeight = _textContentSize + verticalPadding;
    }else{
        cellHeight = DEFAULT_CELL_HEIGHT;
    }
    return cellHeight;
}

-(CGFloat)textViewHeight:(NSString *)string{
    //NSLog(@"Call textView Height");
    float textHeight = 0.0f;
    float _textContentSize = [NSString stringWithHeight:string];
    //CGSize _textContentSize = [string sizeWithFont:[UIFont systemFontOfSize:kFontSize] constrainedToSize:CGSizeMake(320, 999999.0f) lineBreakMode:NSLineBreakByWordWrapping];
    
    if(_textContentSize > 0.0f){
        textHeight = _textContentSize;
    }else{
        textHeight = DEFAULT_CELL_HEIGHT;
    }
    //NSLog(@"CellHeight: %f", cellHeight);
    return textHeight;

}

/*
-(void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"Call textView DidChange");
    CGRect f = textView.frame;
    f.size.height = textView.contentSize.height;
    textView.frame = f;
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    NSLog(@"Call textView DidEndEditing");
    CGRect f = textView.frame;
    f.size.height = textView.contentSize.height;
    textView.frame = f;
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    // Configure the cell...
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    cell_picture.layer.cornerRadius = 5;
                    cell = cell_picture;
                    break;
                case 1:
                    if(isBeBlock == YES){
                        cell = cell_status;
                    }else{
                        cell = cell_command;
                    }
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0: cell = self.cell_lastUpdate; break;
                case 1: cell = self.cell_distance; break;
                    
                default:
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0: cell = cell_nickName; break;
                case 1: cell = cell_age; break;
                case 2: cell = cell_height; break;
                case 3: cell = cell_weight; break;
                case 4: cell = cell_sexuallity; break;
                case 5: cell = cell_race; break;
                case 6: cell = cell_country; break;
                default: break;
            }
            break;
        case 3:
            switch (indexPath.row) {
                case 0:
                    cell = cell_styleLabel;
                    break;
                case 1:
                {
                    cell = cell_style;
                    
                    UILabel* lbl_styleValue = (UILabel *)[cell viewWithTag:1];
                    
                    //#if DEBUG
                    //    lbl_styleValue.layer.borderColor = [UIColor blackColor].CGColor;
                    //    lbl_styleValue.layer.borderWidth = 0.5f;
                    //#endif
                    
                    NSString* str = [self.userProfile getStyle];
                    CGRect frame = lbl_styleValue.frame;
                    float  height = [self textViewHeight:str];
                    frame.size.height = height;// + 8.0f;
                    lbl_styleValue.frame = frame;
                    
                    lbl_styleValue.text = str;
                    //[lbl_styleValue sizeToFit];
                }

                    break;
                    
                case 2:
                    cell = cell_lookingForLabel;
                    break;
                case 3:
                {
                    cell = cell_lookingFor;
                    
                    UILabel* lbl_lookingFor = (UILabel *)[cell viewWithTag:2];
                    
                    //#if DEBUG
                    //    lbl_lookingFor.layer.borderColor = [UIColor blackColor].CGColor;
                    //    lbl_lookingFor.layer.borderWidth = 0.5f;
                    //#endif
                    
                    NSString* str = [self.userProfile getLookingFor];
                    CGRect frame = lbl_lookingFor.frame;
                    float  height = [self textViewHeight:str];
                    frame.size.height = height;// + 8.0f;
                    lbl_lookingFor.frame = frame;
                    
                    lbl_lookingFor.text = str;
                    //[lbl_lookingFor sizeToFit];
                }
                    break;
                default: break;
            }
            break;
        case 4:
            switch (indexPath.row) {
                case 0: cell = cell_commentLabel; break;
                case 1:
                {
                    cell = cell_comment;

                    UILabel* lbl_comment = (UILabel *)[cell viewWithTag:3];
                    
                    //#if DEBUG
                    //lbl_comment.layer.borderColor = [UIColor blackColor].CGColor;
                    //lbl_comment.layer.borderWidth = 1.0;
                    //#endif
                    
                    NSString* str = [self.userProfile getComment];
                    CGRect frame = lbl_comment.frame;
                    float  height = [self textViewHeight:str];
                    frame.size.height = height;
                    lbl_comment.frame = frame;
                    
                    lbl_comment.text = str;
                    //[lbl_comment sizeToFit];
                }
                    break;
                default: break;
            }
            break;
        case 5:
            switch (indexPath.row) {
                case 0: cell = cell_bodyShape; break;
                case 1: cell = cell_muscle; break;
                case 2: cell = cell_bodyHair; break;
                case 3: cell = cell_hairStyle; break;
                case 4: cell = cell_hairColor; break;
                case 5: cell = cell_otherCharacteristicsLabel; break;
                case 6:
                {
                    cell = cell_otherCharacteristics;
                    
                    UILabel* lbl_OtherCharacteristics = (UILabel *)[cell viewWithTag:4];
                    
                    //#if DEBUG
                    //lbl_OtherCharacteristics.layer.borderColor = [UIColor blackColor].CGColor;
                    //lbl_OtherCharacteristics.layer.borderWidth = 1.0;
                    //#endif

                    NSString* str = [self.userProfile getOtherCharacteristics];
                    CGRect frame = lbl_OtherCharacteristics.frame;
                    float  height = [self textViewHeight:str];
                    frame.size.height = height;
                    lbl_OtherCharacteristics.frame = frame;
                    
                    lbl_OtherCharacteristics.text = str;
                    //[lbl_OtherCharacteristics sizeToFit];
                }
                    break;
                default: break;
            }
            break;
        case 6:
            switch (indexPath.row) {
                case 0: cell = cell_p0;  break;
                case 1: cell = cell_p1;  break;
                case 2: cell = cell_p2;  break;
                case 3: cell = cell_p3;  break;
                case 4: cell = cell_p4;  break;
                case 5: cell = cell_p5;  break;
                case 6: cell = cell_p6;  break;
                case 7: cell = cell_p7;  break;
                case 8: cell = cell_p8;  break;
                case 9: cell = cell_p9;  break;
                case 10: cell = cell_p10;  break;
                case 11: cell = cell_p11;  break;
                case 12: cell = cell_p12;  break;
                case 13: cell = cell_p13;  break;
                case 14: cell = cell_p14;  break;
                case 15: cell = cell_p15;  break;
                case 16: cell = cell_p16;  break;
                case 17: cell = cell_p17;  break;
                case 18: cell = cell_p18;  break;

                default: break;
            }
            break;
        case 7:
            switch (indexPath.row) {
                case 0: cell = cell_gayCareer;  break;
                case 1: cell = cell_comingout;  break;
                case 2: cell = cell_loveStyle;  break;
                case 3: cell = cell_expect;  break;
                default: break;
            }
            break;
        case 8:
            switch (indexPath.row) {
                case 0: cell = cell_job;  break;
                case 1: cell = cell_living;  break;
                case 2: cell = cell_lifePolicyLabel;  break;
                case 3:
                {
                    cell = cell_lifePolicy;

                    UILabel* lbl_lifePolicy = (UILabel *)[cell viewWithTag:5];
                    
                    //#if DEBUG
                    //lbl_lifePolicy.layer.borderColor = [UIColor blackColor].CGColor;
                    //lbl_lifePolicy.layer.borderWidth = 1.0;
                    //#endif
                    
                    NSString* str = [self.userProfile getLifePolicy];
                    CGRect frame = lbl_lifePolicy.frame;
                    float  height = [self textViewHeight:str];
                    frame.size.height = height;
                    lbl_lifePolicy.frame = frame;
                    
                    lbl_lifePolicy.text = str;
                    //[lbl_lifePolicy sizeToFit];
                }
                    break;
                default:
                    break;
            }
            break;
        case 9:
            switch (indexPath.row) {
                case 0: cell = cell_sexPosition;  break;
                case 1: cell = cell_pSize;  break;
                case 2: cell = cell_penisThickness;  break;
                case 3: cell = cell_phimosis;  break;
                case 4: cell = cell_sadomasochism;  break;
                case 5: cell = cell_fetishLabel;  break;
                case 6:
                {
                    cell = cell_fetish;
                    
                    UILabel* lbl_fetish = (UILabel *)[cell viewWithTag:6];
                    
                    //#if DEBUG
                    //    lbl_fetish.layer.borderColor = [UIColor blackColor].CGColor;
                    //    lbl_fetish.layer.borderWidth = 1.0;
                    //#endif
                    lbl_fetish.text = nil;
                    NSString* str = [self.userProfile getFetish];
                    
                    //NSLog(@"Fetish :%@", str);

                    CGRect frame = lbl_fetish.frame;
                    float  height = [self textViewHeight:str];
                    frame.size.height = height;
                    lbl_fetish.frame = frame;

                    lbl_fetish.text = str;
                    //[lbl_fetish sizeToFit];
                }
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void)cellForRowUpdatedIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [(UITableViewCell *)cell performSelectorOnMainThread:@selector(setNeedsDisplay) withObject:nil waitUntilDone:NO];
}


-(NSString *)picturesURLString:(NSDictionary *)dict pictName:(NSString *)pictName
{
    NSMutableString* appendIconUrlString = [[NSMutableString alloc] init];
    [appendIconUrlString appendString:URLSTRING];
    [appendIconUrlString appendString:@"icons/"];
    [appendIconUrlString appendFormat:@"%@", [dict valueForKey:pictName]];
    
    return appendIconUrlString;
}

-(void)setPicturesDataDictionary:(NSDictionary *)dict// pictName:(NSString *)pictName
{
    NSArray* pictures = @[@"picture1", @"picture2", @"picture3", @"picture4", @"picture5"];
    
    for(NSString* pic in pictures){
        NSString* iconUrlString = [self picturesURLString:dict pictName:pic];
        //if([_iconCacheDict valueForKey:pic] == nil){
            
            NSURL *url = [NSURL URLWithString:iconUrlString];
            NSData *data = [NSData dataWithContentsOfURL:url];
            [_iconCacheDict setValue:data forKey:pic];
        //}
    }
}

-(UIImage *)pictures:(NSDictionary *)dict pictName:(NSString *)pictName
{
    /*
    NSMutableString* appendIconUrlString = [[NSMutableString alloc] init];
    [appendIconUrlString appendString:URLSTRING];
    [appendIconUrlString appendString:@"icons/"];
    [appendIconUrlString appendFormat:@"%@", [dict valueForKey:pictName]];
    */
    NSString* iconUrlString = [self picturesURLString:dict pictName:pictName];

    UIImage *img = nil;
    if([_iconCacheDict valueForKey:pictName] == nil){
    
        NSURL *url = [NSURL URLWithString:iconUrlString];
        NSData *data = [NSData dataWithContentsOfURL:url];
        img = [[UIImage alloc]initWithData:data];
        [_iconCacheDict setValue:data forKey:pictName];
    }else{
        NSData* data = [_iconCacheDict valueForKey:pictName];
        img = [[UIImage alloc]initWithData:data];
    }
    
    return  img;
}

-(void)toNotifyTheUserOne:(NSNotification *)notification
{
    MyUnit* unit = [[MyUnit alloc] init];
    
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q_global, ^{
        
        NSDictionary* noticeDict = [notification object];
        NSDictionary* profileDict = [[noticeDict valueForKey:@"profile"] mutableCopy];
        NSDictionary* responseDict = [noticeDict valueForKey:@"status"];
        
        //NSLog(@"%@", profileDict);
        
        if(self.userProfile == nil){
            self.userProfile = [[UserProfile alloc] init];
        }
        self.userProfile.userProfileInfo = profileDict;

        dispatch_queue_t q_main = dispatch_get_main_queue();
        dispatch_async(q_main, ^{
            
            //NSLog(@"%@", profileDict);
            
            self.lbl_lastUpdate.text = [self stringFromTime:[self.userProfile getUpdated_at]];
            self.lbl_distance.text = [self stringFromDistance:[self.userProfile getLatitude] longitude:[self.userProfile getLongitude]];
            self.lbl_nickName.text = [self.userProfile getNickName];
            
            if([currentLanguage isEqualToString:@"ja"]){
                self.lbl_age.text = [NSString stringWithFormat:@"%d%@", [self.userProfile getAge], @"歳"];
            }else{
                self.lbl_age.text = [NSString stringWithFormat:@"%d", [self.userProfile getAge]];
            }
            
            if([unit getUnit] == 0){
                int height = [[account getHeightProfile] intValue];
                NSString* feet = [NSString stringWithFormat:@"%.1f", (height / 30.48)];
                NSString* inch = [feet componentsSeparatedByString:@"."][1];
                feet = [feet componentsSeparatedByString:@"."][0];
                
                self.lbl_height.text = [NSString stringWithFormat:@"%@'%@\"", feet, inch];
            
                int weight = [self.userProfile getWeight];
                weight = weight / 0.45359237;
            
                self.lbl_weight.text = [NSString stringWithFormat:@"%d%@", weight, @" lbs"];
            }else{
                self.lbl_height.text = [NSString stringWithFormat:@"%d%@",  [self.userProfile getHeight], @" cm"];
                self.lbl_weight.text = [NSString stringWithFormat:@"%d%@", [self.userProfile getWeight], @" kg"];
            }
            
            self.lbl_sexuallity.text = [self.userProfile getSexuallity];
            self.lbl_race.text = [self.userProfile getRace];
            self.lbl_country.text = [self.userProfile getCountry];
            
            self.lbl_bodyShape.text = [self.userProfile getBodyShape];
            self.lbl_muscle.text = [self.userProfile getMuscle];
            self.lbl_bodyHair.text = [self.userProfile getBodyHair];
            self.lbl_hairStyle.text = [self.userProfile getHairStyle];
            self.lbl_hairColor.text = [self.userProfile getHairColor];
            
            self.p0.progress = [self.userProfile getP0];
            self.p1.progress = [self.userProfile getP1];
            self.p2.progress = [self.userProfile getP2];
            self.p3.progress = [self.userProfile getP3];
            self.p4.progress = [self.userProfile getP4];
            self.p5.progress = [self.userProfile getP5];
            self.p6.progress = [self.userProfile getP6];
            self.p7.progress = [self.userProfile getP7];
            self.p8.progress = [self.userProfile getP8];
            self.p9.progress = [self.userProfile getP9];
            self.p10.progress = [self.userProfile getP10];
            self.p11.progress = [self.userProfile getP11];
            self.p12.progress = [self.userProfile getP12];
            self.p13.progress = [self.userProfile getP13];
            self.p14.progress = [self.userProfile getP14];
            self.p15.progress = [self.userProfile getP15];
            self.p16.progress = [self.userProfile getP16];
            self.p17.progress = [self.userProfile getP17];
            self.p18.progress = [self.userProfile getP18];
            
            self.lbl_gayCareer.text = [self.userProfile getGayCareer];
            self.lbl_comingOut.text = [self.userProfile getComingOut];
            self.lbl_loveStyle.text = [self.userProfile getLoveStyle];
            self.lbl_expect.text = [self.userProfile getExpect];
            self.lbl_job.text = [self.userProfile getJob];
            self.lbl_living.text = [self.userProfile getLiving];
            
            self.lbl_sexPosition.text = [self.userProfile getSexPosition];
            self.lbl_pSize.text = [self.userProfile getPSize];
            self.lbl_penisThickness.text = [self.userProfile getPenisThickness];
            self.lbl_phimosis.text = [self.userProfile getPhimosis];
            self.lbl_sadomasochism.text = [self.userProfile getSadomasochism];
            //self.lbl_fetish.text = [self.userProfile getFetish];


            //userIconCacheGlobal = nil;
            
            if([[responseDict valueForKey:@"friend"] isEqualToString:@"success"]){
                isNotifiFriendAnswer = YES;
                [self.btn_friend setImage:[UIImage imageNamed:@"FriendRelease"] forState:UIControlStateNormal];
            }else{
                isNotifiFriendAnswer = NO;
                [self.btn_friend setImage:[UIImage imageNamed:@"FriendRegist"] forState:UIControlStateNormal];
            }
            if([[responseDict valueForKey:@"silentMatch"] isEqualToString:@"success"]){
                isNotifiSilentMatchAnswer = YES;
                [self.btn_silentMatch setImage:[UIImage imageNamed:@"SilentMatchRelease"] forState:UIControlStateNormal];
            }else{
                isNotifiSilentMatchAnswer = NO;
                [self.btn_silentMatch setImage:[UIImage imageNamed:@"SilentMatchRegist"] forState:UIControlStateNormal];
            }
            if([[responseDict valueForKey:@"match"] isEqualToString:@"success"]){
                
            }else{
                
            }
            if([[responseDict valueForKey:@"block"] isEqualToString:@"success"]){
                isBlockAnswer = YES;
            }else{
                
            }
            if([[responseDict valueForKey:@"isBlock"] isEqualToString:@"success"]){
                isBeBlock = YES;
                self.lbl_status.text = @"be Blocks...";
                self.navigationController.navigationItem.rightBarButtonItem = nil;
            }else{
                
            }
            if([[responseDict valueForKey:@"isChat"] isEqualToString:@"success"]){
                isNotifiChatAnswer = YES;
                [self.btn_chat setImage:[UIImage imageNamed:@"ChatHasHistory"] forState:UIControlStateNormal];
            }else{
                isNotifiChatAnswer = NO;
                [self.btn_chat setImage:[UIImage imageNamed:@"ChatWithYou"] forState:UIControlStateNormal];
            }
            
            NSArray* pictures = @[@"picture1", @"picture2", @"picture3", @"picture4", @"picture5"];

            int i=0;
            for(NSString* pic in pictures){
                
                UIImageView* imageView = [[UIImageView alloc] init];

                //[[UIImageView alloc] initWithImage:img];
                //NSData* data = [_iconCacheDict valueForKey:pic];
                //UIImage* img = [[UIImage alloc]initWithData:data];
                //UIImageView* imageView = [[UIImageView alloc] initWithImage:img];

                imageView.contentMode = UIViewContentModeScaleAspectFit;
                //imageView.layer.cornerRadius = 5;
                imageView.clipsToBounds = YES;
                imageView.frame = CGRectMake( IMG_WIDHT * i++, 0, IMG_WIDHT, IMG_HEIGHT);
                
                NSMutableString* appendIconUrlString = [[NSMutableString alloc] init];
                [appendIconUrlString appendString:URLSTRING];
                [appendIconUrlString appendString:@"icons/"];
                [appendIconUrlString appendFormat:@"%@", [profileDict valueForKey:pic]];
                
                [imageView setImageWithURL:[NSURL URLWithString:appendIconUrlString] placeholderImage:nil options:SDWebImageCacheMemoryOnly];
                
                
                [self.scrollView addSubview:imageView];
                self.scrollView.contentSize = CGSizeMake(IMG_WIDHT*i, IMG_HEIGHT);
            }
            // 表示されたときスクロールバーを点滅
            [self.scrollView flashScrollIndicators];
            
            
            //UITableViewを更新
            [(UITableView *)self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            [SVProgressHUD dismiss];
        });
    });
}

- (NSString *)convertWeightValue:(NSString *)weightString{
    int weight = [weightString intValue];
    weight = weight / 0.45359237;
    return [NSString stringWithFormat:@"%d", weight];
}

- (NSString *)convertHeightValue:(NSString *)heightString
{
    //MyUnit* unit = [[MyUnit alloc] init];

    //if([unit getUnit]==0){
        //cm, kg -> feet,inch lb
        int height = [heightString intValue];
        
        NSString* feet = [NSString stringWithFormat:@"%.1f", (height / 30.48)];
        
        NSString* inch = [feet componentsSeparatedByString:@"."][1];
        feet = [feet componentsSeparatedByString:@"."][0];
        
        return [NSString stringWithFormat:@"%@'%@\"", feet, inch];
    //}
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView == _scrollView){
        //NSLog(@"Call scrollViewDidScroll");
        CGFloat pageWidth = self.scrollView.frame.size.width;
        self.pageControl.currentPage = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    }
}

-(void)toNotifyTheIsFriend:(NSNotification *)notification
{
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_main, ^{
        isNotifiFriendAnswer = YES;
        isNotifiSilentMatchAnswer = NO;
        [self.btn_friend setImage:[UIImage imageNamed:@"FriendRelease"] forState:UIControlStateNormal];
        [self.btn_friend reloadInputViews];
        [(UITableView *)self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
        //[self cellForRowUpdatedIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    });
}

-(void)toNotifyTheIsSilentMatch:(NSNotification *)notification
{
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_main, ^{
        isNotifiSilentMatchAnswer = YES;
        isNotifiFriendAnswer = NO;
        [self.btn_silentMatch setImage:[UIImage imageNamed:@"SilentMatchRelease"] forState:UIControlStateNormal];
        [self.btn_silentMatch reloadInputViews];
        [(UITableView *)self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    });
}

-(void)toNotifyTheIsBlock:(NSNotification *)notification
{
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_main, ^{
        isBlockAnswer = YES;
        isNotifiFriendAnswer = NO;
        isNotifiSilentMatchAnswer = NO;
        [(UITableView *)self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
        //[self.tableView reloadData];
    });
}
-(void)toNotifyTheRemoveFriend:(NSNotification *)notification
{
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_main, ^{
        isNotifiFriendAnswer = NO;
        [self.btn_friend setImage:[UIImage imageNamed:@"FriendRegist"] forState:UIControlStateNormal];
        [self.btn_friend reloadInputViews];
        [(UITableView *)self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    });
}

-(void)toNotifyTheRemoveSilentMatch:(NSNotification *)notification
{
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_main, ^{
        isNotifiSilentMatchAnswer = NO;
        [self.btn_silentMatch setImage:[UIImage imageNamed:@"SilentMatchRegist"] forState:UIControlStateNormal];
        [self.btn_silentMatch reloadInputViews];
        [(UITableView *)self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    });
}


-(void)toNotifyTheSendReport:(NSNotification *)notification
{
    //@"Thank you for Reporting."
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"ALERT_REPORT_SENDED", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}


- (IBAction)btn_actionPush:(id)sender {
    UIActionSheet* sheet = [UIActionSheet actionSheetWithTitle:nil];
    
    //@"Block"
    [sheet addButtonWithTitle:NSLocalizedString(@"BLOCK_BUTTON", nil) handler:^(void){
        NSString* nickName = [self.userProfile getNickName]; //[self.userInfoDict valueForKey:@"nickname"];
        NSString* message = [NSString stringWithFormat: NSLocalizedString(@"ADD_BLOCKLIST", nil), nickName];
        UIAlertView* alert = [UIAlertView alertViewWithTitle:message];
        [alert addButtonWithTitle:@"OK" handler:^(void){
            NSString* blockId = [self.userProfile getEmail];
            [coolio sendBlock:self.myId blockId:blockId];

        }];
        [alert setCancelButtonWithTitle:NSLocalizedString(@"CANCEL_BUTTON", nil) handler:^(void){}];
        [alert show];

    }];

    //"BLOCK_BUTTON" = "Block";
    //"REPORT_BUTTON" = "Report";
    //@"Report"
    [sheet addButtonWithTitle:NSLocalizedString(@"REPORT_BUTTON", nil) handler:^(void){
        NSString* reportId = [self.userProfile getEmail];
        UIActionSheet* reportSheet = [UIActionSheet actionSheetWithTitle:nil];
        
        //@"Uncensored pictures."
        //@"Spam text messages."
        //@"Prostitutes(male/female)."
        //@"Conducted to fishing site."
        //@"Non-copyrighted pictures."
        //@"I found minors."
        //@"Unlawful action."
        //@"Dangerous or violent contents."
        //@"Others."
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_UNCENSORED_PICTURES", nil) handler:^(void){ [coolio sendReport:self.myId reportId:reportId commandId:0]; }];
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_SPAM_TEXT", nil) handler:^(void){ [coolio sendReport:self.myId reportId:reportId commandId:1]; }];
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_PROSTITUTES", nil) handler:^(void){ [coolio sendReport:self.myId reportId:reportId commandId:2]; }];
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_FISHING_SITE", nil) handler:^(void){ [coolio sendReport:self.myId reportId:reportId commandId:3]; }];
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_COPYRIGHT_PICTURES", nil) handler:^(void){ [coolio sendReport:self.myId reportId:reportId commandId:4]; }];
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_I_FOUND_MINORS", nil) handler:^(void){ [coolio sendReport:self.myId reportId:reportId commandId:5]; }];
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_UNLAWFUL_ACTION", nil) handler:^(void){ [coolio sendReport:self.myId reportId:reportId commandId:6]; }];
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_VIOLENT_CONTENTS", nil) handler:^(void){ [coolio sendReport:self.myId reportId:reportId commandId:7]; }];
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_OTHERS", nil) handler:^(void){ [coolio sendReport:self.myId reportId:reportId commandId:8]; }];
        [reportSheet setCancelButtonWithTitle:NSLocalizedString(@"CANCEL_BUTTON", nil) handler:^(void){}];
        [reportSheet showInView:self.navigationController.view];
    }];
    
    
    [sheet setCancelButtonWithTitle:NSLocalizedString(@"CANCEL_BUTTON", nil) handler:^(void){}];
    [sheet showInView:self.navigationController.view];
}

- (IBAction)btn_friendPush:(id)sender {
    isFriendRequestPush = YES;
    
    //UIAlertView* alert = nil;
    NSString* nickName = [self.userProfile getNickName];//[self.userInfoDict valueForKey:@"nickname"];
    NSString* message = [self isStateMessage:nickName];
    NSString* userId = [self.userProfile getEmail];
    
    //alert = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    UIAlertView* alert = [UIAlertView alertViewWithTitle:nil message:message];
    
    [alert addButtonWithTitle:@"OK" handler:^(void){
        if(isNotifiFriendAnswer == NO){
            isNotifiSilentMatchAnswer = NO;
            isNotifiFriendAnswer = YES;
            [self.btn_friend setImage:[UIImage imageNamed:@"FriendRelease"] forState:UIControlStateNormal];
            [self.btn_friend reloadInputViews];
            dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(q_global, ^{
                [coolio sendFriendRequest:self.myId userId:userId];
                [coolio sendSilentMatchRemove:self.myId userId:userId];
            });
            
        }else{
            isNotifiFriendAnswer = NO;
            [self.btn_friend setImage:[UIImage imageNamed:@"FriendRegist"] forState:UIControlStateNormal];
            [self.btn_friend reloadInputViews];
            dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(q_global, ^{
                [coolio sendFriendRemove:self.myId userId:userId];
            });
        }
    }];

    [alert setCancelButtonWithTitle:NSLocalizedString(@"CANCEL_BUTTON", nil) handler:^(void){}];
    [alert show];
    isFriendRequestPush = NO;
}

- (IBAction)btn_silentMatchPush:(id)sender {
    isSilentMatchRequestPush = YES;
    //UIAlertView* alert = nil;
    NSString* nickName = [self.userProfile getNickName];//[self.userInfoDict valueForKey:@"nickname"];
    NSString* message = [self isStateMessage:nickName];
    NSString* userId = [self.userProfile getEmail];
    
    //alert = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    UIAlertView* alert = [UIAlertView alertViewWithTitle:nil message:message];
    [alert addButtonWithTitle:@"OK" handler:^(void){
        if(isNotifiSilentMatchAnswer == NO){
            isNotifiFriendAnswer = NO;
            isNotifiSilentMatchAnswer = YES;
            [self.btn_silentMatch setImage:[UIImage imageNamed:@"SilentMatchRelease"] forState:UIControlStateNormal];
            [self.btn_silentMatch reloadInputViews];
            dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(q_global, ^{
                [coolio sendFriendRemove:self.myId userId:userId];
                [coolio sendSilentMatch:self.myId userId:userId];
            });
        }else{
            isNotifiSilentMatchAnswer = NO;
            [self.btn_silentMatch setImage:[UIImage imageNamed:@"SilentMatchRegist"] forState:UIControlStateNormal];
            [self.btn_silentMatch reloadInputViews];
            dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(q_global, ^{
                [coolio sendSilentMatchRemove:self.myId userId:userId];
            });
        }
    }];
    
    [alert setCancelButtonWithTitle:NSLocalizedString(@"CANCEL_BUTTON", nil) handler:^(void){}];
    [alert show];
    isSilentMatchRequestPush = NO;
}

- (NSString *)isStateMessage:(NSString *)nickName
{
    NSString* message = nil;

    //--------------  Friend Request Action --------------//
    //フレンドでも無くサイレントマッチでも無い場合、フレンド・ボタンを押したらフレンド登録
    if(isFriendRequestPush == YES && isNotifiFriendAnswer == NO && isNotifiSilentMatchAnswer == NO){
        message = [NSString stringWithFormat: NSLocalizedString(@"ADD_FRIENDLIST", nil), nickName];
    }

    //既にフレンドでフレンド・ボタンを押したら、フレンド解除
    if(isNotifiFriendAnswer == YES && isFriendRequestPush == YES){
        message = [NSString stringWithFormat: NSLocalizedString(@"REMOVE_FRIENDLIST", nil), nickName];
        
    }
    
    //既にサイレントマッチでフレンドボタンを押したら、フレンドへ移動
    if(isNotifiSilentMatchAnswer == YES && isFriendRequestPush == YES){
        message = [NSString stringWithFormat: NSLocalizedString(@"MOVE_FRIENDLIST", nil), nickName];
    }
    
    
    //--------------  SilentMatch Request Action --------------//
    //フレンドでも無くサイレントマッチでも無い場合、サイレントマッチ・ボタンを押したらサイレントマッチ登録
    if(isSilentMatchRequestPush == YES && isNotifiFriendAnswer == NO && isNotifiSilentMatchAnswer == NO){
        message = [NSString stringWithFormat: NSLocalizedString(@"ADD_MATCHLIST", nil), nickName];
    }
    
    //既にサイレントマッチでサイレントマッチ・ボタンを押したら、サイレントマッチ解除
    if(isNotifiSilentMatchAnswer == YES && isSilentMatchRequestPush == YES){
        message = [NSString stringWithFormat: NSLocalizedString(@"REMOVE_MATCHLIST", nil), nickName];
    }
    
    //既にフレンドでサイレントマッチ・ボタンを押したら、フレンド解除でサイレントマッチ登録
    if(isNotifiFriendAnswer == YES && isSilentMatchRequestPush == YES){
        message = [NSString stringWithFormat: NSLocalizedString(@"MOVE_MATCHLIST", nil), nickName];
    }


    return message;
}

//- (IBAction)btn_chatPush:(id)sender {
//}

/*
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.tableView.decelerating) {
        // don't try anything when the tableview is moving..
        return [super hitTest:point withEvent:event];
    }
    
    // Find the cell
    NSIndexPath *indexPathAtHitPoint = [self.tableView indexPathForRowAtPoint:point];
    id cell = [self.tableView cellForRowAtIndexPath:indexPathAtHitPoint];
    // if the cell has a scrollView property, it's the one we want
    if (cell != nil && [cell respondsToSelector:@selector(scrollView)]) {
        [[cell scrollView] setScrollEnabled:YES];
        // Return the innermost scrollview
        return (UIView *)[cell scrollView];
    }
    
    return [super hitTest:point withEvent:event];
}
*/

- (NSString *)stringFromTime:(NSString *)updated_at {
    //NSString *datetimeString = @"2009-12-15T20:00:00+09:00";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
    [dateFormatter setDateFormat:DATEFORMAT_UTC];
    NSDate *updateTime = [dateFormatter dateFromString:updated_at];
    
    
    NSDate* now = [NSDate date];
    float date_a = [now timeIntervalSinceDate:updateTime];
    
    NSInteger ti = (NSInteger)date_a;
    //NSLog(@"ti: %d", ti);
    //NSInteger sec = ti % 60;
    NSInteger min = (ti / 60) % 60;
    NSInteger hour = (ti / 3600);
    //NSLog(@"%02d:%02d:%02d", hour, min, sec);
    
    NSString* retString;
    
    //NSArray *languages = [NSLocale preferredLanguages];
    //NSString *currentLanguage = [languages objectAtIndex:0];
    
    if([currentLanguage isEqualToString:@"ja"]){
        if(hour == 0){
            if(min == 0){
                retString = [NSString stringWithFormat:@"%@", @"たった今"];
            }else{
                retString = [NSString stringWithFormat:@"%d%@", min, @"分前"];
            }
        }else if(hour >= 1 && hour <=24){
            retString = [NSString stringWithFormat:@"%d%@", hour, @"時間前"];
        }else if(hour > 24 && (hour / 24) <= 365 ){
            retString = [NSString stringWithFormat:@"%d%@", (hour / 24) + 1, @"日前"];
        }else{
            retString = [NSString stringWithFormat:@"%@", @"1年以上前"];
        }
    }else{ // if([currentLanguage isEqualToString:@"en"]){
        if(hour == 0){
            if(min == 0){
                retString = [NSString stringWithFormat:@"%@", @"Now"];
            }else{
                retString = [NSString stringWithFormat:@"%d%@", min, @"m ago"];
            }
        }else if(hour >= 1 && hour <=24){
            retString = [NSString stringWithFormat:@"%d%@", hour, @"h ago"];
        }else if(hour > 24 && (hour / 24) <= 365 ){
            retString = [NSString stringWithFormat:@"%d%@", (hour / 24) + 1, @"d ago"];
        }else{
            retString = [NSString stringWithFormat:@"%@", @"over 1 year"];
        }
    }
    
    return retString;
    //[NSString stringWithFormat:@"%02i:%02i:%02i", hours, minutes, seconds];
}

- (NSString *)stringFromDistance:(NSString *)latitude longitude:(NSString *)longitude {
    
    
    if(latitude == nil){ return nil;}
    
    CLLocationCoordinate2D coordinate;
    CLLocation* userLocation = nil;//[[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    
    if(latitude != nil && longitude != nil){
        coordinate.latitude = [latitude doubleValue];
        coordinate.longitude = [longitude doubleValue];
        userLocation = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    }
    
    if(userLocation == nil){
        return @"";
    }
    
    CLLocationDistance distance = [tempNewLocationGlobal distanceFromLocation:userLocation];
    
    int distanceIntValue = [[NSNumber numberWithDouble:distance] intValue];
    
    MyUnit* unit = [[MyUnit alloc] init];
    NSString* retCorrdinateString;
        
    if([unit getUnit] == 1){
        if(distanceIntValue < 1000){
            if([currentLanguage isEqualToString:@"ja"]){
                retCorrdinateString = [NSString stringWithFormat:@"%@", @"1km未満"];
            }else if([currentLanguage isEqualToString:@"en"]){
                retCorrdinateString = [NSString stringWithFormat:@"%@", @"1km less"];
            }
        }else{
            distanceIntValue = distanceIntValue / 1000;
            retCorrdinateString = [NSString stringWithFormat:@"%dkm", distanceIntValue];
        }
    }else{
        if(distanceIntValue < 1600){
            if([currentLanguage isEqualToString:@"ja"]){
                retCorrdinateString = [NSString stringWithFormat:@"%@", @"1mi未満"];
            }else if([currentLanguage isEqualToString:@"en"]){
                retCorrdinateString = [NSString stringWithFormat:@"%@", @"1mi less"];
            }
        }else{
            distanceIntValue = distanceIntValue / 1600;
            retCorrdinateString = [NSString stringWithFormat:@"%dmi", distanceIntValue];
        }
    }
    return retCorrdinateString;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    if ([segue.identifier isEqualToString:@"chatMessagesViewDetail"]) {
        //NSIndexPath* idxPath = self.tblView.indexPathForSelectedRow;
        //NSDictionary* userInfoDict = [[chatMessages objectAtIndex:idxPath.row] mutableCopy];
        //userInfoGlobal = userDict;
        //self.userId = [userInfoDict valueForKey:@"email"];
        [coolio doChatCountReset:self.myId userId:self.userId];
        
        ChatMessagesViewController* chatView = segue.destinationViewController;
        chatView.userId = self.userId;
    }
}

@end
