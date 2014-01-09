//
//  UserProfile.m
//  Coolio
//
//  Created by hoehoe on 2013/08/15.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "UserProfile.h"

@implementation UserProfile
@synthesize userProfileInfo = _userProfileInfo;

-(id)init
{
    if(self == nil){
        self = [super init];
    }
    
    return self;
}

-(NSString *)getEmail{
    return [self.userProfileInfo valueForKey:@"email"];
}
-(NSString *)getNickName{
    return [self.userProfileInfo valueForKey:@"nickname"];
}
-(int)getAge{
    return [[self.userProfileInfo valueForKey:@"age"] intValue];
}
-(int)getHeight{
    return [[self.userProfileInfo valueForKey:@"height"] intValue];
}
-(int)getWeight{
    return [[self.userProfileInfo valueForKey:@"weight"] intValue];
}

-(NSString *)getSexuallity{
    NSArray* sexArray = @[[self.userProfileInfo valueForKey:@"sexGay"], [self.userProfileInfo valueForKey:@"sexBisex"], [self.userProfileInfo valueForKey:@"sexStraight"]];
    
    NSString* sexuallity = @"";
    for(int i=0; i<sexArray.count; i++){
        NSString* sexStr = sexArray[i];
        if(sexStr == nil){
            continue;
        }
        if([sexStr boolValue] == YES){
            switch (i) {
                case 0:
                    sexuallity = NSLocalizedString(@"sexGay", nil);
                    break;
                case 1:
                    sexuallity = NSLocalizedString(@"sexBisex", nil);
                    break;
                case 2:
                    sexuallity = NSLocalizedString(@"sexStraight", nil);
                    break;
                default:
                    break;
            }
        }
    }
    return sexuallity;
}

-(NSString *)getRace{
    NSString* race = @"";
    NSArray* raceArray = @[[self.userProfileInfo valueForKey:@"raceAsian"],
                          [self.userProfileInfo valueForKey:@"raceWhite"],
                          [self.userProfileInfo valueForKey:@"raceBlack"],
                          [self.userProfileInfo valueForKey:@"raceLatin"],
                          [self.userProfileInfo valueForKey:@"raceArab"],
                          [self.userProfileInfo valueForKey:@"racePolynesian"],
                          [self.userProfileInfo valueForKey:@"raceMix"],
                          [self.userProfileInfo valueForKey:@"raceEtc"]];
    
    
    for(int i=0; i<[raceArray count]; i++){
        NSString* raceString = raceArray[i];
        if(raceString == nil){
            continue;
        }
        if([raceString boolValue] == YES){
            switch (i) {
                case 0:
                    race = NSLocalizedString(@"raceAsian", nil);
                    break;
                case 1:
                    race = NSLocalizedString(@"raceWhite", nil);
                    break;
                case 2:
                    race = NSLocalizedString(@"raceBlack", nil);
                    break;
                case 3:
                    race = NSLocalizedString(@"raceLatin", nil);
                    break;
                case 4:
                    race = NSLocalizedString(@"raceArab", nil);
                    break;
                case 5:
                    race = NSLocalizedString(@"racePolynesian", nil);
                    break;
                case 6:
                    race = NSLocalizedString(@"raceMix", nil);
                    break;
                case 7:
                    race = NSLocalizedString(@"raceEtc", nil);
                    break;
                default:
                    break;
            }
        }
    }
    return race;
}

-(NSString *)getCountry{
    NSString* country = @"";

    NSString* plistFile;
    if([currentLanguage isEqualToString:@"ja"]){
        plistFile = [[NSBundle mainBundle] pathForResource:@"CountryData-ja" ofType:@"plist"];
    }else{
        plistFile = [[NSBundle mainBundle] pathForResource:@"CountryData-en" ofType:@"plist"];
    }
    
    NSArray* countryArray = [NSArray arrayWithContentsOfFile:plistFile];
    NSString* countryValue = [NSString stringWithFormat:@"%d", [[self.userProfileInfo valueForKey:@"country"] intValue]];

    if(countryValue != nil &&  ![countryValue isEqualToString:@""]){
        NSDictionary* countryValueDict =  countryArray[[[countryArray valueForKeyPath:@"id"] indexOfObject:countryValue]];
        country = [countryValueDict valueForKey:@"name"];
    }
    return country;
}

-(NSString *)getStyle
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSArray* styleArray = @[[self.userProfileInfo valueForKey:@"styleTwink"],
                           [self.userProfileInfo valueForKey:@"styleHunk"],
                           [self.userProfileInfo valueForKey:@"styleSurfer"],
                           [self.userProfileInfo valueForKey:@"styleHipHop"],
                           [self.userProfileInfo valueForKey:@"styleThug"],
                           [self.userProfileInfo valueForKey:@"stylePunk"],
                           [self.userProfileInfo valueForKey:@"styleWhiteCollar"],
                           [self.userProfileInfo valueForKey:@"styleHardcoreGay"],
                           [self.userProfileInfo valueForKey:@"stylePotato"],
                           [self.userProfileInfo valueForKey:@"styleBear"],
                           [self.userProfileInfo valueForKey:@"styleGeek"],
                           [self.userProfileInfo valueForKey:@"styleChubby"],
                           [self.userProfileInfo valueForKey:@"styleBeefy"],
                           [self.userProfileInfo valueForKey:@"styleBodybuilder"],
                           [self.userProfileInfo valueForKey:@"styleWellMuscled"],
                           [self.userProfileInfo valueForKey:@"styleSlimSkinny"],
                           [self.userProfileInfo valueForKey:@"styleFeminine"],
                           [self.userProfileInfo valueForKey:@"styleShemale"],
                           [self.userProfileInfo valueForKey:@"styleEtc"]];
    
    NSMutableString* mString = [NSMutableString string];
    @try{
        for(int i=0; i<[styleArray count]; i++){
            NSString* styleString = styleArray[i];
            if(styleString == nil){
                continue;
            }
            if(styleString != nil && [styleString boolValue] == YES){
                switch (i) {
                    case 0: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleTwink", nil)]; break;
                    case 1: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleHunk", nil)]; break;
                    case 2: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleSurfer", nil)]; break;
                    case 3: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleHipHop", nil)]; break;
                    case 4: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleThug", nil)]; break;
                    case 5: [mString appendFormat:@"%@\n", NSLocalizedString(@"stylePunk", nil)]; break;
                    case 6: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleWhiteCollar", nil)]; break;
                    case 7: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleHardcoreGay", nil)]; break;
                    case 8: [mString appendFormat:@"%@\n", NSLocalizedString(@"stylePotato", nil)]; break;
                    case 9: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleBear", nil)]; break;
                    case 10: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleGeek", nil)]; break;
                    case 11: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleChubby", nil)]; break;
                    case 12: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleBeefy", nil)]; break;
                    case 13: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleBodybuilder", nil)]; break;
                    case 14: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleWellMuscled", nil)]; break;
                    case 15: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleSlimSkinny", nil)]; break;
                    case 16: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleFeminine", nil)]; break;
                    case 17: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleShemale", nil)]; break;
                    case 18: [mString appendFormat:@"%@\n", NSLocalizedString(@"styleEtc", nil)]; break;
                        
                    default:
                        break;
                }
            }
        }
    }@catch (NSException* e) {
        //NSLog(@"%@", e.description);
    }

    return mString;
}


-(NSString *)getLookingFor
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSArray* lookingArray =  @[[self.userProfileInfo valueForKey:@"lookingLover"],
                              [self.userProfileInfo valueForKey:@"lookingFriend"],
                              [self.userProfileInfo valueForKey:@"lookingEPal"],
                              [self.userProfileInfo valueForKey:@"lookingMPal"],
                              [self.userProfileInfo valueForKey:@"lookingTPal"],
                              [self.userProfileInfo valueForKey:@"lookingCircle"],
                              [self.userProfileInfo valueForKey:@"lookingRoommate"],
                              [self.userProfileInfo valueForKey:@"lookingBPartner"],
                              [self.userProfileInfo valueForKey:@"lookingFriendWithBenefits"]];
    
    NSMutableString* mString = [NSMutableString string];
    for(int i=0; i<[lookingArray count]; i++){
        NSString* lookingString = lookingArray[i];
        if(![lookingString isEqual:[NSNull null]] && [lookingString boolValue] == YES){
            switch (i) {
                case 0: [mString appendFormat:@"%@\n", NSLocalizedString(@"lookingLover", nil)]; break;
                case 1: [mString appendFormat:@"%@\n", NSLocalizedString(@"lookingFriend", nil)]; break;
                case 2: [mString appendFormat:@"%@\n", NSLocalizedString(@"lookingEPal", nil)]; break;
                case 3: [mString appendFormat:@"%@\n", NSLocalizedString(@"lookingMPal", nil)]; break;
                case 4: [mString appendFormat:@"%@\n", NSLocalizedString(@"lookingTPal", nil)]; break;
                case 5: [mString appendFormat:@"%@\n", NSLocalizedString(@"lookingCircle", nil)]; break;
                case 6: [mString appendFormat:@"%@\n", NSLocalizedString(@"lookingRoommate", nil)]; break;
                case 7: [mString appendFormat:@"%@\n", NSLocalizedString(@"lookingBPartner", nil)]; break;
                case 8: [mString appendFormat:@"%@\n", NSLocalizedString(@"lookingFriendWithBenefits", nil)]; break;
                    
                default:
                    break;
            }
        }
    }
    
    return mString;
}

-(NSString *)getComment
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    
    NSString* comment = [self.userProfileInfo valueForKey:@"comment"];
    //NSLog(@"%@", comment);
    if(comment == nil && [comment isEqual:[NSNull null]]){
        comment = @"";
    }
    return comment;
}

-(NSString *)getBodyShape
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSString* mString = [NSString string];
    NSArray* bodyShapeArray = @[[self.userProfileInfo valueForKey:@"bodyShapeSecret"],
                               [self.userProfileInfo valueForKey:@"bodyShapeSlim"],
                               [self.userProfileInfo valueForKey:@"bodyShapeAverage"],
                               [self.userProfileInfo valueForKey:@"bodyShapeChubby"],
                               [self.userProfileInfo valueForKey:@"bodyShapeVeryChubby"]];
    
    for(int i=0; i<[bodyShapeArray count]; i++){
        NSString* bodyShapeString = bodyShapeArray[i];
        if(bodyShapeString != nil && [bodyShapeString boolValue] == YES){
            switch (i) {
                case 0: mString = NSLocalizedString(@"bodyShapeSecret", nil); break;
                case 1: mString = NSLocalizedString(@"bodyShapeSlim", nil); break;
                case 2: mString = NSLocalizedString(@"bodyShapeAverage", nil); break;
                case 3: mString = NSLocalizedString(@"bodyShapeChubby", nil); break;
                case 4: mString = NSLocalizedString(@"bodyShapeVeryChubby", nil); break;
                    
                default:
                    break;
            }
        }
    }
    return mString;
}
-(NSString *)getMuscle
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSString* mString = [NSString string];
    NSArray* muscleArray = @[[self.userProfileInfo valueForKey:@"muscleSecret"],
                            [self.userProfileInfo valueForKey:@"muscleDelicate"],
                            [self.userProfileInfo valueForKey:@"muscleAverage"],
                            [self.userProfileInfo valueForKey:@"muscleWellBuilt"],
                            [self.userProfileInfo valueForKey:@"muscleBodybuilder"]];
    
    for(int i=0; i<[muscleArray count]; i++){
        NSString* muscleString = muscleArray[i];
        if(muscleString != nil && [muscleString boolValue] == YES){
            switch (i) {
                case 0: mString = NSLocalizedString(@"muscleSecret", nil); break;
                case 1: mString = NSLocalizedString(@"muscleDelicate", nil); break;
                case 2: mString = NSLocalizedString(@"muscleAverage", nil); break;
                case 3: mString = NSLocalizedString(@"muscleWellBuilt", nil); break;
                case 4: mString = NSLocalizedString(@"muscleBodybuilder", nil); break;
                    
                default:
                    break;
            }
        }
    }
    
    return mString;
}

-(NSString *)getBodyHair
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSString* mString = [NSString string];
    NSArray* bodyHairArray = @[[self.userProfileInfo valueForKey:@"bodyHairSecret"],
                              [self.userProfileInfo valueForKey:@"bodyHairSmooth"],
                              [self.userProfileInfo valueForKey:@"bodyHairAverage"],
                              [self.userProfileInfo valueForKey:@"bodyHairHairy"]];
    
    for(int i=0; i<[bodyHairArray count]; i++){
        NSString* bodyHairString = bodyHairArray[i];
        
        if(bodyHairString != nil && [bodyHairString boolValue] == YES){
            switch (i) {
                case 0: mString = NSLocalizedString(@"bodyHairSecret", nil); break;
                case 1: mString = NSLocalizedString(@"bodyHairSmooth", nil); break;
                case 2: mString = NSLocalizedString(@"bodyHairAverage", nil); break;
                case 3: mString = NSLocalizedString(@"bodyHairHairy", nil); break;
                    
                default:
                    break;
            }
        }
    }
    return mString;

}

-(NSString *)getHairStyle
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSString* mString = [NSString string];
    NSArray* hairStyleArray = @[[self.userProfileInfo valueForKey:@"hairStyleSecret"],
                               [self.userProfileInfo valueForKey:@"hairStyleShavedHead"],
                               [self.userProfileInfo valueForKey:@"hairStyleShortHair"],
                               [self.userProfileInfo valueForKey:@"hairStyleAverage"],
                               [self.userProfileInfo valueForKey:@"hairStyleSemiLongHair"],
                               [self.userProfileInfo valueForKey:@"hairStyleLongHair"],
                               [self.userProfileInfo valueForKey:@"hairStyleUniqueStyle"]];
    
    for(int i=0; i<[hairStyleArray count]; i++){
        NSString* hairStyleString = hairStyleArray[i];
        if(hairStyleString == nil){
            continue;
        }
        if(hairStyleString != nil && [hairStyleString boolValue] == YES){
            switch (i) {
                case 0: mString = NSLocalizedString(@"hairStyleSecret", nil); break;
                case 1: mString = NSLocalizedString(@"hairStyleShavedHead", nil);  break;
                case 2: mString = NSLocalizedString(@"hairStyleShortHair", nil);  break;
                case 3: mString = NSLocalizedString(@"hairStyleAverage", nil);  break;
                case 4: mString = NSLocalizedString(@"hairStyleSemiLongHair", nil);  break;
                case 5: mString = NSLocalizedString(@"hairStyleLongHair", nil);  break;
                case 6: mString = NSLocalizedString(@"hairStyleUniqueStyle", nil);  break;
                default:
                    break;
            }
        }
    }
    return mString;
}

-(NSString *)getHairColor
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSString* mString = [NSString string];
    NSArray* hairColorArray = @[[self.userProfileInfo valueForKey:@"hairColorSecret"],
                               [self.userProfileInfo valueForKey:@"hairColorBlack"],
                               [self.userProfileInfo valueForKey:@"hairColorBrown"],
                               [self.userProfileInfo valueForKey:@"hairColorBlond"],
                               [self.userProfileInfo valueForKey:@"hairColorWhite"],
                               [self.userProfileInfo valueForKey:@"hairColorUniqueColor"]];
    
    for(int i=0; i<[hairColorArray count]; i++){
        NSString* hairColorString = hairColorArray[i];
        if(hairColorString == nil){
            continue;
        }
        if(hairColorString != nil && [hairColorString boolValue] == YES){
            switch (i) {
                case 0: mString = NSLocalizedString(@"hairColorSecret", nil); break;
                case 1: mString = NSLocalizedString(@"hairColorBlack", nil);  break;
                case 2: mString = NSLocalizedString(@"hairColorBrown", nil);  break;
                case 3: mString = NSLocalizedString(@"hairColorBlond", nil);  break;
                case 4: mString = NSLocalizedString(@"hairColorWhite", nil);  break;
                case 5: mString = NSLocalizedString(@"hairColorUniqueColor", nil);  break;
                default:
                    break;
            }
        }
    }
    
    return mString;
}
-(NSString *)getOtherCharacteristics
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSMutableString* mString = [NSMutableString string];
    NSArray* otherCharacteristicsArray = @[[self.userProfileInfo valueForKey:@"otherCharacteristicsMustache"],
                                          [self.userProfileInfo valueForKey:@"otherCharacteristicsTanningSkin"],
                                          [self.userProfileInfo valueForKey:@"otherCharacteristicsGlasses"],
                                          [self.userProfileInfo valueForKey:@"otherCharacteristicsPiarce"],
                                          [self.userProfileInfo valueForKey:@"otherCharacteristicsTatoo"]];
    
    for(int i=0; i<[otherCharacteristicsArray count]; i++){
        NSString* otherCharacteristicsString = otherCharacteristicsArray[i];
        if(otherCharacteristicsString == nil){
            continue;
        }
        if(otherCharacteristicsString != nil && [otherCharacteristicsString boolValue] == YES){
            switch (i) {
                case 0: [mString appendFormat:@"%@\n", NSLocalizedString(@"otherCharacteristicsMustache", nil)]; break;
                case 1: [mString appendFormat:@"%@\n", NSLocalizedString(@"otherCharacteristicsTanningSkin", nil)]; break;
                case 2: [mString appendFormat:@"%@\n", NSLocalizedString(@"otherCharacteristicsGlasses", nil)]; break;
                case 3: [mString appendFormat:@"%@\n", NSLocalizedString(@"otherCharacteristicsPiarce", nil)]; break;
                case 4: [mString appendFormat:@"%@\n", NSLocalizedString(@"otherCharacteristicsTatoo", nil)]; break;

                /*
                case 0: [mString appendFormat:@"%@\n", @"otherCharacteristicsMustache"]; break;
                case 1: [mString appendFormat:@"%@\n", @"otherCharacteristicsTanningSkin"]; break;
                case 2: [mString appendFormat:@"%@\n", @"otherCharacteristicsGlasses"]; break;
                case 3: [mString appendFormat:@"%@\n", @"otherCharacteristicsPiarce"]; break;
                case 4: [mString appendFormat:@"%@\n", @"otherCharacteristicsTatoo"]; break;
                */
                default:
                    break;
            }
        }
    }
    
    return mString;
}

-(NSString *)getGayCareer{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSString* mString = [NSString string];
    
    NSArray* gayCareerArray = @[[self.userProfileInfo valueForKey:@"gayCareerSecret"],
                               [self.userProfileInfo valueForKey:@"gayCareerBeginner"],
                               [self.userProfileInfo valueForKey:@"gayCareerAverage"],
                               [self.userProfileInfo valueForKey:@"gayCareerExpert"]];
    
    for(int i=0; i<gayCareerArray.count; i++){
        NSString* gayCareerString = gayCareerArray[i];
        if(gayCareerString == nil){
            continue;
        }
        if([gayCareerString boolValue] == YES){
            switch (i) {
                case 0: mString = NSLocalizedString(@"gayCareerSecret", nil);  break;
                case 1: mString = NSLocalizedString(@"gayCareerBeginner", nil);  break;
                case 2: mString = NSLocalizedString(@"gayCareerAverage", nil);  break;
                case 3: mString = NSLocalizedString(@"gayCareerExpert", nil);  break;
                default:
                    break;
            }
        }
    }
    return mString;
}

-(NSString *)getComingOut{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSString* mString = [NSString string];

    NSArray* comingOutArray = @[[self.userProfileInfo valueForKey:@"comingoutSecret"],
                               [self.userProfileInfo valueForKey:@"comingoutNobodyKnows"],
                               [self.userProfileInfo valueForKey:@"comingoutSomeoneCloseKnow"],
                               [self.userProfileInfo valueForKey:@"comingoutMostPeopleKnow"]];
    
    for(int i=0; i<comingOutArray.count; i++){
        NSString* comingOutString = comingOutArray[i];
        if(comingOutString == nil){
            continue;
        }
        if([comingOutString boolValue] == YES){
            switch (i) {
                case 0: mString = NSLocalizedString(@"comingoutSecret", nil);  break;
                case 1: mString = NSLocalizedString(@"comingoutNobodyKnows", nil);  break;
                case 2: mString = NSLocalizedString(@"comingoutSomeoneCloseKnow", nil);  break;
                case 3: mString = NSLocalizedString(@"comingoutMostPeopleKnow", nil);  break;
                default:
                    break;
            }
        }
    }
    return mString;
}

-(NSString *)getLoveStyle{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSString* mString = [NSString string];
    
    NSArray* loveStyleArray = @[[self.userProfileInfo valueForKey:@"loveStylesSecret"],
                               [self.userProfileInfo valueForKey:@"loveStylesClose"],
                               [self.userProfileInfo valueForKey:@"loveStylesAverage"],
                               [self.userProfileInfo valueForKey:@"loveStylesSimple"],
                               [self.userProfileInfo valueForKey:@"loveStylesUpToyou"]];
    
    for(int i=0; i<loveStyleArray.count; i++){
        NSString* loveStyleString = loveStyleArray[i];
        if(loveStyleString == nil){
            continue;
        }
        if([loveStyleString boolValue] == YES){
            switch (i) {
                case 0: mString = NSLocalizedString(@"loveStylesSecret", nil);  break;
                case 1: mString = NSLocalizedString(@"loveStylesClose", nil);  break;
                case 2: mString = NSLocalizedString(@"loveStylesAverage", nil);  break;
                case 3: mString = NSLocalizedString(@"loveStylesSimple", nil);  break;
                case 4: mString = NSLocalizedString(@"loveStylesUpToyou", nil);  break;
                default:
                    break;
            }
        }
    }
    return mString;
}

-(NSString *)getExpect
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSString* mString = [NSString string];
    
    NSArray* expectArray = @[[self.userProfileInfo valueForKey:@"expectSecret"],
                               [self.userProfileInfo valueForKey:@"expectpersonality"],
                               [self.userProfileInfo valueForKey:@"expectAppearance"],
                               [self.userProfileInfo valueForKey:@"expectAtmosphere"],
                               [self.userProfileInfo valueForKey:@"expectBody"],
                               [self.userProfileInfo valueForKey:@"expectSex"],
                               [self.userProfileInfo valueForKey:@"expectInterest"],
                               [self.userProfileInfo valueForKey:@"expectCircumstance"],
                               [self.userProfileInfo valueForKey:@"expectFinance"],
                               [self.userProfileInfo valueForKey:@"expectDistance"]];
    
    for(int i=0; i<expectArray.count; i++){
        NSString* expectString = expectArray[i];
        if(expectString == nil){
            continue;
        }
        if([expectString boolValue] == YES){
            switch (i) {
                case 0: mString = NSLocalizedString(@"expectSecret", nil);  break;
                case 1: mString = NSLocalizedString(@"expectpersonality", nil);  break;
                case 2: mString = NSLocalizedString(@"expectAppearance", nil);  break;
                case 3: mString = NSLocalizedString(@"expectAtmosphere", nil);  break;
                case 4: mString = NSLocalizedString(@"expectBody", nil);  break;
                case 5: mString = NSLocalizedString(@"expectSex", nil);  break;
                case 6: mString = NSLocalizedString(@"expectInterest", nil);  break;
                case 7: mString = NSLocalizedString(@"expectCircumstance", nil);  break;
                case 8: mString = NSLocalizedString(@"expectFinance", nil);  break;
                case 9: mString = NSLocalizedString(@"expectDistance", nil);  break;
                default:
                    break;
            }
        }
    }
    return mString;
}

-(NSString *)getJob
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSString* mString = [NSString string];
    
    NSArray* jobArray = @[[self.userProfileInfo valueForKey:@"jobSecret"],
                               [self.userProfileInfo valueForKey:@"jobStudent"],
                               [self.userProfileInfo valueForKey:@"jobBetweenJobs"],
                               [self.userProfileInfo valueForKey:@"jobOfficeWork"],
                               [self.userProfileInfo valueForKey:@"jobServices"],
                               [self.userProfileInfo valueForKey:@"jobManufacturing"],
                               [self.userProfileInfo valueForKey:@"jobComputer"],
                               [self.userProfileInfo valueForKey:@"jobLanguage"],
                               [self.userProfileInfo valueForKey:@"jobAssets"],
                               [self.userProfileInfo valueForKey:@"jobLaw"],
                               [self.userProfileInfo valueForKey:@"jobMedia"],
                               [self.userProfileInfo valueForKey:@"jobPublishing"],
                               [self.userProfileInfo valueForKey:@"jobDomestic"],
                               [self.userProfileInfo valueForKey:@"jobMedicalProfession"],
                               [self.userProfileInfo valueForKey:@"jobHealth"],
                               [self.userProfileInfo valueForKey:@"jobArchitecture"],
                               [self.userProfileInfo valueForKey:@"jobCreativeProfession"],
                               [self.userProfileInfo valueForKey:@"jobCooking"],
                               [self.userProfileInfo valueForKey:@"jobVehicle"],
                               [self.userProfileInfo valueForKey:@"jobTravel"],
                               [self.userProfileInfo valueForKey:@"jobBeauty"],
                               [self.userProfileInfo valueForKey:@"jobEntertainment"],
                               [self.userProfileInfo valueForKey:@"jobReligiousProfession"],
                               [self.userProfileInfo valueForKey:@"jobCeremonialOccasions"],
                               [self.userProfileInfo valueForKey:@"jobNature"],
                               [self.userProfileInfo valueForKey:@"jobSports"],
                               [self.userProfileInfo valueForKey:@"jobSexIndustry"]];
    
    for(int i=0; i<jobArray.count; i++){
        NSString* jobString = jobArray[i];
        if(jobString == nil){
            continue;
        }
        if([jobString boolValue] == YES){
            switch (i) {
                case 0: mString = NSLocalizedString(@"jobSecret", nil);  break;
                case 1: mString = NSLocalizedString(@"jobStudent", nil);  break;
                case 2: mString = NSLocalizedString(@"jobBetweenJobs", nil);  break;
                case 3: mString = NSLocalizedString(@"jobOfficeWork", nil);  break;
                case 4: mString = NSLocalizedString(@"jobServices", nil);  break;
                case 5: mString = NSLocalizedString(@"jobManufacturing", nil);  break;
                case 6: mString = NSLocalizedString(@"jobComputer", nil);  break;
                case 7: mString = NSLocalizedString(@"jobLanguage", nil);  break;
                case 8: mString = NSLocalizedString(@"jobAssets", nil);  break;
                case 9: mString = NSLocalizedString(@"jobLaw", nil);  break;
                case 10: mString = NSLocalizedString(@"jobMedia", nil);  break;
                case 11: mString = NSLocalizedString(@"jobPublishing", nil);  break;
                case 12: mString = NSLocalizedString(@"jobDomestic", nil);  break;
                case 13: mString = NSLocalizedString(@"jobMedicalProfession", nil);  break;
                case 14: mString = NSLocalizedString(@"jobHealth", nil);  break;
                case 15: mString = NSLocalizedString(@"jobArchitecture", nil);  break;
                case 16: mString = NSLocalizedString(@"jobCreativeProfession", nil);  break;
                case 17: mString = NSLocalizedString(@"jobCooking", nil);  break;
                case 18: mString = NSLocalizedString(@"jobVehicle", nil);  break;
                case 19: mString = NSLocalizedString(@"jobTravel", nil);  break;
                case 20: mString = NSLocalizedString(@"jobBeauty", nil);  break;
                case 21: mString = NSLocalizedString(@"jobEntertainment", nil);  break;
                case 22: mString = NSLocalizedString(@"jobReligiousProfession", nil);  break;
                case 23: mString = NSLocalizedString(@"jobCeremonialOccasions", nil);  break;
                case 24: mString = NSLocalizedString(@"jobNature", nil);  break;
                case 25: mString = NSLocalizedString(@"jobSports", nil);  break;
                case 26: mString = NSLocalizedString(@"jobSexIndustry", nil);  break;
                    
                default:
                    break;
            }
        }
    }
    return mString;
}

-(NSString *)getLiving
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSString* mString = [NSString string];
    
    NSArray* livingArray = @[[self.userProfileInfo valueForKey:@"livingSecret"],
                               [self.userProfileInfo valueForKey:@"livingAlone"],
                               [self.userProfileInfo valueForKey:@"livingwithFamily"],
                               [self.userProfileInfo valueForKey:@"livingwithFriendsorLovers"]];
    
    for(int i=0; i<livingArray.count; i++){
        NSString* livingString = livingArray[i];
        if(livingString == nil){
            continue;
        }
        if([livingString boolValue] == YES){
            switch (i) {
                case 0: mString = NSLocalizedString(@"livingSecret", nil);  break;
                case 1: mString = NSLocalizedString(@"livingAlone", nil);  break;
                case 2: mString = NSLocalizedString(@"livingwithFamily", nil);  break;
                case 3: mString = NSLocalizedString(@"livingwithFriendsorLovers", nil);  break;
                default:
                    break;
            }
        }
    }
    return mString;
}

-(NSString *)getLifePolicy
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSMutableString* mString = [NSMutableString string];
    
    NSArray* lifePolicyArray = @[[self.userProfileInfo valueForKey:@"lifePolicyVegetarian"],
                               [self.userProfileInfo valueForKey:@"lifePolicyNoSmoking"],
                               [self.userProfileInfo valueForKey:@"lifePolicyNoDrinking"],
                               [self.userProfileInfo valueForKey:@"lifePolicyNoGambling"],
                               [self.userProfileInfo valueForKey:@"lifePolicyNoSex"]];
    
    for(int i=0; i<lifePolicyArray.count; i++){
        NSString* lifePolicyString = lifePolicyArray[i];
        if(lifePolicyString == nil){
            continue;
        }
        if([lifePolicyString boolValue] == YES){
            switch (i) {
                case 0: [mString appendFormat:@"%@\n", NSLocalizedString(@"lifePolicyVegetarian", nil)];  break;
                case 1: [mString appendFormat:@"%@\n", NSLocalizedString(@"lifePolicyNoSmoking", nil)];  break;
                case 2: [mString appendFormat:@"%@\n", NSLocalizedString(@"lifePolicyNoDrinking", nil)];  break;
                case 3: [mString appendFormat:@"%@\n", NSLocalizedString(@"lifePolicyNoGambling", nil)];  break;
                case 4: [mString appendFormat:@"%@\n", NSLocalizedString(@"lifePolicyNoSex", nil)];  break;
                default:
                    break;
            }
        }
    }
    return mString;
}

-(NSString *)getSexPosition
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSString* mString = [NSString string];
    
    NSArray* sexPositionArray = @[[self.userProfileInfo valueForKey:@"sexPositionSecret"],
                               [self.userProfileInfo valueForKey:@"sexPositionTop"],
                               [self.userProfileInfo valueForKey:@"sexPositionBottom"],
                               [self.userProfileInfo valueForKey:@"sexPositionVersatile"]];
    
    for(int i=0; i<sexPositionArray.count; i++){
        NSString* sexPositionString = sexPositionArray[i];
        if(sexPositionString == nil){
            continue;
        }
        if([sexPositionString boolValue] == YES){
            switch (i) {
                case 0: mString = NSLocalizedString(@"sexPositionSecret", nil);  break;
                case 1: mString = NSLocalizedString(@"sexPositionTop", nil);  break;
                case 2: mString = NSLocalizedString(@"sexPositionBottom", nil);  break;
                case 3: mString = NSLocalizedString(@"sexPositionVersatile", nil);  break;
                default:
                    break;
            }
        }
    }
    return mString;
}

-(NSString *)getPSize
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSString* pSize = nil;
    if(![[self.userProfileInfo valueForKey:@"penisSize"] isEqual:[NSNull null]]){
        int p = [[self.userProfileInfo valueForKey:@"penisSize"] intValue];
        pSize = [NSString stringWithFormat:@"%d", p];
    }else{
        pSize = @"";
    }
    return pSize;
}

-(NSString *)getPenisThickness
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSString* mString = [NSString string];
    
    NSArray* penisThicknessArray = @[[self.userProfileInfo valueForKey:@"penisThicknessSecret"],
                               [self.userProfileInfo valueForKey:@"penisThicknessSlender"],
                               [self.userProfileInfo valueForKey:@"penisThicknessAverage"],
                               [self.userProfileInfo valueForKey:@"penisThicknessPlump"],
                               [self.userProfileInfo valueForKey:@"penisThicknessExtraThick"]];
    
    for(int i=0; i<penisThicknessArray.count; i++){
        NSString* penisThicknessString = penisThicknessArray[i];
        if(penisThicknessString == nil){
            continue;
        }
        if([penisThicknessString boolValue] == YES){
            switch (i) {
                case 0: mString = NSLocalizedString(@"penisThicknessSecret", nil);  break;
                case 1: mString = NSLocalizedString(@"penisThicknessSlender", nil);  break;
                case 2: mString = NSLocalizedString(@"penisThicknessAverage", nil);  break;
                case 3: mString = NSLocalizedString(@"penisThicknessPlump", nil);  break;
                case 4: mString = NSLocalizedString(@"penisThicknessExtraThick", nil);  break;
                default:
                    break;
            }
        }
    }
    return mString;
}

-(NSString *)getPhimosis
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSString* mString = [NSString string];
    
    NSArray* phimosisArray = @[[self.userProfileInfo valueForKey:@"phimosisSecret"],
                               [self.userProfileInfo valueForKey:@"phimosisCut"],
                               [self.userProfileInfo valueForKey:@"phimosisUncut"],
                               [self.userProfileInfo valueForKey:@"phimosisOverhang"]];
    
    for(int i=0; i<phimosisArray.count; i++){
        NSString* phimosisString = phimosisArray[i];
        if(phimosisString == nil){
            continue;
        }
        if([phimosisString boolValue] == YES){
            switch (i) {
                case 0: mString = NSLocalizedString(@"phimosisSecret", nil);  break;
                case 1: mString = NSLocalizedString(@"phimosisCut", nil);  break;
                case 2: mString = NSLocalizedString(@"phimosisUncut", nil);  break;
                case 3: mString = NSLocalizedString(@"phimosisOverhang", nil);  break;
                default:
                    break;
            }
        }
    }
    return mString;
}

-(NSString *)getSadomasochism
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSString* mString = [NSString string];
    
    NSArray* sadomasochismArray = @[[self.userProfileInfo valueForKey:@"sadomasochismSecret"],
                               [self.userProfileInfo valueForKey:@"sadomasochismSadistic"],
                               [self.userProfileInfo valueForKey:@"sadomasochismMasochistic"],
                               [self.userProfileInfo valueForKey:@"sadomasochismBoth"],
                               [self.userProfileInfo valueForKey:@"sadomasochismNeither"]];
    
    for(int i=0; i<sadomasochismArray.count; i++){
        NSString* sadomasochismString = sadomasochismArray[i];
        if(sadomasochismString == nil){
            continue;
        }
        if([sadomasochismString boolValue] == YES){
            switch (i) {
                case 0: mString = NSLocalizedString(@"sadomasochismSecret", nil);  break;
                case 1: mString = NSLocalizedString(@"sadomasochismSadistic", nil);  break;
                case 2: mString = NSLocalizedString(@"sadomasochismMasochistic", nil);  break;
                case 3: mString = NSLocalizedString(@"sadomasochismBoth", nil);  break;
                case 4: mString = NSLocalizedString(@"sadomasochismNeither", nil);  break;
                default:
                    break;
            }
        }
    }
    return mString;
}

-(NSString *)getFetish
{
    if(self.userProfileInfo == nil){
        return @"";
    }
    NSMutableString* mString = [NSMutableString string];
    
        NSArray* fetishArray = @[[self.userProfileInfo valueForKey:@"fetishBDSM"],
                                 [self.userProfileInfo valueForKey:@"fetishBigCock"],
                                 [self.userProfileInfo valueForKey:@"fetishSmallCock"],
                                 [self.userProfileInfo valueForKey:@"fetishUncut"],
                                 [self.userProfileInfo valueForKey:@"fetishSmellFetish"],
                                 [self.userProfileInfo valueForKey:@"fetishUniformFetish"],
                                 [self.userProfileInfo valueForKey:@"fetishRubber"],
                                 [self.userProfileInfo valueForKey:@"fetishDrag"],
                                 [self.userProfileInfo valueForKey:@"fetishFlasher"],
                                 [self.userProfileInfo valueForKey:@"fetishGangbang"],
                                 [self.userProfileInfo valueForKey:@"fetishHardcorePlay"],
                                 [self.userProfileInfo valueForKey:@"fetishPhoneSex"],
                                 [self.userProfileInfo valueForKey:@"fetishTeenLover"],
                                 [self.userProfileInfo valueForKey:@"fetishMatureLover"],
                                 [self.userProfileInfo valueForKey:@"fetishChubbyLover"]];
        if(fetishArray == nil){
            return @"";
        }
        for(int i=0; i<fetishArray.count; i++){
            NSString* fetishString = fetishArray[i];
            if(fetishString == nil){
                continue;
            }
            //if(fetishString != nil)
            if([fetishString boolValue] == YES){
                switch (i) {
                    case 0: [mString appendFormat:@"%@\n", NSLocalizedString(@"fetishBDSM", nil)];  break;
                    case 1: [mString appendFormat:@"%@\n",  NSLocalizedString(@"fetishBigCock", nil)];  break;
                    case 2: [mString appendFormat:@"%@\n",  NSLocalizedString(@"fetishSmallCock", nil)];  break;
                    case 3: [mString appendFormat:@"%@\n",  NSLocalizedString(@"fetishUncut", nil)];  break;
                    case 4: [mString appendFormat:@"%@\n",  NSLocalizedString(@"fetishSmellFetish", nil)];  break;
                    case 5: [mString appendFormat:@"%@\n",  NSLocalizedString(@"fetishUniformFetish", nil)];  break;
                    case 6: [mString appendFormat:@"%@\n",  NSLocalizedString(@"fetishRubber", nil)];  break;
                    case 7: [mString appendFormat:@"%@\n",  NSLocalizedString(@"fetishDrag", nil)];  break;
                    case 8: [mString appendFormat:@"%@\n",  NSLocalizedString(@"fetishFlasher", nil)];  break;
                    case 9: [mString appendFormat:@"%@\n", NSLocalizedString(@"fetishGangbang", nil)];  break;
                    case 10: [mString appendFormat:@"%@\n",  NSLocalizedString(@"fetishHardcorePlay", nil)];  break;
                    case 11: [mString appendFormat:@"%@\n",  NSLocalizedString(@"fetishPhoneSex", nil)];  break;
                    case 12: [mString appendFormat:@"%@\n",  NSLocalizedString(@"fetishTeenLover", nil)];  break;
                    case 13: [mString appendFormat:@"%@\n",  NSLocalizedString(@"fetishMatureLover", nil)];  break;
                    case 14: [mString appendFormat:@"%@\n",  NSLocalizedString(@"fetishChubbyLover", nil)];  break;
                        
                    default:
                        break;
                }
            }
        }
    return mString;
}

-(float)getP0{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityCheerful"] intValue]];
}
-(float)getP1{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalitySerious"] intValue]];
}
-(float)getP2{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityFunny"] intValue]];
}
-(float)getP3{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityTakeTheLead"] intValue]];
}
-(float)getP4{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalitySociable"] intValue]];
}
-(float)getP5{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityFollow"] intValue]];
}
-(float)getP6{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityFlashy"] intValue]];
}
-(float)getP7{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityActBasedOnEmotions"] intValue]];
}
-(float)getP8{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityBold"] intValue]];
}
-(float)getP9{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityWantStimulation"] intValue]];
}
-(float)getP10{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityRealism"] intValue]];
}
-(float)getP11{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityOptimistic"] intValue]];
}
-(float)getP12{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityMasculine"] intValue]];
}
-(float)getP13{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityStrongPerson"] intValue]];
}
-(float)getP14{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityWantToProtect"] intValue]];
}
-(float)getP15{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityIndoorsy"] intValue]];
}
-(float)getP16{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityBookishType"] intValue] ];
}
-(float)getP17{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityLoveToTalkAbout"] intValue]];
}
-(float)getP18{
    return [self personalityValue:[[self.userProfileInfo valueForKey:@"personalityLookingToMeet"] intValue]];
}

-(float)personalityValue:(int)value{
    float retFloatValue = 0.0f;
    switch (value) {
        case 0:
            retFloatValue = 0.0f;
            break;
        case 1:
            retFloatValue = 0.25f;
            break;
        case 2:
            retFloatValue = 0.5f;
            break;
        case 3:
            retFloatValue = 1.0f;
            break;
        default:
            break;
    }
    return retFloatValue;
}

-(NSString *)getUpdated_at{ return [self.userProfileInfo valueForKey:@"updated_at"]; }
-(NSString *)getLatitude{return [self.userProfileInfo valueForKey:@"latitude"];}
-(NSString *)getLongitude{return [self.userProfileInfo valueForKey:@"longitude"];}







-(NSString *)getTableViewFormatValues
{
    NSString* age = [self didChangeUnitValue_Age:[self getAge]];
    NSString* height = [self didChangeUnitValue_Height:[self getHeight]];
    NSString* weight = [self didChangeUnitValue_Weight:[self getWeight]];
    NSString* lookingFor = [self getLookingFor_OneLine];

    
    
    NSMutableString* mString = [NSMutableString string];
    [mString appendFormat:NSLocalizedString(@"TBL_FORMAT_PROFILE", nil), age, height, weight];
    [mString appendString:@"\n"];
    [mString appendString:lookingFor];
    
    //NSLog(@"getTableViewFormatValues: %@", mString);
    
    return mString;
}

-(NSString *)getLookingFor_OneLine
{
    NSArray* lookingArray =  @[[self.userProfileInfo valueForKey:@"lookingLover"],
                              [self.userProfileInfo valueForKey:@"lookingFriend"],
                              [self.userProfileInfo valueForKey:@"lookingEPal"],
                              [self.userProfileInfo valueForKey:@"lookingMPal"],
                              [self.userProfileInfo valueForKey:@"lookingTPal"],
                              [self.userProfileInfo valueForKey:@"lookingCircle"],
                              [self.userProfileInfo valueForKey:@"lookingRoommate"],
                              [self.userProfileInfo valueForKey:@"lookingBPartner"],
                              [self.userProfileInfo valueForKey:@"lookingFriendWithBenefits"]];
    
    NSMutableString* mString = [NSMutableString string];
    for(int i=0; i<[lookingArray count]; i++){
        NSString* lookingString = lookingArray[i];
        if(![lookingString isEqual:[NSNull null]] && [lookingString boolValue] == YES){
            switch (i) {
                case 0: [mString appendFormat:@"%@", NSLocalizedString(@"lookingLover", nil)]; break;
                case 1: [mString appendFormat:@"%@", NSLocalizedString(@"lookingFriend", nil)]; break;
                case 2: [mString appendFormat:@"%@", NSLocalizedString(@"lookingEPal", nil)]; break;
                case 3: [mString appendFormat:@"%@", NSLocalizedString(@"lookingMPal", nil)]; break;
                case 4: [mString appendFormat:@"%@", NSLocalizedString(@"lookingTPal", nil)]; break;
                case 5: [mString appendFormat:@"%@", NSLocalizedString(@"lookingCircle", nil)]; break;
                case 6: [mString appendFormat:@"%@", NSLocalizedString(@"lookingRoommate", nil)]; break;
                case 7: [mString appendFormat:@"%@", NSLocalizedString(@"lookingBPartner", nil)]; break;
                case 8: [mString appendFormat:@"%@", NSLocalizedString(@"lookingFriendWithBenefits", nil)]; break;
                    
                default:
                    break;
            }
            if(i < ([lookingArray count] - 1)){
                [mString appendFormat:@"%@", @", "];
            }
        }
    }
    
    return mString;
}

- (NSString *)didChangeUnitValue_Height:(int)height
{
    MyUnit* unit = [[MyUnit alloc] init];
    if([unit getUnit]==0){
        //cm, kg -> feet,inch lb
        //int height = [[account getHeightProfile] intValue];
        //int weight = [[account getWeightProfile] intValue];
        
        NSString* feet = [NSString stringWithFormat:@"%.1f", (height / 30.48)];
        
        NSString* inch = [feet componentsSeparatedByString:@"."][1];
        feet = [feet componentsSeparatedByString:@"."][0];
        
        return [NSString stringWithFormat:@"%@'%@\"", feet, inch];
    }else{
        return [NSString stringWithFormat:@"%dcm", height];
    }
}

- (NSString *)didChangeUnitValue_Weight:(int)weight
{
    MyUnit* unit = [[MyUnit alloc] init];
    if([unit getUnit]==0){
        //cm, kg -> feet,inch lb
        
        weight = weight / 0.45359237;
        return [NSString stringWithFormat:@"%dlbs", weight];
    }else{
        return [NSString stringWithFormat:@"%dkg", weight];
    }

}

- (NSString *)didChangeUnitValue_Age:(int)age
{
    //NSArray *languages = [NSLocale preferredLanguages];
    //NSString *currentLanguage = [languages objectAtIndex:0];
    
    if([currentLanguage isEqualToString:@"ja"]){
        return [NSString stringWithFormat:@"%d歳", age];
    }else{
        return [NSString stringWithFormat:@"%d", age];
    }
}

@end
