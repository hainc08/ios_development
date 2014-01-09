//
//  SendContact.m
//  iTell
//
//  Created by tranduc on 9/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SendContact.h"
#import "ApiRequest.h"
#import "Global.h"
#import <AddressBook/AddressBook.h>
#import "JSON.h"
#import "ITMarco.h"

#define kTargetSendContact @"SendContact"

@interface SendContact()
@property(nonatomic, retain)ApiRequest *apiRequest;
@property(nonatomic, retain)NSMutableArray *arrMutableNameContact;
@property(nonatomic, retain)NSMutableArray *arrMutablePhoneContact;
@property(nonatomic, retain)NSMutableArray *arrMutableEmailContact;

-(void)sendGroupContact;
@end

@implementation SendContact
@synthesize delegate;
@synthesize apiRequest;
@synthesize arrMutableEmailContact, arrMutableNameContact, arrMutablePhoneContact;

-(id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(void)dealloc{
    [arrMutablePhoneContact release];
    [arrMutableNameContact release];
    [arrMutableEmailContact release];
    [apiRequest release];
    [super dealloc];
}
-(void)sendContact{
    arrMutableNameContact = [[NSMutableArray alloc] init];
    arrMutablePhoneContact  = [[NSMutableArray alloc] init];
    arrMutableEmailContact  = [[NSMutableArray alloc] init];
    
    ABAddressBookRef _addressBookRef = ABAddressBookCreate();
    NSArray* allPeople = (NSArray *)ABAddressBookCopyArrayOfAllPeople(_addressBookRef);    
    for (id record in allPeople) 
    {
        
        CFTypeRef emailProp = ABRecordCopyValue((ABRecordRef)record, kABPersonEmailProperty);
        NSString *email = [((NSArray *)ABMultiValueCopyArrayOfAllValues(emailProp)) objectAtIndex:0 ];
        if (!email) {
            email = @"";  
        }else {
            email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
        [arrMutableEmailContact addObject:email];
        CFTypeRef numberPhone = ABRecordCopyValue((ABRecordRef)record, kABPersonPhoneProperty);
        NSString *strPhone = [((NSArray *)ABMultiValueCopyArrayOfAllValues(numberPhone)) objectAtIndex:0 ];
        if (!strPhone) {
            strPhone = @"";  
        }else {
            strPhone = [strPhone stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
        [arrMutablePhoneContact addObject:strPhone];
        NSString *strName = (NSString *)ABRecordCopyValue(record, kABPersonFirstNameProperty);
        if (!strName) {
            strName = @"";  
        }else {
            strName=[strName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
        [arrMutableNameContact addObject:strName];
        
        ITLOG(@"Name: %@  Phone: %@  Email: %@", strName, strPhone, email);
    }
    CFRelease(_addressBookRef);
    [allPeople release];
    allPeople = nil;
    index = 0;
    [self sendGroupContact];
}

-(void)sendGroupContact{
    if (index >=[arrMutableEmailContact count]) {
        [delegate sendContactComplete:self];
        return;
    }
    int len = MIN(kCountPerTime, [arrMutableEmailContact count]- index);
    NSRange range = NSMakeRange(index, len);
    NSArray *arrName = [arrMutableEmailContact subarrayWithRange:range];
    NSArray *arrEmail = [arrMutableEmailContact subarrayWithRange:range];
    NSArray *arrPhone = [arrMutablePhoneContact subarrayWithRange:range];
    
    self.apiRequest = [[[ApiRequest alloc] initWithDelegate:self andTarget:kTargetSendContact] autorelease];
    
    UserData *user = [Global shareGlobal].user;
    NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:
                           [NSNumber numberWithInt:user.userID], @"user_id",
                           user.uuid, @"uuid",
                           [arrName JSONRepresentation], @"names",
                           [arrPhone JSONRepresentation], @"phones",
                           [arrEmail JSONRepresentation], @"emails", nil];
    NSString *url = [NSString stringWithFormat:@"%@setting/post_contact",SERVER_URL];
    [apiRequest requestUsingPostMethod:url postData:param];
    index += len+1;
}

#pragma mark - Api 
-(void)requestFinished:(NSDictionary *)dictionData andTarget:(NSString *)target{
    ITLOG(@"dicreturn = %@", dictionData);
    if ([target isEqualToString:kTargetSendContact]) {
        [self sendGroupContact];
    }
}
-(void)requestFailedTarget:(NSString *)target errorMsg:(NSString *)msg{
    if ([target isEqualToString:kTargetSendContact]) {
        [delegate sendContactError:self];
    }
}
@end
