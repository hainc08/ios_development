//
//  FilterViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/05/01.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyFilter.h"
#import "BlocksKit.h"
#import "UITableViewController+PassLock.h"
#import "CoolioWebService.h"
#import "SVProgressHUD.h"

@interface FilterViewController : UITableViewController
{
    int sectionsCount;
    BOOL filterSettings;
    MyFilter* account;
}
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_applyFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_ageFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_heightFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_weightFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sexGayFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sexBisexualFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sexStraightFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_raceAsianFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_raceWhiteFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_raceBlackFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_raceLatinFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_raceArabFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_racePolFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_raceMixFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_raceEtcFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleTwinkFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleHunkFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleSurferFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleHipHopFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleThugFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_stylePunkFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleWhiteCollarFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleHardcoreGayFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_stylePotatoFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleBearFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleGeekFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleChubbyFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleBeefyFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleBodyBuilderFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleSlimWellMuscledFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleSlimSkinnyFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleFeminineFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleShemaleFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_styleEtcFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingLoverFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingFriendFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingEpalFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingMPalFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingTPalFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingCircleFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingRoommateFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingBPartnerFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lookingBenefitsFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_bodyshapeSecretFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_bodyshapeSlimFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_bodyshapeAveFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_bodyshapeChubbyFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_bodyshapeVChubbyFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_muscleSecretFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_muscleDelicateFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_muscleAveFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_muscleWellBuiltFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_muscleBodybuilderFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_bodyHairSecretFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_bodyHairSlimFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_bodyHairAveFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_bodyHairHairyFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_hairStyleSecretFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_hairStyleShavedHeadFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_hairStyleShortHairFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_hairStyleAveFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_hairStyleSemiLongHairFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_hairStyleLongHairFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_hairStyleUniqueFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_hairColorSecretFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_hairColorBlackFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_hairColorBrownRedFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_hairColorBlondFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_hairColorWhiteFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_hairColorUniqueFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_otherCharacterMustacheFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_otherCharacterTanningSkinFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_otherCharacterGlassesFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_otherCharacterPiarceFilter;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_otherCharacterTatooFilter;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality0;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality2;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality3;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality4;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality5;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality6;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality7;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality8;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality9;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality10;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality11;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality12;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality13;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality14;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality15;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality16;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality17;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_personality18;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_gayCareer0;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_gayCareer1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_gayCareer2;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_gayCareer3;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_comingOut0;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_comingOut1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_comingOut2;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_comingOut3;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_loveStyle0;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_loveStyle1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_loveStyle2;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_loveStyle3;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_loveStyle4;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_expect0;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_expect1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_expect2;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_expect3;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_expect4;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_expect5;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_expect6;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_expect7;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_expect8;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_expect9;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job0;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job2;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job3;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job4;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job5;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job6;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job7;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job8;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job9;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job10;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job11;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job12;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job13;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job14;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job15;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job16;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job17;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job18;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job19;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job20;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job21;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job22;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job23;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job24;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job25;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_job26;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_home0;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_home1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_home2;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_home3;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lifePol0;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lifePol1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lifePol2;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lifePol3;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_lifePol4;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sexPosi0;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sexPosi1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sexPosi2;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sexPosi3;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_penisSize;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_penisThi0;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_penisThi1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_penisThi2;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_penisThi3;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_penisThi4;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_phimosis0;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_phimosis1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_phimosis2;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_phimosis3;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sado0;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sado1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sado2;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sado3;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_sado4;

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_feti0;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_feti1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_feti2;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_feti3;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_feti4;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_feti5;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_feti6;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_feti7;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_feti8;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_feti9;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_feti10;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_feti11;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_feti12;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_feti13;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_feti14;

@property (weak, nonatomic) IBOutlet UISwitch *sw_filterApply;

@property (weak, nonatomic) IBOutlet UISwitch *sw_sexGayFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_sexBisexualFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_sexStraightFilter;

@property (weak, nonatomic) IBOutlet UISwitch *sw_raceAsianFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_raceWhiteFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_raceBlackFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_raceLatinFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_raceArabFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_racePolFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_raceMixFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_raceEtcFilter;

@property (weak, nonatomic) IBOutlet UISwitch *sw_styleTwinkFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleHunkFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleSurferFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleHipHopFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleThugFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_stylePunkFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleWhiteCollarFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleHardcoreGayFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_stylePotatoFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleBearFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleGeekFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleChubbyFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleBeefyFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleBodyBuilderFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleSlimWellMuscledFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleSlimSkinnyFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleFeminineFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleShemaleFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_styleEtcFilter;

@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingLoverFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingFriendFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingEpalFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingMPalFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingTPalFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingCircleFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingRoommateFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingBPartnerFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lookingBenefitsFilter;

@property (weak, nonatomic) IBOutlet UISwitch *sw_bodyshapeSecretFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_bodyshapeSlimFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_bodyshapeAveFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_bodyshapeChubbyFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_bodyshapeVChubbyFilter;

@property (weak, nonatomic) IBOutlet UISwitch *sw_muscleSecretFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_muscleDelicateFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_muscleAveFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_muscleWellBuiltFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_muscleBodybuilderFilter;

@property (weak, nonatomic) IBOutlet UISwitch *sw_bodyHairSecretFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_bodyHairSmoothFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_bodyHairAveFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_bodyHairHairyFilter;

@property (weak, nonatomic) IBOutlet UISwitch *sw_hairStyleSecretFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_hairStyleShavedHeadFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_hairStyleShortHairFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_hairStyleAveFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_hairStyleSemiLongHairFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_hairStyleLongHairFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_hairStyleUniqueFilter;

@property (weak, nonatomic) IBOutlet UISwitch *sw_hairColorSecretFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_hairColorBlackFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_hairColorBrownRedFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_hairColorBlondFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_hairColorWhiteFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_hairColorUniqueFilter;

@property (weak, nonatomic) IBOutlet UISwitch *sw_otherCharacterMustacheFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_otherCharacterTanningSkinFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_otherCharacterGlassesFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_otherCharacterPiarceFilter;
@property (weak, nonatomic) IBOutlet UISwitch *sw_otherCharacterTatooFilter;

@property (weak, nonatomic) IBOutlet UISwitch *sw_personality0;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality1;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality2;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality3;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality4;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality5;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality6;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality7;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality8;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality9;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality10;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality11;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality12;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality13;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality14;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality15;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality16;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality17;
@property (weak, nonatomic) IBOutlet UISwitch *sw_personality18;

@property (weak, nonatomic) IBOutlet UISwitch *sw_gayCareer0;
@property (weak, nonatomic) IBOutlet UISwitch *sw_gayCareer1;
@property (weak, nonatomic) IBOutlet UISwitch *sw_gayCareer2;
@property (weak, nonatomic) IBOutlet UISwitch *sw_gayCareer3;

@property (weak, nonatomic) IBOutlet UISwitch *sw_comingOut0;
@property (weak, nonatomic) IBOutlet UISwitch *sw_comingOut1;
@property (weak, nonatomic) IBOutlet UISwitch *sw_comingOut2;
@property (weak, nonatomic) IBOutlet UISwitch *sw_comingOut3;

@property (weak, nonatomic) IBOutlet UISwitch *sw_loveStyle0;
@property (weak, nonatomic) IBOutlet UISwitch *sw_loveStyle1;
@property (weak, nonatomic) IBOutlet UISwitch *sw_loveStyle2;
@property (weak, nonatomic) IBOutlet UISwitch *sw_loveStyle3;
@property (weak, nonatomic) IBOutlet UISwitch *sw_loveStyle4;

@property (weak, nonatomic) IBOutlet UISwitch *sw_expect0;
@property (weak, nonatomic) IBOutlet UISwitch *sw_expect1;
@property (weak, nonatomic) IBOutlet UISwitch *sw_expect2;
@property (weak, nonatomic) IBOutlet UISwitch *sw_expect3;
@property (weak, nonatomic) IBOutlet UISwitch *sw_expect4;
@property (weak, nonatomic) IBOutlet UISwitch *sw_expect5;
@property (weak, nonatomic) IBOutlet UISwitch *sw_expect6;
@property (weak, nonatomic) IBOutlet UISwitch *sw_expect7;
@property (weak, nonatomic) IBOutlet UISwitch *sw_expect8;
@property (weak, nonatomic) IBOutlet UISwitch *sw_expect9;

@property (weak, nonatomic) IBOutlet UISwitch *sw_job0;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job1;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job2;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job3;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job4;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job5;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job6;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job7;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job8;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job9;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job10;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job11;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job12;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job13;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job14;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job15;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job16;

@property (weak, nonatomic) IBOutlet UISwitch *sw_job17;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job18;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job19;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job20;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job21;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job22;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job23;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job24;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job25;
@property (weak, nonatomic) IBOutlet UISwitch *sw_job26;

@property (weak, nonatomic) IBOutlet UISwitch *sw_home0;
@property (weak, nonatomic) IBOutlet UISwitch *sw_home1;
@property (weak, nonatomic) IBOutlet UISwitch *sw_home2;
@property (weak, nonatomic) IBOutlet UISwitch *sw_home3;

@property (weak, nonatomic) IBOutlet UISwitch *sw_lifePol0;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lifePol1;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lifePol2;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lifePol3;
@property (weak, nonatomic) IBOutlet UISwitch *sw_lifePol4;

@property (weak, nonatomic) IBOutlet UISwitch *sw_sexPosi0;
@property (weak, nonatomic) IBOutlet UISwitch *sw_sexPosi1;
@property (weak, nonatomic) IBOutlet UISwitch *sw_sexPosi2;
@property (weak, nonatomic) IBOutlet UISwitch *sw_sexPosi3;

//@property (weak, nonatomic) IBOutlet UISwitch *sw_penisSize;

@property (weak, nonatomic) IBOutlet UISwitch *sw_penisThi0;
@property (weak, nonatomic) IBOutlet UISwitch *sw_penisThi1;
@property (weak, nonatomic) IBOutlet UISwitch *sw_penisThi2;
@property (weak, nonatomic) IBOutlet UISwitch *sw_penisThi3;
@property (weak, nonatomic) IBOutlet UISwitch *sw_penisThi4;

@property (weak, nonatomic) IBOutlet UISwitch *sw_phimosis0;
@property (weak, nonatomic) IBOutlet UISwitch *sw_phimosis1;
@property (weak, nonatomic) IBOutlet UISwitch *sw_phimosis2;
@property (weak, nonatomic) IBOutlet UISwitch *sw_phimosis3;

@property (weak, nonatomic) IBOutlet UISwitch *sw_sado0;
@property (weak, nonatomic) IBOutlet UISwitch *sw_sado1;
@property (weak, nonatomic) IBOutlet UISwitch *sw_sado2;
@property (weak, nonatomic) IBOutlet UISwitch *sw_sado3;
@property (weak, nonatomic) IBOutlet UISwitch *sw_sado4;

@property (weak, nonatomic) IBOutlet UISwitch *sw_feti0;
@property (weak, nonatomic) IBOutlet UISwitch *sw_feti1;
@property (weak, nonatomic) IBOutlet UISwitch *sw_feti2;
@property (weak, nonatomic) IBOutlet UISwitch *sw_feti3;
@property (weak, nonatomic) IBOutlet UISwitch *sw_feti4;
@property (weak, nonatomic) IBOutlet UISwitch *sw_feti5;
@property (weak, nonatomic) IBOutlet UISwitch *sw_feti6;
@property (weak, nonatomic) IBOutlet UISwitch *sw_feti7;
@property (weak, nonatomic) IBOutlet UISwitch *sw_feti8;
@property (weak, nonatomic) IBOutlet UISwitch *sw_feti9;
@property (weak, nonatomic) IBOutlet UISwitch *sw_feti10;
@property (weak, nonatomic) IBOutlet UISwitch *sw_feti11;
@property (weak, nonatomic) IBOutlet UISwitch *sw_feti12;
@property (weak, nonatomic) IBOutlet UISwitch *sw_feti13;
@property (weak, nonatomic) IBOutlet UISwitch *sw_feti14;

@property (weak, nonatomic) IBOutlet UILabel *lbl_age;
@property (weak, nonatomic) IBOutlet UILabel *lbl_height;
@property (weak, nonatomic) IBOutlet UILabel *lbl_weight;
@property (weak, nonatomic) IBOutlet UILabel *lbl_penisSize;


@property (retain, nonatomic) NSMutableDictionary *sexualityDict;
@property (retain, nonatomic) NSMutableDictionary *raceDict;
@property (retain, nonatomic) NSMutableDictionary *styleDict;
@property (retain, nonatomic) NSMutableDictionary *lookingDict;
@property (retain, nonatomic) NSMutableDictionary *bodyShapeDict;
@property (retain, nonatomic) NSMutableDictionary *muscleDict;
@property (retain, nonatomic) NSMutableDictionary *bodyHairDict;
@property (retain, nonatomic) NSMutableDictionary *hairStyleDict;
@property (retain, nonatomic) NSMutableDictionary *hairColorDict;
@property (retain, nonatomic) NSMutableDictionary *otherCharacterDict;
@property (retain, nonatomic) NSMutableDictionary *personalityDict;
@property (retain, nonatomic) NSMutableDictionary *gayCareerDict;
@property (retain, nonatomic) NSMutableDictionary *comingOutDict;
@property (retain, nonatomic) NSMutableDictionary *loveStyleDict;
@property (retain, nonatomic) NSMutableDictionary *expectDict;
@property (retain, nonatomic) NSMutableDictionary *jobDict;
@property (retain, nonatomic) NSMutableDictionary *homeDict;
@property (retain, nonatomic) NSMutableDictionary *lifePolDict;
@property (retain, nonatomic) NSMutableDictionary *sexPosiDict;
@property (retain, nonatomic) NSMutableDictionary *penisThiDict;
@property (retain, nonatomic) NSMutableDictionary *phimosisDict;
@property (retain, nonatomic) NSMutableDictionary *sadoDict;
@property (retain, nonatomic) NSMutableDictionary *fetiDict;
/*
@property (retain, nonatomic) NSMutableDictionary *ageDict;
@property (retain, nonatomic) NSMutableDictionary *heightDict;
@property (retain, nonatomic) NSMutableDictionary *weightDict;
@property (retain, nonatomic) NSMutableDictionary *penisSizeDict;
*/

@property (retain, nonatomic) NSMutableDictionary *basicDict;






//- (IBAction)btn_cancelPush:(id)sender;
- (IBAction)btn_donePush:(id)sender;
- (IBAction)sw_applyFilter_valueChanged:(id)sender;

- (IBAction)sw_sexGayFilter_valueChanged:(id)sender;
- (IBAction)sw_sexBisexualFilter_valueChanged:(id)sender;
- (IBAction)sw_sexStraightFilter_valueChanged:(id)sender;

- (IBAction)sw_raceAsianFilter_valueChanged:(id)sender;
- (IBAction)sw_raceWhiteFilter_valueChanged:(id)sender;
- (IBAction)sw_raceBlackFilter_valueChanged:(id)sender;
- (IBAction)sw_raceLatinFilter_valueChanged:(id)sender;
- (IBAction)sw_raceArabFilter_valueChanged:(id)sender;
- (IBAction)sw_racePolFilter_valueChanged:(id)sender;
- (IBAction)sw_raceMixFilter_valueChanged:(id)sender;
- (IBAction)sw_raceEtcFilter_valueChanged:(id)sender;

- (IBAction)sw_styleTwinkFilter_valueChanged:(id)sender;
- (IBAction)sw_styleHunkFilter_valueChanged:(id)sender;
- (IBAction)sw_styleSurferFilter_valueChanged:(id)sender;
- (IBAction)sw_styleHipHopFilter_valueChanged:(id)sender;
- (IBAction)sw_styleThugFilter_valueChanged:(id)sender;
- (IBAction)sw_stylePunkFilter_valueChanged:(id)sender;
- (IBAction)sw_styleWhiteCollarFilter_valueChanged:(id)sender;
- (IBAction)sw_styleHardcoreGayFilter_valueChanged:(id)sender;
- (IBAction)sw_stylePotatoFilter_valueChanged:(id)sender;
- (IBAction)sw_styleBearFilter_valueChanged:(id)sender;
- (IBAction)sw_styleGeekFilter_valueChanged:(id)sender;
- (IBAction)sw_styleChubbyFilter_valueChanged:(id)sender;
- (IBAction)sw_styleBeefyFilter_valueChanged:(id)sender;
- (IBAction)sw_styleBodyBuilderFilter_valueChanged:(id)sender;
- (IBAction)sw_styleSlimWellMuscledFilter_valueChanged:(id)sender;
- (IBAction)sw_styleSlimSkinnyFilter_valueChanged:(id)sender;
- (IBAction)sw_styleFeminineFilter_valueChanged:(id)sender;
- (IBAction)sw_styleShemaleFilter_valueChanged:(id)sender;
- (IBAction)sw_styleEtcFilter_valueChanged:(id)sender;

- (IBAction)sw_lookingLoverFilter_valueChanged:(id)sender;
- (IBAction)sw_lookingFriendFilter_valueChanged:(id)sender;
- (IBAction)sw_lookingEpalFilter_valueChanged:(id)sender;
- (IBAction)sw_lookingMPalFilter_valueChanged:(id)sender;
- (IBAction)sw_lookingTPalFilter_valueChanged:(id)sender;
- (IBAction)sw_lookingCircleFilter_valueChanged:(id)sender;
- (IBAction)sw_lookingRoommateFilter_valueChanged:(id)sender;
- (IBAction)sw_lookingBPartnerFilter_valueChanged:(id)sender;
- (IBAction)sw_lookingBenefitsFilter_valueChanged:(id)sender;

- (IBAction)sw_bodyshapeSecretFilter_valueChanged:(id)sender;
- (IBAction)sw_bodyshapeSlimFilter_valueChanged:(id)sender;
- (IBAction)sw_bodyshapeAveFilter_valueChanged:(id)sender;
- (IBAction)sw_bodyshapeChubbyFilter_valueChanged:(id)sender;
- (IBAction)sw_bodyshapeVChubbyFilter_valueChanged:(id)sender;

- (IBAction)sw_muscleSecretFilter_valueChanged:(id)sender;
- (IBAction)sw_muscleDelicateFilter_valueChanged:(id)sender;
- (IBAction)sw_muscleAveFilter_valueChanged:(id)sender;
- (IBAction)sw_muscleWellBuiltFilter_valueChanged:(id)sender;
- (IBAction)sw_muscleBodybuilderFilter_valueChanged:(id)sender;

- (IBAction)sw_bodyHairSecretFilter_valueChanged:(id)sender;
- (IBAction)sw_bodyHairSmoothFilter_valueChanged:(id)sender;
- (IBAction)sw_bodyHairAveFilter_valueChanged:(id)sender;
- (IBAction)sw_bodyHairHairyFilter_valueChanged:(id)sender;

- (IBAction)sw_hairStyleSecretFilter_valueChanged:(id)sender;
- (IBAction)sw_hairStyleShavedHeadFilter_valueChanged:(id)sender;
- (IBAction)sw_hairStyleShortHairFilter_valueChanged:(id)sender;
- (IBAction)sw_hairStyleAveFilter_valueChanged:(id)sender;
- (IBAction)sw_hairStyleSemiLongHairFilter_valueChanged:(id)sender;
- (IBAction)sw_hairStyleLongHairFilter_valueChanged:(id)sender;
- (IBAction)sw_hairStyleUniqueFilter_valueChanged:(id)sender;

- (IBAction)sw_hairColorSecretFilter_valueChanged:(id)sender;
- (IBAction)sw_hairColorBlackFilter_valueChanged:(id)sender;
- (IBAction)sw_hairColorBrownRedFilter_valueChanged:(id)sender;
- (IBAction)sw_hairColorBlondFilter_valueChanged:(id)sender;
- (IBAction)sw_hairColorWhiteFilter_valueChanged:(id)sender;
- (IBAction)sw_hairColorUniqueFilter_valueChanged:(id)sender;

- (IBAction)sw_otherCharacterMustacheFilter_valueChanged:(id)sender;
- (IBAction)sw_otherCharacterTanningSkinFilter_valueChanged:(id)sender;
- (IBAction)sw_otherCharacterGlassesFilter_valueChanged:(id)sender;
- (IBAction)sw_otherCharacterPiarceFilter_valueChanged:(id)sender;
- (IBAction)sw_otherCharacterTatooFilter_valueChanged:(id)sender;

- (IBAction)sw_personality0_valueChanged:(id)sender;
- (IBAction)sw_personality1_valueChanged:(id)sender;
- (IBAction)sw_personality2_valueChanged:(id)sender;
- (IBAction)sw_personality3_valueChanged:(id)sender;
- (IBAction)sw_personality4_valueChanged:(id)sender;
- (IBAction)sw_personality5_valueChanged:(id)sender;
- (IBAction)sw_personality6_valueChanged:(id)sender;
- (IBAction)sw_personality7_valueChanged:(id)sender;
- (IBAction)sw_personality8_valueChanged:(id)sender;
- (IBAction)sw_personality9_valueChanged:(id)sender;
- (IBAction)sw_personality10_valueChanged:(id)sender;
- (IBAction)sw_personality11_valueChanged:(id)sender;
- (IBAction)sw_personality12_valueChanged:(id)sender;
- (IBAction)sw_personality13_valueChanged:(id)sender;
- (IBAction)sw_personality14_valueChanged:(id)sender;
- (IBAction)sw_personality15_valueChanged:(id)sender;
- (IBAction)sw_personality16_valueChanged:(id)sender;
- (IBAction)sw_personality17_valueChanged:(id)sender;
- (IBAction)sw_personality18_valueChanged:(id)sender;

- (IBAction)sw_gayCareer0_valueChanged:(id)sender;
- (IBAction)sw_gayCareer1_valueChanged:(id)sender;
- (IBAction)sw_gayCareer2_valueChanged:(id)sender;
- (IBAction)sw_gayCareer3_valueChanged:(id)sender;

- (IBAction)sw_comingOut0_valueChanged:(id)sender;
- (IBAction)sw_comingOut1_valueChanged:(id)sender;
- (IBAction)sw_comingOut2_valueChanged:(id)sender;
- (IBAction)sw_comingOut3_valueChanged:(id)sender;

- (IBAction)sw_loveStyle0_valueChanged:(id)sender;
- (IBAction)sw_loveStyle1_valueChanged:(id)sender;
- (IBAction)sw_loveStyle2_valueChanged:(id)sender;
- (IBAction)sw_loveStyle3_valueChanged:(id)sender;
- (IBAction)sw_loveStyle4_valueChanged:(id)sender;

- (IBAction)sw_expect0_valueChanged:(id)sender;
- (IBAction)sw_expect1_valueChanged:(id)sender;
- (IBAction)sw_expect2_valueChanged:(id)sender;
- (IBAction)sw_expect3_valueChanged:(id)sender;
- (IBAction)sw_expect4_valueChanged:(id)sender;
- (IBAction)sw_expect5_valueChanged:(id)sender;
- (IBAction)sw_expect6_valueChanged:(id)sender;
- (IBAction)sw_expect7_valueChanged:(id)sender;
- (IBAction)sw_expect8_valueChanged:(id)sender;
- (IBAction)sw_expect9_valueChanged:(id)sender;

- (IBAction)sw_job0_valueChanged:(id)sender;
- (IBAction)sw_job1_valueChanged:(id)sender;
- (IBAction)sw_job2_valueChanged:(id)sender;
- (IBAction)sw_job3_valueChanged:(id)sender;
- (IBAction)sw_job4_valueChanged:(id)sender;
- (IBAction)sw_job5_valueChanged:(id)sender;
- (IBAction)sw_job6_valueChanged:(id)sender;
- (IBAction)sw_job7_valueChanged:(id)sender;
- (IBAction)sw_job8_valueChanged:(id)sender;
- (IBAction)sw_job9_valueChanged:(id)sender;
- (IBAction)sw_job10_valueChanged:(id)sender;
- (IBAction)sw_job11_valueChanged:(id)sender;
- (IBAction)sw_job12_valueChanged:(id)sender;
- (IBAction)sw_job13_valueChanged:(id)sender;
- (IBAction)sw_job14_valueChanged:(id)sender;
- (IBAction)sw_job15_valueChanged:(id)sender;
- (IBAction)sw_job16_valueChanged:(id)sender;
- (IBAction)sw_job17_valueChanged:(id)sender;
- (IBAction)sw_job18_valueChanged:(id)sender;
- (IBAction)sw_job19_valueChanged:(id)sender;
- (IBAction)sw_job20_valueChanged:(id)sender;
- (IBAction)sw_job21_valueChanged:(id)sender;
- (IBAction)sw_job22_valueChanged:(id)sender;
- (IBAction)sw_job23_valueChanged:(id)sender;
- (IBAction)sw_job24_valueChanged:(id)sender;
- (IBAction)sw_job25_valueChanged:(id)sender;
- (IBAction)sw_job26_valueChanged:(id)sender;

- (IBAction)sw_home0_valueChanged:(id)sender;
- (IBAction)sw_home1_valueChanged:(id)sender;
- (IBAction)sw_home2_valueChanged:(id)sender;
- (IBAction)sw_home3_valueChanged:(id)sender;

- (IBAction)sw_lifePol0_valueChanged:(id)sender;
- (IBAction)sw_lifePol1_valueChanged:(id)sender;
- (IBAction)sw_lifePol2_valueChanged:(id)sender;
- (IBAction)sw_lifePol3_valueChanged:(id)sender;
- (IBAction)sw_lifePol4_valueChanged:(id)sender;

- (IBAction)sw_sexPosi0_valueChanged:(id)sender;
- (IBAction)sw_sexPosi1_valueChanged:(id)sender;
- (IBAction)sw_sexPosi2_valueChanged:(id)sender;
- (IBAction)sw_sexPosi3_valueChanged:(id)sender;

//- (IBAction)sw_penisSize_valueChanged:(id)sender;

- (IBAction)sw_penisThi0_valueChanged:(id)sender;
- (IBAction)sw_penisThi1_valueChanged:(id)sender;
- (IBAction)sw_penisThi2_valueChanged:(id)sender;
- (IBAction)sw_penisThi3_valueChanged:(id)sender;
- (IBAction)sw_penisThi4_valueChanged:(id)sender;

- (IBAction)sw_phimosis0_valueChanged:(id)sender;
- (IBAction)sw_phimosis1_valueChanged:(id)sender;
- (IBAction)sw_phimosis2_valueChanged:(id)sender;
- (IBAction)sw_phimosis3_valueChanged:(id)sender;

- (IBAction)sw_sado0_valueChanged:(id)sender;
- (IBAction)sw_sado1_valueChanged:(id)sender;
- (IBAction)sw_sado2_valueChanged:(id)sender;
- (IBAction)sw_sado3_valueChanged:(id)sender;
- (IBAction)sw_sado4_valueChanged:(id)sender;

- (IBAction)sw_feti0_valueChanged:(id)sender;
- (IBAction)sw_feti1_valueChanged:(id)sender;
- (IBAction)sw_feti2_valueChanged:(id)sender;
- (IBAction)sw_feti3_valueChanged:(id)sender;
- (IBAction)sw_feti4_valueChanged:(id)sender;
- (IBAction)sw_feti5_valueChanged:(id)sender;
- (IBAction)sw_feti6_valueChanged:(id)sender;
- (IBAction)sw_feti7_valueChanged:(id)sender;
- (IBAction)sw_feti8_valueChanged:(id)sender;
- (IBAction)sw_feti9_valueChanged:(id)sender;
- (IBAction)sw_feti10_valueChanged:(id)sender;
- (IBAction)sw_feti11_valueChanged:(id)sender;
- (IBAction)sw_feti12_valueChanged:(id)sender;
- (IBAction)sw_feti13_valueChanged:(id)sender;
- (IBAction)sw_feti14_valueChanged:(id)sender;


@end
