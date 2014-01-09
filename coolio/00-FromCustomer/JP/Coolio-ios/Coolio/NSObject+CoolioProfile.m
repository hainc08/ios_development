//
//  NSObject+CoolioProfile.m
//  Coolio
//
//  Created by hoehoe on 2013/07/04.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "NSObject+CoolioProfile.h"

@implementation NSObject (CoolioProfile)



-(R9HTTPRequest *)setRequestBodyToProfile:(R9HTTPRequest *)request
{
    MyProfiles* profile = [[MyProfiles alloc] init];
    MyPublish* publish = [[MyPublish alloc] init];    
    
    [request  addBody:[profile getEmailProfile] forKey:@"email"];
    [request  addBody:[profile getPasswordProfile] forKey:@"password"];
    [request  addBody:[profile getNickNameProfile] forKey:@"nickname"];
    [request  addBody:[profile getAgeProfile] forKey:@"age"];
    [request  addBody:[profile getHeightProfile] forKey:@"height"];
    [request  addBody:[profile getWeightProfile] forKey:@"weight"];
    [request  addBody:[profile getCountryProfile] forKey:@"country"];
    
    NSDictionary* sexDict = [[profile getSexuallityProfile] mutableCopy];
    [request  addBody:([[sexDict valueForKey:@"sexGayProfile"] boolValue] ? @"YES" : @"NO") forKey:@"sexGay"];
    [request  addBody:([[sexDict valueForKey:@"sexBisexProfile"] boolValue] ? @"YES" : @"NO") forKey:@"sexBisex"];
    [request  addBody:([[sexDict valueForKey:@"sexStraightProfile"] boolValue] ? @"YES" : @"NO") forKey:@"sexStraight"];
    
    
    NSDictionary* raceDict = [[profile getRaceProfile] mutableCopy];
    [request  addBody:([[raceDict valueForKey:@"raceAsianProfile"] boolValue] ? @"YES" : @"NO") forKey:@"raceAsian"];
    [request  addBody:([[raceDict valueForKey:@"raceWhiteProfile"] boolValue] ? @"YES" : @"NO") forKey:@"raceWhite"];
    [request  addBody:([[raceDict valueForKey:@"raceBlackProfile"] boolValue] ? @"YES" : @"NO") forKey:@"raceBlack"];
    [request  addBody:([[raceDict valueForKey:@"raceLatinProfile"] boolValue] ? @"YES" : @"NO") forKey:@"raceLatin"];
    [request  addBody:([[raceDict valueForKey:@"raceArabProfile"] boolValue] ? @"YES" : @"NO") forKey:@"raceArab"];
    [request  addBody:([[raceDict valueForKey:@"racePolynesianProfile"] boolValue] ? @"YES" : @"NO") forKey:@"racePolynesian"];
    [request  addBody:([[raceDict valueForKey:@"raceMixProfile"] boolValue] ? @"YES" : @"NO") forKey:@"raceMix"];
    [request  addBody:([[raceDict valueForKey:@"raceEtcProfile"] boolValue] ? @"YES" : @"NO") forKey:@"raceEtc"];
    
    
    NSDictionary* styleDict = [[profile getStyleProfile] mutableCopy];
    [request  addBody:([[styleDict valueForKey:@"styleTwinkProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleTwink"];
    [request  addBody:([[styleDict valueForKey:@"styleHunkProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleHunk"];
    [request  addBody:([[styleDict valueForKey:@"styleSurferProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleSurfer"];
    [request  addBody:([[styleDict valueForKey:@"styleHipHopProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleHipHop"];
    [request  addBody:([[styleDict valueForKey:@"styleThugProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleThug"];
    [request  addBody:([[styleDict valueForKey:@"stylePunkProfile"] boolValue] ? @"YES" : @"NO") forKey:@"stylePunk"];
    [request  addBody:([[styleDict valueForKey:@"styleWhiteCollarProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleWhiteCollar"];
    [request  addBody:([[styleDict valueForKey:@"styleHardcoreGayProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleHardcoreGay"];
    [request  addBody:([[styleDict valueForKey:@"stylePotatoProfile"] boolValue] ? @"YES" : @"NO") forKey:@"stylePotato"];
    [request  addBody:([[styleDict valueForKey:@"styleBearProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleBear"];
    [request  addBody:([[styleDict valueForKey:@"styleGeekProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleGeek"];
    [request  addBody:([[styleDict valueForKey:@"styleChubbyProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleChubby"];
    [request  addBody:([[styleDict valueForKey:@"styleBeefyProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleBeefy"];
    [request  addBody:([[styleDict valueForKey:@"styleBodybuilderProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleBodybuilder"];
    [request  addBody:([[styleDict valueForKey:@"styleWellMuscledProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleWellMuscled"];
    [request  addBody:([[styleDict valueForKey:@"styleSlimSkinnyProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleSlimSkinny"];
    [request  addBody:([[styleDict valueForKey:@"styleFeminineProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleFeminine"];
    [request  addBody:([[styleDict valueForKey:@"styleShemaleProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleShemale"];
    [request  addBody:([[styleDict valueForKey:@"styleEtcProfile"] boolValue] ? @"YES" : @"NO") forKey:@"styleEtc"];
    
    
    NSDictionary* lookingDict = [[profile getLookingForProfile] mutableCopy];
    [request  addBody:([[lookingDict valueForKey:@"lookingLoverProfile"] boolValue] ? @"YES" : @"NO") forKey:@"lookingLover"];
    [request  addBody:([[lookingDict valueForKey:@"lookingFriendProfile"] boolValue] ? @"YES" : @"NO") forKey:@"lookingFriend"];
    [request  addBody:([[lookingDict valueForKey:@"lookingEPalProfile"] boolValue] ? @"YES" : @"NO") forKey:@"lookingEPal"];
    [request  addBody:([[lookingDict valueForKey:@"lookingMPalProfile"] boolValue] ? @"YES" : @"NO") forKey:@"lookingMPal"];
    [request  addBody:([[lookingDict valueForKey:@"lookingTPalProfile"] boolValue] ? @"YES" : @"NO") forKey:@"lookingTPal"];
    [request  addBody:([[lookingDict valueForKey:@"lookingCircleProfile"] boolValue] ? @"YES" : @"NO") forKey:@"lookingCircle"];
    [request  addBody:([[lookingDict valueForKey:@"lookingRoommateProfile"] boolValue] ? @"YES" : @"NO") forKey:@"lookingRoommate"];
    [request  addBody:([[lookingDict valueForKey:@"lookingBPartnerProfile"] boolValue] ? @"YES" : @"NO") forKey:@"lookingBPartner"];
    [request  addBody:([[lookingDict valueForKey:@"lookingFriendWithBenefitsProfile"] boolValue] ? @"YES" : @"NO") forKey:@"lookingFriendWithBenefits"];
    
    NSString* comment = [profile getCommentProfile];
    if(comment == nil){
        comment = @"";
    }
    [request  addBody:comment forKey:@"comment"];
    
    
    NSDictionary* bodyShapeDict = [[profile getBodyShapeProfile] mutableCopy];
    [request  addBody:([[bodyShapeDict valueForKey:@"bodyShapeSecretProfile"] boolValue] ? @"YES" : @"NO") forKey:@"bodyShapeSecret"];
    [request  addBody:([[bodyShapeDict valueForKey:@"bodyShapeSlimProfile"] boolValue] ? @"YES" : @"NO") forKey:@"bodyShapeSlim"];
    [request  addBody:([[bodyShapeDict valueForKey:@"bodyShapeAverageProfile"] boolValue] ? @"YES" : @"NO") forKey:@"bodyShapeAverage"];
    [request  addBody:([[bodyShapeDict valueForKey:@"bodyShapeChubbyProfile"] boolValue] ? @"YES" : @"NO") forKey:@"bodyShapeChubby"];
    [request  addBody:([[bodyShapeDict valueForKey:@"bodyShapeVeryChubbyProfile"] boolValue] ? @"YES" : @"NO") forKey:@"bodyShapeVeryChubby"];
    
    
    NSDictionary* muscleDict = [[profile getMuscleProfile] mutableCopy];
    [request  addBody:([[muscleDict valueForKey:@"muscleSecretProfile"] boolValue] ? @"YES" : @"NO") forKey:@"muscleSecret"];
    [request  addBody:([[muscleDict valueForKey:@"muscleDelicateProfile"] boolValue] ? @"YES" : @"NO") forKey:@"muscleDelicate"];
    [request  addBody:([[muscleDict valueForKey:@"muscleAverageProfile"] boolValue] ? @"YES" : @"NO") forKey:@"muscleAverage"];
    [request  addBody:([[muscleDict valueForKey:@"muscleWell-builtProfile"] boolValue] ? @"YES" : @"NO") forKey:@"muscleWellBuilt"];
    [request  addBody:([[muscleDict valueForKey:@"muscleBodybuilderProfile"] boolValue] ? @"YES" : @"NO") forKey:@"muscleBodybuilder"];
    
    NSDictionary* bodyHairDict = [[profile getBodyHairProfile] mutableCopy];
    [request  addBody:([[bodyHairDict valueForKey:@"bodyHairSecretProfile"] boolValue] ? @"YES" : @"NO") forKey:@"bodyHairSecret"];
    [request  addBody:([[bodyHairDict valueForKey:@"bodyHairSmoothProfile"] boolValue] ? @"YES" : @"NO") forKey:@"bodyHairSmooth"];
    [request  addBody:([[bodyHairDict valueForKey:@"bodyHairAverageProfile"] boolValue] ? @"YES" : @"NO") forKey:@"bodyHairAverage"];
    [request  addBody:([[bodyHairDict valueForKey:@"bodyHairHairyProfile"] boolValue] ? @"YES" : @"NO") forKey:@"bodyHairHairy"];
    
    
    NSDictionary* hairStyleDict = [[profile getHairStyleProfile] mutableCopy];
    [request addBody:([[hairStyleDict valueForKey:@"hairStyleSecretProfile"] boolValue] ? @"YES" : @"NO") forKey:@"hairStyleSecret"];
    [request addBody:([[hairStyleDict valueForKey:@"hairStyleShavedHeadProfile"] boolValue] ? @"YES" : @"NO") forKey:@"hairStyleShavedHead"];
    [request addBody:([[hairStyleDict valueForKey:@"hairStyleShortHairProfile"] boolValue] ? @"YES" : @"NO") forKey:@"hairStyleShortHair"];
    [request addBody:([[hairStyleDict valueForKey:@"hairStyleAverageProfile"] boolValue] ? @"YES" : @"NO") forKey:@"hairStyleAverage"];
    [request addBody:([[hairStyleDict valueForKey:@"hairStyleSemiLongHairProfile"] boolValue] ? @"YES" : @"NO") forKey:@"hairStyleSemiLongHair"];
    [request addBody:([[hairStyleDict valueForKey:@"hairStyleLongHairProfile"] boolValue] ? @"YES" : @"NO") forKey:@"hairStyleLongHair"];
    [request addBody:([[hairStyleDict valueForKey:@"hairStyleUniqueStyleProfile"] boolValue] ? @"YES" : @"NO") forKey:@"hairStyleUniqueStyle"];
    
    NSDictionary* hairColorDict = [[profile getHairColorProfile] mutableCopy];
    [request addBody:([[hairColorDict valueForKey:@"hairColorSecretProfile"] boolValue] ? @"YES" : @"NO") forKey:@"hairColorSecret"];
    [request addBody:([[hairColorDict valueForKey:@"hairColorBlackProfile"] boolValue] ? @"YES" : @"NO") forKey:@"hairColorBlack"];
    [request addBody:([[hairColorDict valueForKey:@"hairColorBrownProfile"] boolValue] ? @"YES" : @"NO") forKey:@"hairColorBrown"];
    [request addBody:([[hairColorDict valueForKey:@"hairColorBlondProfile"] boolValue] ? @"YES" : @"NO") forKey:@"hairColorBlond"];
    [request addBody:([[hairColorDict valueForKey:@"hairColorWhiteProfile"] boolValue] ? @"YES" : @"NO") forKey:@"hairColorWhite"];
    [request addBody:([[hairColorDict valueForKey:@"hairColorUniqueColorProfile"] boolValue] ? @"YES" : @"NO") forKey:@"hairColorUniqueColor"];
    
    NSDictionary* otherCharacterDict = [[profile getOtherCharacteristicsProfile] mutableCopy];
    [request addBody:([[otherCharacterDict valueForKey:@"otherCharacteristicsMustacheProfile"] boolValue] ? @"YES" : @"NO") forKey:@"otherCharacteristicsMustache"];
    [request addBody:([[otherCharacterDict valueForKey:@"otherCharacteristicsTanningSkinProfile"] boolValue] ? @"YES" : @"NO") forKey:@"otherCharacteristicsTanningSkin"];
    [request addBody:([[otherCharacterDict valueForKey:@"otherCharacteristicsGlassesProfile"] boolValue] ? @"YES" : @"NO") forKey:@"otherCharacteristicsGlasses"];
    [request addBody:([[otherCharacterDict valueForKey:@"otherCharacteristicsPiarceProfile"] boolValue] ? @"YES" : @"NO") forKey:@"otherCharacteristicsPiarce"];
    [request addBody:([[otherCharacterDict valueForKey:@"otherCharacteristicsTatooProfile"] boolValue] ? @"YES" : @"NO") forKey:@"otherCharacteristicsTatoo"];
    
    NSDictionary* personalityDict = [[profile getPersonalityProfile] mutableCopy];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityCheerfulProfile"] intValue]] forKey:@"personalityCheerful"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalitySeriousProfile"] intValue]] forKey:@"personalitySerious"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityFunnyProfile"] intValue]] forKey:@"personalityFunny"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityTakeTheLeadProfile"] intValue]] forKey:@"personalityTakeTheLead"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalitySociableProfile"] intValue]] forKey:@"personalitySociable"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityFollowProfile"] intValue]] forKey:@"personalityFollow"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityFlashyProfile"] intValue]] forKey:@"personalityFlashy"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityActBasedOnEmotionsProfile"] intValue]] forKey:@"personalityActBasedOnEmotions"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityBoldProfile"] intValue]] forKey:@"personalityBold"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityWantStimulationProfile"] intValue]] forKey:@"personalityWantStimulation"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityRealismProfile"] intValue]] forKey:@"personalityRealism"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityOptimisticProfile"] intValue]] forKey:@"personalityOptimistic"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityMasculineProfile"] intValue]] forKey:@"personalityMasculine"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityStrongPersonProfile"] intValue]] forKey:@"personalityStrongPerson"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityWantToProtectProfile"] intValue]] forKey:@"personalityWantToProtect"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityIndoorsyProfile"] intValue]] forKey:@"personalityIndoorsy"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityBookishTypeProfile"] intValue]] forKey:@"personalityBookishType"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityLoveToTalkAboutProfile"] intValue]] forKey:@"personalityLoveToTalkAbout"];
    [request addBody:[NSString stringWithFormat:@"%d", [[personalityDict valueForKey:@"personalityLookingToMeetProfile"] intValue]] forKey:@"personalityLookingToMeet"];
    
    
    /*
     NSMutableDictionary* gayCareerDict = [NSMutableDictionary dictionary];
     [gayCareerDict setValue:[NSNumber numberWithBool:[[_myInfo valueForKey:@"gayCareerSecret"] boolValue]] forKey:@"gayCareerSecretProfile"];
     [gayCareerDict setValue:[NSNumber numberWithBool:[[_myInfo valueForKey:@"gayCareerBeginner"] boolValue]] forKey:@"gayCareerBeginnerProfile"];
     [gayCareerDict setValue:[NSNumber numberWithBool:[[_myInfo valueForKey:@"gayCareerAverage"] boolValue]] forKey:@"gayCareerAverageProfile"];
     [gayCareerDict setValue:[NSNumber numberWithBool:[[_myInfo valueForKey:@"gayCareerExpert"] boolValue]] forKey:@"gayCareerExpertProfile"];
     [self setGayCareerProfile:gayCareerDict];
     */
    
    
    NSDictionary* gayCareerDict = [[profile getGayCareerProfile] mutableCopy];
    [request addBody:([[gayCareerDict valueForKey:@"gayCareerSecretProfile"] boolValue] ? @"YES" : @"NO") forKey:@"gayCareerSecret"];
    [request addBody:([[gayCareerDict valueForKey:@"gayCareerBeginnerProfile"] boolValue] ? @"YES" : @"NO") forKey:@"gayCareerBeginner"];
    [request addBody:([[gayCareerDict valueForKey:@"gayCareerAverageProfile"] boolValue] ? @"YES" : @"NO") forKey:@"gayCareerAverage"];
    [request addBody:([[gayCareerDict valueForKey:@"gayCareerExpertProfile"] boolValue] ? @"YES" : @"NO") forKey:@"gayCareerExpert"];
    
    NSDictionary* comingOutDict = [[profile getComingoutProfile] mutableCopy];
    [request addBody:([[comingOutDict valueForKey:@"comingoutSecretProfile"] boolValue] ? @"YES" : @"NO") forKey:@"comingoutSecret"];
    [request addBody:([[comingOutDict valueForKey:@"comingoutNobodyKnowsProfile"] boolValue] ? @"YES" : @"NO") forKey:@"comingoutNobodyKnows"];
    [request addBody:([[comingOutDict valueForKey:@"comingoutSomeoneCloseKnowProfile"] boolValue] ? @"YES" : @"NO") forKey:@"comingoutSomeoneCloseKnow"];
    [request addBody:([[comingOutDict valueForKey:@"comingoutMostPeopleKnowProfile"] boolValue] ? @"YES" : @"NO") forKey:@"comingoutMostPeopleKnow"];
    
    NSDictionary* loveStyleDict = [[profile getLoveStylesProfile] mutableCopy];
    [request addBody:([[loveStyleDict valueForKey:@"loveStylesSecretProfile"] boolValue] ? @"YES" : @"NO") forKey:@"loveStylesSecret"];
    [request addBody:([[loveStyleDict valueForKey:@"loveStylesCloseProfile"] boolValue] ? @"YES" : @"NO") forKey:@"loveStylesClose"];
    [request addBody:([[loveStyleDict valueForKey:@"loveStylesAverageProfile"] boolValue] ? @"YES" : @"NO") forKey:@"loveStylesAverage"];
    [request addBody:([[loveStyleDict valueForKey:@"loveStylesSimpleProfile"] boolValue] ? @"YES" : @"NO") forKey:@"loveStylesSimple"];
    [request addBody:([[loveStyleDict valueForKey:@"loveStylesUpToyouProfile"] boolValue] ? @"YES" : @"NO") forKey:@"loveStylesUpToyou"];
    
    NSDictionary* expectDict = [[profile getExpectProfile] mutableCopy];
    [request addBody:([[expectDict valueForKey:@"expectSecretProfile"] boolValue] ? @"YES" : @"NO") forKey:@"expectSecret"];
    [request addBody:([[expectDict valueForKey:@"expectpersonalityProfile"] boolValue] ? @"YES" : @"NO") forKey:@"expectpersonality"];
    [request addBody:([[expectDict valueForKey:@"expectAppearanceProfile"] boolValue] ? @"YES" : @"NO") forKey:@"expectAppearance"];
    [request addBody:([[expectDict valueForKey:@"expectAtmosphereProfile"] boolValue] ? @"YES" : @"NO") forKey:@"expectAtmosphere"];
    [request addBody:([[expectDict valueForKey:@"expectBodyProfile"] boolValue] ? @"YES" : @"NO") forKey:@"expectBody"];
    [request addBody:([[expectDict valueForKey:@"expectSexProfile"] boolValue] ? @"YES" : @"NO") forKey:@"expectSex"];
    [request addBody:([[expectDict valueForKey:@"expectInterestProfile"] boolValue] ? @"YES" : @"NO") forKey:@"expectInterest"];
    [request addBody:([[expectDict valueForKey:@"expectCircumstanceProfile"] boolValue] ? @"YES" : @"NO") forKey:@"expectCircumstance"];
    [request addBody:([[expectDict valueForKey:@"expectFinanceProfile"] boolValue] ? @"YES" : @"NO") forKey:@"expectFinance"];
    [request addBody:([[expectDict valueForKey:@"expectDistanceProfile"] boolValue] ? @"YES" : @"NO") forKey:@"expectDistance"];
    
    
    NSDictionary* jobDict = [[profile getJobProfile] mutableCopy];
    [request addBody:([[jobDict valueForKey:@"jobSecretProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobSecret"];
    [request addBody:([[jobDict valueForKey:@"jobStudentProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobStudent"];
    [request addBody:([[jobDict valueForKey:@"jobBetweenJobsProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobBetweenJobs"];
    [request addBody:([[jobDict valueForKey:@"jobOfficeWorkProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobOfficeWork"];
    [request addBody:([[jobDict valueForKey:@"jobServicesProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobServices"];
    [request addBody:([[jobDict valueForKey:@"jobManufacturingProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobManufacturing"];
    [request addBody:([[jobDict valueForKey:@"jobComputerProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobComputer"];
    [request addBody:([[jobDict valueForKey:@"jobLanguageProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobLanguage"];
    [request addBody:([[jobDict valueForKey:@"jobAssetsProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobAssets"];
    [request addBody:([[jobDict valueForKey:@"jobLawProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobLaw"];
    [request addBody:([[jobDict valueForKey:@"jobMediaProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobMedia"];
    [request addBody:([[jobDict valueForKey:@"jobPublishingProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobPublishing"];
    [request addBody:([[jobDict valueForKey:@"jobDomesticProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobDomestic"];
    [request addBody:([[jobDict valueForKey:@"jobMedicalProfessionProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobMedicalProfession"];
    [request addBody:([[jobDict valueForKey:@"jobHealthProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobHealth"];
    [request addBody:([[jobDict valueForKey:@"jobArchitectureProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobArchitecture"];
    [request addBody:([[jobDict valueForKey:@"jobCreativeProfessionProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobCreativeProfession"];
    [request addBody:([[jobDict valueForKey:@"jobCookingProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobCooking"];
    [request addBody:([[jobDict valueForKey:@"jobVehicleProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobVehicle"];
    [request addBody:([[jobDict valueForKey:@"jobTravelProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobTravel"];
    [request addBody:([[jobDict valueForKey:@"jobBeautyProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobBeauty"];
    [request addBody:([[jobDict valueForKey:@"jobEntertainmentProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobEntertainment"];
    [request addBody:([[jobDict valueForKey:@"jobReligiousProfessionProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobReligiousProfession"];
    [request addBody:([[jobDict valueForKey:@"jobCeremonialOccasionsProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobCeremonialOccasions"];
    [request addBody:([[jobDict valueForKey:@"jobNatureProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobNature"];
    [request addBody:([[jobDict valueForKey:@"jobSportsProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobSports"];
    [request addBody:([[jobDict valueForKey:@"jobSexIndustryProfile"] boolValue] ? @"YES" : @"NO") forKey:@"jobSexIndustry"];
    
    NSDictionary* homeDict = [[profile getLivingProfile] mutableCopy];
    [request addBody:([[homeDict valueForKey:@"livingSecretProfile"] boolValue] ? @"YES" : @"NO") forKey:@"livingSecret"];
    [request addBody:([[homeDict valueForKey:@"livingAloneProfile"] boolValue] ? @"YES" : @"NO") forKey:@"livingAlone"];
    [request addBody:([[homeDict valueForKey:@"livingwithFamilyProfile"] boolValue] ? @"YES" : @"NO") forKey:@"livingwithFamily"];
    [request addBody:([[homeDict valueForKey:@"livingwithFriendsorLoversProfile"] boolValue] ? @"YES" : @"NO") forKey:@"livingwithFriendsorLovers"];
    
    NSDictionary* lifePolDict = [[profile getLifePolicyProfile] mutableCopy];
    [request addBody:([[lifePolDict valueForKey:@"lifePolicyVegetarianProfile"] boolValue] ? @"YES" : @"NO") forKey:@"lifePolicyVegetarian"];
    [request addBody:([[lifePolDict valueForKey:@"lifePolicyNoSmokingProfile"] boolValue] ? @"YES" : @"NO") forKey:@"lifePolicyNoSmoking"];
    [request addBody:([[lifePolDict valueForKey:@"lifePolicyNoDrinkingProfile"] boolValue] ? @"YES" : @"NO") forKey:@"lifePolicyNoDrinking"];
    [request addBody:([[lifePolDict valueForKey:@"lifePolicyNoGamblingProfile"] boolValue] ? @"YES" : @"NO") forKey:@"lifePolicyNoGambling"];
    [request addBody:([[lifePolDict valueForKey:@"lifePolicyNoSexProfile"] boolValue] ? @"YES" : @"NO") forKey:@"lifePolicyNoSex"];
    
    NSDictionary* sexPosiDict = [[profile getSexPositionProfile] mutableCopy];
    [request addBody:([[sexPosiDict valueForKey:@"sexPositionSecretProfile"] boolValue] ? @"YES" : @"NO") forKey:@"sexPositionSecret"];
    [request addBody:([[sexPosiDict valueForKey:@"sexPositionTopProfile"] boolValue] ? @"YES" : @"NO") forKey:@"sexPositionTop"];
    [request addBody:([[sexPosiDict valueForKey:@"sexPositionBottomProfile"] boolValue] ? @"YES" : @"NO") forKey:@"sexPositionBottom"];
    [request addBody:([[sexPosiDict valueForKey:@"sexPositionVersatileProfile"] boolValue] ? @"YES" : @"NO") forKey:@"sexPositionVersatile"];
    
    int pSize = [profile getPenisSizeProfile];
    [request addBody:[NSString stringWithFormat:@"%d", pSize] forKey:@"penisSize"];
    
    NSDictionary* penisThiDict = [[profile getPenisThicknessProfile] mutableCopy];
    [request addBody:([[penisThiDict valueForKey:@"penisThicknessSecretProfile"] boolValue] ? @"YES" : @"NO") forKey:@"penisThicknessSecret"];
    [request addBody:([[penisThiDict valueForKey:@"penisThicknessSlenderProfile"] boolValue] ? @"YES" : @"NO") forKey:@"penisThicknessSlender"];
    [request addBody:([[penisThiDict valueForKey:@"penisThicknessAverageProfile"] boolValue] ? @"YES" : @"NO") forKey:@"penisThicknessAverage"];
    [request addBody:([[penisThiDict valueForKey:@"penisThicknessPlumpProfile"] boolValue] ? @"YES" : @"NO") forKey:@"penisThicknessPlump"];
    [request addBody:([[penisThiDict valueForKey:@"penisThicknessExtraThickProfile"] boolValue] ? @"YES" : @"NO") forKey:@"penisThicknessExtraThick"];
    
    NSDictionary* phimosisDict = [[profile getPhimosisProfile] mutableCopy];
    [request addBody:([[phimosisDict valueForKey:@"phimosisSecretProfile"] boolValue] ? @"YES" : @"NO") forKey:@"phimosisSecret"];
    [request addBody:([[phimosisDict valueForKey:@"phimosisCutProfile"] boolValue] ? @"YES" : @"NO") forKey:@"phimosisCut"];
    [request addBody:([[phimosisDict valueForKey:@"phimosisUncutProfile"] boolValue] ? @"YES" : @"NO") forKey:@"phimosisUncut"];
    [request addBody:([[phimosisDict valueForKey:@"phimosisOverhangProfile"] boolValue] ? @"YES" : @"NO") forKey:@"phimosisOverhang"];
    
    NSDictionary* sadoDict = [[profile getSadomasochismProfile] mutableCopy];
    [request addBody:([[sadoDict valueForKey:@"sadomasochismSecretProfile"] boolValue] ? @"YES" : @"NO") forKey:@"sadomasochismSecret"];
    [request addBody:([[sadoDict valueForKey:@"sadomasochismSadisticProfile"] boolValue] ? @"YES" : @"NO") forKey:@"sadomasochismSadistic"];
    [request addBody:([[sadoDict valueForKey:@"sadomasochismMasochisticProfile"] boolValue] ? @"YES" : @"NO") forKey:@"sadomasochismMasochistic"];
    [request addBody:([[sadoDict valueForKey:@"sadomasochismBothProfile"] boolValue] ? @"YES" : @"NO") forKey:@"sadomasochismBoth"];
    [request addBody:([[sadoDict valueForKey:@"sadomasochismNeitherProfile"] boolValue] ? @"YES" : @"NO") forKey:@"sadomasochismNeither"];
    
    NSDictionary* fetiDict = [[profile getFetishProfile] mutableCopy];
    [request addBody:([[fetiDict valueForKey:@"fetishBDSMProfile"] boolValue] ? @"YES" : @"NO") forKey:@"fetishBDSM"];
    [request addBody:([[fetiDict valueForKey:@"fetishBigCockProfile"] boolValue] ? @"YES" : @"NO") forKey:@"fetishBigCock"];
    [request addBody:([[fetiDict valueForKey:@"fetishSmallCockProfile"] boolValue] ? @"YES" : @"NO") forKey:@"fetishSmallCock"];
    [request addBody:([[fetiDict valueForKey:@"fetishUncutProfile"] boolValue] ? @"YES" : @"NO") forKey:@"fetishUncut"];
    [request addBody:([[fetiDict valueForKey:@"fetishSmellFetishProfile"] boolValue] ? @"YES" : @"NO") forKey:@"fetishSmellFetish"];
    [request addBody:([[fetiDict valueForKey:@"fetishUniformFetishProfile"] boolValue] ? @"YES" : @"NO") forKey:@"fetishUniformFetish"];
    [request addBody:([[fetiDict valueForKey:@"fetishRubberProfile"] boolValue] ? @"YES" : @"NO") forKey:@"fetishRubber"];
    [request addBody:([[fetiDict valueForKey:@"fetishDragProfile"] boolValue] ? @"YES" : @"NO") forKey:@"fetishDrag"];
    [request addBody:([[fetiDict valueForKey:@"fetishFlasherProfile"] boolValue] ? @"YES" : @"NO") forKey:@"fetishFlasher"];
    [request addBody:([[fetiDict valueForKey:@"fetishGangbangProfile"] boolValue] ? @"YES" : @"NO") forKey:@"fetishGangbang"];
    [request addBody:([[fetiDict valueForKey:@"fetishHardcorePlayProfile"] boolValue] ? @"YES" : @"NO") forKey:@"fetishHardcorePlay"];
    [request addBody:([[fetiDict valueForKey:@"fetishPhoneSexProfile"] boolValue] ? @"YES" : @"NO") forKey:@"fetishPhoneSex"];
    [request addBody:([[fetiDict valueForKey:@"fetishTeenLoverProfile"] boolValue] ? @"YES" : @"NO") forKey:@"fetishTeenLover"];
    [request addBody:([[fetiDict valueForKey:@"fetishMatureLoverProfile"] boolValue] ? @"YES" : @"NO") forKey:@"fetishMatureLover"];
    [request addBody:([[fetiDict valueForKey:@"fetishChubbyLoverProfile"] boolValue] ? @"YES" : @"NO") forKey:@"fetishChubbyLover"];
    //
    
    //MyNotification* notice = [[MyNotification alloc] init];
    //[request addBody:([notice getChatNotice] ? @"YES" : @"NO") forKey:@"chatNotice"];
    //[request addBody:([notice getFriendRequestNotice] ? @"YES" : @"NO") forKey:@"friendRequestNotice"];
    //[request addBody:([notice getMatchNotice] ? @"YES" : @"NO") forKey:@"matchNotice"];
    
    BOOL publishEnable = [publish getEnabled];
    
    // Publish All User
    if(publishEnable == NO){
        
        [request addBody:[NSString stringWithFormat:@"%d", 99] forKey:@"ageUpperPublish"];
        [request addBody:[NSString stringWithFormat:@"%d", 18] forKey:@"ageLowerPublish"];
        
        [request addBody:@"YES" forKey:@"sexGayPublish"];
        [request addBody:@"YES" forKey:@"sexBisexPublish"];
        [request addBody:@"YES" forKey:@"sexStraightPublish"];
        
        
        [request addBody:@"YES" forKey:@"raceAsianPublish"];
        [request addBody:@"YES" forKey:@"raceWhitePublish"];
        [request addBody:@"YES" forKey:@"raceBlackPublish"];
        [request addBody:@"YES" forKey:@"raceLatinPublish"];
        [request addBody:@"YES" forKey:@"raceArabPublish"];
        [request addBody:@"YES" forKey:@"racePolynesianPublish"];
        [request addBody:@"YES" forKey:@"raceMixPublish"];
        [request addBody:@"YES" forKey:@"raceEtcPublish"];
        
        /*
        [request addBody:@"YES" forKey:@"styleTwinkPublish"];
        [request addBody:@"YES" forKey:@"styleHunkPublish"];
        [request addBody:@"YES" forKey:@"styleSurferPublish"];
        [request addBody:@"YES" forKey:@"styleHipHopPublish"];
        [request addBody:@"YES" forKey:@"styleThugPublish"];
        [request addBody:@"YES" forKey:@"stylePunkPublish"];
        [request addBody:@"YES" forKey:@"styleWhiteCollarPublish"];
        [request addBody:@"YES" forKey:@"styleHardcoreGayPublish"];
        [request addBody:@"YES" forKey:@"stylePotatoPublish"];
        [request addBody:@"YES" forKey:@"styleBearPublish"];
        [request addBody:@"YES" forKey:@"styleGeekPublish"];
        [request addBody:@"YES" forKey:@"styleChubbyPublish"];
        [request addBody:@"YES" forKey:@"styleBeefyPublish"];
        [request addBody:@"YES" forKey:@"styleBodybuilderPublish"];
        [request addBody:@"YES" forKey:@"styleWellMuscledPublish"];
        [request addBody:@"YES" forKey:@"styleSlimSkinnyPublish"];
        [request addBody:@"YES" forKey:@"styleFemininePublish"];
        [request addBody:@"YES" forKey:@"styleShemalePublish"];
        [request addBody:@"YES" forKey:@"styleEtcPublish"];
        
        
        [request addBody:@"YES" forKey:@"lookingLoverPublish"];
        [request addBody:@"YES" forKey:@"lookingFriendPublish"];
        [request addBody:@"YES" forKey:@"lookingEPalPublish"];
        [request addBody:@"YES" forKey:@"lookingMPalPublish"];
        [request addBody:@"YES" forKey:@"lookingTPalPublish"];
        [request addBody:@"YES" forKey:@"lookingCirclePublish"];
        [request addBody:@"YES" forKey:@"lookingRoommatePublish"];
        [request addBody:@"YES" forKey:@"lookingBPartnerPublish"];
        [request addBody:@"YES" forKey:@"lookingFriendWithBenefitsPublish"];
        */
    }else{
        int ageUpper = [publish getAgeUpper];
        [request addBody:[NSString stringWithFormat:@"%d", ageUpper] forKey:@"ageUpperPublish"];
        
        int ageLower = [publish getAgeLower];
        [request addBody:[NSString stringWithFormat:@"%d", ageLower] forKey:@"ageLowerPublish"];
        
        NSDictionary* sexPublishDict = [[publish getSexuallity] mutableCopy];
        [request  addBody:([[sexPublishDict valueForKey:@"sexGayPublish"] boolValue] ? @"YES" : @"NO") forKey:@"sexGayPublish"];
        [request  addBody:([[sexPublishDict valueForKey:@"sexBisexPublish"] boolValue] ? @"YES" : @"NO") forKey:@"sexBisexPublish"];
        [request  addBody:([[sexPublishDict valueForKey:@"sexStraightPublish"] boolValue] ? @"YES" : @"NO") forKey:@"sexStraightPublish"];
        
        
        NSDictionary* racePublishDict = [[publish getRace] mutableCopy];
        [request  addBody:([[racePublishDict valueForKey:@"raceAsianPublish"] boolValue] ? @"YES" : @"NO") forKey:@"raceAsianPublish"];
        [request  addBody:([[racePublishDict valueForKey:@"raceWhitePublish"] boolValue] ? @"YES" : @"NO") forKey:@"raceWhitePublish"];
        [request  addBody:([[racePublishDict valueForKey:@"raceBlackPublish"] boolValue] ? @"YES" : @"NO") forKey:@"raceBlackPublish"];
        [request  addBody:([[racePublishDict valueForKey:@"raceLatinPublish"] boolValue] ? @"YES" : @"NO") forKey:@"raceLatinPublish"];
        [request  addBody:([[racePublishDict valueForKey:@"raceArabPublish"] boolValue] ? @"YES" : @"NO") forKey:@"raceArabPublish"];
        [request  addBody:([[racePublishDict valueForKey:@"racePolynesianPublish"] boolValue] ? @"YES" : @"NO") forKey:@"racePolynesianPublish"];
        [request  addBody:([[racePublishDict valueForKey:@"raceMixPublish"] boolValue] ? @"YES" : @"NO") forKey:@"raceMixPublish"];
        [request  addBody:([[racePublishDict valueForKey:@"raceEtcPublish"] boolValue] ? @"YES" : @"NO") forKey:@"raceEtcPublish"];
        
        /*
        NSDictionary* stylePublishDict = [[publish getStyle] mutableCopy];
        [request  addBody:([[stylePublishDict valueForKey:@"styleTwinkPublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleTwinkPublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"styleHunkPublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleHunkPublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"styleSurferPublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleSurferPublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"styleHipHopPublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleHipHopPublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"styleThugPublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleThugPublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"stylePunkPublish"] boolValue] ? @"YES" : @"NO") forKey:@"stylePunkPublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"styleWhiteCollarPublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleWhiteCollarPublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"styleHardcoreGayPublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleHardcoreGayPublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"stylePotatoPublish"] boolValue] ? @"YES" : @"NO") forKey:@"stylePotatoPublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"styleBearPublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleBearPublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"styleGeekPublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleGeekPublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"styleChubbyPublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleChubbyPublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"styleBeefyPublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleBeefyPublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"styleBodybuilderPublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleBodybuilderPublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"styleWellMuscledPublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleWellMuscledPublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"styleSlimSkinnyPublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleSlimSkinnyPublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"styleFemininePublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleFemininePublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"styleShemalePublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleShemalePublish"];
        [request  addBody:([[stylePublishDict valueForKey:@"styleEtcPublish"] boolValue] ? @"YES" : @"NO") forKey:@"styleEtcPublish"];
        
        
        NSDictionary* lookingPublishDict = [[publish getLookingFor] mutableCopy];
        [request  addBody:([[lookingPublishDict valueForKey:@"lookingLoverPublish"] boolValue] ? @"YES" : @"NO") forKey:@"lookingLoverPublish"];
        [request  addBody:([[lookingPublishDict valueForKey:@"lookingFriendPublish"] boolValue] ? @"YES" : @"NO") forKey:@"lookingFriendPublish"];
        [request  addBody:([[lookingPublishDict valueForKey:@"lookingEPalPublish"] boolValue] ? @"YES" : @"NO") forKey:@"lookingEPalPublish"];
        [request  addBody:([[lookingPublishDict valueForKey:@"lookingMPalPublish"] boolValue] ? @"YES" : @"NO") forKey:@"lookingMPalPublish"];
        [request  addBody:([[lookingPublishDict valueForKey:@"lookingTPalPublish"] boolValue] ? @"YES" : @"NO") forKey:@"lookingTPalPublish"];
        [request  addBody:([[lookingPublishDict valueForKey:@"lookingCirclePublish"] boolValue] ? @"YES" : @"NO") forKey:@"lookingCirclePublish"];
        [request  addBody:([[lookingPublishDict valueForKey:@"lookingRoommatePublish"] boolValue] ? @"YES" : @"NO") forKey:@"lookingRoommatePublish"];
        [request  addBody:([[lookingPublishDict valueForKey:@"lookingBPartnerPublish"] boolValue] ? @"YES" : @"NO") forKey:@"lookingBPartnerPublish"];
        [request  addBody:([[lookingPublishDict valueForKey:@"lookingFriendWithBenefitsPublish"] boolValue] ? @"YES" : @"NO") forKey:@"lookingFriendWithBenefitsPublish"];
        */
    }
    
    return request;
}

-(void)sendProfile
{
    NSString* method = @"setProfile";
    R9HTTPRequest* request = [self setRequestBodyToProfile:[self createRequest:method]];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            //NSLog(@"%@", responseString);
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheSave_Profile" object:nil userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
        }
        if([responseHeader statusCode] != 200){
            NSMutableDictionary* _userInfo = [NSMutableDictionary dictionary];
            [_userInfo setValue:[NSNumber numberWithInt:[responseHeader statusCode]] forKey:@"HTTP_ERROR"];
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheHTTPError" object:self userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
        }
    }];
    [request startRequest];
}

-(void)sendProfileImage1
{
    NSString* method = @"setProfileImage1";
    R9HTTPRequest* request = [self createRequest:method];
    
    MyPicture* picture = [[MyPicture alloc] init];
    MyProfiles* profile = [[MyProfiles alloc] init];
    /*
     CGSize size;
     size.height = IMAGE_SIZE;
     size.width  = IMAGE_SIZE;
     
     UIImage* image = [ImageResizable imageWithImage:[picture getMyPicture1] scaledToSizeWithSameAspectRatio:size];
     */
    UIImage* image = [picture getMyPicture1];
    NSData *imageData = [[NSData alloc] initWithData:UIImagePNGRepresentation(image)];
    
    NSString* myId = [profile getEmailProfile];
    NSString *fileName = [NSString stringWithFormat:@"icon_%@_%d.png", myId, 1];
    // set image data
    [request setData:imageData withFileName:fileName andContentType:@"image/png" forKey:@"mypicture1"];
    
    [request  addBody:[profile getEmailProfile] forKey:@"email"];
    [request  addBody:[profile getPasswordProfile] forKey:@"password"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            //NSLog(@"%@", responseString);
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheSave_ProfileImageFile" object:nil userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];

        }
        if([responseHeader statusCode] != 200){
            NSMutableDictionary* _userInfo = [NSMutableDictionary dictionary];
            [_userInfo setValue:[NSNumber numberWithInt:[responseHeader statusCode]] forKey:@"HTTP_ERROR"];
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheHTTPError" object:self userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
        }
    }];
    [request startRequest];
}

-(void)sendProfileImage2
{
    NSString* method = @"setProfileImage2";
    R9HTTPRequest* request = [self createRequest:method];
    
    MyPicture* picture = [[MyPicture alloc] init];
    MyProfiles* profile = [[MyProfiles alloc] init];
    
    /*
     CGSize size;
     size.height = IMAGE_SIZE;
     size.width  = IMAGE_SIZE;
     
     UIImage* image = [ImageResizable imageWithImage:[picture getMyPicture2] scaledToSizeWithSameAspectRatio:size];
     */
    UIImage* image = [picture getMyPicture2];
    NSData *imageData = [[NSData alloc] initWithData:UIImagePNGRepresentation(image)];
    
    NSString* myId = [profile getEmailProfile];
    NSString *fileName = [NSString stringWithFormat:@"icon_%@_%d.png", myId, 2];
    // set image data
    [request setData:imageData withFileName:fileName andContentType:@"image/png" forKey:@"mypicture2"];
    [request  addBody:[profile getEmailProfile] forKey:@"email"];
    [request  addBody:[profile getPasswordProfile] forKey:@"password"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            //NSLog(@"%@", responseString);
        }
        if([responseHeader statusCode] != 200){
            NSMutableDictionary* _userInfo = [NSMutableDictionary dictionary];
            [_userInfo setValue:[NSNumber numberWithInt:[responseHeader statusCode]] forKey:@"HTTP_ERROR"];
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheHTTPError" object:self userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
        }
    }];
    [request startRequest];
}

-(void)sendProfileImage3
{
    NSString* method = @"setProfileImage3";
    R9HTTPRequest* request = [self createRequest:method];
    
    MyPicture* picture = [[MyPicture alloc] init];
    MyProfiles* profile = [[MyProfiles alloc] init];
    
    /*
     CGSize size;
     size.height = IMAGE_SIZE;
     size.width  = IMAGE_SIZE;
     
     UIImage* image = [ImageResizable imageWithImage:[picture getMyPicture3] scaledToSizeWithSameAspectRatio:size];
     */
    UIImage* image = [picture getMyPicture3];
    NSData *imageData = [[NSData alloc] initWithData:UIImagePNGRepresentation(image)];
    
    NSString* myId = [profile getEmailProfile];
    NSString *fileName = [NSString stringWithFormat:@"icon_%@_%d.png", myId, 3];
    // set image data
    [request setData:imageData withFileName:fileName andContentType:@"image/png" forKey:@"mypicture3"];
    [request  addBody:[profile getEmailProfile] forKey:@"email"];
    [request  addBody:[profile getPasswordProfile] forKey:@"password"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            //NSLog(@"%@", responseString);
        }
        if([responseHeader statusCode] != 200){
            NSMutableDictionary* _userInfo = [NSMutableDictionary dictionary];
            [_userInfo setValue:[NSNumber numberWithInt:[responseHeader statusCode]] forKey:@"HTTP_ERROR"];
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheHTTPError" object:self userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
        }
    }];
    [request startRequest];
}

-(void)sendProfileImage4
{
    NSString* method = @"setProfileImage4";
    R9HTTPRequest* request = [self createRequest:method];
    
    MyPicture* picture = [[MyPicture alloc] init];
    MyProfiles* profile = [[MyProfiles alloc] init];
    
    /*
     CGSize size;
     size.height = IMAGE_SIZE;
     size.width  = IMAGE_SIZE;
     
     UIImage* image = [ImageResizable imageWithImage:[picture getMyPicture4] scaledToSizeWithSameAspectRatio:size];
     */
    UIImage* image = [picture getMyPicture4];
    NSData *imageData = [[NSData alloc] initWithData:UIImagePNGRepresentation(image)];
    
    NSString* myId = [profile getEmailProfile];
    NSString *fileName = [NSString stringWithFormat:@"icon_%@_%d.png", myId, 4];
    // set image data
    [request setData:imageData withFileName:fileName andContentType:@"image/png" forKey:@"mypicture4"];
    [request  addBody:[profile getEmailProfile] forKey:@"email"];
    [request  addBody:[profile getPasswordProfile] forKey:@"password"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            //NSLog(@"%@", responseString);
        }
        if([responseHeader statusCode] != 200){
            NSMutableDictionary* _userInfo = [NSMutableDictionary dictionary];
            [_userInfo setValue:[NSNumber numberWithInt:[responseHeader statusCode]] forKey:@"HTTP_ERROR"];
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheHTTPError" object:self userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
        }
    }];
    [request startRequest];
}

-(void)sendProfileImage5
{
    NSString* method = @"setProfileImage5";
    R9HTTPRequest* request = [self createRequest:method];
    
    MyPicture* picture = [[MyPicture alloc] init];
    MyProfiles* profile = [[MyProfiles alloc] init];
    
    /*
     CGSize size;
     size.height = IMAGE_SIZE;
     size.width  = IMAGE_SIZE;
     
     UIImage* image = [ImageResizable imageWithImage:[picture getMyPicture5] scaledToSizeWithSameAspectRatio:size];
     */
    UIImage* image = [picture getMyPicture5];
    NSData *imageData = [[NSData alloc] initWithData:UIImagePNGRepresentation(image)];
    
    NSString* myId = [profile getEmailProfile];
    NSString *fileName = [NSString stringWithFormat:@"icon_%@_%d.png", myId, 5];
    // set image data
    [request setData:imageData withFileName:fileName andContentType:@"image/png" forKey:@"mypicture5"];
    [request  addBody:[profile getEmailProfile] forKey:@"email"];
    [request  addBody:[profile getPasswordProfile] forKey:@"password"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            //NSLog(@"%@", responseString);
        }
        if([responseHeader statusCode] != 200){
            NSMutableDictionary* _userInfo = [NSMutableDictionary dictionary];
            [_userInfo setValue:[NSNumber numberWithInt:[responseHeader statusCode]] forKey:@"HTTP_ERROR"];
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheHTTPError" object:self userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
        }
    }];
    [request startRequest];
}


//-(void)sendMyLocation:(NSString *)email password:(NSString *)password latitude:(NSString *)latitude longitude:(NSString *)longitude
-(void)sendMyLocation:(NSString *)email latitude:(NSString *)latitude longitude:(NSString *)longitude
{
    //NSLog(@"Call Send MyLocation");
    NSString* method = @"setLocation";
    R9HTTPRequest* request = [self createRequest:method];
    
    [request addBody:email forKey:@"email"];
    //[request addBody:password forKey:@"password"];
    [request addBody:latitude forKey:@"latitude"];
    [request addBody:longitude forKey:@"longitude"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send location data ok...");
            //NSLog(@"%@", responseString);
        }
        if([responseHeader statusCode] != 200){
            NSMutableDictionary* _userInfo = [NSMutableDictionary dictionary];
            [_userInfo setValue:[NSNumber numberWithInt:[responseHeader statusCode]] forKey:@"HTTP_ERROR"];
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheHTTPError" object:self userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
        }
    }];
    [request startRequest];
}


-(void)sendDeviceId
{
    #if DEBUG
        return;
    #endif
    
    MyProfiles* account = [[MyProfiles alloc] init];
    MyDevice* device = [[MyDevice alloc] init];

    NSString* email = [account getEmailProfile];
    if(email == nil) return;
    //NSString* password = [account getPasswordProfile];
    NSString* deviceId = [device getDeviceId];

    if(deviceId != nil && [deviceId isEqualToString:@""] == NO){

        ////NSLog(@"Call Send MyLocation");
        NSString* method = @"setDevice";
        R9HTTPRequest* request = [self createRequest:method];
        
        [request addBody:email forKey:@"email"];
        [request addBody:deviceId forKey:@"myDevice"];
        [request addBody:@"0" forKey:@"os"];
        
        [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
            if([responseHeader statusCode] == 200){
                //NSLog(@"Send location data ok...");
                //NSLog(@"%@", responseString);
            }
            if([responseHeader statusCode] != 200){
                NSMutableDictionary* _userInfo = [NSMutableDictionary dictionary];
                [_userInfo setValue:[NSNumber numberWithInt:[responseHeader statusCode]] forKey:@"HTTP_ERROR"];
                NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheHTTPError" object:self userInfo:nil];
                [[NSNotificationCenter defaultCenter] postNotification:n];
            }
        }];
        [request startRequest];
    }
}

//-(void)getMyInfo:(NSString *)myId password:(NSString *)password
-(void)getMyInfo:(NSString *)myId
{
    if(myId == nil) return;
    
    NSString* method = @"getMyInfo";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"email"];
    //[request addBody:password forKey:@"password"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            //NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyGetMyInfo" object:jsonArray userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
            
            ////NSLog(@"%@", responseString);
        }
        if([responseHeader statusCode] != 200){
            NSMutableDictionary* _userInfo = [NSMutableDictionary dictionary];
            [_userInfo setValue:[NSNumber numberWithInt:[responseHeader statusCode]] forKey:@"HTTP_ERROR"];
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheHTTPError" object:self userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
        }
    }];
    [request startRequest];
}

-(void)getMasterPassword:(NSString *)myId{
    
    if(myId == nil) return;
    
    NSString* method = @"getMasterPassword";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"email"];
    //[request addBody:password forKey:@"password"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            //NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyGetMyPassword" object:jsonArray userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
            
            ////NSLog(@"%@", responseString);
        }
        if([responseHeader statusCode] != 200){
            NSMutableDictionary* _userInfo = [NSMutableDictionary dictionary];
            [_userInfo setValue:[NSNumber numberWithInt:[responseHeader statusCode]] forKey:@"HTTP_ERROR"];
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheHTTPError" object:self userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
        }
    }];
    [request startRequest];
}

-(void)doNewAccountCheck
{
    MyProfiles* account = [[MyProfiles alloc] init];
    
    NSString* email = [account getEmailProfile];
    NSString* nickName = [account getNickNameProfile];

    if(email == nil) return;
    if(nickName == nil) return;
    
    ////NSLog(@"Call Send MyLocation");
    NSString* method = @"doNewAccountCheck";
    R9HTTPRequest* request = [self createRequest:method];
    
    [request addBody:email forKey:@"email"];
    [request addBody:nickName forKey:@"nickName"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send location data ok...");
            //NSLog(@"%@", responseString);
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheNewAccountCheck" object:responseString userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
        }
        if([responseHeader statusCode] != 200){
            NSMutableDictionary* _userInfo = [NSMutableDictionary dictionary];
            [_userInfo setValue:[NSNumber numberWithInt:[responseHeader statusCode]] forKey:@"HTTP_ERROR"];
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheHTTPError" object:self userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
        }
    }];
    [request startRequest];
    
}

@end
