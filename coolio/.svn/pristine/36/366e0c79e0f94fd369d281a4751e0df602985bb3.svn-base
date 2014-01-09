//
//  InformationViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/07/28.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "InformationViewController.h"

@interface InformationViewController ()

@end

@implementation InformationViewController
@synthesize tblView;

#define kFontSize 14.0f
#define DATEFORMAT_UTC @"yyyy-MM-dd'T'HH:mm:ssZZZZ"


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.tblView.delegate = self;
    self.tblView.dataSource = self;
    
    [self openMenue];
    [self openPasscodeView];

    coolio = [[CoolioWebService alloc] init];
    //infoArray = [NSMutableArray array];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheGetInfo:) name:@"ToNotifyTheGetInfo" object:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    self.slidingViewController.underRightViewController = nil;
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if( [AppDelegate NetworkCheckConnect] == YES){
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        [SVProgressHUD showWithStatus:@"" maskType:SVProgressHUDMaskTypeBlack];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [coolio getInfo];
        });
    }
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //return 0;
    return [infoArray count];
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    NSDictionary* _dict = infoArray[indexPath.row];
    NSString* message =  [_dict valueForKey:@"message"];
    return [self cellHeight:message];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //UIImageView* iconView = (UIImageView *)[cell viewWithTag:1];
    UILabel* dateLabel = (UILabel *)[cell viewWithTag:2];
    UITextView* contentTextView = (UITextView *)[cell viewWithTag:3];
    
    //iconView.image = nil;
    dateLabel.text = nil;
    contentTextView.text = nil;

    //iconView.image = [UIImage imageNamed:@"adminIcon"]; //[UIImage imageWithData:[self pictures]];
    
    NSDictionary* _infoDict = infoArray[indexPath.row];
    NSString* _message = [_infoDict valueForKey:@"message"];
    contentTextView.text = _message;
    
    CGRect frame = contentTextView.frame;
    frame.size.height = [self textHeight:_message];
    //contentTextView.contentSize.height;
    contentTextView.frame = frame;

    NSString* updated_at = [_infoDict valueForKey:@"updated_at"];
    dateLabel.text = [self stringFromTime:updated_at];
    
    return cell;
}

- (CGFloat)cellHeight:(NSString*)text{
    //cell label space 20
    //label y 20
    //label height 21
    //textView y 49
    
    float cellHeight = 0.0f;
    
    float verticalSpace = 8.0f;
    float cellLabelSpace = 20.0f;
    float labelY = 20.0f;
    float labelHeight = 21.0f;
    float labelTextViewSpace = 8.0f;
    
    //CGSize _size = CGSizeMake(212, 999999.0f);
    float textContentSizeHeight = [self textHeight:text];
    //[text sizeWithFont:[UIFont systemFontOfSize:kFontSize] constrainedToSize:_size lineBreakMode:NSLineBreakByWordWrapping];
    
    cellHeight = cellLabelSpace + labelY + labelHeight + labelTextViewSpace + textContentSizeHeight + verticalSpace;
    
    //if(_textContentSize.height < 100){
    //    cellHeight += 24.0f;
    //}else if(_textContentSize.height >= 100 && _textContentSize.height < 1300){
    //    cellHeight += 80.0f;
    //}else{
    //    cellHeight += 300.0f;
    //}
    
    //cellHeight = _textContentSize.height + verticalPadding;
    //NSLog(@"CellHeight: %f", cellHeight);
    return cellHeight;
}


- (CGFloat)textHeight:(NSString*)text{
    return [NSString stringWithHeight:text];
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

/*
-(NSData *)pictures
{
    NSMutableString* appendIconUrlString = [[NSMutableString alloc] init];
    [appendIconUrlString appendString:URLSTRING];
    [appendIconUrlString appendString:@"icons/"];
    [appendIconUrlString appendString:@"admin-120.png"];
    
    NSURL *url = [NSURL URLWithString:appendIconUrlString];
    return [NSData dataWithContentsOfURL:url];
    //NSData *data = [NSData dataWithContentsOfURL:url];
    //UIImage *img = [[UIImage alloc]initWithData:data];
    //return  img;
}
*/

-(void)toNotifyTheGetInfo:(NSNotification *)notification
{
    infoArray = [[notification object] mutableCopy];
    
    if([infoArray count] == 0){
        NSMutableDictionary* _dict = [NSMutableDictionary dictionary];
        
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
        [dateFormatter setDateFormat:DATEFORMAT_UTC];
        NSString* now = [dateFormatter stringFromDate:date];
        
        [_dict setValue:NSLocalizedString(@"INFOVIEW_ZERO", nil) forKey:@"message"];
        [_dict setValue:now forKey:@"updated_at"];
        [infoArray addObject:_dict];
    }
    
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_main, ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [SVProgressHUD dismiss];
        [(UITableView *)self.tblView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    });
}

- (NSString *)stringFromTime:(NSString *)updated_at {
    if(updated_at == nil || [updated_at isEqual:[NSNull null]]){ return @""; }
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

- (IBAction)revealMenu:(id)sender
{
    NSString* myId = [[[MyProfiles alloc] init] getEmailProfile];
    //CoolioWebService* coolio = [[CoolioWebService alloc] init];
    [coolio getMyUnreadCount:myId];
    [self.slidingViewController anchorTopViewTo:ECRight];
}

@end
