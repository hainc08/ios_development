//
//  NSObject+CoolioSearch.m
//  Coolio
//
//  Created by hoehoe on 2013/07/04.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "NSObject+CoolioSearch.h"

@implementation NSObject (CoolioSearch)


-(R9HTTPRequest *)setRequestBodyToSearch:request
{
    //dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //dispatch_async(q_global, ^{
    
    MyProfiles* profile = [[MyProfiles alloc] init];
    MyFilter* filter = [[MyFilter alloc] init];
    //MyPublish* publish = [[MyPublish alloc] init];
    
    [request  addBody:[profile getEmailProfile] forKey:@"email"];
    //[request  addBody:[profile getPasswordProfile] forKey:@"password"];
    //[request  addBody:[profile getNickNameProfile] forKey:@"nickname"];
    
    BOOL filterEnabled =  [filter getEnabled];
    if(filterEnabled == YES){
        [request addBody:@"YES" forKey:@"filterEnable"];
        [request addBody:[NSString stringWithFormat:@"%d", [filter getAgeFilter]] forKey:@"age"];
        [request addBody:([filter getAgeFilterHiLow] ? @"Low" : @"Hi") forKey:@"ageHiLow"];
        
        [request  addBody:[NSString stringWithFormat:@"%d", [filter getHeightFilter]] forKey:@"height"];
        [request  addBody:([filter getHeightFilterHiLow] ? @"Low" : @"Hi") forKey:@"heightHiLow"];
        
        [request  addBody:[NSString stringWithFormat:@"%d", [filter getWeightFilter]] forKey:@"weight"];
        [request  addBody:([filter getWeightFilterHiLow] ? @"Low" : @"Hi") forKey:@"weightHiLow"];
        
        NSDictionary* sexDict = [[filter getSexuallityFilter] mutableCopy];
        if([[sexDict valueForKey:@"sexGayFilter"] boolValue] == YES){
            [request  addBody:@"YES"forKey:@"sexGay"];
        }
        if([[sexDict valueForKey:@"sexBisexFilter"] boolValue]  == YES){
            [request  addBody:@"YES" forKey:@"sexBisex"];
        }
        if([[sexDict valueForKey:@"sexStraightFilter"] boolValue] == YES){
            [request  addBody:@"YES" forKey:@"sexStraight"];
        }
        
        
        NSDictionary* raceDict = [[filter getRaceFilter] mutableCopy];
        if([[raceDict valueForKey:@"raceAsianFilter"] boolValue] == YES){
            [request  addBody:@"YES" forKey:@"raceAsian"];
        }
        if([[raceDict valueForKey:@"raceWhiteFilter"] boolValue] == YES){
            [request  addBody:@"YES" forKey:@"raceWhite"];
        }
        if([[raceDict valueForKey:@"raceBlackFilter"] boolValue] == YES){
            [request  addBody:@"YES" forKey:@"raceBlack"];
        }
        if([[raceDict valueForKey:@"raceLatinFilter"] boolValue] == YES){
            [request  addBody:@"YES" forKey:@"raceLatin"];
        }
        if([[raceDict valueForKey:@"raceArabFilter"] boolValue] == YES){
            [request  addBody:@"YES" forKey:@"raceArab"];
        }
        if([[raceDict valueForKey:@"racePolynesianFilter"] boolValue] == YES){
            [request  addBody:@"YES" forKey:@"racePolynesian"];
        }
        if([[raceDict valueForKey:@"raceMixFilter"] boolValue] == YES){
            [request  addBody:@"YES" forKey:@"raceMix"];
        }
        if([[raceDict valueForKey:@"raceEtcFilter"] boolValue] == YES){
            [request  addBody:@"YES" forKey:@"raceEtc"];
        }
        
        
        NSDictionary* styleDict = [[filter getStyleFilter] mutableCopy];
        if([[styleDict valueForKey:@"styleTwinkFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"styleTwink"];
        }
        if([[styleDict valueForKey:@"styleHunkFilter"] boolValue]  == YES){
            [request addBody:@"YES" forKey:@"styleHunk"];
        }
        if([[styleDict valueForKey:@"styleSurferFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"styleSurfer"];
        }
        if([[styleDict valueForKey:@"styleHipHopFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"styleHipHop"];
        }
        if([[styleDict valueForKey:@"styleThugFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"styleThug"];
        }
        if([[styleDict valueForKey:@"stylePunkFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"stylePunk"];
        }
        if([[styleDict valueForKey:@"styleWhiteCollarFilter"] boolValue]  == YES){
            [request addBody:@"YES" forKey:@"styleWhiteCollar"];
        }
        if([[styleDict valueForKey:@"styleHardcoreGayFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"styleHardcoreGay"];
        }
        if([[styleDict valueForKey:@"stylePotatoFilter"] boolValue]  == YES){
            [request addBody:@"YES" forKey:@"stylePotato"];
        }
        if([[styleDict valueForKey:@"styleBearFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"styleBear"];
        }
        if([[styleDict valueForKey:@"styleGeekFilter"] boolValue]  == YES){
            [request addBody:@"YES" forKey:@"styleGeek"];
        }
        if([[styleDict valueForKey:@"raceLatinFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"raceLatin"];
        }
        if([[styleDict valueForKey:@"styleChubbyFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"styleChubby"];
        }
        if([[styleDict valueForKey:@"styleBeefyFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"styleBeefy"];
        }
        if([[styleDict valueForKey:@"styleBodybuilderFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"styleBodybuilder"];
        }
        if([[styleDict valueForKey:@"styleWellMuscledFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"styleWellMuscled"];
        }
        if([[styleDict valueForKey:@"styleSlimSkinnyFilter"] boolValue]  == YES){
            [request addBody:@"YES" forKey:@"styleSlimSkinny"];
        }
        if([[styleDict valueForKey:@"styleFeminineFilter"] boolValue]  == YES){
            [request addBody:@"YES" forKey:@"styleFeminine"];
        }
        if([[styleDict valueForKey:@"styleShemaleFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"styleShemale"];
        }
        if([[styleDict valueForKey:@"styleEtcFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"styleEtc"];
        }
        
        
        NSDictionary* lookingDict = [[filter getLookingForFilter] mutableCopy];
        if([[lookingDict valueForKey:@"lookingLoverFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"lookingLover"];
        }
        if([[lookingDict valueForKey:@"lookingFriendFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"lookingFriend"];
        }
        if([[lookingDict valueForKey:@"lookingEPalFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"lookingEPal"];
        }
        if([[lookingDict valueForKey:@"lookingMPalFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"lookingMPal"];
        }
        if([[lookingDict valueForKey:@"lookingTPalFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"lookingTPal"];
        }
        if([[lookingDict valueForKey:@"lookingCircleFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"lookingCircle"];
        }
        if([[lookingDict valueForKey:@"lookingRoommateFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"lookingRoommate"];
        }
        if([[lookingDict valueForKey:@"lookingBPartnerFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"lookingBPartner"];
        }
        if([[lookingDict valueForKey:@"lookingFriendWithBenefitsFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"lookingFriendWithBenefits"];
        }

        
        NSDictionary* bodyShapeDict = [[filter getBodyShapeFilter] mutableCopy];
        if([[bodyShapeDict valueForKey:@"bodyShapeSecretFilter"] boolValue]  == YES){
            [request addBody:@"YES" forKey:@"bodyShapeSecret"];
        }
        if([[bodyShapeDict valueForKey:@"bodyShapeSlimFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"bodyShapeSlim"];
        }
        if([[bodyShapeDict valueForKey:@"bodyShapeAverageFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"bodyShapeAverage"];
        }
        if([[bodyShapeDict valueForKey:@"bodyShapeChubbyFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"bodyShapeChubby"];
        }
        if([[bodyShapeDict valueForKey:@"bodyShapeVeryChubbyFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"bodyShapeVeryChubby"];
        }
        
        
        NSDictionary* muscleDict = [[filter getMuscleFilter] mutableCopy];
        if([[muscleDict valueForKey:@"muscleSecretFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"muscleSecret"];
        }
        if([[muscleDict valueForKey:@"muscleDelicateFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"muscleDelicate"];
        }
        if([[muscleDict valueForKey:@"muscleAverageFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"muscleAverage"];
        }
        if([[muscleDict valueForKey:@"muscleWell-builtFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"muscleWellBuilt"];
        }
        if([[muscleDict valueForKey:@"muscleBodybuilderFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"muscleBodybuilder"];
        }
        
        
        NSDictionary* bodyHairDict = [[filter getBodyHairFilter] mutableCopy];
        if([[bodyHairDict valueForKey:@"bodyHairSecretFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"bodyHairSecret"];
        }
        if([[bodyHairDict valueForKey:@"bodyHairSmoothFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"bodyHairSmooth"];
        }
        if([[bodyHairDict valueForKey:@"bodyHairAverageFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"bodyHairAverage"];
        }
        if([[bodyHairDict valueForKey:@"bodyHairHairyFilter"] boolValue] == YES){
            [request addBody: @"YES" forKey:@"bodyHairHairy"];
        }
        
        
        NSDictionary* hairStyleDict = [[filter getHairStyleFilter] mutableCopy];
        if([[hairStyleDict valueForKey:@"hairStyleSecretFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"hairStyleSecret"];
        }
        if([[hairStyleDict valueForKey:@"hairStyleShavedHeadFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"hairStyleShavedHead"];
        }
        if([[hairStyleDict valueForKey:@"hairStyleShortHairFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"hairStyleShortHair"];
        }
        if([[hairStyleDict valueForKey:@"hairStyleAverageFilter"] boolValue]  == YES){
            [request addBody:@"YES" forKey:@"hairStyleAverage"];
        }
        if([[hairStyleDict valueForKey:@"hairStyleSemiLongHairFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"hairStyleSemiLongHair"];
        }
        if([[hairStyleDict valueForKey:@"hairStyleLongHairFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"hairStyleLongHair"];
        }
        if([[hairStyleDict valueForKey:@"hairStyleUniqueStyleFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"hairStyleUniqueStyle"];
        }
        
        
        NSDictionary* hairColorDict = [[filter getHairColorFilter] mutableCopy];
        if([[hairColorDict valueForKey:@"hairColorSecretFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"hairColorSecret"];
        }
        if([[hairColorDict valueForKey:@"hairColorBlackFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"hairColorBlack"];
        }
        if([[hairColorDict valueForKey:@"hairColorBrownFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"hairColorBrown"];
        }
        if([[hairColorDict valueForKey:@"hairColorBlondFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"hairColorBlond"];
        }
        if([[hairColorDict valueForKey:@"hairColorWhiteFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"hairColorWhite"];
        }
        if([[hairColorDict valueForKey:@"hairColorUniqueColorFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"hairColorUniqueColor"];
        }
        
        
        NSDictionary* otherCharacterDict = [[filter getOtherCharacteristicsFilter] mutableCopy];
        if([[otherCharacterDict valueForKey:@"otherCharacteristicsMustacheFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"otherCharacteristicsMustache"];
        }
        if([[otherCharacterDict valueForKey:@"otherCharacteristicsTanningSkinFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"otherCharacteristicsTanningSkin"];
        }
        if([[otherCharacterDict valueForKey:@"otherCharacteristicsGlassesFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"otherCharacteristicsGlasses"];
        }
        if([[otherCharacterDict valueForKey:@"otherCharacteristicsPiarceFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"otherCharacteristicsPiarce"];
        }
        if([[otherCharacterDict valueForKey:@"otherCharacteristicsTatooFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"otherCharacteristicsTatoo"];
        }
        
        
        NSDictionary* personalityDict = [[filter getPersonalityFilter] mutableCopy];
        if([[personalityDict valueForKey:@"personalityCheerfulFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalityCheerful"];
        }
        if([[personalityDict valueForKey:@"personalitySeriousFilter"] boolValue]  == YES){
            [request addBody:@"YES" forKey:@"personalitySerious"];
        }
        if([[personalityDict valueForKey:@"personalityFunnyFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalityFunny"];
        }
        if([[personalityDict valueForKey:@"personalityTakeTheLeadFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalityTakeTheLead"];
        }
        if([[personalityDict valueForKey:@"personalitySociableFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalitySociableFilter"];
        }
        if([[personalityDict valueForKey:@"personalityFollowFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalityFollow"];
        }
        if([[personalityDict valueForKey:@"personalityFlashyFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalityFlashy"];
        }
        if([[personalityDict valueForKey:@"personalityActBasedOnEmotionsFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalityActBasedOnEmotions"];
        }
        if([[personalityDict valueForKey:@"personalityBoldFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalityBold"];
        }
        if([[personalityDict valueForKey:@"personalityWantStimulationFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalityWantStimulation"];
        }
        if([[personalityDict valueForKey:@"personalityRealismFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalityRealism"];
        }
        if([[personalityDict valueForKey:@"personalityOptimisticFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalityOptimistic"];
        }
        if([[personalityDict valueForKey:@"personalityMasculineFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalityMasculine"];
        }
        if([[personalityDict valueForKey:@"personalityStrongPersonFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalityStrongPerson"];
        }
        if([[personalityDict valueForKey:@"personalityWantToProtectFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalityWantToProtect"];
        }
        if([[personalityDict valueForKey:@"personalityIndoorsyFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalityIndoorsy"];
        }
        if([[personalityDict valueForKey:@"personalityBookishTypeFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalityBookishType"];
        }
        if([[personalityDict valueForKey:@"personalityLoveToTalkAboutFilter"] boolValue]  == YES){
            [request addBody:@"YES" forKey:@"personalityLoveToTalkAbout"];
        }
        if([[personalityDict valueForKey:@"personalityLookingToMeetFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"personalityLookingToMeet"];
        }
        
        
        NSDictionary* gayCareerDict = [[filter getGayCareerFilter] mutableCopy];
        if([[gayCareerDict valueForKey:@"gayCareerSecretFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"gayCareerSecret"];
        }
        if([[gayCareerDict valueForKey:@"gayCareerBeginnerFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"gayCareerBeginner"];
        }
        if([[gayCareerDict valueForKey:@"gayCareerAverageFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"gayCareerAverage"];
        }
        if([[gayCareerDict valueForKey:@"gayCareerExpertFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"gayCareerExpertFilter"];
        }
        
        NSDictionary* comingOutDict = [[filter getComingoutFilter] mutableCopy];
        if([[comingOutDict valueForKey:@"comingoutSecretFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"comingoutSecret"];
        }
        if([[comingOutDict valueForKey:@"comingoutNobodyKnowsFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"comingoutNobodyKnows"];
        }
        if([[comingOutDict valueForKey:@"comingoutSomeoneCloseKnowFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"comingoutSomeoneCloseKnow"];
        }
        if([[comingOutDict valueForKey:@"comingoutMostPeopleKnowFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"comingoutMostPeopleKnow"];
        }
        
        NSDictionary* loveStyleDict = [[filter getLoveStylesFilter] mutableCopy];
        if([[loveStyleDict valueForKey:@"loveStylesSecretFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"loveStylesSecret"];
        }
        if([[loveStyleDict valueForKey:@"loveStylesCloseFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"loveStylesClose"];
        }
        if([[loveStyleDict valueForKey:@"loveStylesAverageFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"loveStylesAverage"];
        }
        if([[loveStyleDict valueForKey:@"loveStylesSimpleFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"loveStylesSimple"];
        }
        if([[loveStyleDict valueForKey:@"loveStylesUpToyouFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"loveStylesUpToyou"];
        }
        
        NSDictionary* expectDict = [[filter getExpectFilter] mutableCopy];
        if([[expectDict valueForKey:@"expectSecretFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"expectSecret"];
        }
        if([[expectDict valueForKey:@"expectpersonalityFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"expectpersonality"];
        }
        if([[expectDict valueForKey:@"expectAppearanceFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"expectAppearance"];
        }
        if([[expectDict valueForKey:@"expectAtmosphereFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"expectAtmosphere"];
        }
        if([[expectDict valueForKey:@"expectBodyFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"expectBody"];
        }
        if([[expectDict valueForKey:@"expectSexFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"expectSex"];
        }
        if([[expectDict valueForKey:@"expectInterestFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"expectInterest"];
        }
        if([[expectDict valueForKey:@"expectCircumstanceFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"expectCircumstance"];
        }
        if([[expectDict valueForKey:@"expectFinanceFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"expectFinance"];
        }
        if([[expectDict valueForKey:@"expectDistanceFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"expectDistance"];
        }
        
        
        NSDictionary* jobDict = [[filter getJobFilter] mutableCopy];
        if([[jobDict valueForKey:@"jobSecretFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobSecret"];
        }
        if([[jobDict valueForKey:@"jobStudentFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobStudent"];
        }
        if([[jobDict valueForKey:@"jobBetweenJobsFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobBetweenJobs"];
        }
        if([[jobDict valueForKey:@"jobOfficeWorkFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobOfficeWork"];
        }
        if([[jobDict valueForKey:@"jobServicesFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobServices"];
        }
        if([[jobDict valueForKey:@"jobManufacturingFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobManufacturing"];
        }
        if([[jobDict valueForKey:@"jobComputerFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobComputer"];
        }
        if([[jobDict valueForKey:@"jobLanguageFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobLanguage"];
        }
        if([[jobDict valueForKey:@"jobAssetsFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobAssets"];
        }
        if([[jobDict valueForKey:@"jobLawFilter"] boolValue]  == YES){
            [request addBody:@"YES" forKey:@"jobLaw"];
        }
        if([[jobDict valueForKey:@"jobMediaFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobMedia"];
        }
        if([[jobDict valueForKey:@"jobPublishingFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobPublishing"];
        }
        if([[jobDict valueForKey:@"jobDomesticFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobDomestic"];
        }
        if([[jobDict valueForKey:@"jobMedicalProfessionFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobMedicalProfession"];
        }
        if([[jobDict valueForKey:@"jobHealthFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobHealth"];
        }
        if([[jobDict valueForKey:@"jobArchitectureFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobArchitecture"];
        }
        if([[jobDict valueForKey:@"jobCreativeProfessionFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobCreativeProfession"];
        }
        if([[jobDict valueForKey:@"jobCookingFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobCooking"];
        }
        if([[jobDict valueForKey:@"jobVehicleFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobVehicle"];
        }
        if([[jobDict valueForKey:@"jobTravelFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobTravel"];
        }
        if([[jobDict valueForKey:@"jobBeautyFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobBeauty"];
        }
        if([[jobDict valueForKey:@"jobEntertainmentFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobEntertainment"];
        }
        if([[jobDict valueForKey:@"jobReligiousProfessionFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobReligiousProfession"];
        }
        if([[jobDict valueForKey:@"jobCeremonialOccasionsFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobCeremonialOccasions"];
        }
        if([[jobDict valueForKey:@"jobNatureFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobNature"];
        }
        if([[jobDict valueForKey:@"jobSportsFilter"] boolValue] ){
            [request addBody:@"YES" forKey:@"jobSports"];
        }
        if([[jobDict valueForKey:@"jobSexIndustryFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"jobSexIndustry"];
        }
        
        NSDictionary* homeDict = [[filter getLivingFilter] mutableCopy];
        if([[homeDict valueForKey:@"livingSecretFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"livingSecret"];
        }
        if([[homeDict valueForKey:@"livingAloneFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"livingAlone"];
        }
        if([[homeDict valueForKey:@"livingwithFamilyFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"livingwithFamily"];
        }
        if([[homeDict valueForKey:@"livingwithFriendsorLoversFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"livingwithFriendsorLovers"];
        }
        
        NSDictionary* lifePolDict = [[filter getLifePolicyFilter] mutableCopy];
        if([[lifePolDict valueForKey:@"lifePolicyVegetarianFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"lifePolicyVegetarian"];
        }
        if([[lifePolDict valueForKey:@"lifePolicyNoSmokingFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"lifePolicyNoSmoking"];
        }
        if([[lifePolDict valueForKey:@"lifePolicyNoDrinkingFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"lifePolicyNoDrinking"];
        }
        if([[lifePolDict valueForKey:@"lifePolicyNoGamblingFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"lifePolicyNoGambling"];
        }
        if([[lifePolDict valueForKey:@"lifePolicyNoSexFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"lifePolicyNoSex"];
        }
        
        NSDictionary* sexPosiDict = [[filter getSexPositionFilter] mutableCopy];
        if([[sexPosiDict valueForKey:@"sexPositionSecretFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"sexPositionSecret"];
        }
        if([[sexPosiDict valueForKey:@"sexPositionTopFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"sexPositionTop"];
        }
        if([[sexPosiDict valueForKey:@"sexPositionBottomFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"sexPositionBottom"];
        }
        if([[sexPosiDict valueForKey:@"sexPositionVersatileFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"sexPositionVersatile"];
        }
        
        
        [request addBody:[NSString stringWithFormat:@"%d", [filter getPenisSizeFilter]] forKey:@"penisSize"];
        [request addBody:([filter getPenisSizeHiLowFilter] ? @"Low":@"Hi") forKey:@"penisSizeHiLow"];
        
        
        NSDictionary* penisThiDict = [[filter getPenisThicknessFilter] mutableCopy];
        if([[penisThiDict valueForKey:@"penisThicknessSecretFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"penisThicknessSecret"];
        }
        if([[penisThiDict valueForKey:@"penisThicknessSlenderFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"penisThicknessSlender"];
        }
        if([[penisThiDict valueForKey:@"penisThicknessAverageFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"penisThicknessAverage"];
        }
        if([[penisThiDict valueForKey:@"penisThicknessPlumpFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"penisThicknessPlump"];
        }
        if([[penisThiDict valueForKey:@"penisThicknessExtraThickFilter"] boolValue] ){
            [request addBody:@"YES" forKey:@"penisThicknessExtraThick"];
        }
        
        NSDictionary* phimosisDict = [[filter getPhimosisFilter] mutableCopy];
        if([[phimosisDict valueForKey:@"phimosisSecretFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"phimosisSecret"];
        }
        if([[phimosisDict valueForKey:@"phimosisCutFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"phimosisCut"];
        }
        if([[phimosisDict valueForKey:@"phimosisUncutFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"phimosisUncut"];
        }
        if([[phimosisDict valueForKey:@"phimosisOverhangFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"phimosisOverhang"];
        }
        
        NSDictionary* sadoDict = [[filter getSadomasochismFilter] mutableCopy];
        if([[sadoDict valueForKey:@"sadomasochismSecretFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"sadomasochismSecret"];
        }
        if([[sadoDict valueForKey:@"sadomasochismSadisticFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"sadomasochismSadistic"];
        }
        if([[sadoDict valueForKey:@"sadomasochismMasochisticFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"sadomasochismMasochistic"];
        }
        if([[sadoDict valueForKey:@"sadomasochismBothFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"sadomasochismBoth"];
        }
        if([[sadoDict valueForKey:@"sadomasochismNeitherFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"sadomasochismNeither"];
        }
        
        NSDictionary* fetiDict = [[filter getFetishFilter] mutableCopy];
        if([[fetiDict valueForKey:@"fetishBDSMFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"fetishBDSM"];
        }
        if([[fetiDict valueForKey:@"fetishBigCockFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"fetishBigCock"];
        }
        if([[fetiDict valueForKey:@"fetishSmallCockFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"fetishSmallCock"];
        }
        if([[fetiDict valueForKey:@"fetishUncutFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"fetishUncut"];
        }
        if([[fetiDict valueForKey:@"fetishSmellFetishFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"fetishSmellFetish"];
        }
        if([[fetiDict valueForKey:@"fetishUniformFetishFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"fetishUniformFetish"];
        }
        if([[fetiDict valueForKey:@"fetishRubberFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"fetishRubber"];
        }
        if([[fetiDict valueForKey:@"fetishDragFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"fetishDrag"];
        }
        if([[fetiDict valueForKey:@"fetishFlasherFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"fetishFlasher"];
        }
        if([[fetiDict valueForKey:@"fetishGangbangFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"fetishGangbang"];
        }
        if([[fetiDict valueForKey:@"fetishHardcorePlayFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"fetishHardcorePlay"];
        }
        if([[fetiDict valueForKey:@"fetishPhoneSexFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"fetishPhoneSex"];
        }
        if([[fetiDict valueForKey:@"fetishTeenLoverFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"fetishTeenLover"];
        }
        if([[fetiDict valueForKey:@"fetishMatureLoverFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"fetishMatureLoverFilter"];
        }
        if([[fetiDict valueForKey:@"fetishChubbyLoverFilter"] boolValue] == YES){
            [request addBody:@"YES" forKey:@"fetishChubbyLoverFilter"];
        }

    }
    
    [request addBody:[profile getAgeProfile] forKey:@"myAge"];
    
    NSDictionary* sexProfileDict = [[profile getSexuallityProfile] mutableCopy];
    
    if([[sexProfileDict valueForKey:@"sexGayProfile"] boolValue] == YES){
        [request addBody:@"Gay" forKey:@"mySexuallity"];
    }
    if([[sexProfileDict valueForKey:@"sexBisexProfile"] boolValue] == YES){
        [request addBody:@"Bisexuality" forKey:@"mySexuallity"];
    }
    if([[sexProfileDict valueForKey:@"sexStraightProfile"] boolValue] == YES){
        [request addBody:@"Straight" forKey:@"mySexuallity"];
    }
    
    NSDictionary* raceProfileDict = [[profile getRaceProfile] mutableCopy];
    
    if([[raceProfileDict valueForKey:@"raceAsianProfile"] boolValue] == YES){
        [request  addBody:@"Asian" forKey:@"myRace"];
    }
    if([[raceProfileDict valueForKey:@"raceWhiteProfile"] boolValue] == YES){
        [request  addBody:@"White" forKey:@"myRace"];
    }
    if([[raceProfileDict valueForKey:@"raceBlackProfile"] boolValue] == YES){
        [request  addBody:@"Black" forKey:@"myRace"];
    }
    if([[raceProfileDict valueForKey:@"raceLatinProfile"] boolValue] == YES){
        [request  addBody:@"Latin" forKey:@"myRace"];
    }
    if([[raceProfileDict valueForKey:@"raceArabProfile"] boolValue] == YES){
        [request  addBody:@"Arab" forKey:@"myRace"];
    }
    if([[raceProfileDict valueForKey:@"racePolynesianProfile"] boolValue] == YES){
        [request  addBody:@"Polynesian" forKey:@"myRace"];
    }
    if([[raceProfileDict valueForKey:@"raceMixProfile"] boolValue] == YES){
        [request  addBody:@"Mix" forKey:@"myRace"];
    }
    if([[raceProfileDict valueForKey:@"raceEtcProfile"] boolValue] == YES){
        [request  addBody:@"Etc" forKey:@"myRace"];
    }
    
    
    /*
    NSDictionary* styleProfileDict = [[profile getStyleProfile] mutableCopy];
    if([[styleProfileDict valueForKey:@"styleTwinkProfile"] boolValue] == YES){
        [request addBody:@"YES" forKey:@"myStyleTwink"];
    }
    if([[styleProfileDict valueForKey:@"styleHunkProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStyleHunk"];
    }
    if([[styleProfileDict valueForKey:@"styleSurferProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStyleSurfer"];
    }
    if([[styleProfileDict valueForKey:@"styleHipHopProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStyleHipHop"];
    }
    if([[styleProfileDict valueForKey:@"styleThugProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStyleThug"];
    }
    if([[styleProfileDict valueForKey:@"stylePunkProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStylePunk"];
    }
    if([[styleProfileDict valueForKey:@"styleWhiteCollarProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStyleWhiteCollar"];
    }
    if([[styleProfileDict valueForKey:@"styleHardcoreGayProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStyleHardcoreGay"];
    }
    if([[styleProfileDict valueForKey:@"stylePotatoProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStylePotato"];
    }
    if([[styleProfileDict valueForKey:@"styleBearProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStyleBear"];
    }
    if([[styleProfileDict valueForKey:@"styleGeekProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStyleGeek"];
    }
    if([[styleProfileDict valueForKey:@"styleChubbyProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStyleChubby"];
    }
    if([[styleProfileDict valueForKey:@"styleBeefyProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStyleBeefy"];
    }
    if([[styleProfileDict valueForKey:@"styleBodybuilderProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStyleBodybuilder"];
    }
    if([[styleProfileDict valueForKey:@"styleWellMuscledProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStyleWellMuscled"];
    }
    if([[styleProfileDict valueForKey:@"styleSlimSkinnyProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStyleSlimSkinny"];
    }
    if([[styleProfileDict valueForKey:@"styleFeminineProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStyleFeminine"];
    }
    if([[styleProfileDict valueForKey:@"styleShemaleProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStyleShemale"];
    }
    if([[styleProfileDict valueForKey:@"styleEtcProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myStyleEtc"];
    }
    
    
    NSDictionary* lookingProfileDict = [[profile getLookingForProfile] mutableCopy];
    if([[lookingProfileDict valueForKey:@"lookingLoverProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myLookingLover"];
    }
    if([[lookingProfileDict valueForKey:@"lookingFriendProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myLookingFriend"];
    }
    if([[lookingProfileDict valueForKey:@"lookingEPalProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myLookingEPal"];
    }
    if([[lookingProfileDict valueForKey:@"lookingMPalProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myLookingMPal"];
    }
    if([[lookingProfileDict valueForKey:@"lookingTPalProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myLookingTPal"];
    }
    if([[lookingProfileDict valueForKey:@"lookingCircleProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myLookingCircle"];
    }
    if([[lookingProfileDict valueForKey:@"lookingRoommateProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myLookingRoommate"];
    }
    if([[lookingProfileDict valueForKey:@"lookingBPartnerProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myLookingBPartner"];
    }
    if([[lookingProfileDict valueForKey:@"lookingFriendWithBenefitsProfile"] boolValue] == YES){
        [request  addBody:@"YES" forKey:@"myLookingFriendWithBenefits"];
    }
    */
    
    return request;
}


-(void)getUsers{
    NSString* method = @"getUser";
    R9HTTPRequest* request = [self setRequestBodyToSearch:[self createRequest:method]];
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyGetUsers" object:responseString userInfo:nil];
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

-(void)getUsers:(NSString *)searchText
{
    NSString* method = @"getUser";
    R9HTTPRequest* request = [self setRequestBodyToSearch:[self createRequest:method]];
    [request addBody:searchText forKey:@"searchText"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyGetUsers" object:responseString userInfo:nil];
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

-(void)getUsersNextPage:(int)index
{
    NSString* method = @"getUser";
    R9HTTPRequest* request = [self setRequestBodyToSearch:[self createRequest:method]];
    [request addBody:[NSString stringWithFormat:@"%d", index] forKey:@"offsetValue"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyGetUsers" object:responseString userInfo:nil];
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

-(void)getUsersNew
{
    NSString* method = @"getUser";
    R9HTTPRequest* request = [self setRequestBodyToSearch:[self createRequest:method]];
    [request addBody:@"YES" forKey:@"newUser"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyGetUsers" object:responseString userInfo:nil];
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

-(void)getUsersOnline
{
    NSString* method = @"getUser";
    R9HTTPRequest* request = [self setRequestBodyToSearch:[self createRequest:method]];
    [request addBody:@"YES" forKey:@"online"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyGetUsers" object:responseString userInfo:nil];
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

/*
-(void)getUsersOne:(NSString *)nickName
{
    NSString* method = @"getUserOne";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:nickName forKey:@"nickName"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyGetUserOneNickName" object:responseString userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
            ////NSLog(@"%@", responseString);
        }else{
            @try{
                ////NSLog(@"%@", responseString);
                //NSNotification* n = [NSNotification notificationWithName:@"ToNotifyError" object:nil userInfo:nil];
                //[[NSNotificationCenter defaultCenter] postNotification:n];
            }@catch (NSException* e) {
                //NSLog(@"%@", e.description);
            }
            ////NSLog(@"%@", responseString);
        }
    }];
    [request startRequest];
}
*/

@end
