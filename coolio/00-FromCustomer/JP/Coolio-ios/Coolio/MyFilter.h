//
//  MyFilter.h
//  Coolio
//
//  Created by hoehoe on 2013/04/28.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyFilter : NSObject
{
    NSUserDefaults* _defaultObject;
}

@property(nonatomic, retain) NSUserDefaults* defaultObject;

-(void) setEnabled:(BOOL)enabled;
-(BOOL) getEnabled;

-(void)setAgeFilter:(int)age;
-(int)getAgeFilter;

-(void)setAgeFilterHiLow:(BOOL)ageHiLow;
-(BOOL)getAgeFilterHiLow;

-(void)setHeightFilter:(int)height;
-(int)getHeightFilter;

-(void)setHeightFilterHiLow:(BOOL)heightHiLow;
-(BOOL)getHeightFilterHiLow;

-(void)setWeightFilter:(int)weight;
-(int)getWeightFilter;

-(void)setWeightFilterHiLow:(BOOL)weightHiLow;
-(BOOL)getWeightFilterHiLow;

-(void)setSexuallityFilter:(NSDictionary *)sexuallity;
-(NSDictionary *)getSexuallityFilter;

-(void)setRaceFilter:(NSDictionary *)race;
-(NSDictionary *)getRaceFilter;

-(void)setStyleFilter:(NSDictionary *)style;
-(NSDictionary *)getStyleFilter;

-(void)setLookingForFilter:(NSDictionary *)lookingFor;
-(NSDictionary *)getLookingForFilter;

-(void)setBodyShapeFilter:(NSDictionary *)bodyShape;
-(NSDictionary *)getBodyShapeFilter;

-(void)setMuscleFilter:(NSDictionary *)muscle;
-(NSDictionary *)getMuscleFilter;

-(void)setBodyHairFilter:(NSDictionary *)bodyHair;
-(NSDictionary *)getBodyHairFilter;

-(void)setHairStyleFilter:(NSDictionary *)hairStyle;
-(NSDictionary *)getHairStyleFilter;

-(void)setHairColorFilter:(NSDictionary *)hairColor;
-(NSDictionary *)getHairColorFilter;

-(void)setOtherCharacteristicsFilter:(NSDictionary *)otherCharacteristics;
-(NSDictionary *)getOtherCharacteristicsFilter;

-(void)setPersonalityFilter:(NSDictionary *)personality;
-(NSDictionary *)getPersonalityFilter;

-(void)setGayCareerFilter:(NSDictionary *)gayCareer;
-(NSDictionary *)getGayCareerFilter;

-(void)setComingoutFilter:(NSDictionary *)comingout;
-(NSDictionary *)getComingoutFilter;

-(void)setLoveStylesFilter:(NSDictionary *)loveStyles;
-(NSDictionary *)getLoveStylesFilter;

-(void)setExpectFilter:(NSDictionary *)Expect;
-(NSDictionary *)getExpectFilter;

-(void)setJobFilter:(NSDictionary *)job;
-(NSDictionary *)getJobFilter;

-(void)setLivingFilter:(NSDictionary *)living;
-(NSDictionary *)getLivingFilter;

-(void)setLifePolicyFilter:(NSDictionary *)lifePolicy;
-(NSDictionary *)getLifePolicyFilter;

-(void)setSexPositionFilter:(NSDictionary *)sexPosition;
-(NSDictionary *)getSexPositionFilter;

-(void)setPenisSizeFilter:(int)penisSize;
-(int)getPenisSizeFilter;

-(void)setPenisSizeHiLowFilter:(BOOL)penisSizeHiLow;
-(BOOL)getPenisSizeHiLowFilter;

-(void)setPenisThicknessFilter:(NSDictionary *)penisThickness;
-(NSDictionary *)getPenisThicknessFilter;

-(void)setPhimosisFilter:(NSDictionary *)phimosis;
-(NSDictionary *)getPhimosisFilter;

-(void)setSadomasochismFilter:(NSDictionary *)sadomasochism;
-(NSDictionary *)getSadomasochismFilter;

-(void)setFetishFilter:(NSDictionary *)Fetish;
-(NSDictionary *)getFetishFilter;


@end
