//
//  RegistViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/10/10.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()

@end

@implementation RegistViewController
@synthesize cellLabel;
@synthesize cellTextField;
@synthesize cellButton;
@synthesize txtField;


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

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheRegistEmail:) name:@"ToNotifyTheRegistEmail" object:nil];
    [self openPasscodeView];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float cellHeight = 0.0f;
    
    switch (indexPath.row) {
        case 0: cellHeight = 100.0f; break;
        case 1: cellHeight = 60.0f; break;
        case 2: cellHeight = 60.0f; break;
        default: break;
    }
    return cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = nil; //[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    // Configure the cell...
    switch (indexPath.row) {
        case 0:
        {
            //cell = [tableView dequeueReusableCellWithIdentifier:self.idCellLabel];
            //if(cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idCellLabel];
            cell = cellLabel;
            UITextView* txtView = (UITextView *)[cell viewWithTag:1];
            [txtView setFont:[UIFont systemFontOfSize:14.0f]];
        }
            break;
        case 1:
            //cell = [tableView dequeueReusableCellWithIdentifier:self.idCellTextField];
            //if(cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idCellTextField];
            cell = cellTextField;
            self.txtField = (UITextField *)[cell viewWithTag:2];
            self.txtField.delegate = self;
            break;
        case 2:
            //cell = [tableView dequeueReusableCellWithIdentifier:self.idCellButton];
            //if(cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idCellButton];
            cell = cellButton;
            break;
        default: break;
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */


#pragma mark UITextField delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)btn_cancelPush:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btn_registPush:(id)sender {
    if(self.txtField.text != nil && ![self.txtField.text isEqualToString:@""]){
        if([AppDelegate NetworkCheckConnect] == YES){
            NSString* email =  self.txtField.text;

            NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
            NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];

            if ([emailTest evaluateWithObject:email] == NO) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"ALERT_VALID_EMAIL", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                return;
            }else{
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
                [SVProgressHUD show];
                CoolioWebService* coolio = [[CoolioWebService alloc] init];
                [coolio sendRegistEmail:email];
            }
        }
    }else{
        NSString* _message = NSLocalizedString(@"ALERT_EMPTY_EMAIL", nil);
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:_message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

-(void)toNotifyTheRegistEmail:(NSNotification*)notification
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [SVProgressHUD dismiss];

    NSString* status = [notification object];
    if([status isEqualToString:@"success"]){
        NSString* message = NSLocalizedString(@"ALERT_EMAIL_SENDED", nil);
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [self dismissViewControllerAnimated:YES completion:nil];
    }else if([status isEqualToString:@"registered"]){
        NSString* message = NSLocalizedString(@"ALERT_EMAIL_ALREADY_REGISTERED", nil);
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else if([status isEqualToString:@"user_unknown_in_mailbox"]){
        ///NSLog(@"user_unknown_in_mailbox");
    }else if([status isEqualToString:@"name_or_service_not_known"]){
        //NSLog(@"name_or_service_not_known");
    }else if([status isEqualToString:@"other_errors"]){
        //NSLog(@"other_errors");
    }else{
        NSString* message = @"Mail Server Error";
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];

    }
}

@end
