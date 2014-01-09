//
//  NSObject+CoolioReport.h
//  Coolio
//
//  Created by hoehoe on 2013/07/13.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+CoolioData.h"

@interface NSObject (CoolioReport)

-(void)sendReport:(NSString *)myId reportId:(NSString *)reportId commandId:(int)commandId;

@end
