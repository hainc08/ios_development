//
//  ForgotPasswordViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/06/01.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController
@synthesize cell_button;
@synthesize cell_email;
@synthesize txt_email;
@synthesize btn_send;

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
    coolio = [[CoolioWebService alloc] init];
    account = [[MyProfiles alloc] init];
    
    self.txt_email.delegate = self;
    self.txt_email.keyboardType = UIKeyboardTypeEmailAddress;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheForgotPass:) name:@"ToNotifyTheForgotPass" object:nil];
    if([AppDelegate NetworkCheckConnect] == NO){
        [AppDelegate showDisconnectAlert];
    }
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
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    switch (indexPath.row) {
        case 0:
            cell = cell_email;
            break;
        case 1:
            cell = cell_button;
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


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)txt_email_EditingDidEnd:(id)sender {
    [self.txt_email resignFirstResponder];
}

- (IBAction)btn_sendPush:(id)sender {
    NSString* email = [account getEmailProfile];
    
    if(self.txt_email.text != nil || ![self.txt_email.text isEqualToString:@""]){
        if([email isEqualToString:self.txt_email.text] == YES){
            if([AppDelegate NetworkCheckConnect] == NO){
                [AppDelegate showDisconnectAlert];
            }else{
                [coolio forgotPassword:email];
                [SVProgressHUD show];
            }
        }else{
            NSString* message = NSLocalizedString(@"ALERT_EMAIL_DIFFERENT", nil);
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }

}

- (IBAction)btn_donePush:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)toNotifyTheForgotPass:(NSNotification *)notification
{
    [SVProgressHUD dismiss];
    NSString* message = NSLocalizedString(@"ALERT_FORGATPASS_SEND_EMAIL", nil);
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}


@end
