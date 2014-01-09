//
//  FilterViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/05/01.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()

@end

@implementation FilterViewController

#define SECTION_MIN 1
#define SECTION_MAX 26

#define AGE_MIN 18
#define AGE_MAX 99

@synthesize sw_filterApply;

@synthesize cell_applyFilter;
@synthesize cell_ageFilter;
@synthesize cell_heightFilter;
@synthesize cell_weightFilter;
@synthesize cell_sexGayFilter;
@synthesize cell_sexBisexualFilter;
@synthesize cell_sexStraightFilter;
@synthesize cell_raceAsianFilter;
@synthesize cell_raceWhiteFilter;
@synthesize cell_raceBlackFilter;
@synthesize cell_raceLatinFilter;
@synthesize cell_raceArabFilter;
@synthesize cell_racePolFilter;
@synthesize cell_raceMixFilter;
@synthesize cell_raceEtcFilter;
@synthesize cell_styleTwinkFilter;
@synthesize cell_styleHunkFilter;
@synthesize cell_styleSurferFilter;
@synthesize cell_styleHipHopFilter;
@synthesize cell_styleThugFilter;
@synthesize cell_stylePunkFilter;
@synthesize cell_styleWhiteCollarFilter;
@synthesize cell_styleHardcoreGayFilter;
@synthesize cell_stylePotatoFilter;
@synthesize cell_styleBearFilter;
@synthesize cell_styleGeekFilter;
@synthesize cell_styleChubbyFilter;
@synthesize cell_styleBeefyFilter;
@synthesize cell_styleBodyBuilderFilter;
@synthesize cell_styleSlimWellMuscledFilter;
@synthesize cell_styleSlimSkinnyFilter;
@synthesize cell_styleFeminineFilter;
@synthesize cell_styleShemaleFilter;
@synthesize cell_styleEtcFilter;
@synthesize cell_lookingLoverFilter;
@synthesize cell_lookingFriendFilter;
@synthesize cell_lookingEpalFilter;
@synthesize cell_lookingMPalFilter;
@synthesize cell_lookingTPalFilter;
@synthesize cell_lookingCircleFilter;
@synthesize cell_lookingRoommateFilter;
@synthesize cell_lookingBPartnerFilter;
@synthesize cell_lookingBenefitsFilter;
@synthesize cell_bodyshapeSecretFilter;
@synthesize cell_bodyshapeSlimFilter;
@synthesize cell_bodyshapeAveFilter;
@synthesize cell_bodyshapeChubbyFilter;
@synthesize cell_bodyshapeVChubbyFilter;
@synthesize cell_muscleSecretFilter;
@synthesize cell_muscleDelicateFilter;
@synthesize cell_muscleAveFilter;
@synthesize cell_muscleWellBuiltFilter;
@synthesize cell_muscleBodybuilderFilter;
@synthesize cell_bodyHairSecretFilter;
@synthesize cell_bodyHairSlimFilter;
@synthesize cell_bodyHairAveFilter;
@synthesize cell_bodyHairHairyFilter;
@synthesize cell_hairStyleSecretFilter;
@synthesize cell_hairStyleShavedHeadFilter;
@synthesize cell_hairStyleShortHairFilter;
@synthesize cell_hairStyleAveFilter;
@synthesize cell_hairStyleSemiLongHairFilter;
@synthesize cell_hairStyleLongHairFilter;
@synthesize cell_hairStyleUniqueFilter;
@synthesize cell_hairColorSecretFilter;
@synthesize cell_hairColorBlackFilter;
@synthesize cell_hairColorBrownRedFilter;
@synthesize cell_hairColorBlondFilter;
@synthesize cell_hairColorWhiteFilter;
@synthesize cell_hairColorUniqueFilter;
@synthesize cell_otherCharacterMustacheFilter;
@synthesize cell_otherCharacterTanningSkinFilter;
@synthesize cell_otherCharacterGlassesFilter;
@synthesize cell_otherCharacterPiarceFilter;
@synthesize cell_otherCharacterTatooFilter;

@synthesize cell_personality0;
@synthesize cell_personality1;
@synthesize cell_personality2;
@synthesize cell_personality3;
@synthesize cell_personality4;
@synthesize cell_personality5;
@synthesize cell_personality6;
@synthesize cell_personality7;
@synthesize cell_personality8;
@synthesize cell_personality9;
@synthesize cell_personality10;
@synthesize cell_personality11;
@synthesize cell_personality12;
@synthesize cell_personality13;
@synthesize cell_personality14;
@synthesize cell_personality15;
@synthesize cell_personality16;
@synthesize cell_personality17;
@synthesize cell_personality18;
@synthesize cell_gayCareer0;
@synthesize cell_gayCareer1;
@synthesize cell_gayCareer2;
@synthesize cell_gayCareer3;

@synthesize cell_comingOut0;
@synthesize cell_comingOut1;
@synthesize cell_comingOut2;
@synthesize cell_comingOut3;
@synthesize cell_loveStyle0;
@synthesize cell_loveStyle1;
@synthesize cell_loveStyle2;
@synthesize cell_loveStyle3;
@synthesize cell_loveStyle4;

@synthesize cell_expect0;
@synthesize cell_expect1;
@synthesize cell_expect2;
@synthesize cell_expect3;
@synthesize cell_expect4;
@synthesize cell_expect5;
@synthesize cell_expect6;
@synthesize cell_expect7;
@synthesize cell_expect8;
@synthesize cell_expect9;

@synthesize cell_job0;
@synthesize cell_job1;
@synthesize cell_job2;
@synthesize cell_job3;
@synthesize cell_job4;
@synthesize cell_job5;
@synthesize cell_job6;
@synthesize cell_job7;
@synthesize cell_job8;
@synthesize cell_job9;
@synthesize cell_job10;
@synthesize cell_job11;
@synthesize cell_job12;
@synthesize cell_job13;
@synthesize cell_job14;
@synthesize cell_job15;
@synthesize cell_job16;
@synthesize cell_job17;
@synthesize cell_job18;
@synthesize cell_job19;
@synthesize cell_job20;
@synthesize cell_job21;
@synthesize cell_job22;
@synthesize cell_job23;
@synthesize cell_job24;
@synthesize cell_job25;
@synthesize cell_job26;

@synthesize cell_home0;
@synthesize cell_home1;
@synthesize cell_home2;
@synthesize cell_home3;

@synthesize cell_lifePol0;
@synthesize cell_lifePol1;
@synthesize cell_lifePol2;
@synthesize cell_lifePol3;
@synthesize cell_lifePol4;

@synthesize cell_sexPosi0;
@synthesize cell_sexPosi1;
@synthesize cell_sexPosi2;
@synthesize cell_sexPosi3;

@synthesize cell_penisSize;

@synthesize cell_penisThi0;
@synthesize cell_penisThi1;
@synthesize cell_penisThi2;
@synthesize cell_penisThi3;
@synthesize cell_penisThi4;

@synthesize cell_phimosis0;
@synthesize cell_phimosis1;
@synthesize cell_phimosis2;
@synthesize cell_phimosis3;

@synthesize cell_sado0;
@synthesize cell_sado1;
@synthesize cell_sado2;
@synthesize cell_sado3;
@synthesize cell_sado4;

@synthesize cell_feti0;
@synthesize cell_feti1;
@synthesize cell_feti2;
@synthesize cell_feti3;
@synthesize cell_feti4;
@synthesize cell_feti5;
@synthesize cell_feti6;
@synthesize cell_feti7;
@synthesize cell_feti8;
@synthesize cell_feti9;
@synthesize cell_feti10;
@synthesize cell_feti11;
@synthesize cell_feti12;
@synthesize cell_feti13;
@synthesize cell_feti14;

@synthesize sw_sexGayFilter;
@synthesize sw_sexBisexualFilter;
@synthesize sw_sexStraightFilter;
@synthesize sw_raceAsianFilter;
@synthesize sw_raceWhiteFilter;
@synthesize sw_raceBlackFilter;
@synthesize sw_raceLatinFilter;
@synthesize sw_raceArabFilter;
@synthesize sw_racePolFilter;
@synthesize sw_raceMixFilter;
@synthesize sw_raceEtcFilter;
@synthesize sw_styleTwinkFilter;
@synthesize sw_styleHunkFilter;
@synthesize sw_styleSurferFilter;
@synthesize sw_styleHipHopFilter;
@synthesize sw_styleThugFilter;
@synthesize sw_stylePunkFilter;
@synthesize sw_styleWhiteCollarFilter;
@synthesize sw_styleHardcoreGayFilter;
@synthesize sw_stylePotatoFilter;
@synthesize sw_styleBearFilter;
@synthesize sw_styleGeekFilter;
@synthesize sw_styleChubbyFilter;
@synthesize sw_styleBeefyFilter;
@synthesize sw_styleBodyBuilderFilter;
@synthesize sw_styleSlimWellMuscledFilter;
@synthesize sw_styleSlimSkinnyFilter;
@synthesize sw_styleFeminineFilter;
@synthesize sw_styleShemaleFilter;
@synthesize sw_styleEtcFilter;
@synthesize sw_lookingLoverFilter;
@synthesize sw_lookingFriendFilter;
@synthesize sw_lookingEpalFilter;
@synthesize sw_lookingMPalFilter;
@synthesize sw_lookingTPalFilter;
@synthesize sw_lookingCircleFilter;
@synthesize sw_lookingRoommateFilter;
@synthesize sw_lookingBPartnerFilter;
@synthesize sw_lookingBenefitsFilter;
@synthesize sw_bodyshapeSecretFilter;
@synthesize sw_bodyshapeSlimFilter;
@synthesize sw_bodyshapeAveFilter;
@synthesize sw_bodyshapeChubbyFilter;
@synthesize sw_bodyshapeVChubbyFilter;
@synthesize sw_muscleSecretFilter;
@synthesize sw_muscleDelicateFilter;
@synthesize sw_muscleAveFilter;
@synthesize sw_muscleWellBuiltFilter;
@synthesize sw_muscleBodybuilderFilter;
@synthesize sw_bodyHairSecretFilter;
@synthesize sw_bodyHairSmoothFilter;
@synthesize sw_bodyHairAveFilter;
@synthesize sw_bodyHairHairyFilter;
@synthesize sw_hairStyleSecretFilter;
@synthesize sw_hairStyleShavedHeadFilter;
@synthesize sw_hairStyleShortHairFilter;
@synthesize sw_hairStyleAveFilter;
@synthesize sw_hairStyleSemiLongHairFilter;
@synthesize sw_hairStyleLongHairFilter;
@synthesize sw_hairStyleUniqueFilter;
@synthesize sw_hairColorSecretFilter;
@synthesize sw_hairColorBlackFilter;
@synthesize sw_hairColorBrownRedFilter;
@synthesize sw_hairColorBlondFilter;
@synthesize sw_hairColorWhiteFilter;
@synthesize sw_hairColorUniqueFilter;
@synthesize sw_otherCharacterMustacheFilter;
@synthesize sw_otherCharacterTanningSkinFilter;
@synthesize sw_otherCharacterGlassesFilter;
@synthesize sw_otherCharacterPiarceFilter;
@synthesize sw_otherCharacterTatooFilter;

@synthesize sw_personality0;
@synthesize sw_personality1;
@synthesize sw_personality2;
@synthesize sw_personality3;
@synthesize sw_personality4;
@synthesize sw_personality5;
@synthesize sw_personality6;
@synthesize sw_personality7;
@synthesize sw_personality8;
@synthesize sw_personality9;
@synthesize sw_personality10;
@synthesize sw_personality11;
@synthesize sw_personality12;
@synthesize sw_personality13;
@synthesize sw_personality14;
@synthesize sw_personality15;
@synthesize sw_personality16;
@synthesize sw_personality17;
@synthesize sw_personality18;
@synthesize sw_gayCareer0;
@synthesize sw_gayCareer1;
@synthesize sw_gayCareer2;
@synthesize sw_gayCareer3;

@synthesize sw_comingOut0;
@synthesize sw_comingOut1;
@synthesize sw_comingOut2;
@synthesize sw_comingOut3;
@synthesize sw_loveStyle0;
@synthesize sw_loveStyle1;
@synthesize sw_loveStyle2;
@synthesize sw_loveStyle3;
@synthesize sw_loveStyle4;

@synthesize sw_expect0;
@synthesize sw_expect1;
@synthesize sw_expect2;
@synthesize sw_expect3;
@synthesize sw_expect4;
@synthesize sw_expect5;
@synthesize sw_expect6;
@synthesize sw_expect7;
@synthesize sw_expect8;
@synthesize sw_expect9;

@synthesize sw_job0;
@synthesize sw_job1;
@synthesize sw_job2;
@synthesize sw_job3;
@synthesize sw_job4;
@synthesize sw_job5;
@synthesize sw_job6;
@synthesize sw_job7;
@synthesize sw_job8;
@synthesize sw_job9;
@synthesize sw_job10;
@synthesize sw_job11;
@synthesize sw_job12;
@synthesize sw_job13;
@synthesize sw_job14;
@synthesize sw_job15;

@synthesize sw_job16;

@synthesize sw_job17;
@synthesize sw_job18;
@synthesize sw_job19;
@synthesize sw_job20;
@synthesize sw_job21;
@synthesize sw_job22;
@synthesize sw_job23;
@synthesize sw_job24;
@synthesize sw_job25;
@synthesize sw_job26;

@synthesize sw_home0;
@synthesize sw_home1;
@synthesize sw_home2;
@synthesize sw_home3;

@synthesize sw_lifePol0;
@synthesize sw_lifePol1;
@synthesize sw_lifePol2;
@synthesize sw_lifePol3;
@synthesize sw_lifePol4;

@synthesize sw_sexPosi0;
@synthesize sw_sexPosi1;
@synthesize sw_sexPosi2;
@synthesize sw_sexPosi3;

//@synthesize sw_penisSize;

@synthesize sw_penisThi0;
@synthesize sw_penisThi1;
@synthesize sw_penisThi2;
@synthesize sw_penisThi3;
@synthesize sw_penisThi4;

@synthesize sw_phimosis0;
@synthesize sw_phimosis1;
@synthesize sw_phimosis2;
@synthesize sw_phimosis3;

@synthesize sw_sado0;
@synthesize sw_sado1;
@synthesize sw_sado2;
@synthesize sw_sado3;
@synthesize sw_sado4;

@synthesize sw_feti0;
@synthesize sw_feti1;
@synthesize sw_feti2;
@synthesize sw_feti3;
@synthesize sw_feti4;
@synthesize sw_feti5;
@synthesize sw_feti6;
@synthesize sw_feti7;
@synthesize sw_feti8;
@synthesize sw_feti9;
@synthesize sw_feti10;
@synthesize sw_feti11;
@synthesize sw_feti12;
@synthesize sw_feti13;
@synthesize sw_feti14;

@synthesize lbl_age;
@synthesize lbl_height;
@synthesize lbl_weight;
@synthesize lbl_penisSize;

@synthesize sexualityDict;
@synthesize raceDict;
@synthesize styleDict;
@synthesize lookingDict;
@synthesize bodyShapeDict;
@synthesize muscleDict;
@synthesize bodyHairDict;
@synthesize hairStyleDict;
@synthesize hairColorDict;
@synthesize otherCharacterDict;
@synthesize personalityDict;
@synthesize gayCareerDict;
@synthesize comingOutDict;
@synthesize loveStyleDict;
@synthesize expectDict;
@synthesize jobDict;
@synthesize homeDict;
@synthesize lifePolDict;
@synthesize sexPosiDict;
@synthesize penisThiDict;
@synthesize phimosisDict;
@synthesize sadoDict;
@synthesize fetiDict;
/*
@synthesize ageDict;
@synthesize heightDict;
@synthesize weightDict;
@synthesize penisSizeDict;
*/
@synthesize basicDict;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self openPasscodeView];
    account = [[MyFilter alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q_global, ^{
        //NSLog(@"Did load");;
        
        NSMutableString* ageMutableString = [[NSMutableString alloc] init];
        BOOL hilow = [account getAgeFilterHiLow];
        //@"Under" : @"Over"
        NSString* strHiLow = hilow ? NSLocalizedString(@"FILTER_UNDER", nil):NSLocalizedString(@"FILTER_OVER", nil);
        int age = [account getAgeFilter];
        
        if(age >= AGE_MIN || age <= AGE_MAX){
            [ageMutableString appendFormat:@"%d", age];
        }else{
            [ageMutableString appendString:@"18"];
            [account setAgeFilter:18];
        }
        [ageMutableString appendString:@" "];
        [ageMutableString appendString:strHiLow];
        
        NSMutableString* heightMutableString = [[NSMutableString alloc] init];
        hilow = [account getHeightFilterHiLow];
        strHiLow = hilow ? NSLocalizedString(@"FILTER_UNDER", nil):NSLocalizedString(@"FILTER_OVER", nil);
        int height = [account getHeightFilter];
        [heightMutableString appendString:[NSString stringWithFormat:@"%d", height]];
        [heightMutableString appendString:@" "];
        [heightMutableString appendString:strHiLow];
        
        NSMutableString* weightMutableString = [[NSMutableString alloc] init];
        hilow = [account getWeightFilterHiLow];
        strHiLow = hilow ? NSLocalizedString(@"FILTER_UNDER", nil):NSLocalizedString(@"FILTER_OVER", nil);
        int weight = [account getWeightFilter];
        [weightMutableString appendString:[NSString stringWithFormat:@"%d", weight]];
        [weightMutableString appendString:@" "];
        [weightMutableString appendString:strHiLow];
        
        NSMutableString* peniSizeMutableString = [[NSMutableString alloc] init];
        hilow = [account getPenisSizeHiLowFilter];
        strHiLow = hilow ? NSLocalizedString(@"FILTER_UNDER", nil):NSLocalizedString(@"FILTER_OVER", nil);
        int peniSize = [account getPenisSizeFilter];
        [peniSizeMutableString appendString:[NSString stringWithFormat:@"%d", peniSize]];
        [peniSizeMutableString appendString:@" "];
        [peniSizeMutableString appendString:strHiLow];
        
        self.raceDict = [(NSMutableDictionary *)[account getRaceFilter] mutableCopy];
        self.sexualityDict = [(NSMutableDictionary *)[account getSexuallityFilter] mutableCopy];
        self.styleDict = [(NSMutableDictionary *)[account getStyleFilter] mutableCopy];
        self.lookingDict = [(NSMutableDictionary *)[account getLookingForFilter] mutableCopy];
        self.bodyShapeDict = [(NSMutableDictionary *)[account getBodyShapeFilter] mutableCopy];
        self.muscleDict = [(NSMutableDictionary *)[account getMuscleFilter] mutableCopy];
        self.bodyHairDict = [(NSMutableDictionary *)[account getBodyHairFilter] mutableCopy];
        self.hairStyleDict = [(NSMutableDictionary *)[account getHairStyleFilter] mutableCopy];
        self.hairColorDict = [(NSMutableDictionary *)[account getHairColorFilter] mutableCopy];
        self.otherCharacterDict = [(NSMutableDictionary *)[account getOtherCharacteristicsFilter] mutableCopy];
        self.personalityDict = [(NSMutableDictionary *)[account getPersonalityFilter] mutableCopy];
        self.gayCareerDict = [(NSMutableDictionary *)[account getGayCareerFilter] mutableCopy];
        self.comingOutDict = [(NSMutableDictionary *)[account getComingoutFilter] mutableCopy];
        self.loveStyleDict = [(NSMutableDictionary *)[account getLoveStylesFilter] mutableCopy];
        self.expectDict = [(NSMutableDictionary *)[account getExpectFilter] mutableCopy];
        self.jobDict = [(NSMutableDictionary *)[account getJobFilter] mutableCopy];
        self.homeDict = [(NSMutableDictionary *)[account getLivingFilter] mutableCopy];
        self.lifePolDict = [(NSMutableDictionary *)[account getLifePolicyFilter] mutableCopy];
        self.sexPosiDict = [(NSMutableDictionary *)[account getSexPositionFilter] mutableCopy];
        self.penisThiDict = [(NSMutableDictionary *)[account getPenisThicknessFilter] mutableCopy];
        self.phimosisDict = [(NSMutableDictionary *)[account getPhimosisFilter] mutableCopy];
        self.sadoDict = [(NSMutableDictionary *)[account getSadomasochismFilter] mutableCopy];
        self.fetiDict = [(NSMutableDictionary *)[account getFetishFilter] mutableCopy];
        
        
        if(self.sexualityDict == nil){
            self.sexualityDict = [NSMutableDictionary dictionary];
            [self.sexualityDict setValue:NO forKey:@"sexGayFilter"];
            [self.sexualityDict setValue:NO forKey:@"sexBisexFilter"];
            [self.sexualityDict setValue:NO forKey:@"sexStraightFilter"];
            [account setSexuallityFilter:self.sexualityDict];
        }
        if(self.raceDict == nil){
            self.raceDict = [NSMutableDictionary dictionary];
            [self.raceDict setValue:NO forKey:@"raceAsianFilter"];
            [self.raceDict setValue:NO forKey:@"raceWhiteFilter"];
            [self.raceDict setValue:NO forKey:@"raceBlackFilter"];
            [self.raceDict setValue:NO forKey:@"raceLatinFilter"];
            [self.raceDict setValue:NO forKey:@"raceArabFilter"];
            [self.raceDict setValue:NO forKey:@"racePolynesianFilter"];
            [self.raceDict setValue:NO forKey:@"raceMixFilter"];
            [self.raceDict setValue:NO forKey:@"raceEtcFilter"];
            [account setRaceFilter:self.raceDict];
        }
        if(self.styleDict == nil){
            self.styleDict = [NSMutableDictionary dictionary];
            [self.styleDict setValue:NO forKey:@"styleTwinkFilter"];
            [self.styleDict setValue:NO forKey:@"styleHunkFilter"];
            [self.styleDict setValue:NO forKey:@"styleSurferFilter"];
            [self.styleDict setValue:NO forKey:@"styleHipHopFilter"];
            [self.styleDict setValue:NO forKey:@"styleThugFilter"];
            [self.styleDict setValue:NO forKey:@"stylePunkFilter"];
            [self.styleDict setValue:NO forKey:@"styleWhiteCollarFilter"];
            [self.styleDict setValue:NO forKey:@"styleHardcoreGayFilter"];
            [self.styleDict setValue:NO forKey:@"stylePotatoFilter"];
            [self.styleDict setValue:NO forKey:@"styleBearFilter"];
            [self.styleDict setValue:NO forKey:@"styleGeekFilter"];
            [self.styleDict setValue:NO forKey:@"styleChubbyFilter"];
            [self.styleDict setValue:NO forKey:@"styleBeefyFilter"];
            [self.styleDict setValue:NO forKey:@"styleBodybuilderFilter"];
            [self.styleDict setValue:NO forKey:@"styleWellMuscledFilter"];
            [self.styleDict setValue:NO forKey:@"styleSlimSkinnyFilter"];
            [self.styleDict setValue:NO forKey:@"styleFeminineFilter"];
            [self.styleDict setValue:NO forKey:@"styleShemaleFilter"];
            [self.styleDict setValue:NO forKey:@"styleEtcFilter"];
            [account setStyleFilter:self.styleDict];
        }
        if(self.lookingDict == nil){
            self.lookingDict = [NSMutableDictionary dictionary];
            [self.lookingDict setValue:NO forKey:@"lookingLoverFilter"];
            [self.lookingDict setValue:NO forKey:@"lookingFriendFilter"];
            [self.lookingDict setValue:NO forKey:@"lookingEPalFilter"];
            [self.lookingDict setValue:NO forKey:@"lookingMPalFilter"];
            [self.lookingDict setValue:NO forKey:@"lookingTPalFilter"];
            [self.lookingDict setValue:NO forKey:@"lookingCircleFilter"];
            [self.lookingDict setValue:NO forKey:@"lookingRoommateFilter"];
            [self.lookingDict setValue:NO forKey:@"lookingBPartnerFilter"];
            [self.lookingDict setValue:NO forKey:@"lookingFriendWithBenefitsFilter"];
            [account setLookingForFilter:self.lookingDict];
        }
        
        if(self.bodyShapeDict == nil){
            self.bodyShapeDict = [NSMutableDictionary dictionary];
            [self.bodyShapeDict setValue:NO forKey:@"bodyShapeSecretFilter"];
            [self.bodyShapeDict setValue:NO forKey:@"bodyShapeSlimFilter"];
            [self.bodyShapeDict setValue:NO forKey:@"bodyShapeAverageFilter"];
            [self.bodyShapeDict setValue:NO forKey:@"bodyShapeChubbyFilter"];
            [self.bodyShapeDict setValue:NO forKey:@"bodyShapeVeryChubbyFilter"];
            [account setBodyShapeFilter:self.bodyShapeDict];
        }
        if(self.muscleDict == nil){
            self.muscleDict = [NSMutableDictionary dictionary];
            [self.muscleDict setValue:NO forKey:@"muscleSecretFilter"];
            [self.muscleDict setValue:NO forKey:@"muscleDelicateFilter"];
            [self.muscleDict setValue:NO forKey:@"muscleAverageFilter"];
            [self.muscleDict setValue:NO forKey:@"muscleWell-builtFilter"];
            [self.muscleDict setValue:NO forKey:@"muscleBodybuilderFilter"];
            [account setMuscleFilter:self.muscleDict];
        }
        if(self.bodyHairDict == nil){
            self.bodyHairDict = [NSMutableDictionary dictionary];
            [self.bodyHairDict setValue:NO forKey:@"bodyHairSecretFilter"];
            [self.bodyHairDict setValue:NO forKey:@"bodyHairSmoothFilter"];
            [self.bodyHairDict setValue:NO forKey:@"bodyHairAverageFilter"];
            [self.bodyHairDict setValue:NO forKey:@"bodyHairHairyFilter"];
            [account setBodyHairFilter:self.bodyHairDict];
        }
        if(self.hairStyleDict == nil){
            self.hairStyleDict = [NSMutableDictionary dictionary];
            [self.hairStyleDict setValue:NO forKey:@"hairStyleSecretFilter"];
            [self.hairStyleDict setValue:NO forKey:@"hairStyleShavedHeadFilter"];
            [self.hairStyleDict setValue:NO forKey:@"hairStyleShortHairFilter"];
            [self.hairStyleDict setValue:NO forKey:@"hairStyleAverageFilter"];
            [self.hairStyleDict setValue:NO forKey:@"hairStyleSemiLongHairFilter"];
            [self.hairStyleDict setValue:NO forKey:@"hairStyleLongHairFilter"];
            [self.hairStyleDict setValue:NO forKey:@"hairStyleUniqueStyleFilter"];
            [account setHairStyleFilter:self.hairStyleDict];
        }
        if(self.hairColorDict == nil){
            self.hairColorDict = [NSMutableDictionary dictionary];
            [self.hairColorDict setValue:NO forKey:@"hairColorSecretFilter"];
            [self.hairColorDict setValue:NO forKey:@"hairColorBlackFilter"];
            [self.hairColorDict setValue:NO forKey:@"hairColorBrownFilter"];
            [self.hairColorDict setValue:NO forKey:@"hairColorBlondFilter"];
            [self.hairColorDict setValue:NO forKey:@"hairColorWhiteFilter"];
            [self.hairColorDict setValue:NO forKey:@"hairColorUniqueColorFilter"];
            [account setHairColorFilter:self.hairColorDict];
        }
        if(self.otherCharacterDict == nil){
            self.otherCharacterDict = [NSMutableDictionary dictionary];
            [self.otherCharacterDict setValue:NO forKey:@"otherCharacteristicsMustacheFilter"];
            [self.otherCharacterDict setValue:NO forKey:@"otherCharacteristicsTanningSkinFilter"];
            [self.otherCharacterDict setValue:NO forKey:@"otherCharacteristicsGlassesFilter"];
            [self.otherCharacterDict setValue:NO forKey:@"otherCharacteristicsPiarceFilter"];
            [self.otherCharacterDict setValue:NO forKey:@"otherCharacteristicsTatooFilter"];
            [account setOtherCharacteristicsFilter:self.otherCharacterDict];
        }
        if(self.personalityDict == nil){
            self.personalityDict = [NSMutableDictionary dictionary];
            [self.personalityDict setValue:NO forKey:@"personalityCheerfulFilter"];
            [self.personalityDict setValue:NO forKey:@"personalitySeriousFilter"];
            [self.personalityDict setValue:NO forKey:@"personalityFunnyFilter"];
            [self.personalityDict setValue:NO forKey:@"personalityTakeTheLeadFilter"];
            [self.personalityDict setValue:NO forKey:@"personalitySociableFilter"];
            [self.personalityDict setValue:NO forKey:@"personalityFollowFilter"];
            [self.personalityDict setValue:NO forKey:@"personalityFlashyFilter"];
            [self.personalityDict setValue:NO forKey:@"personalityActBasedOnEmotionsFilter"];
            [self.personalityDict setValue:NO forKey:@"personalityBoldFilter"];
            [self.personalityDict setValue:NO forKey:@"personalityWantStimulationFilter"];           
            [self.personalityDict setValue:NO forKey:@"personalityRealismFilter"];
            [self.personalityDict setValue:NO forKey:@"personalityOptimisticFilter"];
            [self.personalityDict setValue:NO forKey:@"personalityMasculineFilter"];
            [self.personalityDict setValue:NO forKey:@"personalityStrongPersonFilter"];
            [self.personalityDict setValue:NO forKey:@"personalityWantToProtectFilter"];
            [self.personalityDict setValue:NO forKey:@"personalityIndoorsyFilter"];
            [self.personalityDict setValue:NO forKey:@"personalityBookishTypeFilter"];
            [self.personalityDict setValue:NO forKey:@"personalityLoveToTalkAboutFilter"];
            [self.personalityDict setValue:NO forKey:@"personalityLookingToMeetFilter"];
            [account setPersonalityFilter:self.personalityDict];
        }
        if(self.gayCareerDict == nil){
            self.gayCareerDict = [NSMutableDictionary dictionary];
            [self.gayCareerDict setValue:NO forKey:@"gayCareerSecretFilter"];
            [self.gayCareerDict setValue:NO forKey:@"gayCareerBeginnerFilter"];
            [self.gayCareerDict setValue:NO forKey:@"gayCareerAverageFilter"];
            [self.gayCareerDict setValue:NO forKey:@"gayCareerExpertFilter"];
            [account setGayCareerFilter:self.gayCareerDict];
        }
        if(self.comingOutDict == nil){
            self.comingOutDict = [NSMutableDictionary dictionary];
            [self.comingOutDict setValue:NO forKey:@"comingoutSecretFilter"];
            [self.comingOutDict setValue:NO forKey:@"comingoutNobodyKnowsFilter"];
            [self.comingOutDict setValue:NO forKey:@"comingoutSomeoneCloseKnowFilter"];
            [self.comingOutDict setValue:NO forKey:@"comingoutMostPeopleKnowFilter"];
            [account setComingoutFilter:self.comingOutDict];
        }
        if(self.loveStyleDict == nil){
            self.loveStyleDict = [NSMutableDictionary dictionary];
            [self.loveStyleDict setValue:NO forKey:@"loveStylesSecretFilter"];
            [self.loveStyleDict setValue:NO forKey:@"loveStylesCloseFilter"];
            [self.loveStyleDict setValue:NO forKey:@"loveStylesAverageFilter"];
            [self.loveStyleDict setValue:NO forKey:@"loveStylesSimpleFilter"];
            [self.loveStyleDict setValue:NO forKey:@"loveStylesUpToyouFilter"];
            [account setLoveStylesFilter:self.loveStyleDict];
        }
        if(self.expectDict == nil){
            self.expectDict = [NSMutableDictionary dictionary];

            [self.expectDict setValue:NO forKey:@"expectSecretFilter"];
            [self.expectDict setValue:NO forKey:@"expectpersonalityFilter"];
            [self.expectDict setValue:NO forKey:@"expectAppearanceFilter"];
            [self.expectDict setValue:NO forKey:@"expectAtmosphereFilter"];
            [self.expectDict setValue:NO forKey:@"expectBodyFilter"];
            
            [self.expectDict setValue:NO forKey:@"expectSexFilter"];
            [self.expectDict setValue:NO forKey:@"expectInterestFilter"];
            [self.expectDict setValue:NO forKey:@"expectCircumstanceFilter"];
            [self.expectDict setValue:NO forKey:@"expectFinanceFilter"];
            [self.expectDict setValue:NO forKey:@"expectDistanceFilter"];
            [account setExpectFilter:self.expectDict];

        }
        if(self.jobDict == nil){
            self.jobDict = [NSMutableDictionary dictionary];
            [self.jobDict setValue:NO forKey:@"jobSecretFilter"];
            [self.jobDict setValue:NO forKey:@"jobStudentFilter"];
            [self.jobDict setValue:NO forKey:@"jobBetweenJobsFilter"];
            [self.jobDict setValue:NO forKey:@"jobOfficeWorkFilter"];
            [self.jobDict setValue:NO forKey:@"jobServicesFilter"];
            [self.jobDict setValue:NO forKey:@"jobManufacturingFilter"];
            [self.jobDict setValue:NO forKey:@"jobComputerFilter"];
            [self.jobDict setValue:NO forKey:@"jobLanguageFilter"];
            [self.jobDict setValue:NO forKey:@"jobAssetsFilter"];
            [self.jobDict setValue:NO forKey:@"jobLawFilter"];
            [self.jobDict setValue:NO forKey:@"jobMediaFilter"];
            [self.jobDict setValue:NO forKey:@"jobPublishingFilter"];
            [self.jobDict setValue:NO forKey:@"jobDomesticFilter"];
            [self.jobDict setValue:NO forKey:@"jobMedicalProfessionFilter"];
            [self.jobDict setValue:NO forKey:@"jobHealthFilter"];
            [self.jobDict setValue:NO forKey:@"jobArchitectureFilter"];
            [self.jobDict setValue:NO forKey:@"jobCreativeProfessionFilter"];
            [self.jobDict setValue:NO forKey:@"jobCookingFilter"];
            [self.jobDict setValue:NO forKey:@"jobVehicleFilter"];
            [self.jobDict setValue:NO forKey:@"jobTravelFilter"];
            [self.jobDict setValue:NO forKey:@"jobBeautyFilter"];
            [self.jobDict setValue:NO forKey:@"jobEntertainmentFilter"];
            [self.jobDict setValue:NO forKey:@"jobReligiousProfessionFilter"];
            [self.jobDict setValue:NO forKey:@"jobCeremonialOccasionsFilter"];
            [self.jobDict setValue:NO forKey:@"jobNatureFilter"];
            [self.jobDict setValue:NO forKey:@"jobSportsFilter"];
            [self.jobDict setValue:NO forKey:@"jobSexIndustryFilter"];
            [account setJobFilter:self.jobDict];
        }
        if(self.homeDict == nil){
            self.homeDict = [NSMutableDictionary dictionary];
            [self.homeDict setValue:NO forKey:@"livingSecretFilter"];
            [self.homeDict setValue:NO forKey:@"livingAloneFilter"];
            [self.homeDict setValue:NO forKey:@"livingwithFamilyFilter"];
            [self.homeDict setValue:NO forKey:@"livingwithFriendsorLoversFilter"];
            [account setLivingFilter:self.homeDict];
        }
        if(self.lifePolDict == nil){
            self.lifePolDict = [NSMutableDictionary dictionary];
            [self.lifePolDict setValue:NO forKey:@"lifePolicyVegetarianFilter"];
            [self.lifePolDict setValue:NO forKey:@"lifePolicyNoSmokingFilter"];
            [self.lifePolDict setValue:NO forKey:@"lifePolicyNoDrinkingFilter"];
            [self.lifePolDict setValue:NO forKey:@"lifePolicyNoGamblingFilter"];
            [self.lifePolDict setValue:NO forKey:@"lifePolicyNoSexFilter"];
            [account setLifePolicyFilter:self.lifePolDict];
        }
        if(self.sexPosiDict == nil){
            self.sexPosiDict = [NSMutableDictionary dictionary];
            [self.sexPosiDict setValue:NO forKey:@"sexPositionSecretFilter"];
            [self.sexPosiDict setValue:NO forKey:@"sexPositionTopFilter"];
            [self.sexPosiDict setValue:NO forKey:@"sexPositionBottomFilter"];
            [self.sexPosiDict setValue:NO forKey:@"sexPositionVersatileFilter"];
            [account setSexPositionFilter:self.sexPosiDict];
        }
        if(self.penisThiDict == nil){
            self.penisThiDict = [NSMutableDictionary dictionary];
            [self.penisThiDict setValue:NO forKey:@"penisThicknessSecretFilter"];
            [self.penisThiDict setValue:NO forKey:@"penisThicknessSlenderFilter"];
            
            [self.penisThiDict setValue:NO forKey:@"penisThicknessAverageFilter"];
            [self.penisThiDict setValue:NO forKey:@"penisThicknessPlumpFilter"];
            [self.penisThiDict setValue:NO forKey:@"penisThicknessExtraThickFilter"];
            [account setPenisThicknessFilter:self.penisThiDict];
        }
        if(self.phimosisDict == nil){
            self.phimosisDict = [NSMutableDictionary dictionary];
            [self.phimosisDict setValue:NO forKey:@"phimosisSecretFilter"];
            [self.phimosisDict setValue:NO forKey:@"phimosisCutFilter"];
            [self.phimosisDict setValue:NO forKey:@"phimosisUncutFilter"];
            [self.phimosisDict setValue:NO forKey:@"phimosisOverhangFilter"];
            [account setPhimosisFilter:self.phimosisDict];
        }
        if(self.sadoDict == nil){
            self.sadoDict = [NSMutableDictionary dictionary];
            [self.sadoDict setValue:NO forKey:@"sadomasochismSecretFilter"];
            [self.sadoDict setValue:NO forKey:@"sadomasochismSadisticFilter"];
            [self.sadoDict setValue:NO forKey:@"sadomasochismMasochisticFilter"];
            [self.sadoDict setValue:NO forKey:@"sadomasochismBothFilter"];
            [self.sadoDict setValue:NO forKey:@"sadomasochismNeitherFilter"];
            [account setSadomasochismFilter:self.sadoDict];
        }
        if(self.fetiDict == nil){
            self.fetiDict = [NSMutableDictionary dictionary];
            [self.fetiDict setValue:NO forKey:@"fetishBDSMFilter"];
            [self.fetiDict setValue:NO forKey:@"fetishBigCockFilter"];
            [self.fetiDict setValue:NO forKey:@"fetishSmallCockFilter"];
            [self.fetiDict setValue:NO forKey:@"fetishUncutFilter"];
            [self.fetiDict setValue:NO forKey:@"fetishSmellFetishFilter"];
            
            [self.fetiDict setValue:NO forKey:@"fetishUniformFetishFilter"];
            [self.fetiDict setValue:NO forKey:@"fetishRubberFilter"];
            [self.fetiDict setValue:NO forKey:@"fetishDragFilter"];
            [self.fetiDict setValue:NO forKey:@"fetishFlasherFilter"];
            [self.fetiDict setValue:NO forKey:@"fetishGangbangFilter"];
            
            [self.fetiDict setValue:NO forKey:@"fetishHardcorePlayFilter"];
            [self.fetiDict setValue:NO forKey:@"fetishPhoneSexFilter"];
            [self.fetiDict setValue:NO forKey:@"fetishTeenLoverFilter"];
            [self.fetiDict setValue:NO forKey:@"fetishMatureLoverFilter"];
            [self.fetiDict setValue:NO forKey:@"fetishChubbyLoverFilter"];
            [account setFetishFilter:self.fetiDict];
        }

        dispatch_async(q_main, ^{
            [self.lbl_age setText:ageMutableString];
            [self.lbl_height setText:heightMutableString];
            [self.lbl_weight setText:weightMutableString];
            [self.lbl_penisSize setText:peniSizeMutableString];
            self.sw_sexGayFilter.on = [self.sexualityDict[@"sexGayFilter"] boolValue];
            self.sw_sexBisexualFilter.on = [[self.sexualityDict valueForKey:@"sexBisexFilter"] boolValue];
            self.sw_sexStraightFilter.on = [[self.sexualityDict valueForKey:@"sexStraightFilter"] boolValue];
            
            self.sw_raceAsianFilter.on = [[self.raceDict valueForKey:@"raceAsianFilter"] boolValue];
            self.sw_raceWhiteFilter.on = [[self.raceDict valueForKey:@"raceWhiteFilter"] boolValue];
            self.sw_raceBlackFilter.on = [[self.raceDict valueForKey:@"raceBlackFilter"] boolValue];
            self.sw_raceLatinFilter.on = [[self.raceDict valueForKey:@"raceLatinFilter"] boolValue];
            self.sw_raceArabFilter.on = [[self.raceDict valueForKey:@"raceArabFilter"] boolValue];
            self.sw_racePolFilter.on = [[self.raceDict valueForKey:@"racePolynesianFilter"] boolValue];
            self.sw_raceMixFilter.on = [[self.raceDict valueForKey:@"raceMixFilter"] boolValue];
            self.sw_raceEtcFilter.on = [[self.raceDict valueForKey:@"raceEtcFilter"] boolValue];
            
            self.sw_styleTwinkFilter.on = [[self.styleDict valueForKey:@"styleTwinkFilter"] boolValue];
            self.sw_styleHunkFilter.on = [[self.styleDict valueForKey:@"styleHunkFilter"] boolValue];
            self.sw_styleSurferFilter.on = [[self.styleDict valueForKey:@"styleSurferFilter"] boolValue];
            self.sw_styleHipHopFilter.on = [[self.styleDict valueForKey:@"styleHipHopFilter"] boolValue];
            self.sw_styleThugFilter.on = [[self.styleDict valueForKey:@"styleThugFilter"] boolValue];
            self.sw_stylePunkFilter.on = [[self.styleDict valueForKey:@"stylePunkFilter"] boolValue];
            self.sw_styleWhiteCollarFilter.on = [[self.styleDict valueForKey:@"styleWhiteCollarFilter"] boolValue];
            self.sw_styleHardcoreGayFilter.on = [[self.styleDict valueForKey:@"styleHardcoreGayFilter"] boolValue];
            self.sw_stylePotatoFilter.on = [[self.styleDict valueForKey:@"stylePotatoFilter"] boolValue];
            self.sw_styleBearFilter.on = [[self.styleDict valueForKey:@"styleBearFilter"] boolValue];
            self.sw_styleGeekFilter.on = [[self.styleDict valueForKey:@"styleGeekFilter"] boolValue];
            self.sw_styleChubbyFilter.on = [[self.styleDict valueForKey:@"styleChubbyFilter"] boolValue];
            self.sw_styleBeefyFilter.on = [[self.styleDict valueForKey:@"styleBeefyFilter"] boolValue];
            self.sw_styleBodyBuilderFilter.on = [[self.styleDict valueForKey:@"styleBodybuilderFilter"] boolValue];
            self.sw_styleSlimWellMuscledFilter.on = [[self.styleDict valueForKey:@"styleWellMuscledFilter"] boolValue];
            self.sw_styleSlimSkinnyFilter.on = [[self.styleDict valueForKey:@"styleSlimSkinnyFilter"] boolValue];
            self.sw_styleFeminineFilter.on = [[self.styleDict valueForKey:@"styleFeminineFilter"] boolValue];
            self.sw_styleShemaleFilter.on = [[self.styleDict valueForKey:@"styleShemaleFilter"] boolValue];
            self.sw_styleEtcFilter.on = [[self.styleDict valueForKey:@"styleEtcFilter"] boolValue];
            
            self.sw_lookingLoverFilter.on = [[self.lookingDict valueForKey:@"lookingLoverFilter"] boolValue];
            self.sw_lookingFriendFilter.on = [[self.lookingDict valueForKey:@"lookingFriendFilter"] boolValue];
            self.sw_lookingEpalFilter.on = [[self.lookingDict valueForKey:@"lookingEPalFilter"] boolValue];
            self.sw_lookingMPalFilter.on = [[self.lookingDict valueForKey:@"lookingMPalFilter"] boolValue];
            self.sw_lookingTPalFilter.on = [[self.lookingDict valueForKey:@"lookingTPalFilter"] boolValue];
            self.sw_lookingCircleFilter.on = [[self.lookingDict valueForKey:@"lookingCircleFilter"] boolValue];
            self.sw_lookingRoommateFilter.on = [[self.lookingDict valueForKey:@"lookingRoommateFilter"] boolValue];
            self.sw_lookingBPartnerFilter.on = [[self.lookingDict valueForKey:@"lookingBPartnerFilter"] boolValue];
            self.sw_lookingBenefitsFilter.on = [[self.lookingDict valueForKey:@"lookingFriendWithBenefitsFilter"] boolValue];
            
             self.sw_bodyshapeSecretFilter.on = [[self.bodyShapeDict valueForKey:@"bodyShapeSecretFilter"] boolValue];
             self.sw_bodyshapeSlimFilter.on = [[self.bodyShapeDict valueForKey:@"bodyShapeSlimFilter"] boolValue];
             self.sw_bodyshapeAveFilter.on = [[self.bodyShapeDict valueForKey:@"bodyShapeAverageFilter"] boolValue];
             self.sw_bodyshapeChubbyFilter.on = [[self.bodyShapeDict valueForKey:@"bodyShapeChubbyFilter"] boolValue];
             self.sw_bodyshapeVChubbyFilter.on = [[self.bodyShapeDict valueForKey:@"bodyShapeVeryChubbyFilter"] boolValue];
            
             self.sw_muscleSecretFilter.on = [[self.muscleDict valueForKey:@"muscleSecretFilter"] boolValue];
             self.sw_muscleDelicateFilter.on = [[self.muscleDict valueForKey:@"muscleDelicateFilter"] boolValue];
             self.sw_muscleAveFilter.on = [[self.muscleDict valueForKey:@"muscleAverageFilter"] boolValue];
             self.sw_muscleWellBuiltFilter.on = [[self.muscleDict valueForKey:@"muscleWell-builtFilter"] boolValue];
             self.sw_muscleBodybuilderFilter.on = [[self.muscleDict valueForKey:@"muscleBodybuilderFilter"] boolValue];
            
             self.sw_bodyHairSecretFilter.on = [[self.bodyHairDict valueForKey:@"bodyHairSecretFilter"] boolValue];
             self.sw_bodyHairSmoothFilter.on = [[self.bodyHairDict valueForKey:@"bodyHairSmoothFilter"] boolValue];
             self.sw_bodyHairAveFilter.on = [[self.bodyHairDict valueForKey:@"bodyHairAverageFilter"] boolValue];
             self.sw_bodyHairHairyFilter.on = [[self.bodyHairDict valueForKey:@"bodyHairHairyFilter"] boolValue];
            
             self.sw_hairStyleSecretFilter.on = [[self.hairStyleDict valueForKey:@"hairStyleSecretFilter"] boolValue];
             self.sw_hairStyleShavedHeadFilter.on = [[self.hairStyleDict valueForKey:@"hairStyleShavedHeadFilter"] boolValue];
             self.sw_hairStyleShortHairFilter.on = [[self.hairStyleDict valueForKey:@"hairStyleShortHairFilter"] boolValue];
             self.sw_hairStyleAveFilter.on = [[self.hairStyleDict valueForKey:@"hairStyleAverageFilter"] boolValue];
             self.sw_hairStyleSemiLongHairFilter.on = [[self.hairStyleDict valueForKey:@"hairStyleSemiLongHairFilter"] boolValue];
             self.sw_hairStyleLongHairFilter.on = [[self.hairStyleDict valueForKey:@"hairStyleLongHairFilter"] boolValue];
             self.sw_hairStyleUniqueFilter.on = [[self.hairStyleDict valueForKey:@"hairStyleUniqueStyleFilter"] boolValue];
            
             self.sw_hairColorSecretFilter.on = [[self.hairColorDict valueForKey:@"hairColorSecretFilter"] boolValue];
             self.sw_hairColorBlackFilter.on = [[self.hairColorDict valueForKey:@"hairColorBlackFilter"] boolValue];
             self.sw_hairColorBrownRedFilter.on = [[self.hairColorDict valueForKey:@"hairColorBrownFilter"] boolValue];
             self.sw_hairColorBlondFilter.on = [[self.hairColorDict valueForKey:@"hairColorBlondFilter"] boolValue];
             self.sw_hairColorWhiteFilter.on = [[self.hairColorDict valueForKey:@"hairColorWhiteFilter"] boolValue];
             self.sw_hairColorUniqueFilter.on = [[self.hairColorDict valueForKey:@"hairColorUniqueColorFilter"] boolValue];
            
             self.sw_otherCharacterMustacheFilter.on = [[self.otherCharacterDict valueForKey:@"otherCharacteristicsMustacheFilter"] boolValue];
             self.sw_otherCharacterTanningSkinFilter.on = [[self.otherCharacterDict valueForKey:@"otherCharacteristicsTanningSkinFilter"] boolValue];
             self.sw_otherCharacterGlassesFilter.on = [[self.otherCharacterDict valueForKey:@"otherCharacteristicsGlassesFilter"] boolValue];
             self.sw_otherCharacterPiarceFilter.on = [[self.otherCharacterDict valueForKey:@"otherCharacteristicsPiarceFilter"] boolValue];
             self.sw_otherCharacterTatooFilter.on = [[self.otherCharacterDict valueForKey:@"otherCharacteristicsTatooFilter"] boolValue];
             
             self.sw_personality0.on =[[self.personalityDict valueForKey:@"personalityCheerfulFilter"] boolValue];
             self.sw_personality1.on =[[self.personalityDict valueForKey:@"personalitySeriousFilter"] boolValue];
             self.sw_personality2.on =[[self.personalityDict valueForKey:@"personalityFunnyFilter"] boolValue];
             self.sw_personality3.on =[[self.personalityDict valueForKey:@"personalityTakeTheLeadFilter"] boolValue];
             self.sw_personality4.on =[[self.personalityDict valueForKey:@"personalitySociableFilter"] boolValue];
             self.sw_personality5.on =[[self.personalityDict valueForKey:@"personalityFollowFilter"] boolValue];
             self.sw_personality6.on =[[self.personalityDict valueForKey:@"personalityFlashyFilter"] boolValue];
             self.sw_personality7.on =[[self.personalityDict valueForKey:@"personalityActBasedOnEmotionsFilter"] boolValue];
             self.sw_personality8.on =[[self.personalityDict valueForKey:@"personalityBoldFilter"] boolValue];
             self.sw_personality9.on =[[self.personalityDict valueForKey:@"personalityWantStimulationFilter"] boolValue];
             self.sw_personality10.on =[[self.personalityDict valueForKey:@"personalityRealismFilter"] boolValue];
             self.sw_personality11.on =[[self.personalityDict valueForKey:@"personalityOptimisticFilter"] boolValue];
             self.sw_personality12.on =[[self.personalityDict valueForKey:@"personalityMasculineFilter"] boolValue];
             self.sw_personality13.on =[[self.personalityDict valueForKey:@"personalityStrongPersonFilter"] boolValue];
             self.sw_personality14.on =[[self.personalityDict valueForKey:@"personalityWantToProtectFilter"] boolValue];
             self.sw_personality15.on =[[self.personalityDict valueForKey:@"personalityIndoorsyFilter"] boolValue];
             self.sw_personality16.on =[[self.personalityDict valueForKey:@"personalityBookishTypeFilter"] boolValue];
             self.sw_personality17.on =[[self.personalityDict valueForKey:@"personalityLoveToTalkAboutFilter"] boolValue];
             self.sw_personality18.on =[[self.personalityDict valueForKey:@"personalityLookingToMeetFilter"] boolValue];
            
             self.sw_gayCareer0.on =[[self.gayCareerDict valueForKey:@"gayCareerSecretFilter"] boolValue];
             self.sw_gayCareer1.on =[[self.gayCareerDict valueForKey:@"gayCareerBeginnerFilter"] boolValue];
             self.sw_gayCareer2.on =[[self.gayCareerDict valueForKey:@"gayCareerAverageFilter"] boolValue];
             self.sw_gayCareer3.on =[[self.gayCareerDict valueForKey:@"gayCareerExpertFilter"] boolValue];
             
             self.sw_comingOut0.on =[[self.comingOutDict valueForKey:@"comingoutSecretFilter"] boolValue];
             self.sw_comingOut1.on =[[self.comingOutDict valueForKey:@"comingoutNobodyKnowsFilter"] boolValue];
             self.sw_comingOut2.on =[[self.comingOutDict valueForKey:@"comingoutSomeoneCloseKnowFilter"] boolValue];
             self.sw_comingOut3.on =[[self.comingOutDict valueForKey:@"comingoutMostPeopleKnowFilter"] boolValue];
            
             self.sw_loveStyle0.on =[[self.loveStyleDict valueForKey:@"loveStylesSecretFilter"] boolValue];
             self.sw_loveStyle1.on =[[self.loveStyleDict valueForKey:@"loveStylesCloseFilter"] boolValue];
             self.sw_loveStyle2.on =[[self.loveStyleDict valueForKey:@"loveStylesAverageFilter"] boolValue];
             self.sw_loveStyle3.on =[[self.loveStyleDict valueForKey:@"loveStylesSimpleFilter"] boolValue];
             self.sw_loveStyle4.on =[[self.loveStyleDict valueForKey:@"loveStylesUpToyouFilter"] boolValue];
             
             self.sw_expect0.on =[[self.expectDict valueForKey:@"expectSecretFilter"] boolValue];
             self.sw_expect1.on =[[self.expectDict valueForKey:@"expectpersonalityFilter"] boolValue];
             self.sw_expect2.on =[[self.expectDict valueForKey:@"expectAppearanceFilter"] boolValue];
             self.sw_expect3.on =[[self.expectDict valueForKey:@"expectAtmosphereFilter"] boolValue];
             self.sw_expect4.on =[[self.expectDict valueForKey:@"expectBodyFilter"] boolValue];
             self.sw_expect5.on =[[self.expectDict valueForKey:@"expectSexFilter"] boolValue];
             self.sw_expect6.on =[[self.expectDict valueForKey:@"expectInterestFilter"] boolValue];
             self.sw_expect7.on =[[self.expectDict valueForKey:@"expectCircumstanceFilter"] boolValue];
             self.sw_expect8.on =[[self.expectDict valueForKey:@"expectFinanceFilter"] boolValue];
             self.sw_expect9.on =[[self.expectDict valueForKey:@"expectDistanceFilter"] boolValue];

             self.sw_job0.on = [[self.jobDict valueForKey:@"jobSecretFilter"] boolValue];
             self.sw_job1.on = [[self.jobDict valueForKey:@"jobStudentFilter"] boolValue];
             self.sw_job2.on = [[self.jobDict valueForKey:@"jobBetweenJobsFilter"] boolValue];
             self.sw_job3.on = [[self.jobDict valueForKey:@"jobOfficeWorkFilter"] boolValue];
             self.sw_job4.on = [[self.jobDict valueForKey:@"jobServicesFilter"] boolValue];
             self.sw_job5.on = [[self.jobDict valueForKey:@"jobManufacturingFilter"] boolValue];
             self.sw_job6.on = [[self.jobDict valueForKey:@"jobComputerFilter"] boolValue];
             self.sw_job7.on = [[self.jobDict valueForKey:@"jobLanguageFilter"] boolValue];
             self.sw_job8.on =  [[self.jobDict valueForKey:@"jobAssetsFilter"] boolValue];
             self.sw_job9.on = [[self.jobDict valueForKey:@"jobLawFilter"] boolValue];
             self.sw_job10.on = [[self.jobDict valueForKey:@"jobMediaFilter"] boolValue];
             self.sw_job11.on = [[self.jobDict valueForKey:@"jobPublishingFilter"] boolValue];
             self.sw_job12.on = [[self.jobDict valueForKey:@"jobDomesticFilter"] boolValue];
             self.sw_job13.on = [[self.jobDict valueForKey:@"jobMedicalProfessionFilter"] boolValue];
             self.sw_job14.on = [[self.jobDict valueForKey:@"jobHealthFilter"] boolValue];
             self.sw_job15.on = [[self.jobDict valueForKey:@"jobArchitectureFilter"] boolValue];
             self.sw_job16.on =[[self.jobDict valueForKey:@"jobCreativeProfessionFilter"] boolValue];
             self.sw_job17.on =[[self.jobDict valueForKey:@"jobCookingFilter"] boolValue];
             self.sw_job18.on = [[self.jobDict valueForKey:@"jobVehicleFilter"] boolValue];
             self.sw_job19.on = [[self.jobDict valueForKey:@"jobTravelFilter"] boolValue];
             self.sw_job20.on = [[self.jobDict valueForKey:@"jobBeautyFilter"] boolValue];
             self.sw_job21.on = [[self.jobDict valueForKey:@"jobEntertainmentFilter"] boolValue];
             self.sw_job22.on = [[self.jobDict valueForKey:@"jobReligiousProfessionFilter"] boolValue];
             self.sw_job23.on = [[self.jobDict valueForKey:@"jobCeremonialOccasionsFilter"] boolValue];
             self.sw_job24.on = [[self.jobDict valueForKey:@"jobNatureFilter"] boolValue];
             self.sw_job25.on = [[self.jobDict valueForKey:@"jobSportsFilter"] boolValue];
             self.sw_job26.on =[[self.jobDict valueForKey:@"jobSexIndustryFilter"] boolValue];

             self.sw_home0.on = [[self.homeDict valueForKey:@"livingSecretFilter"] boolValue];
             self.sw_home1.on = [[self.homeDict valueForKey:@"livingAloneFilter"] boolValue];
             self.sw_home2.on = [[self.homeDict valueForKey:@"livingwithFamilyFilter"] boolValue];
             self.sw_home3.on = [[self.homeDict valueForKey:@"livingwithFriendsorLoversFilter"] boolValue];
             
             self.sw_lifePol0.on = [[self.lifePolDict valueForKey:@"lifePolicyVegetarianFilter"] boolValue];
             self.sw_lifePol1.on = [[self.lifePolDict valueForKey:@"lifePolicyNoSmokingFilter"] boolValue];
             self.sw_lifePol2.on = [[self.lifePolDict valueForKey:@"lifePolicyNoDrinkingFilter"] boolValue];
             self.sw_lifePol3.on = [[self.lifePolDict valueForKey:@"lifePolicyNoGamblingFilter"] boolValue];
             self.sw_lifePol4.on = [[self.lifePolDict valueForKey:@"lifePolicyNoSexFilter"] boolValue];
             
             self.sw_sexPosi0.on = [[self.sexPosiDict valueForKey:@"sexPositionSecretFilter"] boolValue];
             self.sw_sexPosi1.on = [[self.sexPosiDict valueForKey:@"sexPositionTopFilter"] boolValue];
             self.sw_sexPosi2.on = [[self.sexPosiDict valueForKey:@"sexPositionBottomFilter"] boolValue];
             self.sw_sexPosi3.on = [[self.sexPosiDict valueForKey:@"sexPositionVersatileFilter"] boolValue];
             
             //sw_penisSize.on = 
            
             self.sw_penisThi0.on = [[self.penisThiDict valueForKey:@"penisThicknessSecretFilter"] boolValue];
             self.sw_penisThi1.on = [[self.penisThiDict valueForKey:@"penisThicknessSlenderFilter"] boolValue];
             self.sw_penisThi2.on = [[self.penisThiDict valueForKey:@"penisThicknessAverageFilter"] boolValue];
             self.sw_penisThi3.on = [[self.penisThiDict valueForKey:@"penisThicknessPlumpFilter"] boolValue];
             self.sw_penisThi4.on = [[self.penisThiDict valueForKey:@"penisThicknessExtraThickFilter"] boolValue];

             self.sw_phimosis0.on = [[self.phimosisDict valueForKey:@"phimosisSecretFilter"] boolValue];
             self.sw_phimosis1.on = [[self.phimosisDict valueForKey:@"phimosisCutFilter"] boolValue];
             self.sw_phimosis2.on = [[self.phimosisDict valueForKey:@"phimosisUncutFilter"] boolValue];
             self.sw_phimosis3.on = [[self.phimosisDict valueForKey:@"phimosisOverhangFilter"] boolValue];
             
             self.sw_sado0.on = [[self.sadoDict valueForKey:@"sadomasochismSecretFilter"] boolValue];
             self.sw_sado1.on = [[self.sadoDict valueForKey:@"sadomasochismSadisticFilter"] boolValue];
             self.sw_sado2.on = [[self.sadoDict valueForKey:@"sadomasochismMasochisticFilter"] boolValue];
             self.sw_sado3.on = [[self.sadoDict valueForKey:@"sadomasochismBothFilter"] boolValue];
             self.sw_sado4.on = [[self.sadoDict valueForKey:@"sadomasochismNeitherFilter"] boolValue];
             
             self.sw_feti0.on = [[self.fetiDict valueForKey:@"fetishBDSMFilter"] boolValue];
             self.sw_feti1.on = [[self.fetiDict valueForKey:@"fetishBigCockFilter"] boolValue];
             self.sw_feti2.on = [[self.fetiDict valueForKey:@"fetishSmallCockFilter"] boolValue];
             self.sw_feti3.on = [[self.fetiDict valueForKey:@"fetishUncutFilter"] boolValue];
             self.sw_feti4.on = [[self.fetiDict valueForKey:@"fetishSmellFetishFilter"] boolValue];
             self.sw_feti5.on = [[self.fetiDict valueForKey:@"fetishUniformFetishFilter"] boolValue];
             self.sw_feti6.on = [[self.fetiDict valueForKey:@"fetishRubberFilter"] boolValue];
             self.sw_feti7.on = [[self.fetiDict valueForKey:@"fetishDragFilter"] boolValue];
             self.sw_feti8.on = [[self.fetiDict valueForKey:@"fetishFlasherFilter"] boolValue];
             self.sw_feti9.on = [[self.fetiDict valueForKey:@"fetishGangbangFilter"] boolValue];
             self.sw_feti10.on = [[self.fetiDict valueForKey:@"fetishHardcorePlayFilter"] boolValue];
             self.sw_feti11.on = [[self.fetiDict valueForKey:@"fetishPhoneSexFilter"] boolValue];
             self.sw_feti12.on = [[self.fetiDict valueForKey:@"fetishTeenLoverFilter"] boolValue];
             self.sw_feti13.on = [[self.fetiDict valueForKey:@"fetishMatureLoverFilter"] boolValue];
             self.sw_feti14.on = [[self.fetiDict valueForKey:@"fetishChubbyLoverFilter"] boolValue];
            

            filterSettings = [account getEnabled];
            self.sw_filterApply.on = filterSettings;
            
            if(sw_filterApply.on){
                sectionsCount = SECTION_MAX;
            }else{
                sectionsCount = SECTION_MIN;
            }
            //NSLog(@"Did Appear");;
            
            [self.tableView reloadData];
        });
    });
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        
        //NSLog(@"popView");
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            int age = [account getAgeFilter];
            if(age < AGE_MIN){
                [account setAgeFilter:18];
            }
            [account setRaceFilter:self.raceDict];
            [account setSexuallityFilter:self.sexualityDict];
            [account setStyleFilter:self.styleDict];
            [account setLookingForFilter:self.lookingDict];
            [account setBodyShapeFilter:self.bodyShapeDict];
            [account setMuscleFilter:self.muscleDict];
            [account setBodyHairFilter:self.bodyHairDict];
            [account setHairStyleFilter:self.hairStyleDict];
            [account setHairColorFilter:self.hairColorDict];
            [account setOtherCharacteristicsFilter:self.otherCharacterDict];
            [account setPersonalityFilter:self.personalityDict];
            [account setGayCareerFilter:self.gayCareerDict];
            [account setComingoutFilter:self.comingOutDict];
            [account setLoveStylesFilter:self.loveStyleDict];
            [account setExpectFilter:self.expectDict];
            [account setJobFilter:self.jobDict];
            [account setLivingFilter:self.homeDict];
            [account setLifePolicyFilter:self.lifePolDict];
            [account setSexPositionFilter:self.sexPosiDict];
            [account setPenisThicknessFilter:self.penisThiDict];
            [account setPhimosisFilter:self.phimosisDict];
            [account setSadomasochismFilter:self.sadoDict];
            [account setFetishFilter:self.fetiDict];
        });
    }
    [super viewWillDisappear:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return sectionsCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    int rows = 0;

    switch (section) {
        case 0: rows = 1; break; //Apply
        case 1: rows = 3; break; //Basic
        case 2: rows = 3; break; //Sexuallity
        case 3: rows = 8; break; //Race
        case 4: rows = 19; break; //Your Style
        case 5: rows = 9; break; //Looking for
        case 6: rows = 5; break; //Body Shape
        case 7: rows = 5; break; //Muscle
        case 8: rows = 4; break; //Body Hair
        case 9: rows = 7; break; //Hair Style
        case 10: rows = 6;break; //Hair Color
        case 11: rows = 5;break; //Other Characteristics
        case 12: rows = 18;break; //Personality
        case 13: rows = 4;break; //Gay Career
        case 14: rows = 4;break; //Coming out
        case 15: rows = 5;break; //Love Styles
        case 16: rows = 10;break; //What do you expect the most in companion?
        case 17: rows = 27;break; //Job
        case 18: rows = 4;break; //Home
        case 19: rows = 5;break; //Life Policy
        case 20: rows = 4;break; //Sex Position
        case 21: rows = 1;break; //Penis Size
        case 22: rows = 5;break; //Penis Thickness
        case 23: rows = 4;break; //Phimosis
        case 24: rows = 5;break; //Sadomasochism
        case 25: rows = 15;break; //Fetish
        default:
            break;
    }
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    switch (indexPath.section) {
        case 0: //Apply Filter
            switch (indexPath.row) {
                case 0: cell = cell_applyFilter; break;
                default:break;
            }
            break;
        case 1: //Basic
            switch (indexPath.row) {
                case 0:
                    cell = cell_ageFilter;
                    [self setAgeFilterLabel];
                    break;
                case 1:
                    cell = cell_heightFilter;
                    [self setHeightFilterLabel];
                    break;
                case 2:
                    cell = cell_weightFilter;
                    [self setWeightFilterLabel];
                    break;
                default:break;
            }
            break;
        case 2: //Sexuallity
            switch (indexPath.row) {
                case 0:
                    cell = cell_sexGayFilter;
                    //[self.sexualityDict[@"sexGayFilter"] boolValue]
                    //self.sw_sexGayFilter.on = [self.sexualityDict[@"sexGayFilter"] boolValue];
                    break;
                case 1: cell = cell_sexBisexualFilter; break;
                case 2: cell = cell_sexStraightFilter; break;
                default:break;
            }
            break;
        case 3: //Race
            switch (indexPath.row) {
                case 0: cell = cell_raceAsianFilter; break;
                case 1: cell = cell_raceWhiteFilter; break;
                case 2: cell = cell_raceBlackFilter; break;
                case 3: cell = cell_raceLatinFilter; break;
                case 4: cell = cell_raceArabFilter; break;
                case 5: cell = cell_racePolFilter; break;
                case 6: cell = cell_raceMixFilter; break;
                case 7: cell = cell_raceEtcFilter; break;
                default:break;
            }
            break;
        case 4: //Your Style
            switch (indexPath.row) {
                case 0: cell = cell_styleTwinkFilter; break;
                case 1: cell = cell_styleHunkFilter; break;
                case 2: cell = cell_styleSurferFilter; break;
                case 3: cell = cell_styleHipHopFilter; break;
                case 4: cell = cell_styleThugFilter; break;
                case 5: cell = cell_stylePunkFilter; break;
                case 6: cell = cell_styleWhiteCollarFilter; break;
                case 7: cell = cell_styleHardcoreGayFilter; break;
                case 8: cell = cell_stylePotatoFilter; break;
                case 9: cell = cell_styleBearFilter; break;
                case 10: cell = cell_styleGeekFilter; break;
                case 11: cell = cell_styleChubbyFilter; break;
                case 12: cell = cell_styleBeefyFilter; break;
                case 13: cell = cell_styleBodyBuilderFilter; break;
                case 14: cell = cell_styleSlimWellMuscledFilter; break;
                case 15: cell = cell_styleSlimSkinnyFilter; break;
                case 16: cell = cell_styleFeminineFilter; break;
                case 17: cell = cell_styleShemaleFilter; break;
                case 18: cell = cell_styleEtcFilter; break;
                default:break;
            }
            break;
        case 5: //Looking for
            switch (indexPath.row) {
                case 0: cell = cell_lookingLoverFilter; break;
                case 1: cell = cell_lookingFriendFilter; break;
                case 2: cell = cell_lookingEpalFilter; break;
                case 3: cell = cell_lookingMPalFilter; break;
                case 4: cell = cell_lookingTPalFilter; break;
                case 5: cell = cell_lookingCircleFilter; break;
                case 6: cell = cell_lookingRoommateFilter; break;
                case 7: cell = cell_lookingBPartnerFilter; break;
                case 8: cell = cell_lookingBenefitsFilter; break;
                default:break;
            }
            break;
        case 6:// Body Shape
            switch (indexPath.row) {
                case 0: cell = cell_bodyshapeSecretFilter; break;
                case 1: cell = cell_bodyshapeSlimFilter; break;
                case 2: cell = cell_bodyshapeAveFilter; break;
                case 3: cell = cell_bodyshapeChubbyFilter; break;
                case 4: cell = cell_bodyshapeVChubbyFilter; break;
                default:break;
            }
            break;
        case 7: //Muscle
            switch (indexPath.row) {
                case 0: cell = cell_muscleSecretFilter; break;
                case 1: cell = cell_muscleDelicateFilter; break;
                case 2: cell = cell_muscleAveFilter; break;
                case 3: cell = cell_muscleWellBuiltFilter; break;
                case 4: cell = cell_muscleBodybuilderFilter; break;
                default:break;
            }
            break;
        case 8: //Body Hair
            switch (indexPath.row) {
                case 0: cell = cell_bodyHairSecretFilter; break;
                case 1: cell = cell_bodyHairSlimFilter; break;
                case 2: cell = cell_bodyHairAveFilter; break;
                case 3: cell = cell_bodyHairHairyFilter; break;
                default:break;
            }
            break;
        case 9: //Hair Style
            switch (indexPath.row) {
                case 0: cell = cell_hairStyleSecretFilter; break;
                case 1: cell = cell_hairStyleShavedHeadFilter; break;
                case 2: cell = cell_hairStyleShortHairFilter; break;
                case 3: cell = cell_hairStyleAveFilter; break;
                case 4: cell = cell_hairStyleSemiLongHairFilter; break;
                case 5: cell = cell_hairStyleLongHairFilter; break;
                case 6: cell = cell_hairStyleUniqueFilter; break;
                default:break;
            }
            break;
        case 10: // Hair Color
            switch (indexPath.row) {
                case 0: cell = cell_hairColorSecretFilter; break;
                case 1: cell = cell_hairColorBlackFilter; break;
                case 2: cell = cell_hairColorBrownRedFilter; break;
                case 3: cell = cell_hairColorBlondFilter; break;
                case 4: cell = cell_hairColorWhiteFilter; break;
                case 5: cell = cell_hairColorUniqueFilter; break;
                default:break;
            }
            break;
        case 11: //Other...
            switch (indexPath.row) {
                case 0: cell = cell_otherCharacterMustacheFilter; break;
                case 1: cell = cell_otherCharacterTanningSkinFilter; break;
                case 2: cell = cell_otherCharacterGlassesFilter; break;
                case 3: cell = cell_otherCharacterPiarceFilter; break;
                case 4: cell = cell_otherCharacterTatooFilter; break;
                default:break;
            }
            break;
        case 12: //Personality
            switch (indexPath.row) {
                case 0: cell = cell_personality0; break;
                case 1: cell = cell_personality1; break;
                case 2: cell = cell_personality2; break;
                case 3: cell = cell_personality3; break;
                case 4: cell = cell_personality4; break;
                case 5: cell = cell_personality5; break;
                case 6: cell = cell_personality6; break;
                case 7: cell = cell_personality7; break;
                case 8: cell = cell_personality8; break;
                case 9: cell = cell_personality9; break;
                case 10: cell = cell_personality10; break;
                case 11: cell = cell_personality11; break;
                case 12: cell = cell_personality12; break;
                case 13: cell = cell_personality13; break;
                case 14: cell = cell_personality14; break;
                case 15: cell = cell_personality15; break;
                case 16: cell = cell_personality16; break;
                case 17: cell = cell_personality17; break;
                default:break;
            }
            break;
        case 13: //Gay Caree
            switch (indexPath.row) {
                case 0: cell = cell_gayCareer0; break;
                case 1: cell = cell_gayCareer1; break;
                case 2: cell = cell_gayCareer2; break;
                case 3: cell = cell_gayCareer3; break;
                default:break;
            }
            break;
        case 14: //Coming out
            switch (indexPath.row) {
                case 0: cell = cell_comingOut0; break;
                case 1: cell = cell_comingOut1; break;
                case 2: cell = cell_comingOut2; break;
                case 3: cell = cell_comingOut3; break;
                default:break;
            }
            break;
        case 15: //LoveStyle
            switch (indexPath.row) {
                case 0: cell = cell_loveStyle0; break;
                case 1: cell = cell_loveStyle1; break;
                case 2: cell = cell_loveStyle2; break;
                case 3: cell = cell_loveStyle3; break;
                case 4: cell = cell_loveStyle4; break;
                default:break;
            }
            break;
        case 16: //Expect
            switch (indexPath.row) {
                case 0: cell = cell_expect0; break;
                case 1: cell = cell_expect1; break;
                case 2: cell = cell_expect2; break;
                case 3: cell = cell_expect3; break;
                case 4: cell = cell_expect4; break;
                case 5: cell = cell_expect5; break;
                case 6: cell = cell_expect6; break;
                case 7: cell = cell_expect7; break;
                case 8: cell = cell_expect8; break;
                case 9: cell = cell_expect9; break;
                default:break;
            }
            break;
        case 17: //Job
            switch (indexPath.row) {
                case 0: cell = cell_job0; break;
                case 1: cell = cell_job1; break;
                case 2: cell = cell_job2; break;
                case 3: cell = cell_job3; break;
                case 4: cell = cell_job4; break;
                case 5: cell = cell_job5; break;
                case 6: cell = cell_job6; break;
                case 7: cell = cell_job7; break;
                case 8: cell = cell_job8; break;
                case 9: cell = cell_job9; break;
                case 10: cell = cell_job10; break;
                case 11: cell = cell_job11; break;
                case 12: cell = cell_job12; break;
                case 13: cell = cell_job13; break;
                case 14: cell = cell_job14; break;
                case 15: cell = cell_job15; break;
                case 16: cell = cell_job16; break;
                case 17: cell = cell_job17; break;
                case 18: cell = cell_job18; break;
                case 19: cell = cell_job19; break;
                case 20: cell = cell_job20; break;
                case 21: cell = cell_job21; break;
                case 22: cell = cell_job22; break;
                case 23: cell = cell_job23; break;
                case 24: cell = cell_job24; break;
                case 25: cell = cell_job25; break;
                case 26: cell = cell_job26; break;
                default:break;
            }
            break;
        case 18: //Home
            switch (indexPath.row) {
                case 0: cell = cell_home0; break;
                case 1: cell = cell_home1; break;
                case 2: cell = cell_home2; break;
                case 3: cell = cell_home3; break;
                default:break;
            }
            break;
        case 19: //Life Policy
            switch (indexPath.row) {
                case 0: cell = cell_lifePol0; break;
                case 1: cell = cell_lifePol1; break;
                case 2: cell = cell_lifePol2; break;
                case 3: cell = cell_lifePol3; break;
                case 4: cell = cell_lifePol4; break;
                default:break;
            }
            break;
        case 20: //Sex Position
            switch (indexPath.row) {
                case 0: cell = cell_sexPosi0; break;
                case 1: cell = cell_sexPosi1; break;
                case 2: cell = cell_sexPosi2; break;
                case 3: cell = cell_sexPosi3; break;
                default:break;
            }
            break;
        case 21: //Penis size
            switch (indexPath.row) {
                case 0:
                    cell = cell_penisSize;
                    [self setPenisSizeFilterLabel];
                    break;
                default:break;
            }
            break;
        case 22: //Penis Thickness
            switch (indexPath.row) {
                case 0: cell = cell_penisThi0; break;
                case 1: cell = cell_penisThi1; break;
                case 2: cell = cell_penisThi2; break;
                case 3: cell = cell_penisThi3; break;
                case 4: cell = cell_penisThi4; break;
                default:break;
            }
            break;
        case 23: //Phimosis
            switch (indexPath.row) {
                case 0: cell = cell_phimosis0; break;
                case 1: cell = cell_phimosis1; break;
                case 2: cell = cell_phimosis2; break;
                case 3: cell = cell_phimosis3; break;
                default:break;
            }
            break;
        case 24: //Sadomasochism
            switch (indexPath.row) {
                case 0: cell = cell_sado0; break;
                case 1: cell = cell_sado1; break;
                case 2: cell = cell_sado2; break;
                case 3: cell = cell_sado3; break;
                case 4: cell = cell_sado4; break;
                default:break;
            }
            break;
        case 25: //Fetish
            switch (indexPath.row) {
                case 0: cell = cell_feti0; break;
                case 1: cell = cell_feti1; break;
                case 2: cell = cell_feti2; break;
                case 3: cell = cell_feti3; break;
                case 4: cell = cell_feti4; break;
                case 5: cell = cell_feti5; break;
                case 6: cell = cell_feti6; break;
                case 7: cell = cell_feti7; break;
                case 8: cell = cell_feti8; break;
                case 9: cell = cell_feti9; break;
                case 10: cell = cell_feti10; break;
                case 11: cell = cell_feti11; break;
                case 12: cell = cell_feti12; break;
                case 13: cell = cell_feti13; break;
                case 14: cell = cell_feti14; break;
                default:break;
            }
            break;
        default:
            break;
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

/*
- (IBAction)btn_cancelPush:(id)sender {
    UIAlertView* alert = [UIAlertView alertViewWithTitle:nil message:NSLocalizedString(@"ALERT_FILTER_RESET_MESSAGE", nil)];
    [alert addButtonWithTitle:NSLocalizedString(@"DISCARD_BUTTON", nil) handler:^(void){
        [account setEnabled:NO];
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert setCancelButtonWithTitle:NSLocalizedString(@"CANCEL_BUTTON", nil) handler:^(void){
        //if(filterSettings == YES){
        //    [account setEnabled:YES];
        //}
        //[self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert show];
}
*/

- (IBAction)btn_donePush:(id)sender {
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q_global, ^{
        CoolioWebService* coolio = [[CoolioWebService alloc] init];
        [coolio getUsers];
    });
    [SVProgressHUD show];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sw_applyFilter_valueChanged:(id)sender {
    UISwitch* sw = (UISwitch*)sender;
    if(sw.on){
        [account setEnabled:YES];
        sectionsCount = SECTION_MAX;
        [self.tableView reloadData];
    }else{
        [account setEnabled:NO];
        sectionsCount = SECTION_MIN;
        [self.tableView reloadData];
    }
}

- (IBAction)sw_sexGayFilter_valueChanged:(id)sender
{
    //[self.sexualityDict setValue:((UISwitch*)sender).on forKey:@"sexGayFilter"];
    UISwitch* sw = (UISwitch *)sender;
    if(sw.on == YES){
        self.sexualityDict[@"sexGayFilter"] = @YES;
        //NSLog(@"%@", self.sexualityDict[@"sexGayFilter"]);
    }else{
        self.sexualityDict[@"sexGayFilter"] = @NO;
         //NSLog(@"YES");
    }
    [account setSexuallityFilter:self.sexualityDict];
}
- (IBAction)sw_sexBisexualFilter_valueChanged:(id)sender{
    //[self.sexualityDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"sexBisexFilter"];
    UISwitch* sw = (UISwitch *)sender;
    if(sw.on == YES){
        self.sexualityDict[@"sexBisexFilter"] = @YES;
        //NSLog(@"%@", self.sexualityDict[@"sexBisexFilter"]);
    }else{
        self.sexualityDict[@"sexBisexFilter"] = @NO;
    }
    [account setSexuallityFilter:self.sexualityDict];
}

- (IBAction)sw_sexStraightFilter_valueChanged:(id)sender{
    //[self.sexualityDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"sexStraightFilter"];
    UISwitch* sw = (UISwitch *)sender;
    if(sw.on == YES){
        self.sexualityDict[@"sexStraightFilter"] = @YES;
        //NSLog(@"%@", self.sexualityDict[@"sexStraightFilter"]);
    }else{
        self.sexualityDict[@"sexStraightFilter"] = @NO;
    }
    [account setSexuallityFilter:self.sexualityDict];
}

- (IBAction)sw_raceAsianFilter_valueChanged:(id)sender{
    //[self.raceDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"raceAsianFilter"];
    UISwitch* sw = (UISwitch *)sender;
    if(sw.on == YES){
        self.raceDict[@"raceAsianFilter"] = @YES;
        //NSLog(@"YES");
    }else{
        self.raceDict[@"raceAsianFilter"] = @NO;
    }
    [account setRaceFilter:self.raceDict];
}
- (IBAction)sw_raceWhiteFilter_valueChanged:(id)sender{
    [self.raceDict setValue:@(((UISwitch *)sender).on) forKey:@"raceWhiteFilter"];
    [account setRaceFilter:self.raceDict];
}

- (IBAction)sw_raceBlackFilter_valueChanged:(id)sender{[self.raceDict setValue:@(((UISwitch *)sender).on) forKey:@"raceBlackFilter"]; [account setRaceFilter:self.raceDict];}
- (IBAction)sw_raceLatinFilter_valueChanged:(id)sender{[self.raceDict setValue:@(((UISwitch *)sender).on) forKey:@"raceLatinFilter"]; [account setRaceFilter:self.raceDict];}
- (IBAction)sw_raceArabFilter_valueChanged:(id)sender{[self.raceDict setValue:@(((UISwitch *)sender).on) forKey:@"raceArabFilter"]; [account setRaceFilter:self.raceDict];}
- (IBAction)sw_racePolFilter_valueChanged:(id)sender{[self.raceDict setValue:@(((UISwitch *)sender).on) forKey:@"racePolynesianFilter"]; [account setRaceFilter:self.raceDict];}
- (IBAction)sw_raceMixFilter_valueChanged:(id)sender{[self.raceDict setValue:@(((UISwitch *)sender).on) forKey:@"raceMixFilter"]; [account setRaceFilter:self.raceDict];}
- (IBAction)sw_raceEtcFilter_valueChanged:(id)sender{[self.raceDict setValue:@(((UISwitch *)sender).on) forKey:@"raceEtcFilter"]; [account setRaceFilter:self.raceDict];}

- (IBAction)sw_styleTwinkFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleTwinkFilter"]; [account setStyleFilter:self.styleDict];}
- (IBAction)sw_styleHunkFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleHunkFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_styleSurferFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleSurferFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_styleHipHopFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleHipHopFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_styleThugFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleThugFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_stylePunkFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"stylePunkFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_styleWhiteCollarFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleWhiteCollarFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_styleHardcoreGayFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleHardcoreGayFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_stylePotatoFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"stylePotatoFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_styleBearFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleBearFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_styleGeekFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleGeekFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_styleChubbyFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleChubbyFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_styleBeefyFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleBeefyFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_styleBodyBuilderFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleBodybuilderFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_styleSlimWellMuscledFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleWellMuscledFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_styleSlimSkinnyFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleSlimSkinnyFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_styleFeminineFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleFeminineFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_styleShemaleFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleShemaleFilter"];[account setStyleFilter:self.styleDict];}
- (IBAction)sw_styleEtcFilter_valueChanged:(id)sender{[self.styleDict setValue:@(((UISwitch *)sender).on) forKey:@"styleEtcFilter"];[account setStyleFilter:self.styleDict];}

- (IBAction)sw_lookingLoverFilter_valueChanged:(id)sender{[self.lookingDict setValue:@(((UISwitch *)sender).on) forKey:@"lookingLoverFilter"];[account setLookingForFilter:self.lookingDict];}
- (IBAction)sw_lookingFriendFilter_valueChanged:(id)sender{[self.lookingDict setValue:@(((UISwitch *)sender).on) forKey:@"lookingFriendFilter"];[account setLookingForFilter:self.lookingDict];}
- (IBAction)sw_lookingEpalFilter_valueChanged:(id)sender{[self.lookingDict setValue:@(((UISwitch *)sender).on) forKey:@"lookingEPalFilter"];[account setLookingForFilter:self.lookingDict];}
- (IBAction)sw_lookingMPalFilter_valueChanged:(id)sender{[self.lookingDict setValue:@(((UISwitch *)sender).on) forKey:@"lookingMPalFilter"];[account setLookingForFilter:self.lookingDict];}
- (IBAction)sw_lookingTPalFilter_valueChanged:(id)sender{[self.lookingDict setValue:@(((UISwitch *)sender).on) forKey:@"lookingTPalFilter"];[account setLookingForFilter:self.lookingDict];}
- (IBAction)sw_lookingCircleFilter_valueChanged:(id)sender{[self.lookingDict setValue:@(((UISwitch *)sender).on) forKey:@"lookingCircleFilter"];[account setLookingForFilter:self.lookingDict];}
- (IBAction)sw_lookingRoommateFilter_valueChanged:(id)sender{[self.lookingDict setValue:@(((UISwitch *)sender).on) forKey:@"lookingRoommateFilter"];[account setLookingForFilter:self.lookingDict];}
- (IBAction)sw_lookingBPartnerFilter_valueChanged:(id)sender{[self.lookingDict setValue:@(((UISwitch *)sender).on) forKey:@"lookingBPartnerFilter"];[account setLookingForFilter:self.lookingDict];}
- (IBAction)sw_lookingBenefitsFilter_valueChanged:(id)sender{[self.lookingDict setValue:@(((UISwitch *)sender).on) forKey:@"lookingFriendWithBenefitsFilter"];[account setLookingForFilter:self.lookingDict];}

- (IBAction)sw_bodyshapeSecretFilter_valueChanged:(id)sender{[self.bodyShapeDict setValue:@(((UISwitch *)sender).on) forKey:@"bodyShapeSecretFilter"];[account setBodyShapeFilter:self.bodyShapeDict];}
- (IBAction)sw_bodyshapeSlimFilter_valueChanged:(id)sender{[self.bodyShapeDict setValue:@(((UISwitch *)sender).on) forKey:@"bodyShapeSlimFilter"];[account setBodyShapeFilter:self.bodyShapeDict];}
- (IBAction)sw_bodyshapeAveFilter_valueChanged:(id)sender{[self.bodyShapeDict setValue:@(((UISwitch *)sender).on) forKey:@"bodyShapeAverageFilter"];[account setBodyShapeFilter:self.bodyShapeDict];}
- (IBAction)sw_bodyshapeChubbyFilter_valueChanged:(id)sender{[self.bodyShapeDict setValue:@(((UISwitch *)sender).on) forKey:@"bodyShapeChubbyFilter"];[account setBodyShapeFilter:self.bodyShapeDict];}
- (IBAction)sw_bodyshapeVChubbyFilter_valueChanged:(id)sender{[self.bodyShapeDict setValue:@(((UISwitch *)sender).on) forKey:@"bodyShapeVeryChubbyFilter"];[account setBodyShapeFilter:self.bodyShapeDict];}

- (IBAction)sw_muscleSecretFilter_valueChanged:(id)sender{[self.muscleDict setValue:@(((UISwitch *)sender).on) forKey:@"muscleSecretFilter"];[account setMuscleFilter:self.muscleDict]; }
- (IBAction)sw_muscleDelicateFilter_valueChanged:(id)sender{[self.muscleDict setValue:@(((UISwitch *)sender).on) forKey:@"muscleDelicateFilter"];[account setMuscleFilter:self.muscleDict];}
- (IBAction)sw_muscleAveFilter_valueChanged:(id)sender{[self.muscleDict setValue:@(((UISwitch *)sender).on) forKey:@"muscleAverageFilter"];[account setMuscleFilter:self.muscleDict];}
- (IBAction)sw_muscleWellBuiltFilter_valueChanged:(id)sender{[self.muscleDict setValue:@(((UISwitch *)sender).on) forKey:@"muscleWell-builtFilter"];[account setMuscleFilter:self.muscleDict];}
- (IBAction)sw_muscleBodybuilderFilter_valueChanged:(id)sender{[self.muscleDict setValue:@(((UISwitch *)sender).on) forKey:@"muscleBodybuilderFilter"];[account setMuscleFilter:self.muscleDict];}

- (IBAction)sw_bodyHairSecretFilter_valueChanged:(id)sender{[self.bodyHairDict setValue:@(((UISwitch *)sender).on) forKey:@"bodyHairSecretFilter"]; [account setBodyHairFilter:self.bodyHairDict]; }
- (IBAction)sw_bodyHairSmoothFilter_valueChanged:(id)sender{[self.bodyHairDict setValue:@(((UISwitch *)sender).on) forKey:@"bodyHairSmoothFilter"]; [account setBodyHairFilter:self.bodyHairDict];}
- (IBAction)sw_bodyHairAveFilter_valueChanged:(id)sender{[self.bodyHairDict setValue:@(((UISwitch *)sender).on) forKey:@"bodyHairAverageFilter"];[account setBodyHairFilter:self.bodyHairDict];}
- (IBAction)sw_bodyHairHairyFilter_valueChanged:(id)sender{[self.bodyHairDict setValue:@(((UISwitch *)sender).on) forKey:@"bodyHairHairyFilter"]; [account setBodyHairFilter:self.bodyHairDict];}

- (IBAction)sw_hairStyleSecretFilter_valueChanged:(id)sender{[self.hairStyleDict setValue:@(((UISwitch *)sender).on) forKey:@"hairStyleSecretFilter"]; [account setHairStyleFilter:self.hairStyleDict]; }
- (IBAction)sw_hairStyleShavedHeadFilter_valueChanged:(id)sender{[self.hairStyleDict setValue:@(((UISwitch *)sender).on) forKey:@"hairStyleShavedHeadFilter"]; [account setHairStyleFilter:self.hairStyleDict];}
- (IBAction)sw_hairStyleShortHairFilter_valueChanged:(id)sender{[self.hairStyleDict setValue:@(((UISwitch *)sender).on) forKey:@"hairStyleShortHairFilter"]; [account setHairStyleFilter:self.hairStyleDict];}
- (IBAction)sw_hairStyleAveFilter_valueChanged:(id)sender{[self.hairStyleDict setValue:@(((UISwitch *)sender).on) forKey:@"hairStyleAverageFilter"]; [account setHairStyleFilter:self.hairStyleDict];}
- (IBAction)sw_hairStyleSemiLongHairFilter_valueChanged:(id)sender{[self.hairStyleDict setValue:@(((UISwitch *)sender).on) forKey:@"hairStyleSemiLongHairFilter"]; [account setHairStyleFilter:self.hairStyleDict];}
- (IBAction)sw_hairStyleLongHairFilter_valueChanged:(id)sender{[self.hairStyleDict setValue:@(((UISwitch *)sender).on) forKey:@"hairStyleLongHairFilter"]; [account setHairStyleFilter:self.hairStyleDict];}
- (IBAction)sw_hairStyleUniqueFilter_valueChanged:(id)sender{[self.hairStyleDict setValue:@(((UISwitch *)sender).on) forKey:@"hairStyleUniqueStyleFilter"]; [account setHairStyleFilter:self.hairStyleDict];}

- (IBAction)sw_hairColorSecretFilter_valueChanged:(id)sender{[self.hairColorDict setValue:@(((UISwitch *)sender).on) forKey:@"hairColorSecretFilter"]; [account setHairColorFilter:self.hairColorDict];}
- (IBAction)sw_hairColorBlackFilter_valueChanged:(id)sender{[self.hairColorDict setValue:@(((UISwitch *)sender).on) forKey:@"hairColorBlackFilter"];  [account setHairColorFilter:self.hairColorDict];}
- (IBAction)sw_hairColorBrownRedFilter_valueChanged:(id)sender{[self.hairColorDict setValue:@(((UISwitch *)sender).on) forKey:@"hairColorBrownFilter"]; [account setHairColorFilter:self.hairColorDict];}
- (IBAction)sw_hairColorBlondFilter_valueChanged:(id)sender{[self.hairColorDict setValue:@(((UISwitch *)sender).on) forKey:@"hairColorBlondFilter"]; [account setHairColorFilter:self.hairColorDict];}
- (IBAction)sw_hairColorWhiteFilter_valueChanged:(id)sender{[self.hairColorDict setValue:@(((UISwitch *)sender).on) forKey:@"hairColorWhiteFilter"]; [account setHairColorFilter:self.hairColorDict];}
- (IBAction)sw_hairColorUniqueFilter_valueChanged:(id)sender{[self.hairColorDict setValue:@(((UISwitch *)sender).on) forKey:@"hairColorUniqueColorFilter"]; [account setHairColorFilter:self.hairColorDict];}

- (IBAction)sw_otherCharacterMustacheFilter_valueChanged:(id)sender{[self.otherCharacterDict setValue:@(((UISwitch *)sender).on) forKey:@"otherCharacteristicsMustacheFilter"];[account setOtherCharacteristicsFilter:self.otherCharacterDict]; }
- (IBAction)sw_otherCharacterTanningSkinFilter_valueChanged:(id)sender{[self.otherCharacterDict setValue:@(((UISwitch *)sender).on) forKey:@"otherCharacteristicsTanningSkinFilter"];[account setOtherCharacteristicsFilter:self.otherCharacterDict]; }
- (IBAction)sw_otherCharacterGlassesFilter_valueChanged:(id)sender{[self.otherCharacterDict setValue:@(((UISwitch *)sender).on) forKey:@"otherCharacteristicsGlassesFilter"];[account setOtherCharacteristicsFilter:self.otherCharacterDict]; }
- (IBAction)sw_otherCharacterPiarceFilter_valueChanged:(id)sender{[self.otherCharacterDict setValue:@(((UISwitch *)sender).on) forKey:@"otherCharacteristicsPiarceFilter"];[account setOtherCharacteristicsFilter:self.otherCharacterDict]; }
- (IBAction)sw_otherCharacterTatooFilter_valueChanged:(id)sender{[self.otherCharacterDict setValue:@(((UISwitch *)sender).on) forKey:@"otherCharacteristicsTatooFilter"];[account setOtherCharacteristicsFilter:self.otherCharacterDict]; }

- (IBAction)sw_personality0_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityCheerfulFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality1_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalitySeriousFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality2_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityFunnyFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality3_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityTakeTheLeadFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality4_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalitySociableFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality5_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityFollowFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality6_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityFlashyFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality7_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityActBasedOnEmotionsFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality8_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityBoldFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality9_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityWantStimulationFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality10_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityRealismFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality11_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityOptimisticFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality12_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityMasculineFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality13_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityStrongPersonFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality14_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityWantToProtectFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality15_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityIndoorsyFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality16_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityBookishTypeFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality17_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityLoveToTalkAboutFilter"]; [account setPersonalityFilter:self.personalityDict];}
- (IBAction)sw_personality18_valueChanged:(id)sender{[self.personalityDict setValue:@(((UISwitch *)sender).on) forKey:@"personalityLookingToMeetFilter"]; [account setPersonalityFilter:self.personalityDict];}

- (IBAction)sw_gayCareer0_valueChanged:(id)sender{[self.gayCareerDict setValue:@(((UISwitch *)sender).on) forKey:@"gayCareerSecretFilter"]; [account setGayCareerFilter:self.gayCareerDict];}
- (IBAction)sw_gayCareer1_valueChanged:(id)sender{[self.gayCareerDict setValue:@(((UISwitch *)sender).on) forKey:@"gayCareerBeginnerFilter"]; [account setGayCareerFilter:self.gayCareerDict];}
- (IBAction)sw_gayCareer2_valueChanged:(id)sender{[self.gayCareerDict setValue:@(((UISwitch *)sender).on) forKey:@"gayCareerAverageFilter"]; [account setGayCareerFilter:self.gayCareerDict];}
- (IBAction)sw_gayCareer3_valueChanged:(id)sender{[self.gayCareerDict setValue:@(((UISwitch *)sender).on) forKey:@"gayCareerExpertFilter"]; [account setGayCareerFilter:self.gayCareerDict];}

- (IBAction)sw_comingOut0_valueChanged:(id)sender{[self.comingOutDict setValue:@(((UISwitch *)sender).on) forKey:@"comingoutSecretFilter"];[account setComingoutFilter:self.comingOutDict]; }
- (IBAction)sw_comingOut1_valueChanged:(id)sender{[self.comingOutDict setValue:@(((UISwitch *)sender).on) forKey:@"comingoutNobodyKnowsFilter"];[account setComingoutFilter:self.comingOutDict];}
- (IBAction)sw_comingOut2_valueChanged:(id)sender{[self.comingOutDict setValue:@(((UISwitch *)sender).on) forKey:@"comingoutSomeoneCloseKnowFilter"];[account setComingoutFilter:self.comingOutDict];}
- (IBAction)sw_comingOut3_valueChanged:(id)sender{[self.comingOutDict setValue:@(((UISwitch *)sender).on) forKey:@"comingoutMostPeopleKnowFilter"];[account setComingoutFilter:self.comingOutDict];}

- (IBAction)sw_loveStyle0_valueChanged:(id)sender{[self.loveStyleDict setValue:@(((UISwitch *)sender).on) forKey:@"loveStylesSecretFilter"]; [account setLoveStylesFilter:self.loveStyleDict]; }
- (IBAction)sw_loveStyle1_valueChanged:(id)sender{[self.loveStyleDict setValue:@(((UISwitch *)sender).on) forKey:@"loveStylesCloseFilter"]; [account setLoveStylesFilter:self.loveStyleDict]; }
- (IBAction)sw_loveStyle2_valueChanged:(id)sender{[self.loveStyleDict setValue:@(((UISwitch *)sender).on) forKey:@"loveStylesAverageFilter"]; [account setLoveStylesFilter:self.loveStyleDict]; }
- (IBAction)sw_loveStyle3_valueChanged:(id)sender{[self.loveStyleDict setValue:@(((UISwitch *)sender).on) forKey:@"loveStylesSimpleFilter"]; [account setLoveStylesFilter:self.loveStyleDict]; }
- (IBAction)sw_loveStyle4_valueChanged:(id)sender{[self.loveStyleDict setValue:@(((UISwitch *)sender).on) forKey:@"loveStylesUpToyouFilter"]; [account setLoveStylesFilter:self.loveStyleDict]; }

- (IBAction)sw_expect0_valueChanged:(id)sender{[self.expectDict setValue:@(((UISwitch *)sender).on) forKey:@"expectSecretFilter"];[account setExpectFilter:self.expectDict];}
- (IBAction)sw_expect1_valueChanged:(id)sender{[self.expectDict setValue:@(((UISwitch *)sender).on) forKey:@"expectpersonalityFilter"];[account setExpectFilter:self.expectDict];}
- (IBAction)sw_expect2_valueChanged:(id)sender{[self.expectDict setValue:@(((UISwitch *)sender).on) forKey:@"expectAppearanceFilter"];[account setExpectFilter:self.expectDict];}
- (IBAction)sw_expect3_valueChanged:(id)sender{[self.expectDict setValue:@(((UISwitch *)sender).on) forKey:@"expectAtmosphereFilter"];[account setExpectFilter:self.expectDict];}
- (IBAction)sw_expect4_valueChanged:(id)sender{[self.expectDict setValue:@(((UISwitch *)sender).on) forKey:@"expectBodyFilter"];[account setExpectFilter:self.expectDict];}
- (IBAction)sw_expect5_valueChanged:(id)sender{[self.expectDict setValue:@(((UISwitch *)sender).on) forKey:@"expectSexFilter"];[account setExpectFilter:self.expectDict];}
- (IBAction)sw_expect6_valueChanged:(id)sender{[self.expectDict setValue:@(((UISwitch *)sender).on) forKey:@"expectInterestFilter"];[account setExpectFilter:self.expectDict];}
- (IBAction)sw_expect7_valueChanged:(id)sender{[self.expectDict setValue:@(((UISwitch *)sender).on) forKey:@"expectCircumstanceFilter"];[account setExpectFilter:self.expectDict];}
- (IBAction)sw_expect8_valueChanged:(id)sender{[self.expectDict setValue:@(((UISwitch *)sender).on) forKey:@"expectFinanceFilter"];[account setExpectFilter:self.expectDict];}
- (IBAction)sw_expect9_valueChanged:(id)sender{[self.expectDict setValue:@(((UISwitch *)sender).on) forKey:@"expectDistanceFilter"];[account setExpectFilter:self.expectDict];}

- (IBAction)sw_job0_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobSecretFilter"];[account setJobFilter:self.jobDict]; }
- (IBAction)sw_job1_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobStudentFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job2_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobBetweenJobsFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job3_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobOfficeWorkFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job4_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobServicesFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job5_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobManufacturingFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job6_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobComputerFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job7_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobLanguageFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job8_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobAssetsFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job9_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobLawFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job10_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobMediaFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job11_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobPublishingFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job12_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobDomesticFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job13_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobMedicalProfessionFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job14_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobHealthFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job15_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobArchitectureFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job16_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobCreativeProfessionFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job17_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobCookingFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job18_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobVehicleFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job19_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobTravelFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job20_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobBeautyFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job21_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobEntertainmentFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job22_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobReligiousProfessionFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job23_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobCeremonialOccasionsFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job24_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobNatureFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job25_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobSportsFilter"]; [account setJobFilter:self.jobDict];}
- (IBAction)sw_job26_valueChanged:(id)sender{[self.jobDict setValue:@(((UISwitch *)sender).on) forKey:@"jobSexIndustryFilter"]; [account setJobFilter:self.jobDict];}

- (IBAction)sw_home0_valueChanged:(id)sender{[self.homeDict setValue:@(((UISwitch *)sender).on) forKey:@"livingSecretFilter"]; [account setLivingFilter:self.homeDict]; }
- (IBAction)sw_home1_valueChanged:(id)sender{[self.homeDict setValue:@(((UISwitch *)sender).on) forKey:@"livingAloneFilter"]; [account setLivingFilter:self.homeDict]; }
- (IBAction)sw_home2_valueChanged:(id)sender{[self.homeDict setValue:@(((UISwitch *)sender).on) forKey:@"livingwithFamilyFilter"]; [account setLivingFilter:self.homeDict]; }
- (IBAction)sw_home3_valueChanged:(id)sender{[self.homeDict setValue:@(((UISwitch *)sender).on) forKey:@"livingwithFriendsorLoversFilter"]; [account setLivingFilter:self.homeDict]; }

- (IBAction)sw_lifePol0_valueChanged:(id)sender{[self.lifePolDict setValue:@(((UISwitch *)sender).on) forKey:@"lifePolicyVegetarianFilter"]; [account setLifePolicyFilter:self.lifePolDict]; }
- (IBAction)sw_lifePol1_valueChanged:(id)sender{[self.lifePolDict setValue:@(((UISwitch *)sender).on) forKey:@"lifePolicyNoSmokingFilter"]; [account setLifePolicyFilter:self.lifePolDict]; }
- (IBAction)sw_lifePol2_valueChanged:(id)sender{[self.lifePolDict setValue:@(((UISwitch *)sender).on) forKey:@"lifePolicyNoDrinkingFilter"]; [account setLifePolicyFilter:self.lifePolDict]; }
- (IBAction)sw_lifePol3_valueChanged:(id)sender{[self.lifePolDict setValue:@(((UISwitch *)sender).on) forKey:@"lifePolicyNoGamblingFilter"]; [account setLifePolicyFilter:self.lifePolDict]; }
- (IBAction)sw_lifePol4_valueChanged:(id)sender{[self.lifePolDict setValue:@(((UISwitch *)sender).on) forKey:@"lifePolicyNoSexFilter"]; [account setLifePolicyFilter:self.lifePolDict]; }

- (IBAction)sw_sexPosi0_valueChanged:(id)sender{[self.sexPosiDict setValue:@(((UISwitch *)sender).on) forKey:@"sexPositionSecretFilter"]; [account setSexPositionFilter:self.sexPosiDict]; }
- (IBAction)sw_sexPosi1_valueChanged:(id)sender{[self.sexPosiDict setValue:@(((UISwitch *)sender).on) forKey:@"sexPositionTopFilter"]; [account setSexPositionFilter:self.sexPosiDict]; }
- (IBAction)sw_sexPosi2_valueChanged:(id)sender{[self.sexPosiDict setValue:@(((UISwitch *)sender).on) forKey:@"sexPositionBottomFilter"]; [account setSexPositionFilter:self.sexPosiDict]; }
- (IBAction)sw_sexPosi3_valueChanged:(id)sender{[self.sexPosiDict setValue:@(((UISwitch *)sender).on) forKey:@"sexPositionVersatileFilter"]; [account setSexPositionFilter:self.sexPosiDict]; }

//- (IBAction)sw_penisSize_valueChanged:(id)sender{}

- (IBAction)sw_penisThi0_valueChanged:(id)sender{[self.penisThiDict setValue:@(((UISwitch *)sender).on) forKey:@"penisThicknessSecretFilter"]; [account setPenisThicknessFilter:self.penisThiDict]; }
- (IBAction)sw_penisThi1_valueChanged:(id)sender{[self.penisThiDict setValue:@(((UISwitch *)sender).on) forKey:@"penisThicknessSlenderFilter"]; [account setPenisThicknessFilter:self.penisThiDict]; }
- (IBAction)sw_penisThi2_valueChanged:(id)sender{[self.penisThiDict setValue:@(((UISwitch *)sender).on) forKey:@"penisThicknessAverageFilter"]; [account setPenisThicknessFilter:self.penisThiDict]; }
- (IBAction)sw_penisThi3_valueChanged:(id)sender{[self.penisThiDict setValue:@(((UISwitch *)sender).on) forKey:@"penisThicknessPlumpFilter"]; [account setPenisThicknessFilter:self.penisThiDict]; }
- (IBAction)sw_penisThi4_valueChanged:(id)sender{[self.penisThiDict setValue:@(((UISwitch *)sender).on) forKey:@"penisThicknessExtraThickFilter"]; [account setPenisThicknessFilter:self.penisThiDict]; }

- (IBAction)sw_phimosis0_valueChanged:(id)sender{[self.phimosisDict setValue:@(((UISwitch *)sender).on) forKey:@"phimosisSecretFilter"]; [account setPhimosisFilter:self.phimosisDict]; }
- (IBAction)sw_phimosis1_valueChanged:(id)sender{[self.phimosisDict setValue:@(((UISwitch *)sender).on) forKey:@"phimosisCutFilter"]; [account setPhimosisFilter:self.phimosisDict]; }
- (IBAction)sw_phimosis2_valueChanged:(id)sender{[self.phimosisDict setValue:@(((UISwitch *)sender).on) forKey:@"phimosisUncutFilter"]; [account setPhimosisFilter:self.phimosisDict]; }
- (IBAction)sw_phimosis3_valueChanged:(id)sender{[self.phimosisDict setValue:@(((UISwitch *)sender).on) forKey:@"phimosisOverhangFilter"]; [account setPhimosisFilter:self.phimosisDict]; }

- (IBAction)sw_sado0_valueChanged:(id)sender{[self.sadoDict setValue:@(((UISwitch *)sender).on) forKey:@"sadomasochismSecretFilter"]; [account setSadomasochismFilter:self.sadoDict]; }
- (IBAction)sw_sado1_valueChanged:(id)sender{[self.sadoDict setValue:@(((UISwitch *)sender).on) forKey:@"sadomasochismSadisticFilter"]; [account setSadomasochismFilter:self.sadoDict]; }
- (IBAction)sw_sado2_valueChanged:(id)sender{[self.sadoDict setValue:@(((UISwitch *)sender).on) forKey:@"sadomasochismMasochisticFilter"]; [account setSadomasochismFilter:self.sadoDict]; }
- (IBAction)sw_sado3_valueChanged:(id)sender{[self.sadoDict setValue:@(((UISwitch *)sender).on) forKey:@"sadomasochismBothFilter"]; [account setSadomasochismFilter:self.sadoDict]; }
- (IBAction)sw_sado4_valueChanged:(id)sender{[self.sadoDict setValue:@(((UISwitch *)sender).on) forKey:@"sadomasochismNeitherFilter"]; [account setSadomasochismFilter:self.sadoDict]; }

- (IBAction)sw_feti0_valueChanged:(id)sender{[self.fetiDict setValue:@(((UISwitch *)sender).on) forKey:@"fetishBDSMFilter"]; [account setFetishFilter:self.fetiDict]; }
- (IBAction)sw_feti1_valueChanged:(id)sender{[self.fetiDict setValue:@(((UISwitch *)sender).on) forKey:@"fetishBigCockFilter"];[account setFetishFilter:self.fetiDict];}
- (IBAction)sw_feti2_valueChanged:(id)sender{[self.fetiDict setValue:@(((UISwitch *)sender).on) forKey:@"fetishSmallCockFilter"];[account setFetishFilter:self.fetiDict];}
- (IBAction)sw_feti3_valueChanged:(id)sender{[self.fetiDict setValue:@(((UISwitch *)sender).on) forKey:@"fetishUncutFilter"];[account setFetishFilter:self.fetiDict];}
- (IBAction)sw_feti4_valueChanged:(id)sender{[self.fetiDict setValue:@(((UISwitch *)sender).on) forKey:@"fetishSmellFetishFilter"];[account setFetishFilter:self.fetiDict];}
- (IBAction)sw_feti5_valueChanged:(id)sender{[self.fetiDict setValue:@(((UISwitch *)sender).on) forKey:@"fetishUniformFetishFilter"];[account setFetishFilter:self.fetiDict];}
- (IBAction)sw_feti6_valueChanged:(id)sender{[self.fetiDict setValue:@(((UISwitch *)sender).on) forKey:@"fetishRubberFilter"];[account setFetishFilter:self.fetiDict];}
- (IBAction)sw_feti7_valueChanged:(id)sender{[self.fetiDict setValue:@(((UISwitch *)sender).on) forKey:@"fetishDragFilter"];[account setFetishFilter:self.fetiDict];}
- (IBAction)sw_feti8_valueChanged:(id)sender{[self.fetiDict setValue:@(((UISwitch *)sender).on) forKey:@"fetishFlasherFilter"];[account setFetishFilter:self.fetiDict];}
- (IBAction)sw_feti9_valueChanged:(id)sender{[self.fetiDict setValue:@(((UISwitch *)sender).on) forKey:@"fetishGangbangFilter"];[account setFetishFilter:self.fetiDict];}
- (IBAction)sw_feti10_valueChanged:(id)sender{[self.fetiDict setValue:@(((UISwitch *)sender).on) forKey:@"fetishHardcorePlayFilter"];[account setFetishFilter:self.fetiDict];}
- (IBAction)sw_feti11_valueChanged:(id)sender{[self.fetiDict setValue:@(((UISwitch *)sender).on) forKey:@"fetishPhoneSexFilter"];[account setFetishFilter:self.fetiDict];}
- (IBAction)sw_feti12_valueChanged:(id)sender{[self.fetiDict setValue:@(((UISwitch *)sender).on) forKey:@"fetishTeenLoverFilter"];[account setFetishFilter:self.fetiDict];}
- (IBAction)sw_feti13_valueChanged:(id)sender{[self.fetiDict setValue:@(((UISwitch *)sender).on) forKey:@"fetishMatureLoverFilter"];[account setFetishFilter:self.fetiDict];}
- (IBAction)sw_feti14_valueChanged:(id)sender{[self.fetiDict setValue:@(((UISwitch *)sender).on) forKey:@"fetishChubbyLoverFilter"];[account setFetishFilter:self.fetiDict];}

-(void)setAgeFilterLabel{
    NSMutableString* muString = [[NSMutableString alloc] init];
    [muString appendString:[NSString stringWithFormat:@"%d", [account getAgeFilter]]];
    [muString appendString:@" "];
    
    if([account getAgeFilterHiLow] == YES){
        [muString appendString:NSLocalizedString(@"FILTER_UNDER", nil)];
    }else{
        [muString appendString:NSLocalizedString(@"FILTER_OVER", nil)];
    }
    
    lbl_age.text = muString;
    
}

-(void)setHeightFilterLabel{
    NSMutableString* muString = [[NSMutableString alloc] init];
    [muString appendString:[NSString stringWithFormat:@"%d", [account getHeightFilter]]];
    [muString appendString:@" "];
    
    if([account getHeightFilterHiLow] == YES){
        [muString appendString:NSLocalizedString(@"FILTER_UNDER", nil)];
    }else{
        [muString appendString:NSLocalizedString(@"FILTER_OVER", nil)];
    }
    
    lbl_height.text = muString;
    
}

-(void)setWeightFilterLabel{
    NSMutableString* muString = [[NSMutableString alloc] init];
    [muString appendString:[NSString stringWithFormat:@"%d", [account getWeightFilter]]];
    [muString appendString:@" "];
    
    if([account getWeightFilterHiLow] == YES){
        [muString appendString:NSLocalizedString(@"FILTER_UNDER", nil)];
    }else{
        [muString appendString:NSLocalizedString(@"FILTER_OVER", nil)];
    }
    
    lbl_weight.text = muString;
    
}

-(void)setPenisSizeFilterLabel{
    NSMutableString* muString = [[NSMutableString alloc] init];
    [muString appendString:[NSString stringWithFormat:@"%d", [account getPenisSizeFilter]]];
    [muString appendString:@" "];
    
    if([account getPenisSizeHiLowFilter] == YES){
        [muString appendString:NSLocalizedString(@"FILTER_UNDER", nil)];
    }else{
        [muString appendString:NSLocalizedString(@"FILTER_OVER", nil)];
    }
    //NSLog(@"%@", muString);
    lbl_penisSize.text = muString;
    
}


@end
