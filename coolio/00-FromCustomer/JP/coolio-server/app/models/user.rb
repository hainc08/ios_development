class User < ActiveRecord::Base

  attr_accessible :age, :ageLowerLimitPublish, :ageUpperLimitPublish, :bodyHairAverage, :bodyHairHairy, :bodyHairSecret, :bodyHairSmooth, :bodyShapeAverage, :bodyShapeChubby, :bodyShapeSecret, :bodyShapeSlim, :bodyShapeVeryChubby, :comingoutMostPeopleKnow, :comingoutNobodyKnows, :comingoutSecret, :comingoutSomeoneCloseKnow, :comment, :country, :email, :expectAppearance, :expectAtmosphere, :expectBody, :expectCircumstance, :expectDistance, :expectFinance, :expectInterest, :expectSecret, :expectSex, :expectpersonality, :fetishBDSM, :fetishBigCock, :fetishChubbyLover, :fetishDrag, :fetishFlasher, :fetishGangbang, :fetishHardcorePlay, :fetishMatureLover, :fetishPhoneSex, :fetishRubber, :fetishSmallCock, :fetishSmellFetish, :fetishTeenLover, :fetishUncut, :fetishUniformFetish, :freezeAccount, :gayCareerAverage, :gayCareerBeginner, :gayCareerExpert, :gayCareerSecret, :hairColorBlack, :hairColorBlond, :hairColorBrown, :hairColorSecret, :hairColorUniqueColor, :hairColorWhite, :hairStyleAverage, :hairStyleLongHair, :hairStyleSecret, :hairStyleSemiLongHair, :hairStyleShavedHead, :hairStyleShortHair, :hairStyleUniqueStyle, :height, :id, :jobArchitecture, :jobAssets, :jobBeauty, :jobBetweenJobs, :jobCeremonialOccasions, :jobComputer, :jobCooking, :jobCreativeProfession, :jobDomestic, :jobEntertainment, :jobHealth, :jobLanguage, :jobLaw, :jobManufacturing, :jobMedia, :jobMedicalProfession, :jobNature, :jobOfficeWork, :jobPublishing, :jobReligiousProfession, :jobSecret, :jobServices, :jobSexIndustry, :jobSports, :jobStudent, :jobTravel, :jobVehicle, :latitude, :lifePolicyNoDrinking, :lifePolicyNoGambling, :lifePolicyNoSex, :lifePolicyNoSmoking, :lifePolicyVegetarian, :livingAlone, :livingSecret, :livingwithFamily, :livingwithFriendsorLovers, :longitude, :lookingBPartner, :lookingCircle, :lookingEPal, :lookingFriend, :lookingFriendWithBenefits, :lookingLover, :lookingMPal, :lookingRoommate, :lookingTPal, :loveStylesAverage, :loveStylesClose, :loveStylesSecret, :loveStylesSimple, :loveStylesUpToyou, :muscleAverage, :muscleBodybuilder, :muscleDelicate, :muscleSecret, :muscleWellBuilt, :mydevice, :nickname, :otherCharacteristicsGlasses, :otherCharacteristicsMustache, :otherCharacteristicsPiarce, :otherCharacteristicsTanningSkin, :otherCharacteristicsTatoo, :online, :password, :penisSize, :penisThicknessAverage, :penisThicknessExtraThick, :penisThicknessPlump, :penisThicknessSecret, :penisThicknessSlender, :personalityActBasedOnEmotions, :personalityBold, :personalityBookishType, :personalityCheerful, :personalityFlashy, :personalityFollow, :personalityFunny, :personalityIndoorsy, :personalityLookingToMeet, :personalityLoveToTalkAbout, :personalityMasculine, :personalityOptimistic, :personalityRealism, :personalitySerious, :personalitySociable, :personalityStrongPerson, :personalityTakeTheLead, :personalityWantStimulation, :personalityWantToProtect, :phimosisCut, :phimosisOverhang, :phimosisSecret, :phimosisUncut, :picture1, :picture2, :picture3, :picture4, :picture5, :raceArab, :raceArabPublish, :raceAsian, :raceAsianPublish, :raceBlack, :raceBlackPublish, :raceEtc, :raceEtcPublish, :raceLatin, :raceLatinPublish, :raceMix, :raceMixPublish, :racePolynesian, :racePolynesianPublish, :raceWhite, :raceWhitePublish, :sadomasochismBoth, :sadomasochismMasochistic, :sadomasochismNeither, :sadomasochismSadistic, :sadomasochismSecret, :sexBisex, :sexBisexPublish, :sexGay, :sexGayPublish, :sexPositionBottom, :sexPositionSecret, :sexPositionTop, :sexPositionVersatile, :sexStraight, :sexStraightPublish, :styleBear, :styleBeefy, :styleBodybuilder, :styleChubby, :styleEtc, :styleFeminine, :styleGeek, :styleHardcoreGay, :styleHipHop, :styleHunk, :stylePotato, :stylePunk, :styleShemale, :styleSlimSkinny, :styleSurfer, :styleThug, :styleTwink, :styleWellMuscled, :styleWhiteCollar, :weight, :chatNotice, :friendRequestNotice, :matchNotice

  #has_many :friends
	has_many :blocks
	has_many :chats
	has_many :devices
	has_many :footprints
	has_many :friendRequests
	has_many :friends
	has_many :histories
	has_many :matches
	has_many :reports
	has_many :silentMatches
	has_many :notificationCounts
	has_many :chatNotificationCounts
	has_many :masterpasswords
end