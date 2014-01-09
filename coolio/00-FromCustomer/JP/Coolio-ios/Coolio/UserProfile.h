//
//  UserProfile.h
//  Coolio
//
//  Created by hoehoe on 2013/08/15.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyUnit.h"
#import "GlobalObjects.h"

@interface UserProfile : NSObject
{
    NSDictionary* _userProfileInfo;
}

@property(nonatomic, strong)NSDictionary* userProfileInfo;

-(NSString *)getEmail;
-(NSString *)getNickName;
-(int)getAge;
-(int)getHeight;
-(int)getWeight;
-(NSString *)getSexuallity;
-(NSString *)getRace;
-(NSString *)getCountry;

-(NSString *)getStyle;
-(NSString *)getLookingFor;
-(NSString *)getComment;
-(NSString *)getBodyShape;
-(NSString *)getMuscle;
-(NSString *)getBodyHair;
-(NSString *)getHairStyle;
-(NSString *)getHairColor;
-(NSString *)getOtherCharacteristics;

-(NSString *)getGayCareer;
-(NSString *)getComingOut;
-(NSString *)getLoveStyle;
-(NSString *)getExpect;
-(NSString *)getJob;
-(NSString *)getLiving;
-(NSString *)getLifePolicy;
-(NSString *)getSexPosition;
-(NSString *)getPSize;
-(NSString *)getPenisThickness;
-(NSString *)getPhimosis;
-(NSString *)getSadomasochism;
-(NSString *)getFetish;

-(float)getP0;
-(float)getP1;
-(float)getP2;
-(float)getP3;
-(float)getP4;
-(float)getP5;
-(float)getP6;
-(float)getP7;
-(float)getP8;
-(float)getP9;
-(float)getP10;
-(float)getP11;
-(float)getP12;
-(float)getP13;
-(float)getP14;
-(float)getP15;
-(float)getP16;
-(float)getP17;
-(float)getP18;

-(NSString *)getUpdated_at;
-(NSString *)getLatitude;
-(NSString *)getLongitude;

-(NSString *)getTableViewFormatValues;


@end
