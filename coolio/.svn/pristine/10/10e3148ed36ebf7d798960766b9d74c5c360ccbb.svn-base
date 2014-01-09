//
//  PersonalityParamViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/29.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "PersonalityParamViewController.h"

@interface PersonalityParamViewController ()

@end

@implementation PersonalityParamViewController

//#define COLMAX 19

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self openPasscodeView];
    account = [[MyProfiles alloc] init];
    personalityDict = [[account getPersonalityProfile] mutableCopy];
    
    if(personalityDict == nil){
        //NSLog(@"Personality Dictionary is null");
        NSNumber* num = @0;
        personalityDict = [NSMutableDictionary dictionary];
        [personalityDict setValue:num forKey:@"personalityCheerfulProfile"];
        [personalityDict setValue:num forKey:@"personalitySeriousProfile"];
        [personalityDict setValue:num forKey:@"personalityFunnyProfile"];
        [personalityDict setValue:num forKey:@"personalityTakeTheLeadProfile"];
        [personalityDict setValue:num forKey:@"personalitySociableProfile"];
        [personalityDict setValue:num forKey:@"personalityFollowProfile"];
        [personalityDict setValue:num forKey:@"personalityFlashyProfile"];
        [personalityDict setValue:num forKey:@"personalityActBasedOnEmotionsProfile"];
        [personalityDict setValue:num forKey:@"personalityBoldProfile"];
        [personalityDict setValue:num forKey:@"personalityWantStimulationProfile"];
        [personalityDict setValue:num forKey:@"personalityRealismProfile"];
        [personalityDict setValue:num forKey:@"personalityOptimisticProfile"];
        [personalityDict setValue:num forKey:@"personalityMasculineProfile"];
        [personalityDict setValue:num forKey:@"personalityStrongPersonProfile"];
        [personalityDict setValue:num forKey:@"personalityWantToProtectProfile"];
        [personalityDict setValue:num forKey:@"personalityIndoorsyProfile"];
        [personalityDict setValue:num forKey:@"personalityBookishTypeProfile"];
        [personalityDict setValue:num forKey:@"personalityLoveToTalkAboutProfile"];
        [personalityDict setValue:num forKey:@"personalityLookingToMeetProfile"];
    }
    
    [self setDefaultSliderValue:[self.selectedSectionIndex intValue]];
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        [account setPersonalityProfile:personalityDict];
        //NSLog(@"popView");
    }
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeLabelValue:(int)section row:(int)row
{
    NSString* labelTextValue = nil;
    
    switch ([self.selectedSectionIndex intValue]) {
        case 0:
            switch (row) {
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Cheerful_and_lively", nil);
                    break;
                case 2:
                    
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Calm_and_quiet", nil);
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Serious_and_dependable", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Frank_and_versatile", nil);
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Funny", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Cool", nil);
                    break;
                default:
                    break;
            }
            break;
        case 3:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Take_the_lead_/_active_role", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Follow_/_passive_role", nil);
                    break;
                default:
                    break;
            }
            break;
        case 4:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Sociable_and_worldly", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Naive_and_clumsy", nil);
                    break;
                default:
                    break;
            }
            break;
        case 5:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Follow_the_latest_trends", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Going_own_way", nil);
                    break;
                default:
                    break;
            }
            break;
        case 6:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Flashy", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Conservative", nil);
                    break;
                default:
                    break;
            }
            break;
        case 7:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Act_based_on_emotions", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Act_based_on_reasons", nil);
                    break;
                default:
                    break;
            }
            break;
        case 8:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Bold", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Cautious", nil);
                    break;
                default:
                    break;
            }
            break;
        case 9:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Want_stimulation", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Want_peace", nil);
                    break;
                default:
                    break;
            }
            break;
        case 10:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Realism", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Idealism", nil);
                    break;
                default:
                    break;
            }
            break;
        case 11:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Optimistic", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Pessimistic", nil);
                    break;
                default:
                    break;
            }
            break;
        case 12:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Masculine", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Feminine", nil);
                    break;
                default:
                    break;
            }
            break;
        case 13:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"I_am_a_strong_person", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"I_am_a_weak_person", nil);
                    break;
                default:
                    break;
            }
            break;
        case 14:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Want_to_protect", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Want_to_be_protected", nil);
                    break;
                default:
                    break;
            }
            break;
        case 15:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Indoorsy", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Outdoorsy", nil);
                    break;
                default:
                    break;
            }
            break;
        case 16:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Bookish_type", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Athletic_type", nil);
                    break;
                default:
                    break;
            }
            break;
        case 17:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Love_to_talk_about_serious_topics_such_as_politics_and_economics", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Just_want_to_have_fun_without_being_pompous", nil);
                    break;
                default:
                    break;
            }
            break;
        case 18:
            switch(row){
                case 0:
                    labelTextValue=NSLocalizedString(@"No_Set", nil);
                    break;
                case 1:
                    labelTextValue=NSLocalizedString(@"Looking_to_meet_a_lot_of_people", nil);
                    break;
                case 2:
                    labelTextValue=NSLocalizedString(@"Neutral", nil);
                    break;
                case 3:
                    labelTextValue=NSLocalizedString(@"Looking_for_THE_one", nil);
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    
    
    self.lbl_personality.text = labelTextValue;
    if(isChanged == NO){
        self.sli_personality.value = (float)row;
    }
}

//-(void)toNotifiThePersonalityDetail:(NSNotification*)notification
-(void)setDefaultSliderValue:(int)notifiIndex
{
    isChanged = NO;
    
    NSNumber* sliNum = nil;
    
    if(personalityDict == nil){
        if(account == nil){
            account = [[MyProfiles alloc] init];
        }
        personalityDict = [[account getPersonalityProfile] mutableCopy];
    }
    
    
    switch (notifiIndex) {
        case 0: sliNum = [personalityDict valueForKey:@"personalityCheerfulProfile"]; break;
        case 1: sliNum = [personalityDict valueForKey:@"personalitySeriousProfile"]; break;
        case 2: sliNum = [personalityDict valueForKey:@"personalityFunnyProfile"]; break;
        case 3: sliNum = [personalityDict valueForKey:@"personalityTakeTheLeadProfile"]; break;
        case 4: sliNum = [personalityDict valueForKey:@"personalitySociableProfile"]; break;
        case 5: sliNum = [personalityDict valueForKey:@"personalityFollowProfile"]; break;
        case 6: sliNum = [personalityDict valueForKey:@"personalityFlashyProfile"]; break;
        case 7: sliNum = [personalityDict valueForKey:@"personalityActBasedOnEmotionsProfile"]; break;
        case 8: sliNum = [personalityDict valueForKey:@"personalityBoldProfile"]; break;
        case 9: sliNum = [personalityDict valueForKey:@"personalityWantStimulationProfile"]; break;
        case 10: sliNum = [personalityDict valueForKey:@"personalityRealismProfile"]; break;
        case 11: sliNum = [personalityDict valueForKey:@"personalityOptimisticProfile"]; break;
        case 12: sliNum = [personalityDict valueForKey:@"personalityMasculineProfile"]; break;
        case 13: sliNum = [personalityDict valueForKey:@"personalityStrongPersonProfile"]; break;
        case 14: sliNum = [personalityDict valueForKey:@"personalityWantToProtectProfile"]; break;
        case 15: sliNum = [personalityDict valueForKey:@"personalityIndoorsyProfile"]; break;
        case 16: sliNum = [personalityDict valueForKey:@"personalityBookishTypeProfile"]; break;
        case 17: sliNum = [personalityDict valueForKey:@"personalityLoveToTalkAboutProfile"]; break;
        case 18: sliNum = [personalityDict valueForKey:@"personalityLookingToMeetProfile"]; break;
        default:
            break;
    }
    //NSLog(@"sliNum: %d", [sliNum intValue]);
    [self changeLabelValue:notifiIndex row:[sliNum intValue]];
}

- (IBAction)sli_valueChanged:(id)sender {
    isChanged = YES;
    int v = (int)self.sli_personality.value;
    //NSLog(@"Slider Value: %f", v);
    switch ([self.selectedSectionIndex intValue]) {
        case 0: [personalityDict setValue:@(v) forKey:@"personalityCheerfulProfile"]; break;
        case 1: [personalityDict setValue:@(v) forKey:@"personalitySeriousProfile"]; break;
        case 2: [personalityDict setValue:@(v) forKey:@"personalityFunnyProfile"]; break;
        case 3: [personalityDict setValue:@(v) forKey:@"personalityTakeTheLeadProfile"]; break;
        case 4: [personalityDict setValue:@(v) forKey:@"personalitySociableProfile"]; break;
        case 5: [personalityDict setValue:@(v) forKey:@"personalityFollowProfile"]; break;
        case 6: [personalityDict setValue:@(v) forKey:@"personalityFlashyProfile"]; break;
        case 7: [personalityDict setValue:@(v) forKey:@"personalityActBasedOnEmotionsProfile"]; break;
        case 8: [personalityDict setValue:@(v) forKey:@"personalityBoldProfile"]; break;
        case 9: [personalityDict setValue:@(v) forKey:@"personalityWantStimulationProfile"]; break;
        case 10: [personalityDict setValue:@(v) forKey:@"personalityRealismProfile"]; break;
        case 11: [personalityDict setValue:@(v) forKey:@"personalityOptimisticProfile"]; break;
        case 12: [personalityDict setValue:@(v) forKey:@"personalityMasculineProfile"]; break;
        case 13: [personalityDict setValue:@(v) forKey:@"personalityStrongPersonProfile"]; break;
        case 14: [personalityDict setValue:@(v) forKey:@"personalityWantToProtectProfile"]; break;
        case 15: [personalityDict setValue:@(v) forKey:@"personalityIndoorsyProfile"]; break;
        case 16: [personalityDict setValue:@(v) forKey:@"personalityBookishTypeProfile"]; break;
        case 17: [personalityDict setValue:@(v) forKey:@"personalityLoveToTalkAboutProfile"]; break;
        case 18: [personalityDict setValue:@(v) forKey:@"personalityLookingToMeetProfile"]; break;
        default:
            break;
    }
    [self changeLabelValue:[self.selectedSectionIndex intValue] row:v];
    isChanged = NO;
}
@end
