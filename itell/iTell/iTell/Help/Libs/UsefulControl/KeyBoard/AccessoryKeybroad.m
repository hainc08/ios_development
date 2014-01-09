//
//  AccessoryKeybroad.m
//  AccessoryKeybroad
//
//  Created by bon on 5/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AccessoryKeybroad.h"

@implementation AccessoryKeybroad
@synthesize buttonNext;
@synthesize buttonPrevious;

@synthesize textFiends;

- (void)dealloc
{
    [textFiends release];
    [segment release];
    [buttonNext release];
    [buttonPrevious release];
    [super dealloc];
}

- (void) setTextField
{
    for (int i = 0; i < [textFiends count]; i++) {
        UITextField *textField = [textFiends objectAtIndex:i];
        textField.delegate = self;
        textField.inputAccessoryView = self;
    }
}

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    if (isKeyBoardShow) 
        return;
    ((UIScrollView*)parentView).contentSize = CGSizeMake(320, 1024);
    NSDictionary* info = [aNotification userInfo];
    //—-obtain the size of the keyboard—-
    NSValue *aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [parentView.superview convertRect:[aValue CGRectValue] fromView:nil];
    NSLog(@"%f", keyboardRect.size.height);
    //—-resize the scroll view (with keyboard)—-
    CGRect viewFrame = [parentView frame]; 
    viewFrame.size.height -= keyboardRect.size.height - 44;
    parentView.frame = viewFrame;
    //—-scroll to the current text field—-
    CGRect textFieldRect = [currentTextField frame]; 
    textFieldRect = CGRectMake(textFieldRect.origin.x, textFieldRect.origin.y + 122, textFieldRect.size.width, textFieldRect.size.height);
    [(UIScrollView*)parentView scrollRectToVisible:textFieldRect animated:YES];
    isKeyBoardShow = YES;
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    ((UIScrollView*)parentView).contentSize = sizeDefault;
    NSDictionary* info = [aNotification userInfo];
    //—-obtain the size of the keyboard—-
    NSValue* aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [parentView.superview convertRect:[aValue CGRectValue] fromView:nil];
    //—-resize the scroll view back to the original size // (without keyboard)—- 
    CGRect viewFrame = [parentView frame]; 
    viewFrame.size.height += keyboardRect.size.height;
    
    parentView.frame = rectDefault;
    isKeyBoardShow = NO;
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:)
        name:UIKeyboardWillHideNotification object:nil];
    
}

- (id)init
{
    if (self = [super init]) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"AccessoryKeybroad" owner:self options:nil];
        self = [[array objectAtIndex:0] retain];
    }
    return self;
}

- (id)initWithTextItems:(NSArray *)item parent:(UIView *)view
{
    if (self = [self init]) {
        self.textFiends = item;
        NSLog(@"%@", self.textFiends);
        parentView = view;
        sizeDefault = ((UIScrollView*)parentView).contentSize;
        rectDefault = view.frame;
        [self setTextField];
        [self registerForKeyboardNotifications];
    }
    return self;
}

- (void) checkIndexTextField
{
    NSInteger index = [textFiends indexOfObject:currentTextField];
    if (index == 0) {
        [buttonPrevious setEnabled:NO];
        [buttonNext setEnabled:YES];
    } else if (index == [textFiends count] - 1) {
        [buttonPrevious setEnabled:YES];
        [buttonNext setEnabled:NO];
    } else {
        [buttonPrevious setEnabled:YES];
        [buttonNext setEnabled:YES];
    }
}

#pragma TextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    currentTextField = textField;
    CGRect textFieldRect = [currentTextField frame]; 
    textFieldRect = CGRectMake(textFieldRect.origin.x, textFieldRect.origin.y + 88, textFieldRect.size.width, textFieldRect.size.height);
    [(UIScrollView*)parentView scrollRectToVisible:textFieldRect animated:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    currentTextField = textField;
    CGRect textFieldRect = [currentTextField frame]; 
    textFieldRect = CGRectMake(textFieldRect.origin.x, textFieldRect.origin.y + 88, textFieldRect.size.width, textFieldRect.size.height);
    [(UIScrollView*)parentView scrollRectToVisible:textFieldRect animated:YES];
    [self checkIndexTextField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)textDoneEditing:(id)sender {
    [currentTextField resignFirstResponder];
}

- (void) nextText
{
    NSInteger index = [textFiends indexOfObject:currentTextField];
    if (index < [textFiends count] - 1) {
        if (!buttonPrevious.enabled) {
            buttonPrevious.enabled = YES;
        }
        index++;
    }
//    if (index == [textFiends count] - 1) {
//        buttonNext.enabled = NO;
//    }
    [[textFiends objectAtIndex:index] becomeFirstResponder];
}

- (void) previousText
{
    NSInteger index = [textFiends indexOfObject:currentTextField];
    if (index > 0) {
        if (!buttonNext.enabled) {
            buttonNext.enabled = YES;
        }
        index--;
    }
//    [self checkIndexTextField];
    [[textFiends objectAtIndex:index] becomeFirstResponder];
}

- (IBAction)nextClick:(id)sender {
    [self nextText];
}

- (IBAction)previousClick:(id)sender {
    [self previousText];
}

@end
