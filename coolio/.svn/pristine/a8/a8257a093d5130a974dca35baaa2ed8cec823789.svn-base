//
//  MyFilter.m
//  Coolio
//
//  Created by hoehoe on 2013/04/28.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "MyFilter.h"

@implementation MyFilter
@synthesize defaultObject = _defaultObject;

-(id)init
{
    if(self == nil){
        self = [[MyFilter alloc] init];
    }
    if(self.defaultObject == nil){
        self.defaultObject = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

-(void) setEnabled:(BOOL)enabled
{
    [self.defaultObject setBool:enabled forKey:@"enabledFilter"];
    [self.defaultObject synchronize];
}

-(BOOL) getEnabled{ return [self.defaultObject boolForKey:@"enabledFilter"]; }


-(void)setAgeFilter:(int)age
{
    [self.defaultObject setInteger:age forKey:@"ageFilter"];
    [self.defaultObject synchronize];
}
-(int)getAgeFilter{ return [self.defaultObject integerForKey:@"ageFilter"]; }

-(void)setAgeFilterHiLow:(BOOL)ageHiLow
{
    [self.defaultObject setBool:ageHiLow forKey:@"ageHiLowFilter"];
    [self.defaultObject synchronize];
}
-(BOOL)getAgeFilterHiLow{ return [self.defaultObject boolForKey:@"ageHiLowFilter"]; }


-(void)setHeightFilter:(int)height{
    [self.defaultObject setInteger:height forKey:@"heightFilter"];
    [self.defaultObject synchronize];
}
-(int)getHeightFilter{ return [self.defaultObject integerForKey:@"heightFilter"]; }

-(void)setHeightFilterHiLow:(BOOL)heightHiLow
{
    [self.defaultObject setBool:heightHiLow forKey:@"heightHiLowFilter"];
    [self.defaultObject synchronize];
}
-(BOOL)getHeightFilterHiLow{ return [self.defaultObject boolForKey:@"heightHiLowFilter"]; }

-(void)setWeightFilter:(int)weight{
    [self.defaultObject setInteger:weight forKey:@"weightFilter"];
    [self.defaultObject synchronize];
}
-(int)getWeightFilter{ return [self.defaultObject integerForKey:@"weightFilter"]; }

-(void)setWeightFilterHiLow:(BOOL)weightHiLow
{
    [self.defaultObject setBool:weightHiLow forKey:@"weightHiLowFilter"];
    [self.defaultObject synchronize];
}
-(BOOL)getWeightFilterHiLow{ return [self.defaultObject boolForKey:@"weightHiLowFilter"]; }

-(void)setSexuallityFilter:(NSDictionary *)sexuallity{
    [self.defaultObject setValue:sexuallity forKey:@"sexuallityFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getSexuallityFilter{ return [self.defaultObject valueForKey:@"sexuallityFilter"]; }

-(void)setRaceFilter:(NSDictionary *)race{
    [self.defaultObject setValue:race forKey:@"raceFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getRaceFilter{return [self.defaultObject valueForKey:@"raceFilter"]; }

-(void)setStyleFilter:(NSDictionary*)style
{
    [self.defaultObject setValue:style forKey:@"styleFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getStyleFilter{return [self.defaultObject valueForKey:@"styleFilter"]; }
-(void)setLookingForFilter:(NSDictionary*)lookingFor{
    [self.defaultObject setValue:lookingFor forKey:@"lookingForFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getLookingForFilter{return [self.defaultObject valueForKey:@"lookingForFilter"]; }

-(void)setCommentFilter:(NSDictionary *)comment{
    [self.defaultObject setValue:comment forKey:@"commentFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getCommentFilter{return [self.defaultObject valueForKey:@"commentFilter"]; }

-(void)setBodyShapeFilter:(NSDictionary *)bodyShape{
    [self.defaultObject setValue:bodyShape forKey:@"bodyShapeFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getBodyShapeFilter{return [self.defaultObject valueForKey:@"bodyShapeFilter"]; }

-(void)setMuscleFilter:(NSDictionary *)muscle{
    [self.defaultObject setValue:muscle forKey:@"muscleFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getMuscleFilter{return [self.defaultObject valueForKey:@"muscleFilter"]; }

-(void)setBodyHairFilter:(NSDictionary *)bodyHair{
    [self.defaultObject setValue:bodyHair forKey:@"bodyHairFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getBodyHairFilter{return [self.defaultObject valueForKey:@"bodyHairFilter"]; }

-(void)setHairStyleFilter:(NSDictionary *)hairStyle{
    [self.defaultObject setValue:hairStyle forKey:@"hairStyleFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getHairStyleFilter{return [self.defaultObject valueForKey:@"hairStyleFilter"]; }

-(void)setHairColorFilter:(NSDictionary *)hairColor{
    [self.defaultObject setValue:hairColor forKey:@"hairColorFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getHairColorFilter{return [self.defaultObject valueForKey:@"hairColorFilter"]; }

-(void)setOtherCharacteristicsFilter:(NSDictionary*)otherCharacteristics{
    [self.defaultObject setValue:otherCharacteristics forKey:@"otherCharacteristicsFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getOtherCharacteristicsFilter{return [self.defaultObject valueForKey:@"otherCharacteristicsFilter"]; }

-(void)setPersonalityFilter:(NSArray*)personality{
    [self.defaultObject setValue:personality forKey:@"personalityFilter"];
    [self.defaultObject synchronize];
}
-(NSArray *)getPersonalityFilter{return [self.defaultObject valueForKey:@"personalityFilter"]; }

-(void)setGayCareerFilter:(NSDictionary *)gayCareer{
    [self.defaultObject setValue:gayCareer forKey:@"gayCareerFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getGayCareerFilter{return [self.defaultObject valueForKey:@"gayCareerFilter"]; }

-(void)setComingoutFilter:(NSDictionary *)comingout{
    [self.defaultObject setValue:comingout forKey:@"comingoutFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getComingoutFilter{return [self.defaultObject valueForKey:@"comingoutFilter"]; }

-(void)setLoveStylesFilter:(NSDictionary *)loveStyles{
    [self.defaultObject setValue:loveStyles forKey:@"loveStylesFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getLoveStylesFilter{return [self.defaultObject valueForKey:@"loveStylesFilter"]; }

-(void)setExpectFilter:(NSDictionary *)Expect{
    [self.defaultObject setValue:Expect forKey:@"expectFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getExpectFilter{return [self.defaultObject valueForKey:@"expectFilter"]; }

-(void)setJobFilter:(NSDictionary *)job{
    [self.defaultObject setValue:job forKey:@"jobFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getJobFilter{return [self.defaultObject valueForKey:@"jobFilter"]; }

-(void)setLivingFilter:(NSDictionary *)living{
    [self.defaultObject setValue:living forKey:@"livingFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getLivingFilter{return [self.defaultObject valueForKey:@"livingFilter"]; }

-(void)setLifePolicyFilter:(NSDictionary*)lifePolicy{
    [self.defaultObject setValue:lifePolicy forKey:@"lifePolicyFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getLifePolicyFilter{return [self.defaultObject valueForKey:@"lifePolicyFilter"]; }

-(void)setSexPositionFilter:(NSDictionary *)sexPosition{
    [self.defaultObject setValue:sexPosition forKey:@"sexPositionFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getSexPositionFilter{return [self.defaultObject valueForKey:@"sexPositionFilter"]; }

-(void)setPenisSizeFilter:(int)penisSize{
    [self.defaultObject setInteger:penisSize forKey:@"penisSizeFilter"];
    [self.defaultObject synchronize];
}
-(int)getPenisSizeFilter{return [self.defaultObject integerForKey:@"penisSizeFilter"]; }

-(void)setPenisSizeHiLowFilter:(BOOL)penisSizeHiLow{
    [self.defaultObject setBool:penisSizeHiLow forKey:@"penisSizeHiLowFilter"];
    [self.defaultObject synchronize];
}
-(BOOL)getPenisSizeHiLowFilter{return [self.defaultObject boolForKey:@"penisSizeHiLowFilter"]; }

-(void)setPenisThicknessFilter:(NSDictionary *)penisThickness{
    [self.defaultObject setValue:penisThickness forKey:@"penisThicknessFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getPenisThicknessFilter{return [self.defaultObject valueForKey:@"penisThicknessFilter"]; }

-(void)setPhimosisFilter:(NSDictionary *)phimosis{
    [self.defaultObject setValue:phimosis forKey:@"phimosisFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getPhimosisFilter{return [self.defaultObject valueForKey:@"phimosisFilter"]; }

-(void)setSadomasochismFilter:(NSDictionary *)sadomasochism{
    [self.defaultObject setValue:sadomasochism forKey:@"sadomasochismFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getSadomasochismFilter{return [self.defaultObject valueForKey:@"sadomasochismFilter"]; }

-(void)setFetishFilter:(NSDictionary*)Fetish{
    [self.defaultObject setValue:Fetish forKey:@"fetishFilter"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getFetishFilter{return [self.defaultObject valueForKey:@"fetishFilter"]; }

@end
