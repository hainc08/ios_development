//
//  SendContact.h
//  iTell
//
//  Created by tranduc on 9/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kCountPerTime 100

#import "ApiRequest.h"
@class SendContact;
@protocol SendContactDelegate
-(void)sendContactComplete:(SendContact*)sender;
-(void)sendContactError:(SendContact*)sender;
@end

@interface SendContact : NSObject<ApiRequestDelegate>{
    int index;
}
@property(nonatomic, assign)id<SendContactDelegate>delegate;
-(void)sendContact;
@end
