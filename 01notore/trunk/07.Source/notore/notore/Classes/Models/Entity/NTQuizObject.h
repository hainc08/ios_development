//
//  NTQuizObject.h
//  notore
//
//  Created by TrinhLD on 11/22/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NTQuestionObject.h"

@interface NTQuizObject : NSObject

@property (nonatomic, retain) NTQuestionObject *question;
@property (nonatomic, retain) NSArray *listAnswer;


@end
