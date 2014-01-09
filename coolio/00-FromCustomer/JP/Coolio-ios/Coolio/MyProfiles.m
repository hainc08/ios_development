//
//  MyProfiles.m
//  Coolio
//
//  Created by hoehoe on 2012/12/14.
//  Copyright (c) 2012年 Gigaworks. corp. All rights reserved.
//

#import "MyProfiles.h"

@implementation MyProfiles
@synthesize defaultObject = _defaultObject;

-(id)init
{
    if(self == nil){
        self = [[MyProfiles alloc] init];
    }
    if(self.defaultObject == nil){
        self.defaultObject = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

-(void)setEmailProfile:(NSString *)_email
{
    [self.defaultObject setValue:_email forKey:@"emailProfile"];
    [self.defaultObject synchronize];
}
-(NSString *)getEmailProfile{ return [self.defaultObject valueForKey:@"emailProfile"]; }

-(void)setPasswordProfile:(NSString*)password
{
    [self.defaultObject setValue:password forKey:@"passwordProfile"];
    [self.defaultObject synchronize];
}
-(NSString *)getPasswordProfile{ return [self.defaultObject valueForKey:@"passwordProfile"]; }

-(void)setNickNameProfile:(NSString*)nickName
{
    [self.defaultObject setValue:nickName forKey:@"nickNameProfile"];
    [self.defaultObject synchronize];
}
-(NSString *)getNickNameProfile{ return [self.defaultObject valueForKey:@"nickNameProfile"]; }

-(void)setAgeProfile:(NSString*)age
{
    [self.defaultObject setValue:age forKey:@"ageProfile"];
    [self.defaultObject synchronize];
}
-(NSString *)getAgeProfile{ return [self.defaultObject valueForKey:@"ageProfile"]; }

-(void)setHeightProfile:(NSString*)height{
    [self.defaultObject setValue:height forKey:@"heightProfile"];
    [self.defaultObject synchronize];
}
-(NSString *)getHeightProfile{ return [self.defaultObject valueForKey:@"heightProfile"]; }

-(void)setWeightProfile:(NSString*)weight{
    [self.defaultObject setValue:weight forKey:@"weightProfile"];
    [self.defaultObject synchronize];
}

-(NSString *)getWeightProfile{ return [self.defaultObject valueForKey:@"weightProfile"]; }


-(void)setCountryProfile:(NSString*)country{
    [self.defaultObject setValue:country forKey:@"countryProfile"];
    [self.defaultObject synchronize];
}

-(NSString *)getCountryProfile{ return [self.defaultObject valueForKey:@"countryProfile"]; }


-(void)setSexuallityProfile:(NSDictionary *)sexuallity{
    [self.defaultObject setValue:sexuallity forKey:@"sexuallityProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getSexuallityProfile{ return [self.defaultObject valueForKey:@"sexuallityProfile"]; }

-(void)setRaceProfile:(NSDictionary *)race{
    [self.defaultObject setValue:race forKey:@"raceProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getRaceProfile{return [self.defaultObject valueForKey:@"raceProfile"]; }

-(void)setStyleProfile:(NSDictionary*)style
{
    [self.defaultObject setValue:style forKey:@"styleProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getStyleProfile{return [self.defaultObject valueForKey:@"styleProfile"]; }

-(void)setLookingForProfile:(NSDictionary*)lookingFor{
    [self.defaultObject setValue:lookingFor forKey:@"lookingForProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getLookingForProfile{return [self.defaultObject valueForKey:@"lookingForProfile"]; }

-(void)setCommentProfile:(NSString *)comment{
    [self.defaultObject setValue:comment forKey:@"commentProfile"];
    [self.defaultObject synchronize];
}
-(NSString *)getCommentProfile{return [self.defaultObject valueForKey:@"commentProfile"]; }

-(void)setBodyShapeProfile:(NSDictionary *)bodyShape{
    [self.defaultObject setValue:bodyShape forKey:@"bodyShapeProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getBodyShapeProfile{return [self.defaultObject valueForKey:@"bodyShapeProfile"]; }

-(void)setMuscleProfile:(NSDictionary *)muscle{
    [self.defaultObject setValue:muscle forKey:@"muscleProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getMuscleProfile{return [self.defaultObject valueForKey:@"muscleProfile"]; }

-(void)setBodyHairProfile:(NSDictionary *)bodyHair{
    [self.defaultObject setValue:bodyHair forKey:@"bodyHairProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getBodyHairProfile{return [self.defaultObject valueForKey:@"bodyHairProfile"]; }

-(void)setHairStyleProfile:(NSDictionary *)hairStyle{
    [self.defaultObject setValue:hairStyle forKey:@"hairStyleProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getHairStyleProfile{return [self.defaultObject valueForKey:@"hairStyleProfile"]; }

-(void)setHairColorProfile:(NSDictionary *)hairColor{
    [self.defaultObject setValue:hairColor forKey:@"hairColorProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getHairColorProfile{return [self.defaultObject valueForKey:@"hairColorProfile"]; }

-(void)setOtherCharacteristicsProfile:(NSDictionary*)otherCharacteristics{
    [self.defaultObject setValue:otherCharacteristics forKey:@"otherCharacteristicsProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getOtherCharacteristicsProfile{
    return [self.defaultObject valueForKey:@"otherCharacteristicsProfile"];
}

-(NSDictionary *)getPersonalityProfile{
    //NSLog(@"GetPersonalityProfile");
    //NSLog(@"%@", [self.defaultObject valueForKey:@"personalityProfile"]);

    return [self.defaultObject valueForKey:@"personalityProfile"];
}

-(void)setPersonalityProfile:(NSDictionary *)personality{
    //NSLog(@"SetPersonalityProfile");
    //NSLog(@"%@", personality);
    [self.defaultObject setValue:personality forKey:@"personalityProfile"];
    [self.defaultObject synchronize];
}


-(void)setGayCareerProfile:(NSDictionary *)gayCareer{
    [self.defaultObject setValue:gayCareer forKey:@"gayCareerProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getGayCareerProfile{return [self.defaultObject valueForKey:@"gayCareerProfile"]; }

-(void)setComingoutProfile:(NSDictionary *)comingout{
    [self.defaultObject setValue:comingout forKey:@"comingoutProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getComingoutProfile{return [self.defaultObject valueForKey:@"comingoutProfile"]; }

-(void)setLoveStylesProfile:(NSDictionary *)loveStyles{
    [self.defaultObject setValue:loveStyles forKey:@"loveStylesProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getLoveStylesProfile{return [self.defaultObject valueForKey:@"loveStylesProfile"]; }

-(void)setExpectProfile:(NSDictionary *)Expect{
    [self.defaultObject setValue:Expect forKey:@"expectProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getExpectProfile{return [self.defaultObject valueForKey:@"expectProfile"]; }

-(void)setJobProfile:(NSDictionary *)job{
    [self.defaultObject setValue:job forKey:@"jobProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getJobProfile{return [self.defaultObject valueForKey:@"jobProfile"]; }

-(void)setLivingProfile:(NSDictionary *)living{
    [self.defaultObject setValue:living forKey:@"livingProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getLivingProfile{return [self.defaultObject valueForKey:@"livingProfile"]; }

-(void)setLifePolicyProfile:(NSDictionary*)lifePolicy{
    [self.defaultObject setValue:lifePolicy forKey:@"lifePolicyProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getLifePolicyProfile{return [self.defaultObject valueForKey:@"lifePolicyProfile"]; }

-(void)setSexPositionProfile:(NSDictionary *)sexPosition{
    [self.defaultObject setValue:sexPosition forKey:@"sexPositionProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getSexPositionProfile{return [self.defaultObject valueForKey:@"sexPositionProfile"]; }

-(void)setPenisSizeProfile:(int)penisSize{
    [self.defaultObject setInteger:penisSize forKey:@"penisSizeProfile"];
    [self.defaultObject synchronize];
}
-(int)getPenisSizeProfile{return [self.defaultObject integerForKey:@"penisSizeProfile"]; }

-(void)setPenisThicknessProfile:(NSDictionary *)penisThickness{
    [self.defaultObject setValue:penisThickness forKey:@"penisThicknessProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getPenisThicknessProfile{return [self.defaultObject valueForKey:@"penisThicknessProfile"]; }

-(void)setPhimosisProfile:(NSDictionary *)phimosis{
    [self.defaultObject setValue:phimosis forKey:@"phimosisProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getPhimosisProfile{return [self.defaultObject valueForKey:@"phimosisProfile"]; }

-(void)setSadomasochismProfile:(NSDictionary *)sadomasochism{
    [self.defaultObject setValue:sadomasochism forKey:@"sadomasochismProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getSadomasochismProfile{return [self.defaultObject valueForKey:@"sadomasochismProfile"]; }

-(void)setFetishProfile:(NSDictionary*)Fetish{
    [self.defaultObject setValue:Fetish forKey:@"fetishProfile"];
    [self.defaultObject synchronize];
}
-(NSDictionary *)getFetishProfile{return [self.defaultObject valueForKey:@"fetishProfile"]; }

-(void)sync:(NSDictionary *)_myInfo
{
    @try{
        [self setEmailProfile:[_myInfo valueForKey:@"email"]];
        //[account setPasswordProfile:password];
        [self setNickNameProfile: [_myInfo valueForKey:@"nickname"]];
        [self setAgeProfile: [NSString stringWithFormat:@"%d", [[_myInfo valueForKey:@"age"] intValue]]];
        [self setHeightProfile: [NSString stringWithFormat:@"%d", [[_myInfo valueForKey:@"height"] intValue]]];
        [self setWeightProfile: [NSString stringWithFormat:@"%d", [[_myInfo valueForKey:@"weight"] intValue]]];
        
        NSMutableDictionary* sexDict = [NSMutableDictionary dictionary];
        
        [sexDict setValue:[_myInfo valueForKey:@"sexGay"] forKey:@"sexGayProfile"];
        [sexDict setValue:[_myInfo valueForKey:@"sexBisex"] forKey:@"sexBisexProfile"];
        [sexDict setValue:[_myInfo valueForKey:@"sexStraight"] forKey:@"sexStraightProfile"];
        [self setSexuallityProfile:sexDict];
        
        NSMutableDictionary* raceDict = [NSMutableDictionary dictionary];
        
        [raceDict setValue:@([[_myInfo valueForKey:@"raceAsian"] boolValue]) forKey:@"raceAsianProfile"];
        [raceDict setValue:@([[_myInfo valueForKey:@"raceWhite"] boolValue]) forKey:@"raceWhiteProfile"];
        [raceDict setValue:@([[_myInfo valueForKey:@"raceBlack"] boolValue]) forKey:@"raceBlackProfile"];
        [raceDict setValue:@([[_myInfo valueForKey:@"raceLatin"] boolValue]) forKey:@"raceLatinProfile"];
        [raceDict setValue:@([[_myInfo valueForKey:@"raceArab"] boolValue]) forKey:@"raceArabProfile"];
        [raceDict setValue:@([[_myInfo valueForKey:@"racePolynesian"] boolValue]) forKey:@"racePolynesianProfile"];
        [raceDict setValue:@([[_myInfo valueForKey:@"raceMix"] boolValue]) forKey:@"raceMixProfile"];
        [raceDict setValue:@([[_myInfo valueForKey:@"raceEtc"] boolValue]) forKey:@"raceEtcProfile"];
        [self setRaceProfile:raceDict];
        
        /*
        NSArray *languages = [NSLocale preferredLanguages];
        NSString* currentLang = [languages objectAtIndex:0];
        NSString* country = @"";
        
        NSString* plistFile;
        if([currentLang isEqualToString:@"ja"]){
            plistFile = [[NSBundle mainBundle] pathForResource:@"CountryData-ja" ofType:@"plist"];
        }else{
            plistFile = [[NSBundle mainBundle] pathForResource:@"CountryData-en" ofType:@"plist"];
        }
        
        NSArray* countryArray = [NSArray arrayWithContentsOfFile:plistFile];
        NSString* countryValue = [NSString stringWithFormat:@"%d", [[_myInfo valueForKey:@"country"] intValue]];
        NSLog(@"CountryValue: %@", countryValue);
        
        if(countryValue != nil &&  ![countryValue isEqualToString:@""]){
            NSDictionary* countryValueDict =  [countryArray objectAtIndex:[[countryArray valueForKeyPath:@"id"] indexOfObject:countryValue]];
            country = [countryValueDict valueForKey:@"name"];
        }
        */
        NSString* countryValue = [NSString stringWithFormat:@"%d", [[_myInfo valueForKey:@"country"] intValue]];
        [self setCountryProfile:countryValue];

        
        NSMutableDictionary* styleDict = [NSMutableDictionary dictionary];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleTwink"] boolValue]) forKey:@"styleTwinkProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleHunk"] boolValue]) forKey:@"styleHunkProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleSurfer"] boolValue]) forKey:@"styleSurferProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleHipHop"] boolValue]) forKey:@"styleHipHopProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleThug"] boolValue]) forKey:@"styleThugProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"stylePunk"] boolValue]) forKey:@"stylePunkProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleWhiteCollar"] boolValue]) forKey:@"styleWhiteCollarProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleHardcoreGay"] boolValue]) forKey:@"styleHardcoreGayProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"stylePotato"] boolValue]) forKey:@"stylePotatoProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleBear"] boolValue]) forKey:@"styleBearProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleGeek"] boolValue]) forKey:@"styleGeekProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleChubby"] boolValue]) forKey:@"styleChubbyProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleBeefy"] boolValue]) forKey:@"styleBeefyProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleBodybuilder"] boolValue]) forKey:@"styleBodybuilderProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleWellMuscled"] boolValue]) forKey:@"styleWellMuscledProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleSlimSkinny"] boolValue]) forKey:@"styleSlimSkinnyProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleFeminine"] boolValue]) forKey:@"styleFeminineProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleShemale"] boolValue]) forKey:@"styleShemaleProfile"];
        [styleDict setValue:@([[_myInfo valueForKey:@"styleEtc"] boolValue]) forKey:@"styleEtcProfile"];
        [self setStyleProfile:styleDict];
        
        NSMutableDictionary* lookingDict = [NSMutableDictionary dictionary];
        [lookingDict setValue:@([[_myInfo valueForKey:@"lookingLover"] boolValue]) forKey:@"lookingLoverProfile"];
        [lookingDict setValue:@([[_myInfo valueForKey:@"lookingFriend"] boolValue]) forKey:@"lookingFriendProfile"];
        [lookingDict setValue:@([[_myInfo valueForKey:@"lookingEPal"] boolValue]) forKey:@"lookingEPalProfile"];
        [lookingDict setValue:@([[_myInfo valueForKey:@"lookingMPal"] boolValue]) forKey:@"lookingMPalProfile"];
        [lookingDict setValue:@([[_myInfo valueForKey:@"lookingTPal"] boolValue]) forKey:@"lookingTPalProfile"];
        [lookingDict setValue:@([[_myInfo valueForKey:@"lookingCircle"] boolValue]) forKey:@"lookingCircleProfile"];
        [lookingDict setValue:@([[_myInfo valueForKey:@"lookingRoommate"] boolValue]) forKey:@"lookingRoommateProfile"];
        [lookingDict setValue:@([[_myInfo valueForKey:@"lookingBPartner"] boolValue]) forKey:@"lookingBPartnerProfile"];
        [lookingDict setValue:@([[_myInfo valueForKey:@"lookingFriendWithBenefits"] boolValue]) forKey:@"lookingFriendWithBenefitsProfile"];
        [self setLookingForProfile:lookingDict];

        [self setCommentProfile:[_myInfo valueForKey:@"comment"]];
        
        NSMutableDictionary* bodyShapeDict = [NSMutableDictionary dictionary];
        [bodyShapeDict setValue:@([[_myInfo valueForKey:@"bodyShapeSecret"] boolValue]) forKey:@"bodyShapeSecretProfile"];
        [bodyShapeDict setValue:@([[_myInfo valueForKey:@"bodyShapeSlim"] boolValue]) forKey:@"bodyShapeSlimProfile"];
        [bodyShapeDict setValue:@([[_myInfo valueForKey:@"bodyShapeAverage"] boolValue]) forKey:@"bodyShapeAverageProfile"];
        [bodyShapeDict setValue:@([[_myInfo valueForKey:@"bodyShapeChubby"] boolValue]) forKey:@"bodyShapeChubbyProfile"];
        [bodyShapeDict setValue:@([[_myInfo valueForKey:@"bodyShapeVeryChubby"] boolValue]) forKey:@"bodyShapeVeryChubbyProfile"];
        [self setBodyShapeProfile:bodyShapeDict];
        
        NSMutableDictionary* muscleDict = [NSMutableDictionary dictionary];
        [muscleDict setValue:@([[_myInfo valueForKey:@"muscleSecret"] boolValue]) forKey:@"muscleSecretProfile"];
        [muscleDict setValue:@([[_myInfo valueForKey:@"muscleDelicate"] boolValue]) forKey:@"muscleDelicateProfile"];
        [muscleDict setValue:@([[_myInfo valueForKey:@"muscleAverage"] boolValue]) forKey:@"muscleAverageProfile"];
        [muscleDict setValue:@([[_myInfo valueForKey:@"muscleWellBuilt"] boolValue]) forKey:@"muscleWellBuiltProfile"];
        [muscleDict setValue:@([[_myInfo valueForKey:@"muscleBodybuilder"] boolValue]) forKey:@"muscleBodybuilderProfile"];
        [self setMuscleProfile:muscleDict];
        
        NSMutableDictionary* bodyHairDict = [NSMutableDictionary dictionary];
        [bodyHairDict setValue:@([[_myInfo valueForKey:@"bodyHairSecret"] boolValue]) forKey:@"bodyHairSecretProfile"];
        [bodyHairDict setValue:@([[_myInfo valueForKey:@"bodyHairSmooth"] boolValue]) forKey:@"bodyHairSmoothProfile"];
        [bodyHairDict setValue:@([[_myInfo valueForKey:@"bodyHairAverage"] boolValue]) forKey:@"bodyHairAverageProfile"];
        [bodyHairDict setValue:@([[_myInfo valueForKey:@"bodyHairHairy"] boolValue]) forKey:@"bodyHairHairyProfile"];
        [self setBodyHairProfile:bodyHairDict];
        
        NSMutableDictionary* hairStyleDict = [NSMutableDictionary dictionary];
        [hairStyleDict setValue:@([[_myInfo valueForKey:@"hairStyleSecret"] boolValue]) forKey:@"hairStyleSecretProfile"];
        [hairStyleDict setValue:@([[_myInfo valueForKey:@"hairStyleShavedHead"] boolValue]) forKey:@"hairStyleShavedHeadProfile"];
        [hairStyleDict setValue:@([[_myInfo valueForKey:@"hairStyleShortHair"] boolValue]) forKey:@"hairStyleShortHairProfile"];
        [hairStyleDict setValue:@([[_myInfo valueForKey:@"hairStyleAverage"] boolValue]) forKey:@"hairStyleAverageProfile"];
        [hairStyleDict setValue:@([[_myInfo valueForKey:@"hairStyleSemiLongHair"] boolValue]) forKey:@"hairStyleSemiLongHairProfile"];
        [hairStyleDict setValue:@([[_myInfo valueForKey:@"hairStyleLongHair"] boolValue]) forKey:@"hairStyleLongHairProfile"];
        [hairStyleDict setValue:@([[_myInfo valueForKey:@"hairStyleUniqueStyle"] boolValue]) forKey:@"hairStyleUniqueStyleProfile"];
        [self setHairStyleProfile:hairStyleDict];
        
        NSMutableDictionary* hairColorDict = [NSMutableDictionary dictionary];
        [hairColorDict setValue:@([[_myInfo valueForKey:@"hairColorSecret"] boolValue]) forKey:@"hairColorSecretProfile"];
        [hairColorDict setValue:@([[_myInfo valueForKey:@"hairColorBlack"] boolValue]) forKey:@"hairColorBlackProfile"];
        [hairColorDict setValue:@([[_myInfo valueForKey:@"hairColorBrown"] boolValue]) forKey:@"hairColorBrownProfile"];
        [hairColorDict setValue:@([[_myInfo valueForKey:@"hairColorBlond"] boolValue]) forKey:@"hairColorBlondProfile"];
        [hairColorDict setValue:@([[_myInfo valueForKey:@"hairColorWhite"] boolValue]) forKey:@"hairColorWhiteProfile"];
        [hairColorDict setValue:@([[_myInfo valueForKey:@"hairColorUniqueColor"] boolValue]) forKey:@"hairColorUniqueColorProfile"];
        [self setHairColorProfile:hairColorDict];
        
        NSMutableDictionary* otherCharacteristicsDict = [NSMutableDictionary dictionary];
        [otherCharacteristicsDict setValue:@([[_myInfo valueForKey:@"otherCharacteristicsMustache"] boolValue]) forKey:@"otherCharacteristicsMustacheProfile"];
        [otherCharacteristicsDict setValue:@([[_myInfo valueForKey:@"otherCharacteristicsTanningSkin"] boolValue]) forKey:@"otherCharacteristicsTanningSkinProfile"];
        [otherCharacteristicsDict setValue:@([[_myInfo valueForKey:@"otherCharacteristicsGlasses"] boolValue]) forKey:@"otherCharacteristicsGlassesProfile"];
        [otherCharacteristicsDict setValue:@([[_myInfo valueForKey:@"otherCharacteristicsPiarce"] boolValue]) forKey:@"otherCharacteristicsPiarceProfile"];
        [otherCharacteristicsDict setValue:@([[_myInfo valueForKey:@"otherCharacteristicsTatoo"] boolValue]) forKey:@"otherCharacteristicsTatooProfile"];
        [self setOtherCharacteristicsProfile:otherCharacteristicsDict];
        
        NSMutableDictionary* personalityDict = [NSMutableDictionary dictionary];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityCheerful"] intValue]) forKey:@"personalityCheerfulProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalitySerious"] intValue]) forKey:@"personalitySeriousProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityFunny"] intValue]) forKey:@"personalityFunnyProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityTakeTheLead"] intValue]) forKey:@"personalityTakeTheLeadProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalitySociable"] intValue]) forKey:@"personalitySociableProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityFollow"] intValue]) forKey:@"personalityFollowProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityFlashy"] intValue]) forKey:@"personalityFlashyProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityActBasedOnEmotions"] intValue]) forKey:@"personalityActBasedOnEmotionsProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityBold"] intValue]) forKey:@"personalityBoldProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityWantStimulation"] intValue]) forKey:@"personalityWantStimulationProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityRealism"] intValue]) forKey:@"personalityRealismProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityOptimistic"] intValue]) forKey:@"personalityOptimisticProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityMasculine"] intValue]) forKey:@"personalityMasculineProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityStrongPerson"] intValue]) forKey:@"personalityStrongPersonProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityWantToProtect"] intValue]) forKey:@"personalityWantToProtectProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityIndoorsy"] intValue]) forKey:@"personalityIndoorsyProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityBookishType"] intValue]) forKey:@"personalityBookishTypeProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityLoveToTalkAbout"] intValue]) forKey:@"personalityLoveToTalkAboutProfile"];
        [personalityDict setValue:@([[_myInfo valueForKey:@"personalityLookingToMeet"] intValue]) forKey:@"personalityLookingToMeetProfile"];
        [self setPersonalityProfile:personalityDict];
        
        NSMutableDictionary* gayCareerDict = [NSMutableDictionary dictionary];
        [gayCareerDict setValue:@([[_myInfo valueForKey:@"gayCareerSecret"] boolValue]) forKey:@"gayCareerSecretProfile"];
        [gayCareerDict setValue:@([[_myInfo valueForKey:@"gayCareerBeginner"] boolValue]) forKey:@"gayCareerBeginnerProfile"];
        [gayCareerDict setValue:@([[_myInfo valueForKey:@"gayCareerAverage"] boolValue]) forKey:@"gayCareerAverageProfile"];
        [gayCareerDict setValue:@([[_myInfo valueForKey:@"gayCareerExpert"] boolValue]) forKey:@"gayCareerExpertProfile"];
        [self setGayCareerProfile:gayCareerDict];
        
        
        NSMutableDictionary* comingoutDict = [NSMutableDictionary dictionary];
        [comingoutDict setValue:@([[_myInfo valueForKey:@"comingoutSecret"] boolValue]) forKey:@"comingoutSecretProfile"];
        [comingoutDict setValue:@([[_myInfo valueForKey:@"comingoutNobodyKnows"] boolValue]) forKey:@"comingoutNobodyKnowsProfile"];
        [comingoutDict setValue:@([[_myInfo valueForKey:@"comingoutSomeoneCloseKnow"] boolValue]) forKey:@"comingoutSomeoneCloseKnowProfile"];
        [comingoutDict setValue:@([[_myInfo valueForKey:@"comingoutMostPeopleKnow"] boolValue]) forKey:@"comingoutMostPeopleKnowProfile"];
        [self setComingoutProfile:comingoutDict];
        
        
        NSMutableDictionary* loveStylesDict = [NSMutableDictionary dictionary];
        [loveStylesDict setValue:@([[_myInfo valueForKey:@"loveStylesSecret"] boolValue]) forKey:@"loveStylesSecretProfile"];
        [loveStylesDict setValue:@([[_myInfo valueForKey:@"loveStylesClose"] boolValue]) forKey:@"loveStylesCloseProfile"];
        [loveStylesDict setValue:@([[_myInfo valueForKey:@"loveStylesAverage"] boolValue]) forKey:@"loveStylesAverageProfile"];
        [loveStylesDict setValue:@([[_myInfo valueForKey:@"loveStylesSimple"] boolValue]) forKey:@"loveStylesSimpleProfile"];
        [loveStylesDict setValue:@([[_myInfo valueForKey:@"loveStylesUpToyou"] boolValue]) forKey:@"loveStylesUpToyouProfile"];
        [self setLoveStylesProfile:loveStylesDict];
        
        
        NSMutableDictionary* expectDict = [NSMutableDictionary dictionary];
        [expectDict setValue:@([[_myInfo valueForKey:@"expectSecret"] boolValue]) forKey:@"expectSecretProfile"];
        [expectDict setValue:@([[_myInfo valueForKey:@"expectpersonality"] boolValue]) forKey:@"expectpersonalityProfile"];
        [expectDict setValue:@([[_myInfo valueForKey:@"expectAppearance"] boolValue]) forKey:@"expectAppearanceProfile"];
        [expectDict setValue:@([[_myInfo valueForKey:@"expectAtmosphere"] boolValue]) forKey:@"expectAtmosphereProfile"];
        [expectDict setValue:@([[_myInfo valueForKey:@"expectBody"] boolValue]) forKey:@"expectBodyProfile"];
        [expectDict setValue:@([[_myInfo valueForKey:@"expectSex"] boolValue]) forKey:@"expectSexProfile"];
        [expectDict setValue:@([[_myInfo valueForKey:@"expectInterest"] boolValue]) forKey:@"expectInterestProfile"];
        [expectDict setValue:@([[_myInfo valueForKey:@"expectCircumstance"] boolValue]) forKey:@"expectCircumstanceProfile"];
        [expectDict setValue:@([[_myInfo valueForKey:@"expectFinance"] boolValue]) forKey:@"expectFinanceProfile"];
        [expectDict setValue:@([[_myInfo valueForKey:@"expectDistance"] boolValue]) forKey:@"expectDistanceProfile"];
        [self setExpectProfile:expectDict];
        
        
        NSMutableDictionary* jobDict = [NSMutableDictionary dictionary];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobSecret"] boolValue]) forKey:@"jobSecretProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobStudent"] boolValue]) forKey:@"jobStudentProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobBetweenJobs"] boolValue]) forKey:@"jobBetweenJobsProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobOfficeWork"] boolValue]) forKey:@"jobOfficeWorkProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobServices"] boolValue]) forKey:@"jobServicesProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobManufacturing"] boolValue]) forKey:@"jobManufacturingProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobComputer"] boolValue]) forKey:@"jobComputerProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobLanguage"] boolValue]) forKey:@"jobLanguageProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobAssets"] boolValue]) forKey:@"jobAssetsProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobLaw"] boolValue]) forKey:@"jobLawProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobMedia"] boolValue]) forKey:@"jobMediaProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobPublishing"] boolValue]) forKey:@"jobPublishingProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobDomestic"] boolValue]) forKey:@"jobDomesticProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobMedicalProfession"] boolValue]) forKey:@"jobMedicalProfessionProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobHealth"] boolValue]) forKey:@"jobHealthProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobArchitecture"] boolValue]) forKey:@"jobArchitectureProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobCreativeProfession"] boolValue]) forKey:@"jobCreativeProfessionProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobCooking"] boolValue]) forKey:@"jobCookingProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobVehicle"] boolValue]) forKey:@"jobVehicleProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobTravel"] boolValue]) forKey:@"jobTravelProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobBeauty"] boolValue]) forKey:@"jobBeautyProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobEntertainment"] boolValue]) forKey:@"jobEntertainmentProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobReligiousProfession"] boolValue]) forKey:@"jobReligiousProfessionProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobCeremonialOccasions"] boolValue]) forKey:@"jobCeremonialOccasionsProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobNature"] boolValue]) forKey:@"jobNatureProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobSports"] boolValue]) forKey:@"jobSportsProfile"];
        [jobDict setValue:@([[_myInfo valueForKey:@"jobSexIndustry"] boolValue]) forKey:@"jobSexIndustryProfile"];
        [self setJobProfile:jobDict];
        
        NSMutableDictionary* livingDict = [NSMutableDictionary dictionary];
        [livingDict setValue:@([[_myInfo valueForKey:@"livingSecret"] boolValue]) forKey:@"livingSecretProfile"];
        [livingDict setValue:@([[_myInfo valueForKey:@"livingAlone"] boolValue]) forKey:@"livingAloneProfile"];
        [livingDict setValue:@([[_myInfo valueForKey:@"livingwithFamily"] boolValue]) forKey:@"livingwithFamilyProfile"];
        [livingDict setValue:@([[_myInfo valueForKey:@"livingwithFriendsorLovers"] boolValue]) forKey:@"livingwithFriendsorLoversProfile"];
        [self setLivingProfile:livingDict];
        
        
        NSMutableDictionary* lifePolicyDict = [NSMutableDictionary dictionary];
        [lifePolicyDict setValue:@([[_myInfo valueForKey:@"lifePolicyVegetarian"] boolValue]) forKey:@"lifePolicyVegetarianProfile"];
        [lifePolicyDict setValue:@([[_myInfo valueForKey:@"lifePolicyNoSmoking"] boolValue]) forKey:@"lifePolicyNoSmokingProfile"];
        [lifePolicyDict setValue:@([[_myInfo valueForKey:@"lifePolicyNoDrinking"] boolValue]) forKey:@"lifePolicyNoDrinkingProfile"];
        [lifePolicyDict setValue:@([[_myInfo valueForKey:@"lifePolicyNoGambling"] boolValue]) forKey:@"lifePolicyNoGamblingProfile"];
        [lifePolicyDict setValue:@([[_myInfo valueForKey:@"lifePolicyNoSex"] boolValue]) forKey:@"lifePolicyNoSexProfile"];
        [self setLifePolicyProfile:lifePolicyDict];
        
        
        NSMutableDictionary* sexPositionDict = [NSMutableDictionary dictionary];
        [sexPositionDict setValue:@([[_myInfo valueForKey:@"sexPositionSecret"] boolValue]) forKey:@"sexPositionSecretProfile"];
        [sexPositionDict setValue:@([[_myInfo valueForKey:@"sexPositionTop"] boolValue]) forKey:@"sexPositionTopProfile"];
        [sexPositionDict setValue:@([[_myInfo valueForKey:@"sexPositionBottom"] boolValue]) forKey:@"sexPositionBottomProfile"];
        [sexPositionDict setValue:@([[_myInfo valueForKey:@"sexPositionVersatile"] boolValue]) forKey:@"sexPositionVersatileProfile"];
        [self setSexPositionProfile:sexPositionDict];
        
        int penisSize = [[_myInfo valueForKey:@"penisSize"] intValue];
        //if([[_myInfo valueForKey:@"penisSize"] isEqual:[NSNull null]]){
        //    penisSize = 0;
        //}else{
        //    penisSize = ;
        //}
        [self setPenisSizeProfile:penisSize];
        
        NSMutableDictionary* penisThicknessDict = [NSMutableDictionary dictionary];
        [penisThicknessDict setValue:@([[_myInfo valueForKey:@"penisThicknessSecret"] boolValue]) forKey:@"penisThicknessSecretProfile"];
        [penisThicknessDict setValue:@([[_myInfo valueForKey:@"penisThicknessSlender"] boolValue]) forKey:@"penisThicknessSlenderProfile"];
        [penisThicknessDict setValue:@([[_myInfo valueForKey:@"penisThicknessAverage"] boolValue]) forKey:@"penisThicknessAverageProfile"];
        [penisThicknessDict setValue:@([[_myInfo valueForKey:@"penisThicknessPlump"] boolValue]) forKey:@"penisThicknessPlumpProfile"];
        [penisThicknessDict setValue:@([[_myInfo valueForKey:@"penisThicknessExtraThick"] boolValue]) forKey:@"penisThicknessExtraThickProfile"];
        [self setPenisThicknessProfile:penisThicknessDict];
        
        NSMutableDictionary* phimosisDict = [NSMutableDictionary dictionary];
        [phimosisDict setValue:@([[_myInfo valueForKey:@"phimosisSecret"] boolValue]) forKey:@"phimosisSecretProfile"];
        [phimosisDict setValue:@([[_myInfo valueForKey:@"phimosisCut"] boolValue]) forKey:@"phimosisCutProfile"];
        [phimosisDict setValue:@([[_myInfo valueForKey:@"phimosisUncut"] boolValue]) forKey:@"phimosisUncutProfile"];
        [phimosisDict setValue:@([[_myInfo valueForKey:@"phimosisOverhang"] boolValue]) forKey:@"phimosisOverhangProfile"];
        [self setPhimosisProfile:phimosisDict];
        
        NSMutableDictionary* sadomasochismDict = [NSMutableDictionary dictionary];
        [sadomasochismDict setValue:@([[_myInfo valueForKey:@"sadomasochismSecret"] boolValue]) forKey:@"sadomasochismSecretProfile"];
        [sadomasochismDict setValue:@([[_myInfo valueForKey:@"sadomasochismSadistic"] boolValue]) forKey:@"sadomasochismSadisticProfile"];
        [sadomasochismDict setValue:@([[_myInfo valueForKey:@"sadomasochismMasochistic"] boolValue]) forKey:@"sadomasochismMasochisticProfile"];
        [sadomasochismDict setValue:@([[_myInfo valueForKey:@"sadomasochismBoth"] boolValue]) forKey:@"sadomasochismBothProfile"];
        [sadomasochismDict setValue:@([[_myInfo valueForKey:@"sadomasochismNeither"] boolValue]) forKey:@"sadomasochismNeitherProfile"];
        [self setSadomasochismProfile:sadomasochismDict];
        
        
        NSMutableDictionary* fetishDict = [NSMutableDictionary dictionary];
        [fetishDict setValue:@([[_myInfo valueForKey:@"fetishBDSM"] boolValue]) forKey:@"fetishBDSMProfile"];
        [fetishDict setValue:@([[_myInfo valueForKey:@"fetishBigCock"] boolValue]) forKey:@"fetishBigCockProfile"];
        [fetishDict setValue:@([[_myInfo valueForKey:@"fetishSmallCock"] boolValue]) forKey:@"fetishSmallCockProfile"];
        [fetishDict setValue:@([[_myInfo valueForKey:@"fetishUncut"] boolValue]) forKey:@"fetishUncutProfile"];
        [fetishDict setValue:@([[_myInfo valueForKey:@"fetishSmellFetish"] boolValue]) forKey:@"fetishSmellFetishProfile"];
        [fetishDict setValue:@([[_myInfo valueForKey:@"fetishUniformFetish"] boolValue]) forKey:@"fetishUniformFetishProfile"];
        [fetishDict setValue:@([[_myInfo valueForKey:@"fetishRubber"] boolValue]) forKey:@"fetishRubberProfile"];
        [fetishDict setValue:@([[_myInfo valueForKey:@"fetishDrag"] boolValue]) forKey:@"fetishDragProfile"];
        [fetishDict setValue:@([[_myInfo valueForKey:@"fetishFlasher"] boolValue]) forKey:@"fetishFlasherProfile"];
        [fetishDict setValue:@([[_myInfo valueForKey:@"fetishGangbang"] boolValue]) forKey:@"fetishGangbangProfile"];
        [fetishDict setValue:@([[_myInfo valueForKey:@"fetishHardcorePlay"] boolValue]) forKey:@"fetishHardcorePlayProfile"];
        [fetishDict setValue:@([[_myInfo valueForKey:@"fetishPhoneSex"] boolValue]) forKey:@"fetishPhoneSexProfile"];
        [fetishDict setValue:@([[_myInfo valueForKey:@"fetishTeenLover"] boolValue]) forKey:@"fetishTeenLoverProfile"];
        [fetishDict setValue:@([[_myInfo valueForKey:@"fetishMatureLover"] boolValue]) forKey:@"fetishMatureLoverProfile"];
        [fetishDict setValue:@([[_myInfo valueForKey:@"fetishChubbyLover"] boolValue]) forKey:@"fetishChubbyLoverProfile"];//
        [self setFetishProfile:fetishDict];
        
        //MyNotification* notice = [[MyNotification alloc] init];
    }@catch (NSException* e) {
       // NSLog(@"%@", e.description);
    }
}

-(void)reset
{
    [self setEmailProfile:nil];
    [self setPasswordProfile:nil];
    [self setNickNameProfile:nil];
    [self setAgeProfile:nil];
    [self setHeightProfile:nil];
    [self setWeightProfile:nil];
    [self setCountryProfile:nil];
    
    [self setSexuallityProfile:nil];
    [self setRaceProfile:nil];
    [self setStyleProfile:nil];
    [self setLookingForProfile:nil];

    [self setCommentProfile:nil];
    
    [self setBodyShapeProfile:nil];
    [self setMuscleProfile:nil];
    [self setBodyHairProfile:nil];
    [self setHairStyleProfile:nil];
    [self setHairColorProfile:nil];
    [self setOtherCharacteristicsProfile:nil];
    [self setPersonalityProfile:nil];
    [self setGayCareerProfile:nil];
    [self setComingoutProfile:nil];
    [self setLoveStylesProfile:nil];
    [self setExpectProfile:nil];
    [self setJobProfile:nil];
    [self setLivingProfile:nil];
    [self setLifePolicyProfile:nil];
    [self setSexPositionProfile:nil];
    
    [self setPenisSizeProfile:0];
    
    [self setPenisThicknessProfile:nil];
    [self setPhimosisProfile:nil];
    [self setSadomasochismProfile:nil];
    [self setFetishProfile:nil];
    
}

@end
