require 'erb'
require 'openssl'

class ProfileServiceController < ApplicationController

  def setDevice

    render :nothing => true

    id = params[:email]
    mydevice = params[:myDevice]
    os = params[:os]

    userId = 0

    if User.where(:email => id).exists? then
      if Device.where(:deviceId => mydevice).exists? then

      else
        # Write new my devices
        @users = User.where(:email => id)
        @users.each do |user|
          userId = user.id
        end

        if mydevice then
          device = Device.new
          device.my_id = userId
          device.deviceId = mydevice
          device.os = os

          device.save
        end
      end
    end
  end

  def setLocation
    render :nothing => true

    id = params[:email]

    if User.where(:email => id).exists? then
      @users = User.where(:email => id)
      @users.each do |user|
        if params[:latitude] then
          user.latitude = params[:latitude]
        else
          user.latitude = 0
        end

        if params[:longitude] then
          user.longitude = params[:longitude]
        else
          user.longitude = 0
        end
        user.online = true
        user.save
      end
    end
  end

  def setProfileImage1
    render :nothing => true

    id = params[:email]

    if User.where(:email => id).exists? then
      @users = User.where(:email => id)
      @users.each do |user|
        icon = params[:mypicture1]

        File.open(Rails.root.to_s+'/public/icons/'+icon.original_filename, 'w') do |of|
          of.write(icon.read)
        end
        user.picture1 = icon.original_filename
        user.save
      end
    end
  end

  def setProfileImage2
    render :nothing => true

    id = params[:email]

    if User.where(:email => id).exists?
      @users = User.where(:email => id)
      @users.each do |user|
        icon = params[:mypicture2]

        File.open(Rails.root.to_s+'/public/icons/'+icon.original_filename, 'w') do |of|
          of.write(icon.read)
        end
        user.picture2 = icon.original_filename
        user.save
      end
    end
  end

  def setProfileImage3
    render :nothing => true

    id = params[:email]

    if User.where(:email => id).exists?
      @users = User.where(:email => id)
      @users.each do |user|
        icon = params[:mypicture3]

        File.open(Rails.root.to_s+'/public/icons/'+icon.original_filename, 'w') do |of|
          of.write(icon.read)
        end
        user.picture3 = icon.original_filename
        user.save
      end
    end
  end

  def setProfileImage4
    render :nothing => true

    id = params[:email]

    if User.where(:email => id).exists?
      @users = User.where(:email => id)
      @users.each do |user|
        icon = params[:mypicture4]

        File.open(Rails.root.to_s+'/public/icons/'+icon.original_filename, 'w') do |of|
          of.write(icon.read)
        end
        user.picture4 = icon.original_filename
        user.save
      end
    end
  end

  def setProfileImage5
    render :nothing => true

    id = params[:email]

    if User.where(:email => id).exists?
      @users = User.where(:email => id)
      @users.each do |user|
        icon = params[:mypicture5]

        File.open(Rails.root.to_s+'/public/icons/'+icon.original_filename, 'w') do |of|
          of.write(icon.read)
        end
        user.picture5 = icon.original_filename
        user.save
      end
    end
  end

  def setProfile
    render :nothing => true

    id = params[:email]
    #pass = Digest::MD5.hexdigest(params[:password])

    if User.where(:email => id).exists? then
      @users = User.where(:email => id)
      @users.each do |user|

        user.email = params[:email]
        user.password = OpenSSL::HMAC::hexdigest(OpenSSL::Digest::SHA1.new, "password-key", params[:password])
        # HMAC::MD5.new(params[:password]).hexdigest
        user.nickname = params[:nickname]
        user.age = params[:age]
        user.height = params[:height]
        user.weight = params[:weight]
        user.country = params[:country]
        user.sexGay = params[:sexGay] == "YES" ? true : false
        user.sexBisex = params[:sexBisex] == "YES" ? true : false
        user.sexStraight = params[:sexStraight] == "YES" ? true : false
        user.raceAsian = params[:raceAsian] == "YES" ? true : false
        user.raceWhite = params[:raceWhite] == "YES" ? true : false
        user.raceBlack = params[:raceBlack] == "YES" ? true : false
        user.raceLatin = params[:raceLatin] == "YES" ? true : false
        user.raceArab = params[:raceArab] == "YES" ? true : false
        user.racePolynesian = params[:racePolynesian] == "YES" ? true : false
        user.raceMix = params[:raceMix] == "YES" ? true : false
        user.raceEtc = params[:raceEtc] == "YES" ? true : false
        user.styleTwink = params[:styleTwink] == "YES" ? true : false
        user.styleHunk = params[:styleHunk] == "YES" ? true : false
        user.styleSurfer = params[:styleSurfer] == "YES" ? true : false
        user.styleHipHop = params[:styleHipHop] == "YES" ? true : false
        user.styleThug = params[:styleThug] == "YES" ? true : false
        user.stylePunk = params[:stylePunk] == "YES" ? true : false
        user.styleWhiteCollar = params[:styleWhiteCollar] == "YES" ? true : false
        user.styleHardcoreGay = params[:styleHardcoreGay] == "YES" ? true : false
        user.stylePotato = params[:stylePotato] == "YES" ? true : false
        user.styleBear = params[:styleBear] == "YES" ? true : false
        user.styleGeek = params[:styleGeek] == "YES" ? true : false
        user.styleChubby = params[:styleChubby] == "YES" ? true : false
        user.styleBeefy = params[:styleBeefy] == "YES" ? true : false
        user.styleBodybuilder = params[:styleBodybuilder] == "YES" ? true : false
        user.styleWellMuscled = params[:styleWellMuscled] == "YES" ? true : false
        user.styleSlimSkinny = params[:styleSlimSkinny] == "YES" ? true : false
        user.styleFeminine = params[:styleFeminine] == "YES" ? true : false
        user.styleShemale = params[:styleShemale] == "YES" ? true : false
        user.styleEtc = params[:styleEtc] == "YES" ? true : false
        user.lookingLover = params[:lookingLover] == "YES" ? true : false
        user.lookingFriend = params[:lookingFriend] == "YES" ? true : false
        user.lookingEPal = params[:lookingEPal] == "YES" ? true : false
        user.lookingMPal = params[:lookingMPal] == "YES" ? true : false
        user.lookingTPal = params[:lookingTPal] == "YES" ? true : false
        user.lookingCircle = params[:lookingCircle] == "YES" ? true : false
        user.lookingRoommate = params[:lookingRoommate] == "YES" ? true : false
        user.lookingBPartner = params[:lookingBPartner] == "YES" ? true : false
        user.lookingFriendWithBenefits = params[:lookingFriendWithBenefits] == "YES" ? true : false
        user.comment = params[:comment] == nil ? "" : params[:comment]
        user.bodyShapeSecret = params[:bodyShapeSecret] == "YES" ? true : false
        user.bodyShapeSlim = params[:bodyShapeSlim] == "YES" ? true : false
        user.bodyShapeAverage = params[:bodyShapeAverage] == "YES" ? true : false
        user.bodyShapeChubby = params[:bodyShapeChubby] == "YES" ? true : false
        user.bodyShapeVeryChubby = params[:bodyShapeVeryChubby] == "YES" ? true : false
        user.muscleSecret = params[:muscleSecret] == "YES" ? true : false
        user.muscleDelicate = params[:muscleDelicate] == "YES" ? true : false
        user.muscleAverage = params[:muscleAverage] == "YES" ? true : false
        user.muscleWellBuilt = params[:muscleWellBuilt] == "YES" ? true : false
        user.muscleBodybuilder = params[:muscleBodybuilder] == "YES" ? true : false
        user.bodyHairSecret = params[:bodyHairSecret] == "YES" ? true : false
        user.bodyHairSmooth = params[:bodyHairSmooth] == "YES" ? true : false
        user.bodyHairAverage = params[:bodyHairAverage] == "YES" ? true : false
        user.bodyHairHairy = params[:bodyHairHairy] == "YES" ? true : false
        user.hairStyleSecret = params[:hairStyleSecret] == "YES" ? true : false
        user.hairStyleShavedHead = params[:hairStyleShavedHead] == "YES" ? true : false
        user.hairStyleShortHair = params[:hairStyleShortHair] == "YES" ? true : false
        user.hairStyleAverage = params[:hairStyleAverage] == "YES" ? true : false
        user.hairStyleSemiLongHair = params[:hairStyleSemiLongHair] == "YES" ? true : false
        user.hairStyleLongHair = params[:hairStyleLongHair] == "YES" ? true : false
        user.hairStyleUniqueStyle = params[:hairStyleUniqueStyle] == "YES" ? true : false
        user.hairColorSecret = params[:hairColorSecret] == "YES" ? true : false
        user.hairColorBlack = params[:hairColorBlack] == "YES" ? true : false
        user.hairColorBrown = params[:hairColorBrown] == "YES" ? true : false
        user.hairColorBlond = params[:hairColorBlond] == "YES" ? true : false
        user.hairColorWhite = params[:hairColorWhite] == "YES" ? true : false
        user.hairColorUniqueColor = params[:hairColorUniqueColor] == "YES" ? true : false
        user.otherCharacteristicsMustache = params[:otherCharacteristicsMustache] == "YES" ? true : false
        user.otherCharacteristicsTanningSkin = params[:otherCharacteristicsTanningSkin] == "YES" ? true : false
        user.otherCharacteristicsGlasses = params[:otherCharacteristicsGlasses] == "YES" ? true : false
        user.otherCharacteristicsPiarce = params[:otherCharacteristicsPiarce] == "YES" ? true : false
        user.otherCharacteristicsTatoo = params[:otherCharacteristicsTatoo] == "YES" ? true : false

        user.personalityCheerful = params[:personalityCheerful]
        user.personalitySerious = params[:personalitySerious]
        user.personalityFunny = params[:personalityFunny]
        user.personalityTakeTheLead = params[:personalityTakeTheLead]
        user.personalitySociable = params[:personalitySociable]
        user.personalityFollow = params[:personalityFollow]
        user.personalityFlashy = params[:personalityFlashy]
        user.personalityActBasedOnEmotions = params[:personalityActBasedOnEmotions]
        user.personalityBold = params[:personalityBold]
        user.personalityWantStimulation = params[:personalityWantStimulation]
        user.personalityRealism = params[:personalityRealism]
        user.personalityOptimistic = params[:personalityOptimistic]
        user.personalityMasculine = params[:personalityMasculine]
        user.personalityStrongPerson = params[:personalityStrongPerson]
        user.personalityWantToProtect = params[:personalityWantToProtect]
        user.personalityIndoorsy = params[:personalityIndoorsy]
        user.personalityBookishType = params[:personalityBookishType]
        user.personalityLoveToTalkAbout = params[:personalityLoveToTalkAbout]
        user.personalityLookingToMeet = params[:personalityLookingToMeet]

        user.gayCareerSecret = params[:gayCareerSecret] == "YES" ? true : false
        user.gayCareerBeginner = params[:gayCareerBeginner] == "YES" ? true : false
        user.gayCareerAverage = params[:gayCareerAverage] == "YES" ? true : false
        user.gayCareerExpert = params[:gayCareerExpert] == "YES" ? true : false
        user.comingoutSecret = params[:comingoutSecret] == "YES" ? true : false
        user.comingoutNobodyKnows = params[:comingoutNobodyKnows] == "YES" ? true : false
        user.comingoutSomeoneCloseKnow = params[:comingoutSomeoneCloseKnow] == "YES" ? true : false
        user.comingoutMostPeopleKnow = params[:comingoutMostPeopleKnow] == "YES" ? true : false
        user.loveStylesSecret = params[:loveStylesSecret] == "YES" ? true : false
        user.loveStylesClose = params[:loveStylesClose] == "YES" ? true : false
        user.loveStylesAverage = params[:loveStylesAverage] == "YES" ? true : false
        user.loveStylesSimple = params[:loveStylesSimple] == "YES" ? true : false
        user.loveStylesUpToyou = params[:loveStylesUpToyou] == "YES" ? true : false
        user.expectSecret = params[:expectSecret] == "YES" ? true : false
        user.expectpersonality = params[:expectpersonality] == "YES" ? true : false
        user.expectAppearance = params[:expectAppearance] == "YES" ? true : false
        user.expectAtmosphere = params[:expectAtmosphere] == "YES" ? true : false
        user.expectBody = params[:expectBody] == "YES" ? true : false
        user.expectSex = params[:expectSex] == "YES" ? true : false
        user.expectInterest = params[:expectInterest] == "YES" ? true : false
        user.expectCircumstance = params[:expectCircumstance] == "YES" ? true : false
        user.expectFinance = params[:expectFinance] == "YES" ? true : false
        user.expectDistance = params[:expectDistance] == "YES" ? true : false
        user.jobSecret = params[:jobSecret] == "YES" ? true : false
        user.jobStudent = params[:jobStudent] == "YES" ? true : false
        user.jobBetweenJobs = params[:jobBetweenJobs] == "YES" ? true : false
        user.jobOfficeWork = params[:jobOfficeWork] == "YES" ? true : false
        user.jobServices = params[:jobServices] == "YES" ? true : false
        user.jobManufacturing = params[:jobManufacturing] == "YES" ? true : false
        user.jobComputer = params[:jobComputer] == "YES" ? true : false
        user.jobLanguage = params[:jobLanguage] == "YES" ? true : false
        user.jobAssets = params[:jobAssets] == "YES" ? true : false
        user.jobLaw = params[:jobLaw] == "YES" ? true : false
        user.jobMedia = params[:jobMedia] == "YES" ? true : false
        user.jobPublishing = params[:jobPublishing] == "YES" ? true : false
        user.jobDomestic = params[:jobDomestic] == "YES" ? true : false
        user.jobMedicalProfession = params[:jobMedicalProfession] == "YES" ? true : false
        user.jobHealth = params[:jobHealth] == "YES" ? true : false
        user.jobArchitecture = params[:jobArchitecture] == "YES" ? true : false
        user.jobCreativeProfession = params[:jobCreativeProfession] == "YES" ? true : false
        user.jobCooking = params[:jobCooking] == "YES" ? true : false
        user.jobVehicle = params[:jobVehicle] == "YES" ? true : false
        user.jobTravel = params[:jobTravel] == "YES" ? true : false
        user.jobBeauty = params[:jobBeauty] == "YES" ? true : false
        user.jobEntertainment = params[:jobEntertainment] == "YES" ? true : false
        user.jobReligiousProfession = params[:jobReligiousProfession] == "YES" ? true : false
        user.jobCeremonialOccasions = params[:jobCeremonialOccasions] == "YES" ? true : false
        user.jobNature = params[:jobNature] == "YES" ? true : false
        user.jobSports = params[:jobSports] == "YES" ? true : false
        user.jobSexIndustry = params[:jobSexIndustry] == "YES" ? true : false
        user.livingSecret = params[:livingSecret] == "YES" ? true : false
        user.livingAlone = params[:livingAlone] == "YES" ? true : false
        user.livingwithFamily = params[:livingwithFamily] == "YES" ? true : false
        user.livingwithFriendsorLovers = params[:livingwithFriendsorLovers] == "YES" ? true : false
        user.lifePolicyVegetarian = params[:lifePolicyVegetarian] == "YES" ? true : false
        user.lifePolicyNoSmoking = params[:lifePolicyNoSmoking] == "YES" ? true : false
        user.lifePolicyNoDrinking = params[:lifePolicyNoDrinking] == "YES" ? true : false
        user.lifePolicyNoGambling = params[:lifePolicyNoGambling] == "YES" ? true : false
        user.lifePolicyNoSex = params[:lifePolicyNoSex] == "YES" ? true : false
        user.sexPositionSecret = params[:sexPositionSecret] == "YES" ? true : false
        user.sexPositionTop = params[:sexPositionTop] == "YES" ? true : false
        user.sexPositionBottom = params[:sexPositionBottom] == "YES" ? true : false
        user.sexPositionVersatile = params[:sexPositionVersatile] == "YES" ? true : false
        user.penisSize = params[:penisSize]
        user.penisThicknessSecret = params[:penisThicknessSecret] == "YES" ? true : false
        user.penisThicknessSlender = params[:penisThicknessSlender] == "YES" ? true : false
        user.penisThicknessAverage = params[:penisThicknessAverage] == "YES" ? true : false
        user.penisThicknessPlump = params[:penisThicknessPlump] == "YES" ? true : false
        user.penisThicknessExtraThick = params[:penisThicknessExtraThick] == "YES" ? true : false
        user.phimosisSecret = params[:phimosisSecret] == "YES" ? true : false
        user.phimosisCut = params[:phimosisCut] == "YES" ? true : false
        user.phimosisUncut = params[:phimosisUncut] == "YES" ? true : false
        user.phimosisOverhang = params[:phimosisOverhang] == "YES" ? true : false
        user.sadomasochismSecret = params[:sadomasochismSecret] == "YES" ? true : false
        user.sadomasochismSadistic = params[:sadomasochismSadistic] == "YES" ? true : false
        user.sadomasochismMasochistic = params[:sadomasochismMasochistic] == "YES" ? true : false
        user.sadomasochismBoth = params[:sadomasochismBoth] == "YES" ? true : false
        user.sadomasochismNeither = params[:sadomasochismNeither] == "YES" ? true : false
        user.fetishBDSM = params[:fetishBDSM] == "YES" ? true : false
        user.fetishBigCock = params[:fetishBigCock] == "YES" ? true : false
        user.fetishSmallCock = params[:fetishSmallCock] == "YES" ? true : false
        user.fetishUncut = params[:fetishUncut] == "YES" ? true : false
        user.fetishSmellFetish = params[:fetishSmellFetish] == "YES" ? true : false
        user.fetishUniformFetish = params[:fetishUniformFetish] == "YES" ? true : false
        user.fetishRubber = params[:fetishRubber] == "YES" ? true : false
        user.fetishDrag = params[:fetishDrag] == "YES" ? true : false
        user.fetishFlasher = params[:fetishFlasher] == "YES" ? true : false
        user.fetishGangbang = params[:fetishGangbang] == "YES" ? true : false
        user.fetishHardcorePlay = params[:fetishHardcorePlay] == "YES" ? true : false
        user.fetishPhoneSex = params[:fetishPhoneSex] == "YES" ? true : false
        user.fetishTeenLover = params[:fetishTeenLover] == "YES" ? true : false
        user.fetishMatureLover = params[:fetishMatureLover] == "YES" ? true : false
        user.fetishChubbyLover = params[:fetishChubbyLover] == "YES" ? true : false
        user.ageLowerLimitPublish = params[:ageLowerPublish]
        user.ageUpperLimitPublish = params[:ageUpperPublish]
        user.sexGayPublish = params[:sexGayPublish] == "YES" ? true : false
        user.sexBisexPublish = params[:sexBisexPublish] == "YES" ? true : false
        user.sexStraightPublish = params[:sexStraightPublish] == "YES" ? true : false
        user.raceAsianPublish = params[:raceAsianPublish] == "YES" ? true : false
        user.raceWhitePublish = params[:raceWhitePublish] == "YES" ? true : false
        user.raceBlackPublish = params[:raceBlackPublish] == "YES" ? true : false
        user.raceLatinPublish = params[:raceLatinPublish] == "YES" ? true : false
        user.raceArabPublish = params[:raceArabPublish] == "YES" ? true : false
        user.racePolynesianPublish = params[:racePolynesianPublish] == "YES" ? true : false
        user.raceMixPublish = params[:raceMixPublish] == "YES" ? true : false
        user.raceEtcPublish = params[:raceEtcPublish] == "YES" ? true : false
        user.chatNotice = params[:chatNotice] == "YES" ? true : false
        user.friendRequestNotice = params[:friendRequestNotice] == "YES" ? true : false
        user.matchNotice = params[:matchNotice] == "YES" ? true : false
        
        user.save
      end
    else
      user = User.new

      user.email = params[:email]
      user.password = OpenSSL::HMAC::hexdigest(OpenSSL::Digest::SHA1.new, "password-key", params[:password])
      #HMAC::MD5.new(params[:password]).hexdigest
      user.nickname = params[:nickname]
      user.age = params[:age]
      user.height = params[:height]
      user.weight = params[:weight]
      user.country = params[:country]
      user.sexGay = params[:sexGay] == "YES" ? true : false
      user.sexBisex = params[:sexBisex] == "YES" ? true : false
      user.sexStraight = params[:sexStraight] == "YES" ? true : false
      user.raceAsian = params[:raceAsian] == "YES" ? true : false
      user.raceWhite = params[:raceWhite] == "YES" ? true : false
      user.raceBlack = params[:raceBlack] == "YES" ? true : false
      user.raceLatin = params[:raceLatin] == "YES" ? true : false
      user.raceArab = params[:raceArab] == "YES" ? true : false
      user.racePolynesian = params[:racePolynesian] == "YES" ? true : false
      user.raceMix = params[:raceMix] == "YES" ? true : false
      user.raceEtc = params[:raceEtc] == "YES" ? true : false
      user.styleTwink = params[:styleTwink] == "YES" ? true : false
      user.styleHunk = params[:styleHunk] == "YES" ? true : false
      user.styleSurfer = params[:styleSurfer] == "YES" ? true : false
      user.styleHipHop = params[:styleHipHop] == "YES" ? true : false
      user.styleThug = params[:styleThug] == "YES" ? true : false
      user.stylePunk = params[:stylePunk] == "YES" ? true : false
      user.styleWhiteCollar = params[:styleWhiteCollar] == "YES" ? true : false
      user.styleHardcoreGay = params[:styleHardcoreGay] == "YES" ? true : false
      user.stylePotato = params[:stylePotato] == "YES" ? true : false
      user.styleBear = params[:styleBear] == "YES" ? true : false
      user.styleGeek = params[:styleGeek] == "YES" ? true : false
      user.styleChubby = params[:styleChubby] == "YES" ? true : false
      user.styleBeefy = params[:styleBeefy] == "YES" ? true : false
      user.styleBodybuilder = params[:styleBodybuilder] == "YES" ? true : false
      user.styleWellMuscled = params[:styleWellMuscled] == "YES" ? true : false
      user.styleSlimSkinny = params[:styleSlimSkinny] == "YES" ? true : false
      user.styleFeminine = params[:styleFeminine] == "YES" ? true : false
      user.styleShemale = params[:styleShemale] == "YES" ? true : false
      user.styleEtc = params[:styleEtc] == "YES" ? true : false
      user.lookingLover = params[:lookingLover] == "YES" ? true : false
      user.lookingFriend = params[:lookingFriend] == "YES" ? true : false
      user.lookingEPal = params[:lookingEPal] == "YES" ? true : false
      user.lookingMPal = params[:lookingMPal] == "YES" ? true : false
      user.lookingTPal = params[:lookingTPal] == "YES" ? true : false
      user.lookingCircle = params[:lookingCircle] == "YES" ? true : false
      user.lookingRoommate = params[:lookingRoommate] == "YES" ? true : false
      user.lookingBPartner = params[:lookingBPartner] == "YES" ? true : false
      user.lookingFriendWithBenefits = params[:lookingFriendWithBenefits] == "YES" ? true : false
      user.comment = params[:comment] == nil ? "" : params[:comment]
      user.bodyShapeSecret = params[:bodyShapeSecret] == "YES" ? true : false
      user.bodyShapeSlim = params[:bodyShapeSlim] == "YES" ? true : false
      user.bodyShapeAverage = params[:bodyShapeAverage] == "YES" ? true : false
      user.bodyShapeChubby = params[:bodyShapeChubby] == "YES" ? true : false
      user.bodyShapeVeryChubby = params[:bodyShapeVeryChubby] == "YES" ? true : false
      user.muscleSecret = params[:muscleSecret] == "YES" ? true : false
      user.muscleDelicate = params[:muscleDelicate] == "YES" ? true : false
      user.muscleAverage = params[:muscleAverage] == "YES" ? true : false
      user.muscleWellBuilt = params[:muscleWellBuilt] == "YES" ? true : false
      user.muscleBodybuilder = params[:muscleBodybuilder] == "YES" ? true : false
      user.bodyHairSecret = params[:bodyHairSecret] == "YES" ? true : false
      user.bodyHairSmooth = params[:bodyHairSmooth] == "YES" ? true : false
      user.bodyHairAverage = params[:bodyHairAverage] == "YES" ? true : false
      user.bodyHairHairy = params[:bodyHairHairy] == "YES" ? true : false
      user.hairStyleSecret = params[:hairStyleSecret] == "YES" ? true : false
      user.hairStyleShavedHead = params[:hairStyleShavedHead] == "YES" ? true : false
      user.hairStyleShortHair = params[:hairStyleShortHair] == "YES" ? true : false
      user.hairStyleAverage = params[:hairStyleAverage] == "YES" ? true : false
      user.hairStyleSemiLongHair = params[:hairStyleSemiLongHair] == "YES" ? true : false
      user.hairStyleLongHair = params[:hairStyleLongHair] == "YES" ? true : false
      user.hairStyleUniqueStyle = params[:hairStyleUniqueStyle] == "YES" ? true : false
      user.hairColorSecret = params[:hairColorSecret] == "YES" ? true : false
      user.hairColorBlack = params[:hairColorBlack] == "YES" ? true : false
      user.hairColorBrown = params[:hairColorBrown] == "YES" ? true : false
      user.hairColorBlond = params[:hairColorBlond] == "YES" ? true : false
      user.hairColorWhite = params[:hairColorWhite] == "YES" ? true : false
      user.hairColorUniqueColor = params[:hairColorUniqueColor] == "YES" ? true : false
      user.otherCharacteristicsMustache = params[:otherCharacteristicsMustache] == "YES" ? true : false
      user.otherCharacteristicsTanningSkin = params[:otherCharacteristicsTanningSkin] == "YES" ? true : false
      user.otherCharacteristicsGlasses = params[:otherCharacteristicsGlasses] == "YES" ? true : false
      user.otherCharacteristicsPiarce = params[:otherCharacteristicsPiarce] == "YES" ? true : false
      user.otherCharacteristicsTatoo = params[:otherCharacteristicsTatoo] == "YES" ? true : false

        user.personalityCheerful = params[:personalityCheerful]
        user.personalitySerious = params[:personalitySerious]
        user.personalityFunny = params[:personalityFunny]
        user.personalityTakeTheLead = params[:personalityTakeTheLead]
        user.personalitySociable = params[:personalitySociable]
        user.personalityFollow = params[:personalityFollow]
        user.personalityFlashy = params[:personalityFlashy]
        user.personalityActBasedOnEmotions = params[:personalityActBasedOnEmotions]
        user.personalityBold = params[:personalityBold]
        user.personalityWantStimulation = params[:personalityWantStimulation]
        user.personalityRealism = params[:personalityRealism]
        user.personalityOptimistic = params[:personalityOptimistic]
        user.personalityMasculine = params[:personalityMasculine]
        user.personalityStrongPerson = params[:personalityStrongPerson]
        user.personalityWantToProtect = params[:personalityWantToProtect]
        user.personalityIndoorsy = params[:personalityIndoorsy]
        user.personalityBookishType = params[:personalityBookishType]
        user.personalityLoveToTalkAbout = params[:personalityLoveToTalkAbout]
        user.personalityLookingToMeet = params[:personalityLookingToMeet]

      user.gayCareerSecret = params[:gayCareerSecret] == "YES" ? true : false
      user.gayCareerBeginner = params[:gayCareerBeginner] == "YES" ? true : false
      user.gayCareerAverage = params[:gayCareerAverage] == "YES" ? true : false
      user.gayCareerExpert = params[:gayCareerExpert] == "YES" ? true : false
      user.comingoutSecret = params[:comingoutSecret] == "YES" ? true : false
      user.comingoutNobodyKnows = params[:comingoutNobodyKnows] == "YES" ? true : false
      user.comingoutSomeoneCloseKnow = params[:comingoutSomeoneCloseKnow] == "YES" ? true : false
      user.comingoutMostPeopleKnow = params[:comingoutMostPeopleKnow] == "YES" ? true : false
      user.loveStylesSecret = params[:loveStylesSecret] == "YES" ? true : false
      user.loveStylesClose = params[:loveStylesClose] == "YES" ? true : false
      user.loveStylesAverage = params[:loveStylesAverage] == "YES" ? true : false
      user.loveStylesSimple = params[:loveStylesSimple] == "YES" ? true : false
      user.loveStylesUpToyou = params[:loveStylesUpToyou] == "YES" ? true : false
      user.expectSecret = params[:expectSecret] == "YES" ? true : false
      user.expectpersonality = params[:expectpersonality] == "YES" ? true : false
      user.expectAppearance = params[:expectAppearance] == "YES" ? true : false
      user.expectAtmosphere = params[:expectAtmosphere] == "YES" ? true : false
      user.expectBody = params[:expectBody] == "YES" ? true : false
      user.expectSex = params[:expectSex] == "YES" ? true : false
      user.expectInterest = params[:expectInterest] == "YES" ? true : false
      user.expectCircumstance = params[:expectCircumstance] == "YES" ? true : false
      user.expectFinance = params[:expectFinance] == "YES" ? true : false
      user.expectDistance = params[:expectDistance] == "YES" ? true : false
      user.jobSecret = params[:jobSecret] == "YES" ? true : false
      user.jobStudent = params[:jobStudent] == "YES" ? true : false
      user.jobBetweenJobs = params[:jobBetweenJobs] == "YES" ? true : false
      user.jobOfficeWork = params[:jobOfficeWork] == "YES" ? true : false
      user.jobServices = params[:jobServices] == "YES" ? true : false
      user.jobManufacturing = params[:jobManufacturing] == "YES" ? true : false
      user.jobComputer = params[:jobComputer] == "YES" ? true : false
      user.jobLanguage = params[:jobLanguage] == "YES" ? true : false
      user.jobAssets = params[:jobAssets] == "YES" ? true : false
      user.jobLaw = params[:jobLaw] == "YES" ? true : false
      user.jobMedia = params[:jobMedia] == "YES" ? true : false
      user.jobPublishing = params[:jobPublishing] == "YES" ? true : false
      user.jobDomestic = params[:jobDomestic] == "YES" ? true : false
      user.jobMedicalProfession = params[:jobMedicalProfession] == "YES" ? true : false
      user.jobHealth = params[:jobHealth] == "YES" ? true : false
      user.jobArchitecture = params[:jobArchitecture] == "YES" ? true : false
      user.jobCreativeProfession = params[:jobCreativeProfession] == "YES" ? true : false
      user.jobCooking = params[:jobCooking] == "YES" ? true : false
      user.jobVehicle = params[:jobVehicle] == "YES" ? true : false
      user.jobTravel = params[:jobTravel] == "YES" ? true : false
      user.jobBeauty = params[:jobBeauty] == "YES" ? true : false
      user.jobEntertainment = params[:jobEntertainment] == "YES" ? true : false
      user.jobReligiousProfession = params[:jobReligiousProfession] == "YES" ? true : false
      user.jobCeremonialOccasions = params[:jobCeremonialOccasions] == "YES" ? true : false
      user.jobNature = params[:jobNature] == "YES" ? true : false
      user.jobSports = params[:jobSports] == "YES" ? true : false
      user.jobSexIndustry = params[:jobSexIndustry] == "YES" ? true : false
      user.livingSecret = params[:livingSecret] == "YES" ? true : false
      user.livingAlone = params[:livingAlone] == "YES" ? true : false
      user.livingwithFamily = params[:livingwithFamily] == "YES" ? true : false
      user.livingwithFriendsorLovers = params[:livingwithFriendsorLovers] == "YES" ? true : false
      user.lifePolicyVegetarian = params[:lifePolicyVegetarian] == "YES" ? true : false
      user.lifePolicyNoSmoking = params[:lifePolicyNoSmoking] == "YES" ? true : false
      user.lifePolicyNoDrinking = params[:lifePolicyNoDrinking] == "YES" ? true : false
      user.lifePolicyNoGambling = params[:lifePolicyNoGambling] == "YES" ? true : false
      user.lifePolicyNoSex = params[:lifePolicyNoSex] == "YES" ? true : false
      user.sexPositionSecret = params[:sexPositionSecret] == "YES" ? true : false
      user.sexPositionTop = params[:sexPositionTop] == "YES" ? true : false
      user.sexPositionBottom = params[:sexPositionBottom] == "YES" ? true : false
      user.sexPositionVersatile = params[:sexPositionVersatile] == "YES" ? true : false
      user.penisSize = params[:penisSize]
      user.penisThicknessSecret = params[:penisThicknessSecret] == "YES" ? true : false
      user.penisThicknessSlender = params[:penisThicknessSlender] == "YES" ? true : false
      user.penisThicknessAverage = params[:penisThicknessAverage] == "YES" ? true : false
      user.penisThicknessPlump = params[:penisThicknessPlump] == "YES" ? true : false
      user.penisThicknessExtraThick = params[:penisThicknessExtraThick] == "YES" ? true : false
      user.phimosisSecret = params[:phimosisSecret] == "YES" ? true : false
      user.phimosisCut = params[:phimosisCut] == "YES" ? true : false
      user.phimosisUncut = params[:phimosisUncut] == "YES" ? true : false
      user.phimosisOverhang = params[:phimosisOverhang] == "YES" ? true : false
      user.sadomasochismSecret = params[:sadomasochismSecret] == "YES" ? true : false
      user.sadomasochismSadistic = params[:sadomasochismSadistic] == "YES" ? true : false
      user.sadomasochismMasochistic = params[:sadomasochismMasochistic] == "YES" ? true : false
      user.sadomasochismBoth = params[:sadomasochismBoth] == "YES" ? true : false
      user.sadomasochismNeither = params[:sadomasochismNeither] == "YES" ? true : false
      user.fetishBDSM = params[:fetishBDSM] == "YES" ? true : false
      user.fetishBigCock = params[:fetishBigCock] == "YES" ? true : false
      user.fetishSmallCock = params[:fetishSmallCock] == "YES" ? true : false
      user.fetishUncut = params[:fetishUncut] == "YES" ? true : false
      user.fetishSmellFetish = params[:fetishSmellFetish] == "YES" ? true : false
      user.fetishUniformFetish = params[:fetishUniformFetish] == "YES" ? true : false
      user.fetishRubber = params[:fetishRubber] == "YES" ? true : false
      user.fetishDrag = params[:fetishDrag] == "YES" ? true : false
      user.fetishFlasher = params[:fetishFlasher] == "YES" ? true : false
      user.fetishGangbang = params[:fetishGangbang] == "YES" ? true : false
      user.fetishHardcorePlay = params[:fetishHardcorePlay] == "YES" ? true : false
      user.fetishPhoneSex = params[:fetishPhoneSex] == "YES" ? true : false
      user.fetishTeenLover = params[:fetishTeenLover] == "YES" ? true : false
      user.fetishMatureLover = params[:fetishMatureLover] == "YES" ? true : false
      user.fetishChubbyLover = params[:fetishChubbyLover] == "YES" ? true : false
      user.ageLowerLimitPublish = params[:ageLowerPublish]
      user.ageUpperLimitPublish = params[:ageUpperPublish]
      user.sexGayPublish = params[:sexGayPublish] == "YES" ? true : false
      user.sexBisexPublish = params[:sexBisexPublish] == "YES" ? true : false
      user.sexStraightPublish = params[:sexStraightPublish] == "YES" ? true : false
      user.raceAsianPublish = params[:raceAsianPublish] == "YES" ? true : false
      user.raceWhitePublish = params[:raceWhitePublish] == "YES" ? true : false
      user.raceBlackPublish = params[:raceBlackPublish] == "YES" ? true : false
      user.raceLatinPublish = params[:raceLatinPublish] == "YES" ? true : false
      user.raceArabPublish = params[:raceArabPublish] == "YES" ? true : false
      user.racePolynesianPublish = params[:racePolynesianPublish] == "YES" ? true : false
      user.raceMixPublish = params[:raceMixPublish] == "YES" ? true : false
      user.raceEtcPublish = params[:raceEtcPublish] == "YES" ? true : false
      user.chatNotice = params[:chatNotice] == "YES" ? true : false
      user.friendRequestNotice = params[:friendRequestNotice] == "YES" ? true : false
      user.matchNotice = params[:matchNotice] == "YES" ? true : false

      user.freezeAccount = false
      user.save
    end

    uid = 0
    @users = User.where(:email => id)
    @users.each do |user|
      uid = user.id
    end

    if uid != 0 && uid != nil then
      if Masterpassword.where(:user_id => uid).exists? then
        @masterPasswords = Masterpassword.where(:user_id => uid)
        @masterPasswords.each do |mp|
            mp.masterpassword = params[:password]
            mp.save
        end
      else
        mp = Masterpassword.new
        mp.user_id = uid
        mp.masterpassword = params[:password]
        mp.save
      end
    end
    
    if NotificationCount.where(:my_id).exists? then
    else
      if uid > 0 && uid != nil then
        nc = NotificationCount.new
        nc.my_id = uid
        nc.friendRequestCount = 0
        nc.matchCount = 0
        nc.footPrintCount = 0
        nc.alertCount = 0
        nc.infomationCount = 0
        nc.save
      end
    end

  end

  def getUser

    sql = <<-SQL
    <%
      email = params[:email]

      offsetValue = 0
      if params[:offsetValue] != nil then
        offsetValue = params[:offsetValue]
      end
    %>
    SELECT DISTINCT 
                id,
                email,
                nickname,
                age,
                height,
                weight,
                country,
                sexGay,
                sexBisex,
                sexStraight,
                raceAsian,
                raceWhite,
                raceBlack,
                raceLatin,
                raceArab,
                racePolynesian,
                raceMix,
                raceEtc,
                styleTwink,
                styleHunk,
                styleSurfer,
                styleHipHop,
                styleThug,
                stylePunk,
                styleWhiteCollar,
                styleHardcoreGay,
                stylePotato,
                styleBear,
                styleGeek,
                styleChubby,
                styleBeefy,
                styleBodybuilder,
                styleWellMuscled,
                styleSlimSkinny,
                styleFeminine,
                styleShemale,
                styleEtc,
                lookingLover,
                lookingFriend,
                lookingMPal,
                lookingTPal,
                lookingCircle,
                lookingRoommate,
                lookingBPartner,
                lookingFriendWithBenefits,
                comment,
                bodyShapeSecret,
                bodyShapeSlim,
                bodyShapeAverage,
                bodyShapeChubby,
                bodyShapeVeryChubby,
                muscleSecret,
                muscleDelicate,
                muscleAverage,
                muscleWellBuilt,
                muscleBodybuilder,
                bodyHairSecret,
                bodyHairSmooth,
                bodyHairAverage,
                bodyHairHairy,
                hairStyleSecret,
                hairStyleShavedHead,
                hairStyleShortHair,
                hairStyleAverage,
                hairStyleSemiLongHair,
                hairStyleLongHair,
                hairStyleUniqueStyle,
                hairColorSecret,
                hairColorBlack,
                hairColorBrown,
                hairColorBlond,
                hairColorWhite,
                hairColorUniqueColor,
                otherCharacteristicsMustache,
                otherCharacteristicsTanningSkin,
                otherCharacteristicsGlasses,
                otherCharacteristicsPiarce,
                otherCharacteristicsTatoo,
                personalityCheerful,
                personalitySerious,
                personalityFunny,
                personalityTakeTheLead,
                personalitySociable,
                personalityFollow,
                personalityFlashy,
                personalityActBasedOnEmotions,
                personalityBold,
                personalityWantStimulation,
                personalityRealism,
                personalityOptimistic,
                personalityMasculine,
                personalityStrongPerson,
                personalityWantToProtect,
                personalityIndoorsy,
                personalityBookishType,
                personalityLoveToTalkAbout,
                personalityLookingToMeet,
                gayCareerSecret,
                gayCareerBeginner,
                gayCareerAverage,
                gayCareerExpert,
                comingoutSecret,
                comingoutNobodyKnows,
                comingoutSomeoneCloseKnow,
                comingoutMostPeopleKnow,
                loveStylesSecret,
                loveStylesClose,
                loveStylesAverage,
                loveStylesSimple,
                loveStylesUpToyou,
                expectSecret,
                expectpersonality,
                expectAppearance,
                expectAtmosphere,
                expectBody,
                expectSex,
                expectInterest,
                expectCircumstance,
                expectFinance,
                expectDistance,
                jobSecret,
                jobStudent,
                jobBetweenJobs,
                jobOfficeWork,
                jobServices,
                jobManufacturing,
                jobComputer,
                jobLanguage,
                jobAssets,
                jobLaw,
                jobMedia,
                jobPublishing,
                jobDomestic,
                jobMedicalProfession,
                jobHealth,
                jobArchitecture,
                jobCreativeProfession,
                jobCooking,
                jobVehicle,
                jobTravel,
                jobBeauty,
                jobEntertainment,
                jobReligiousProfession,
                jobCeremonialOccasions,
                jobNature,
                jobSports,
                jobSexIndustry,
                livingSecret,
                livingAlone,
                livingwithFamily,
                livingwithFriendsorLovers,
                lifePolicyVegetarian,
                lifePolicyNoSmoking,
                lifePolicyNoDrinking,
                lifePolicyNoGambling,
                lifePolicyNoSex,
                sexPositionSecret,
                sexPositionTop,
                sexPositionBottom,
                sexPositionVersatile,
                penisSize,
                penisThicknessSecret,
                penisThicknessSlender,
                penisThicknessAverage,
                penisThicknessPlump,
                penisThicknessExtraThick,
                phimosisSecret,
                phimosisCut,
                phimosisUncut,
                phimosisOverhang,
                sadomasochismSecret,
                sadomasochismSadistic,
                sadomasochismMasochistic,
                sadomasochismBoth,
                sadomasochismNeither,
                fetishBDSM,
                fetishBigCock,
                fetishSmallCock,
                fetishUncut,
                fetishSmellFetish,
                fetishUniformFetish,
                fetishRubber,
                fetishDrag,
                fetishFlasher,
                fetishGangbang,
                fetishHardcorePlay,
                fetishPhoneSex,
                fetishTeenLover,
                fetishMatureLover,
                fetishChubbyLover,
                online,
                latitude,
                longitude,
                picture1,
                picture2,
                picture3,
                picture4,
                picture5,
                created_at,
                updated_at
     FROM users
     WHERE 1=1 AND email != \"<%=email%>\" AND
           latitude != 0.0 AND longitude != 0.0 AND

  <% if params[:searchText] then
       searchArray = params[:searchText].split(nil)
       j = searchArray.length - 1
       i = 0 %>
  <%   if searchArray.length > 1 then %> ( <% end %>
  <%     for searchParam in searchArray do
           searchParam = "'%" + searchParam + "%'"
  %>
           ( nickname LIKE <%= searchParam %> OR comment LIKE <%= searchParam %> )

  <%       if i < j then %>
              OR
              <% i = i + 1 %>
  <%       end %>
  <%     end %>
  <%   if searchArray.length > 1 then %> ) <%  end %>    

       AND
  <% end %>

  <% if params[:newUser] == "YES" then %>
       users.created_at >= DATE_ADD(NOW(),INTERVAL -1 MONTH) AND
  <% end %>

  <% if params[:online] == "YES" then %>
       online = true AND
  <% end %>

  <% if params[:filterEnable] == "YES" then %>
    <% if params[:age] != '0' then %>
      <% if params[:ageHiLow] == "Hi" then %>
        age >= :age AND
      <% else %>
        age <= :age AND
      <% end %>
    <% end %>

    <% if params[:height] != '0' then %>
      <% if params[:heightHiLow] == "Hi" then %>
        height >= :height AND
      <% else %>
        height <= :height AND
      <% end %>
    <% end %>

    <% if params[:weight] != '0' then %>
      <% if params[:weightHiLow] == "Hi" then %>
        weight >= :weight AND
      <% else %>
        weight <= :weight AND
      <% end %>
    <% end %>

    <%
      sexFilterArray = [ params[:sexGay], params[:sexBisex], params[:sexStraight] ]
      i = 0
      newArray = sexFilterArray.compact
      j = newArray.length - 1
      k = 0
      flg = sexFilterArray.index("YES")
    %>
    <% if flg != nil then %>
      ( 
    <% end %>
    <%
    for sex in sexFilterArray do
      if sex != nil && sex == "YES" then
        case i when 0 
    %>
            sexGay = true
          <% when 1 %>
            sexBisex  = true
          <% when 2 %>
            sexStraight  = true
          <% else %>
        <% end %>

        <% if k < j then %>
          OR
          <% k = k + 1 %>
        <% end %>
            
    <%
      end
        i += 1
    end
    %>
    <% if sexFilterArray.length > 1 && flg != nil then %>
      ) 
    <% end %>
    <% if i != 0 && flg != nil then %>
     AND 
    <% end %>

   <%
        raceFilterArray = [ params[:raceAsian], params[:raceWhite], params[:raceBlack], params[:raceLatin], params[:raceArab], params[:racePolynesian], params[:raceMix], params[:raceEtc] ]
        i = 0
        newArray = raceFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = raceFilterArray.index("YES")
    %>
    <% if raceFilterArray.length > 1 && flg != nil then %>
     ( 
    <% end %>
    <% for race in raceFilterArray do
        if race != nil && race == "YES" then
            case i when 0 %>
                raceAsian  = true
            <% when 1 %>
                raceWhite  = true
            <% when 2 %>
                raceBlack  = true
            <% when 3 %>
                raceLatin  = true
            <% when 4 %>
                raceArab  = true
            <% when 5 %>
                racePolynesian  = true
            <% when 6 %>
                raceMix  = true
            <% when 7 %>
                raceEtc  = true
            <% else %>
          <% end %>
          <% if k < j then %>
            OR
            <% k = k + 1 %>
          <% end %>
            
        <%
        end
        i += 1
    end
    %>
   
    <% if raceFilterArray.length > 1 && flg != nil then %>
        )
    <% end %>

    <% if i != 0 && flg != nil then %>
        AND
    <% end %>

   <%
        styleFilterArray = [ params[:styleTwink], params[:styleHunk], params[:styleSurfer], params[:styleHipHop], params[:styleThug], params[:stylePunk], params[:styleWhiteCollar], params[:styleHardcoreGay], params[:stylePotato], params[:styleBear], params[:styleGeek], params[:styleChubby], params[:styleBeefy], params[:styleBodybuilder], params[:styleWellMuscled], params[:styleSlimSkinny], params[:styleFeminine], params[:styleShemale], params[:styleEtc] ]
        i = 0
        newArray = styleFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = styleFilterArray.index("YES")
    %>
    <% if styleFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for styleFilter in styleFilterArray do
         if styleFilter != nil && styleFilter == "YES" then
                case i when 0 %>
                    styleTwink  = true
                <% when 1 %>
                    styleHunk  = true
                <% when 2 %>
                    styleSurfer  = true
                <% when 3 %>
                    styleHipHop  = true
                <% when 4 %>
                    styleThug  = true
                <% when 5 %>
                    stylePunk  = true
                <% when 6 %>
                    styleWhiteCollar  = true
                <% when 7 %>
                    styleHardcoreGay  = true
                <% when 8 %>
                    stylePotato  = true
                <% when 9 %>
                    styleBear  = true
                <% when 10 %>
                    styleGeek  = true
                <% when 11 %>
                    styleChubby  = true
                <% when 12 %>
                    styleBeefy  = true
                <% when 13 %>
                    styleBodybuilder  = true
                <% when 14 %>
                    styleWellMuscled  = true
                <% when 15 %>
                    styleSlimSkinny  = true
                <% when 16 %>
                    styleFeminine  = true
                <% when 17 %>
                    styleShemale  = true
                <% when 18 %>
                    styleEtc  = true
                <% else %>
              <% end %>
            <% if k  < j then %>
                OR
              <% k = k + 1 %>
            <% end %>        
        <%
        end
        i += 1
    end
    %>
   
    <% if styleFilterArray.length > 1 && flg != nil then %>
        )
    <% end %>

    <% if i != 0 && flg != nil then %>
        AND
    <% end %>

    <%
        lookingFilterArray =[ params[:lookingLover], params[:lookingFriend], params[:lookingEPal], params[:lookingMPal], params[:lookingTPal], params[:lookingCircle], params[:lookingRoommate], params[:lookingBPartner], params[:lookingFriendWithBenefits] ]
        i = 0
        newArray = lookingFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = lookingFilterArray.index("YES")
    %>
    <% if lookingFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for lookingFilter in lookingFilterArray do
            if lookingFilter != nil && lookingFilter == "YES" then
                case i when 0 %>
                    lookingLover  = true
                <% when 1 %>
                    lookingFriend  = true
                <% when 2 %>
                    lookingEPal = true
                <% when 3 %>
                    lookingMPal  = true
                <% when 4 %>
                    lookingTPal  = true
                <% when 5 %>
                    lookingCircle  = true
                <% when 6 %>
                    lookingRoommate  = true
                <% when 7 %>
                    lookingBPartner  = true
                <% when 8 %>
                    lookingFriendWithBenefits  = true
                <% else %>
            <% end %>
            <% if k < j then %>
                OR
              <% k = k + 1 %>
            <% end %>        
        <%
        end
        i += 1
    end
    %>
   
    <% if lookingFilterArray.length > 1 && flg != nil then %>
        )
    <% end %>

    <% if i != 0 && flg != nil then %>
        AND
    <% end %>

    <%
        bodyShapeFilterArray = [ params[:bodyShapeSecret], params[:bodyShapeSlim], params[:bodyShapeAverage], params[:bodyShapeChubby], params[:bodyShapeVeryChubby] ]
        i=0
        newArray = bodyShapeFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = bodyShapeFilterArray.index("YES")
    %>
    <% if bodyShapeFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for bodyShapeFilter in bodyShapeFilterArray do
            if bodyShapeFilter != nil && bodyShapeFilter == "YES" then
                case i when 0 %>
                    bodyShapeSecret  = true
                <% when 1 %>
                    bodyShapeSlim  = true
                <% when 2 %>
                    bodyShapeAverage  = true
                <% when 3 %>
                    bodyShapeChubby  = true
                <% when 4 %>
                    bodyShapeVeryChubby  = true
                <% else %>
              <% end %>
              <% if k < j then %>
                OR
                <% k = k + 1 %>
              <% end %>        
          <%
          end
          i += 1
      end
    %>
   
    <% if bodyShapeFilterArray.length > 1 && flg != nil then %>
        )
    <% end %>

    <% if i != 0 && flg != nil then %>
        AND
    <% end %>

    <%
        muscleFilterArray = [ params[:muscleSecret], params[:muscleDelicate], params[:muscleAverage], params[:muscleWellBuilt], params[:muscleBodybuilder] ]
        i=0
        newArray = muscleFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = muscleFilterArray.index("YES")
    %>
    <% if muscleFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for muscleFilter in muscleFilterArray do
            if muscleFilter != nil && muscleFilter == "YES" then
                case i when 0 %>
                    muscleSecret  = true
                <% when 1 %>
                    muscleDelicate  = true
                <% when 2 %>
                    muscleAverage  = true
                <% when 3 %>
                    muscleWellBuilt  = true
                <% when 4 %>
                    muscleBodybuilder  = true
                <% else %>
              <% end %>
              <% if k < j then %>
                  OR
                <% k = k + 1 %>
              <% end %>        
          <%
          end
          i += 1
      end
    %>

    <% if muscleFilterArray.length > 1 && flg != nil then %>
        )
    <% end %>

    <% if i != 0 && flg != nil then %>
        AND
    <% end %>

    <%
        bodyHairFilterArray = [ params[:bodyHairSecret], params[:bodyHairSmooth], params[:bodyHairAverage], params[:bodyHairHairy] ]
        i=0
        newArray = bodyHairFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = bodyHairFilterArray.index("YES")
    %>
    <% if bodyHairFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for bodyHairFilter in bodyHairFilterArray do
        if bodyHairFilter != nil && bodyHairFilter == "YES" then
          case i when 0 %>
                    bodyHairSecret  = true
                <% when 1 %>
                    bodyHairSmooth  = true
                <% when 2 %>
                    bodyHairAverage  = true
                <% when 3 %>
                    bodyHairHairy  = true
                <% else %>
            <% end %>
            <% if k < j then %>
                OR
              <% k = k + 1 %>
            <% end %>        
        <%
        end
        i += 1
    end
    %>

    <% if bodyHairFilterArray.length > 1 && flg != nil then %>
        )
    <% end %>

    <% if i != 0 && flg != nil then %>
        AND
    <% end %>

    <%
        hairStyleFilterArray = [ params[:hairStyleSecret], params[:hairStyleShavedHead], params[:hairStyleShortHair],params[:hairStyleAverage], params[:hairStyleSemiLongHair], params[:hairStyleLongHair], params[:hairStyleUniqueStyle] ]
        i = 0
        newArray = hairStyleFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = hairStyleFilterArray.index("YES")
    %>
    <% if hairStyleFilterArray.length > 1 && flg != nil then %> 
        (
    <% end %>
    <% for hairStyleFilter in hairStyleFilterArray do
            if hairStyleFilter != nil && hairStyleFilter == "YES" then
                case i when 0 %>
                    hairStyleSecret  = true
                <% when 1 %>
                    hairStyleShavedHead  = true
                <% when 2 %>
                    hairStyleShortHair  = true
                <% when 3 %>
                    hairStyleAverage  = true
                <% when 4 %>
                    hairStyleSemiLongHair  = true
                <% when 5 %>
                    hairStyleLongHair  = true
                <% when 6 %>
                    hairStyleUniqueStyle  = true
                <% else %>
            <% end %>
            <% if k < j then %>
                OR
              <% k = k + 1 %>
            <% end %>        
        <%
        end
        i += 1
    end
    %>

    <% if hairStyleFilterArray.length > 1 && flg != nil %>
        )
    <% end %>
    <% if i != 0 && flg != nil %>
        AND
    <% end %>

    <%
        hairColorFilterArray = [ params[:hairColorSecret], params[:hairColorBlack], params[:hairColorBrown], params[:hairColorBlond], params[:hairColorWhite], params[:hairColorUniqueColor] ]
        i=0
        newArray = hairColorFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = hairColorFilterArray.index("YES")
    %>
    <% if hairColorFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for hairColorFilter in hairColorFilterArray do
            if hairColorFilter != nil && hairColorFilter == "YES" then
                case i when 0 %>
                    hairColorSecret  = true
                <% when 1 %>
                    hairColorBlack  = true
                <% when 2 %>
                    hairColorBrown  = true
                <% when 3 %>
                    hairColorBlond  = true
                <% when 4 %>
                    hairColorWhite  = true
                <% when 5 %>
                    hairColorUniqueColor  = true
                <% else %>
            <% end %>
            <% if k < j then %>
                OR
              <% k = k + 1 %>
            <% end %>        
        <%
        end
        i += 1
    end
    %>

    <% if hairColorFilterArray.length > 1 && flg != nil then %>
        )
    <% end %>

    <% if i != 0 && flg != nil then %>
        AND
    <% end %>

    <%
        otherCharacteristicsFilterArray = [ params[:otherCharacteristicsMustache], params[:otherCharacteristicsTanningSkin], params[:otherCharacteristicsGlasses], params[:otherCharacteristicsPiarce], params[:otherCharacteristicsTatoo] ]
        i=0
        newArray = otherCharacteristicsFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = otherCharacteristicsFilterArray.index("YES")
    %>
    <% if otherCharacteristicsFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for otherCharacteristicsFilter in otherCharacteristicsFilterArray do
            if otherCharacteristicsFilter != nil && otherCharacteristicsFilter == "YES" then
              case i when 0 %>
                    otherCharacteristicsMustache  = true
                <% when 1 %>
                    otherCharacteristicsTanningSkin  = true
                <% when 2 %>
                    otherCharacteristicsGlasses  = true
                <% when 3 %>
                    otherCharacteristicsPiarce  = true
                <% when 4 %>
                    otherCharacteristicsTatoo  = true
                <% else %>
              <% end %>
            <% if k < j then %>
                OR
              <% k = k + 1 %>
            <% end %>        
        <%
        end
        i += 1
    end
    %>

    <% if otherCharacteristicsFilterArray.length > 1 && flg != nil then %>
        )
    <% end %>

    <% if i != 0 && flg != nil then %>
        AND
    <% end %>

    <%
        personalityFilterArray = [ params[:personalityCheerful], params[:personalitySerious], params[:personalityFunny], params[:personalityTakeTheLead], params[:personalitySociable], params[:personalityFollow], params[:personalityFlashy], params[:personalityActBasedOnEmotions],  params[:personalityBold], params[:personalityWantStimulation], params[:personalityRealism], params[:personalityOptimistic], params[:personalityMasculine], params[:personalityStrongPerson], params[:personalityWantToProtect], params[:personalityIndoorsy], params[:personalityBookishType], params[:personalityLoveToTalkAbout], params[:personalityLookingToMeet] ]
        i=0
        newArray = personalityFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = personalityFilterArray.index("YES")
    %>
    <% if personalityFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for personalityFilter in personalityFilterArray do
        if personalityFilter != nil && personalityFilter == "YES" then
            case i when 0 %>
                personalityCheerful <> 0
            <% when 1 %>
                personalitySerious <> 0
                <% when 2 %>
                    personalityFunny <> 0
                <% when 3 %>
                    personalityTakeTheLead <> 0
                <% when 4 %>
                    personalitySociable <> 0
                <% when 5 %>
                    personalityFollow <> 0
                <% when 6 %>
                    personalityFlashy <> 0
                <% when 7 %>
                    personalityActBasedOnEmotions <> 0
                <% when 8 %>
                    personalityBold <> 0
                <% when 9 %>
                    personalityWantStimulation <> 0
                <% when 10 %>
                    personalityRealism <> 0
                <% when 11 %>
                    personalityOptimistic <> 0
                <% when 12 %>
                    personalityMasculine <> 0
                <% when 13 %>
                    personalityStrongPerson <> 0
                <% when 14 %>
                    personalityWantToProtect <> 0
                <% when 15 %>
                    personalityIndoorsy <> 0
                <% when 16 %>
                    personalityBookishType <> 0
                <% when 17 %>
                    personalityLoveToTalkAbout <> 0
                <% when 18 %>
                    personalityLookingToMeet <> 0
                <% else %>
            <% end %>
            <% if k < j then %>
                OR
              <% k = k + 1 %>
            <% end %>        
        <%
        end
        i += 1
    end
    %>

    <% if personalityFilterArray.length > 1 && flg != nil then %>
        )
    <% end %>

    <% if i != 0 && flg != nil then %>
        AND
    <% end %>

    <%
        gayCareerFilterArray = [ params[:gayCareerSecret], params[:gayCareerBeginner], params[:gayCareerAverage], params[:gayCareerExpert] ]
        i = 0
        newArray = gayCareerFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = gayCareerFilterArray.index("YES")
    %>
    <% if gayCareerFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for gayCareerFilter in gayCareerFilterArray do
            if gayCareerFilter != nil && gayCareerFilter == "YES" then
                case i when 0 %>
                    gayCareerSecret  = true
                <% when 1 %>
                    gayCareerBeginner  = true
                <% when 2 %>
                    gayCareerAverage  = true
                <% when 3 %>
                    gayCareerExpert  = true
                <% else %>
            <% end %>
            <% if k < j then %>
                OR
              <%  k = k + 1 %>
            <% end %>        
        <%
        end
        i += 1
    end
    %>

    <% if gayCareerFilterArray.length > 1 && flg != nil then %>
        )
    <% end %>

    <% if i != 0 && flg != nil then %>
        AND
    <% end %>

    <%
        comingoutFilterArray = [ params[:comingoutSecret], params[:comingoutNobodyKnows], params[:comingoutSomeoneCloseKnow], params[:comingoutMostPeopleKnow] ]
        i=0
        newArray = comingoutFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = comingoutFilterArray.index("YES")
    %>
    <%if comingoutFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for comingoutFilter in comingoutFilterArray do
        if comingoutFilter != nil && comingoutFilter == "YES" then
            case i when 0 %>
                    comingoutSecret  = true
                <% when 1 %>
                    comingoutNobodyKnows = true
                <% when 2 %>
                    comingoutSomeoneCloseKnow  = true
                <% when 3 %>
                    comingoutMostPeopleKnow  = true
                <% else %>
            <% end %>
            <% if k < j then %>
                OR
              <% k = k + 1 %>
            <% end %>        
        <%
        end
        i += 1
    end
    %>

    <% if comingoutFilterArray.length > 1 && flg != nil then %>
        )
    <% end %>

    <% if i != 0 && flg != nil then %>
        AND
    <% end %>

    <%
        loveStyleFilterArray = [ params[:loveStylesSecret], params[:loveStylesClose], params[:loveStylesAverage], params[:loveStylesSimple], params[:loveStylesUpToyou] ]
        i = 0
        newArray = loveStyleFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = loveStyleFilterArray.index("YES")
    %>
    <% if loveStyleFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for loveStyleFilter in loveStyleFilterArray do
        if loveStyleFilter != nil && loveStyleFilter == "YES" then
            case i when 0 %>
                    loveStylesSecret  = true
                <% when 1 %>
                    loveStylesClose  = true
                <% when 2 %>
                    loveStylesAverage  = true
                <% when 3 %>
                    loveStylesSimple  = true
                <% when 4 %>
                    loveStylesUpToyou  = true
                <% else %>
            <% end %>
            <% if k < j then %>
                OR
              <% k = k + 1 %>
            <% end %>        
        <%
        end
        i += 1
    end
    %>

    <% if loveStyleFilterArray.length > 1 && flg != nil then %>
        )
    <% end %>

    <% if i != 0 && flg != nil then %>
        AND
    <% end %>

    <%
        expectFilterArray = [ params[:expectSecret], params[:expectpersonality], params[:expectAppearance],params[:expectAtmosphere], params[:expectBody], params[:expectSex],params[:expectInterest], params[:expectCircumstance], params[:expectFinance],params[:expectDistance] ]
        i = 0
        newArray = expectFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = expectFilterArray.index("YES")
    %>
    <%if expectFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for expectFilter in expectFilterArray do
            if expectFilter != nil && expectFilter == "YES" then
                case i when 0 %>
                    expectSecret  = true
                <% when 1 %>
                    expectpersonality  = true
                <% when 2 %>
                    expectAppearance  = true
                <% when 3 %>
                    expectAtmosphere  = true
                <% when 4 %>
                    expectBody  = true
                <% when 5 %>
                    expectSex  = true
                <% when 6 %>
                    expectInterest  = true
                <% when 7 %>
                    expectCircumstance  = true
                <% when 8 %>
                    expectFinance  = true
                <% when 9 %>
                    expectDistance  = true
                <% else %>
            <% end %>
            <% if k < j then %>
                OR 
              <% k = k + 1 %>
            <% end %>        
        <%
        end
        i += 1
    end
    %>
    <% if expectFilterArray.length > 1 && flg != nil then %>
      ) 
    <% end %>
    
    <% if i != 0 && flg != nil then %>
      AND
    <% end %>

    <% 
        jobFilterArray = [ params[:jobSecret], params[:jobStudent], params[:jobBetweenJobs], params[:jobOfficeWork], params[:jobServices], params[:jobManufacturing], params[:jobComputer], params[:jobLanguage], params[:jobAssets], params[:jobLaw], params[:jobMedia], params[:jobPublishing], params[:jobDomestic], params[:jobMedicalProfession], params[:jobHealth], params[:jobArchitecture], params[:jobCreativeProfession], params[:jobCooking], params[:jobVehicle], params[:jobTravel], params[:jobBeauty], params[:jobEntertainment], params[:jobReligiousProfession], params[:jobCeremonialOccasions], params[:jobNature], params[:jobSports], params[:jobSexIndustry] ]
        i = 0
        newArray = jobFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = jobFilterArray.index("YES")
    %>
    <%if jobFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for jobFilter in jobFilterArray do
            if jobFilter != nil && jobFilter == "YES" then
                case i when 0 %>
                    jobSecret  = true
                <% when 1 %>
                    jobStudent  = true
                <% when 2 %>
                    jobBetweenJobs  = true
                <% when 3 %>
                    jobOfficeWork  = true
                <% when 4 %>
                    jobServices  = true
                <% when 5 %>
                    jobManufacturing  = true
                <% when 6 %>
                    jobComputer  = true
                <% when 7 %>
                    jobLanguage  = true
                <% when 8 %>
                    jobAssets  = true
                <% when 9 %>
                    jobLaw  = true
                <% when 10 %>
                    jobMedia  = true
                <% when 11 %>
                    jobPublishing  = true
                <% when 12 %>
                    jobDomestic  = true
                <% when 13 %>
                    jobMedicalProfession  = true
                <% when 14 %>
                    jobHealth  = true
                <% when 15 %>
                    jobArchitecture  = true
                <% when 16 %>
                    jobCreativeProfession  = true
                <% when 17 %>
                    jobCooking  = true
                <% when 18 %>
                    jobVehicle  = true
                <% when 19 %>
                    jobTravel  = true
                <% when 20 %>
                    jobBeauty  = true
                <% when 21 %>
                    jobEntertainment  = true
                <% when 22 %>
                    jobReligiousProfession  = true
                <% when 23 %>
                    jobCeremonialOccasions  = true
                <% when 24 %>
                    jobNature  = true
                <% when 25 %>
                    jobSports  = true
                <% when 26 %>
                    jobSexIndustry  = true
                <% else %>
            <% end %>
            <% if k < j then %> 
                OR 
              <% k = k + 1 %>
            <% end %>        
        <%
        end
        i += 1
    end
    %>
    <% if jobFilterArray.length > 1 && flg != nil then %> 
        ) 
    <% end %>
    <% if i != 0 && flg != nil then %>
     AND 
    <% end %>

    <%
        livingFilterArray = [ params[:livingSecret], params[:livingAlone], params[:livingwithFamily], params[:livingwithFriendsorLovers], params[:lifePolicyVegetaria]  ]
        i = 0
        newArray = livingFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = livingFilterArray.index("YES")
    %>
    <%if livingFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for livingFilter in livingFilterArray do
            if livingFilter != nil && livingFilter == "YES" then
                case i when 0 %>
                    livingSecret  = true
                <% when 1 %>
                    livingAlone  = true
                <% when 2 %>
                    livingwithFamily  = true
                <% when 3 %>
                    livingwithFriendsorLovers  = true
                <% when 4 %>
                    lifePolicyVegetaria  = true
                <% else %>
            <% end %>
            <% if k < j then %>
                OR
              <% k = k + 1 %> 
            <% end %>        
        <%
        end
        i += 1
    end
    %>
    <% if livingFilterArray.length > 1 && flg != nil then %>
      ) 
    <% end %>
    <% if i != 0 && flg != nil then %>
      AND 
    <% end %>

    <%
        lifePolicyFilterArray = [ params[:lifePolicyNoSmoking], params[:lifePolicyNoDrinking], params[:lifePolicyNoGambling], params[:lifePolicyNoSex] ]
        i = 0
        newArray = lifePolicyFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = lifePolicyFilterArray.index("YES")
    %>
    <%if lifePolicyFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for lifePolicyFilter in lifePolicyFilterArray do
            if lifePolicyFilter != nil && lifePolicyFilter == "YES" then
                case i when 0 %>
                    lifePolicyNoSmoking  = true
                <% when 1 %>
                    lifePolicyNoDrinking  = true
                <% when 2 %>
                    lifePolicyNoGambling  = true
                <% when 3 %>
                    lifePolicyNoSex  = true
                <% else %>
            <% end %>
            <% if k < j then %>
                OR 
              <% k = k + 1 %>
            <% end %>        
        <%
        end
        i += 1
    end
    %>
    <% if lifePolicyFilterArray.length > 1 && flg != nil then %>
     ) 
    <% end %>
    <% if i != 0 && flg != nil then %>
     AND 
    <% end %>

    <%
        sexPositionFilterArray = [ params[:sexPositionSecret], params[:sexPositionTop], params[:sexPositionBottom], params[:sexPositionVersatile] ]
        i = 0
        newArray = sexPositionFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = sexPositionFilterArray.index("YES")
    %>
    <%if sexPositionFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for sexPositionFilter in sexPositionFilterArray do
            if sexPositionFilter != nil && sexPositionFilter == "YES" then
                case i when 0 %>
                    sexPositionSecret  = true
                <% when 1 %>
                    sexPositionTop  = true
                <% when 2 %>
                    sexPositionBottom  = true
                <% when 3 %>
                    sexPositionVersatile  = true
                <% else %>
            <% end %>
            <% if k < j then %>
              OR 
              <% k = k + 1 %>
            <% end %>        
        <%
        end
        i += 1
    end
    %>
    <% if sexPositionFilterArray.length > 1 && flg != nil then %>
     ) 
    <% end %>
    <% if i != 0 && flg != nil then %>
     AND 
    <% end %>

    <%if params[:penisSize] != '0' then %>
        <%if params[:penisSizeHiLow] == "Hi" then %>
            penisSize >= :penisSize AND
        <%else%>
            penisSize <= :penisSize AND
        <%end%>
    <%end%>

    <%
        penisThicknessFilterArray = [ params[:penisThicknessSecret], params[:penisThicknessSlender], params[:penisThicknessAverage], params[:penisThicknessPlump], params[:penisThicknessExtraThick] ]
        i = 0
        newArray = penisThicknessFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = penisThicknessFilterArray.index("YES")
    %>
    <%if penisThicknessFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for penisThicknessFilter in penisThicknessFilterArray do
            if penisThicknessFilter != nil && penisThicknessFilter == "YES" then
                case i when 0 %>
                    penisThicknessSecret  = true
                <% when 1 %>
                    penisThicknessSlender  = true
                <% when 2 %>
                    penisThicknessAverage  = true
                <% when 3 %>
                    penisThicknessPlump  = true
                <% when 4 %>
                    penisThicknessExtraThick  = true
                <% else %>
            <% end %>
            <% if k < j then %>
                OR
              <% k = k + 1 %> 
            <% end %>        
        <%
        end
        i += 1
    end
    %>
    <% if penisThicknessFilterArray.length > 1 && flg != nil then %>
     ) 
    <% end %>
    <% if i != 0 && flg != nil then %>
      AND 
    <% end %>

    <%
        phimosisFilterArray = [ params[:phimosisSecret], params[:phimosisCut], params[:phimosisUncut], params[:phimosisOverhang] ]
        i = 0
        newArray = phimosisFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = phimosisFilterArray.index("YES")
    %>
    <%if phimosisFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for phimosisFilter in phimosisFilterArray do
            if phimosisFilter != nil && phimosisFilter == "YES" then
                case i when 0 %>
                    phimosisSecret  = true
                <% when 1 %>
                    phimosisCut  = true
                <% when 2 %>
                    phimosisUncut  = true
                <% when 3 %>
                    phimosisOverhang  = true
                <% else %>
            <% end %>
            <% if k < j then %>
             OR
             <% k = k + 1 %> 
            <% end %>        
        <%
        end
        i += 1
    end
    %>
    <% if phimosisFilterArray.length > 1 && flg != nil then %>
      ) 
    <% end %>
    <% if i != 0 && flg != nil then %>
      AND 
    <% end %>

    <%
        sadomasochismFilterArray = [ params[:sadomasochismSecret], params[:sadomasochismSadistic], params[:sadomasochismMasochistic], params[:sadomasochismBoth], params[:sadomasochismNeither] ]
        i = 0
        newArray = sadomasochismFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = sadomasochismFilterArray.index("YES")
    %>
    <%if sadomasochismFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for sadomasochismFilter in sadomasochismFilterArray do
            if sadomasochismFilter != nil && sadomasochismFilter == "YES" then
                case i when 0 %>
                    sadomasochismSecret  = true
                <% when 1 %>
                    sadomasochismSadistic  = true
                <% when 2 %>
                    sadomasochismMasochistic  = true
                <% when 3 %>
                    sadomasochismBoth  = true
                <% when 4 %>
                    sadomasochismNeither  = true
                <% else %>
            <% end %>
            <% if k < j then %>
               OR
              <% k = k + 1 %> 
            <% end %>        
        <%
        end
        i += 1
    end
    %>
    <% if sadomasochismFilterArray.length > 1 && flg != nil then %>
      ) 
    <% end %>
    <% if i != 0 && flg != nil then %>
      AND 
    <% end %>

    <%
        fetishFilterArray = [ params[:fetishBDSM], params[:fetishBigCock], params[:fetishSmallCock], params[:fetishUncut], params[:fetishSmellFetish], params[:fetishUniformFetish], params[:fetishRubber], params[:fetishDrag], params[:fetishFlasher], params[:fetishGangbang], params[:fetishHardcorePlay], params[:fetishPhoneSex], params[:fetishTeenLover], params[:fetishMatureLover], params[:fetishChubbyLover]  ]
        i=0
        newArray = fetishFilterArray.compact
        j = newArray.length - 1
        k = 0
        flg = fetishFilterArray.index("YES")
    %>
    <%if fetishFilterArray.length > 1 && flg != nil then %>
        (
    <% end %>
    <% for fetishFilter in fetishFilterArray do
            if fetishFilter != nil && fetishFilter == "YES" then
                case i when 0 %>
                    fetishBDSM  = true
                <% when 1 %>
                    fetishBigCock  = true
                <% when 2 %>
                    fetishSmallCock  = true
                <% when 3 %>
                    fetishUncut  = true
                <% when 4 %>
                    fetishSmellFetish  = true
                <% when 5 %>
                    fetishUniformFetish  = true
                <% when 6 %>
                    fetishRubber  = true
                <% when 7 %>
                    fetishDrag  = true
                <% when 8 %>
                    fetishFlasher  = true
                <% when 9 %>
                    fetishGangbang  = true
                <% when 10 %>
                    fetishHardcorePlay  = true
                <% when 11 %>
                    fetishPhoneSex  = true
                <% when 12 %>
                    fetishTeenLover = true
                <% when 13 %>
                    fetishMatureLover = true
                <% when 14 %>
                    fetishChubbyLover = true
                <% else %>
            <% end %>
            <% if k < j then %>
                OR
              <% k = k + 1 %> 
            <% end %>        
        <%
        end
        i += 1
    end
    %>
    <% if fetishFilterArray.length > 1 && flg != nil then %>
      ) 
    <% end %>
    <% if i != 0 && flg != nil then %>
      AND 
    <% end %>

  <%# End For if %>
  <% end %>

   <% if params[:myAge] != 0 %>
     ageLowerLimitPublish <= :myAge AND
     ageUpperLimitPublish >= :myAge AND
   <%end%>

   <% if params[:mySexuallity] == "Gay" then %>
    sexGayPublish = true AND
   <% end %>
   <% if params[:mySexuallity] == "Bisexuality" then  %>
    sexBisexPublish  = true AND
   <% end %>
   <% if params[:mySexuallity] == "Straight" then %>
    sexStraightPublish  = true AND
   <% end %>

   <% if params[:myRace] == "Asian" then %>
    raceAsianPublish  = true AND
   <% end %>
   <% if params[:myRace] == "White" then %>
    raceWhitePublish  = true AND
   <% end %>
   <% if params[:myRace] == "Black" then %>
    raceBlackPublish  = true AND
   <% end %>
   <% if params[:myRace] == "Latin" then %>
    raceLatinPublish  = true AND
   <% end %>
   <%if params[:myRace] == "Arab" then %>
    raceArabPublish  = true AND
   <% end %>
   <% if params[:myRace]  == "Polynesian" then %>
    racePolynesianPublish  = true AND
   <% end %>
   <% if params[:myRace] == "Mix" then %>
    raceMixPublish  = true AND
   <% end %>
   <% if params[:myRace] == "Etc" then %>
    raceEtcPublish = true AND
   <% end %>
   
    (freezeAccount != NULL OR freezeAccount = false)
      AND
      users.id NOT IN (SELECT blocks.user_id FROM blocks, users WHERE users.id = blocks.user_id AND blocks.my_id =  (SELECT id FROM users WHERE email = \"<%=email%>\"))
      AND
      users.id NOT IN (SELECT blocks.my_id FROM blocks, users WHERE users.id = blocks.user_id AND blocks.user_id =  (SELECT id FROM users WHERE email = \"<%=email%>\"))
      AND
      users.email NOT IN (SELECT blacklists.email FROM blacklists)
      ORDER BY updated_at DESC
      LIMIT <%= offsetValue %>, 300
  SQL
  # LIMIT <%= offsetValue %>, 300
    @users = User.find_by_sql([ERB.new(sql).result(binding), params])
    respond_to do |format|
      format.json { render :json => @users.to_json() }
    end
  end


end

