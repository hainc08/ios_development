# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130819190052) do

  create_table "alerts", :force => true do |t|
    t.text     "message",                 :null => false
    t.integer  "user_id",    :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "blacklists", :force => true do |t|
    t.string   "email",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "blocks", :force => true do |t|
    t.integer  "my_id",      :limit => 8
    t.integer  "user_id",    :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "chat_notification_counts", :force => true do |t|
    t.integer  "my_id",      :limit => 8
    t.integer  "countValue",              :default => 0
    t.integer  "user_id",    :limit => 8
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "chats", :force => true do |t|
    t.integer  "my_id",      :limit => 8
    t.text     "message"
    t.string   "pict"
    t.integer  "user_id",    :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "devices", :force => true do |t|
    t.text     "deviceId"
    t.integer  "my_id",      :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "footprints", :force => true do |t|
    t.integer  "my_id",      :limit => 8
    t.integer  "user_id",    :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "friend_requests", :force => true do |t|
    t.integer  "my_id",      :limit => 8
    t.integer  "user_id",    :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "friends", :force => true do |t|
    t.integer  "my_id",      :limit => 8
    t.integer  "user_id",    :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "histories", :force => true do |t|
    t.integer  "my_id",      :limit => 8
    t.integer  "user_id",    :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "infos", :id => false, :force => true do |t|
    t.integer  "id",         :limit => 8
    t.text     "message",                 :null => false
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "masterpasswords", :force => true do |t|
    t.string   "masterpassword",              :null => false
    t.integer  "user_id",        :limit => 8
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "matches", :force => true do |t|
    t.integer  "my_id",      :limit => 8
    t.integer  "user_id",    :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "notification_counts", :force => true do |t|
    t.integer  "friendRequestCount",              :default => 0
    t.integer  "matchCount",                      :default => 0
    t.integer  "footPrintCount",                  :default => 0
    t.integer  "alertCount",                      :default => 0
    t.integer  "infomationCount",                 :default => 0
    t.integer  "my_id",              :limit => 8
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "reports", :force => true do |t|
    t.integer  "command",                 :default => 0, :null => false
    t.integer  "my_id",      :limit => 8
    t.integer  "user_id",    :limit => 8
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "silent_matches", :force => true do |t|
    t.integer  "my_id",      :limit => 8
    t.integer  "user_id",    :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                                                             :null => false
    t.string   "password",                                                                          :null => false
    t.string   "nickname",                                                                          :null => false
    t.integer  "age",                                                            :default => 0
    t.integer  "height",                                                         :default => 0
    t.integer  "weight",                                                         :default => 0
    t.integer  "country",                                                        :default => 0
    t.boolean  "sexGay",                                                         :default => false
    t.boolean  "sexBisex",                                                       :default => false
    t.boolean  "sexStraight",                                                    :default => false
    t.boolean  "raceAsian",                                                      :default => false
    t.boolean  "raceWhite",                                                      :default => false
    t.boolean  "raceBlack",                                                      :default => false
    t.boolean  "raceLatin",                                                      :default => false
    t.boolean  "raceArab",                                                       :default => false
    t.boolean  "racePolynesian",                                                 :default => false
    t.boolean  "raceMix",                                                        :default => false
    t.boolean  "raceEtc",                                                        :default => false
    t.boolean  "styleTwink",                                                     :default => false
    t.boolean  "styleHunk",                                                      :default => false
    t.boolean  "styleSurfer",                                                    :default => false
    t.boolean  "styleHipHop",                                                    :default => false
    t.boolean  "styleThug",                                                      :default => false
    t.boolean  "stylePunk",                                                      :default => false
    t.boolean  "styleWhiteCollar",                                               :default => false
    t.boolean  "styleHardcoreGay",                                               :default => false
    t.boolean  "stylePotato",                                                    :default => false
    t.boolean  "styleBear",                                                      :default => false
    t.boolean  "styleGeek",                                                      :default => false
    t.boolean  "styleChubby",                                                    :default => false
    t.boolean  "styleBeefy",                                                     :default => false
    t.boolean  "styleBodybuilder",                                               :default => false
    t.boolean  "styleWellMuscled",                                               :default => false
    t.boolean  "styleSlimSkinny",                                                :default => false
    t.boolean  "styleFeminine",                                                  :default => false
    t.boolean  "styleShemale",                                                   :default => false
    t.boolean  "styleEtc",                                                       :default => false
    t.boolean  "lookingLover",                                                   :default => false
    t.boolean  "lookingFriend",                                                  :default => false
    t.boolean  "lookingEPal",                                                    :default => false
    t.boolean  "lookingMPal",                                                    :default => false
    t.boolean  "lookingTPal",                                                    :default => false
    t.boolean  "lookingCircle",                                                  :default => false
    t.boolean  "lookingRoommate",                                                :default => false
    t.boolean  "lookingBPartner",                                                :default => false
    t.boolean  "lookingFriendWithBenefits",                                      :default => false
    t.text     "comment"
    t.boolean  "bodyShapeSecret",                                                :default => false
    t.boolean  "bodyShapeSlim",                                                  :default => false
    t.boolean  "bodyShapeAverage",                                               :default => false
    t.boolean  "bodyShapeChubby",                                                :default => false
    t.boolean  "bodyShapeVeryChubby",                                            :default => false
    t.boolean  "muscleSecret",                                                   :default => false
    t.boolean  "muscleDelicate",                                                 :default => false
    t.boolean  "muscleAverage",                                                  :default => false
    t.boolean  "muscleWellBuilt",                                                :default => false
    t.boolean  "muscleBodybuilder",                                              :default => false
    t.boolean  "bodyHairSecret",                                                 :default => false
    t.boolean  "bodyHairSmooth",                                                 :default => false
    t.boolean  "bodyHairAverage",                                                :default => false
    t.boolean  "bodyHairHairy",                                                  :default => false
    t.boolean  "hairStyleSecret",                                                :default => false
    t.boolean  "hairStyleShavedHead",                                            :default => false
    t.boolean  "hairStyleShortHair",                                             :default => false
    t.boolean  "hairStyleAverage",                                               :default => false
    t.boolean  "hairStyleSemiLongHair",                                          :default => false
    t.boolean  "hairStyleLongHair",                                              :default => false
    t.boolean  "hairStyleUniqueStyle",                                           :default => false
    t.boolean  "hairColorSecret",                                                :default => false
    t.boolean  "hairColorBlack",                                                 :default => false
    t.boolean  "hairColorBrown",                                                 :default => false
    t.boolean  "hairColorBlond",                                                 :default => false
    t.boolean  "hairColorWhite",                                                 :default => false
    t.boolean  "hairColorUniqueColor",                                           :default => false
    t.boolean  "otherCharacteristicsMustache",                                   :default => false
    t.boolean  "otherCharacteristicsTanningSkin",                                :default => false
    t.boolean  "otherCharacteristicsGlasses",                                    :default => false
    t.boolean  "otherCharacteristicsPiarce",                                     :default => false
    t.boolean  "otherCharacteristicsTatoo",                                      :default => false
    t.integer  "personalityCheerful",                                            :default => 0
    t.integer  "personalitySerious",                                             :default => 0
    t.integer  "personalityFunny",                                               :default => 0
    t.integer  "personalityTakeTheLead",                                         :default => 0
    t.integer  "personalitySociable",                                            :default => 0
    t.integer  "personalityFollow",                                              :default => 0
    t.integer  "personalityFlashy",                                              :default => 0
    t.integer  "personalityActBasedOnEmotions",                                  :default => 0
    t.integer  "personalityBold",                                                :default => 0
    t.integer  "personalityWantStimulation",                                     :default => 0
    t.integer  "personalityRealism",                                             :default => 0
    t.integer  "personalityOptimistic",                                          :default => 0
    t.integer  "personalityMasculine",                                           :default => 0
    t.integer  "personalityStrongPerson",                                        :default => 0
    t.integer  "personalityWantToProtect",                                       :default => 0
    t.integer  "personalityIndoorsy",                                            :default => 0
    t.integer  "personalityBookishType",                                         :default => 0
    t.integer  "personalityLoveToTalkAbout",                                     :default => 0
    t.integer  "personalityLookingToMeet",                                       :default => 0
    t.boolean  "gayCareerSecret",                                                :default => false
    t.boolean  "gayCareerBeginner",                                              :default => false
    t.boolean  "gayCareerAverage",                                               :default => false
    t.boolean  "gayCareerExpert",                                                :default => false
    t.boolean  "comingoutSecret",                                                :default => false
    t.boolean  "comingoutNobodyKnows",                                           :default => false
    t.boolean  "comingoutSomeoneCloseKnow",                                      :default => false
    t.boolean  "comingoutMostPeopleKnow",                                        :default => false
    t.boolean  "loveStylesSecret",                                               :default => false
    t.boolean  "loveStylesClose",                                                :default => false
    t.boolean  "loveStylesAverage",                                              :default => false
    t.boolean  "loveStylesSimple",                                               :default => false
    t.boolean  "loveStylesUpToyou",                                              :default => false
    t.boolean  "expectSecret",                                                   :default => false
    t.boolean  "expectpersonality",                                              :default => false
    t.boolean  "expectAppearance",                                               :default => false
    t.boolean  "expectAtmosphere",                                               :default => false
    t.boolean  "expectBody",                                                     :default => false
    t.boolean  "expectSex",                                                      :default => false
    t.boolean  "expectInterest",                                                 :default => false
    t.boolean  "expectCircumstance",                                             :default => false
    t.boolean  "expectFinance",                                                  :default => false
    t.boolean  "expectDistance",                                                 :default => false
    t.boolean  "jobSecret",                                                      :default => false
    t.boolean  "jobStudent",                                                     :default => false
    t.boolean  "jobBetweenJobs",                                                 :default => false
    t.boolean  "jobOfficeWork",                                                  :default => false
    t.boolean  "jobServices",                                                    :default => false
    t.boolean  "jobManufacturing",                                               :default => false
    t.boolean  "jobComputer",                                                    :default => false
    t.boolean  "jobLanguage",                                                    :default => false
    t.boolean  "jobAssets",                                                      :default => false
    t.boolean  "jobLaw",                                                         :default => false
    t.boolean  "jobMedia",                                                       :default => false
    t.boolean  "jobPublishing",                                                  :default => false
    t.boolean  "jobDomestic",                                                    :default => false
    t.boolean  "jobMedicalProfession",                                           :default => false
    t.boolean  "jobHealth",                                                      :default => false
    t.boolean  "jobArchitecture",                                                :default => false
    t.boolean  "jobCreativeProfession",                                          :default => false
    t.boolean  "jobCooking",                                                     :default => false
    t.boolean  "jobVehicle",                                                     :default => false
    t.boolean  "jobTravel",                                                      :default => false
    t.boolean  "jobBeauty",                                                      :default => false
    t.boolean  "jobEntertainment",                                               :default => false
    t.boolean  "jobReligiousProfession",                                         :default => false
    t.boolean  "jobCeremonialOccasions",                                         :default => false
    t.boolean  "jobNature",                                                      :default => false
    t.boolean  "jobSports",                                                      :default => false
    t.boolean  "jobSexIndustry",                                                 :default => false
    t.boolean  "livingSecret",                                                   :default => false
    t.boolean  "livingAlone",                                                    :default => false
    t.boolean  "livingwithFamily",                                               :default => false
    t.boolean  "livingwithFriendsorLovers",                                      :default => false
    t.boolean  "lifePolicyVegetarian",                                           :default => false
    t.boolean  "lifePolicyNoSmoking",                                            :default => false
    t.boolean  "lifePolicyNoDrinking",                                           :default => false
    t.boolean  "lifePolicyNoGambling",                                           :default => false
    t.boolean  "lifePolicyNoSex",                                                :default => false
    t.boolean  "sexPositionSecret",                                              :default => false
    t.boolean  "sexPositionTop",                                                 :default => false
    t.boolean  "sexPositionBottom",                                              :default => false
    t.boolean  "sexPositionVersatile",                                           :default => false
    t.integer  "penisSize",                                                      :default => 0
    t.boolean  "penisThicknessSecret",                                           :default => false
    t.boolean  "penisThicknessSlender",                                          :default => false
    t.boolean  "penisThicknessAverage",                                          :default => false
    t.boolean  "penisThicknessPlump",                                            :default => false
    t.boolean  "penisThicknessExtraThick",                                       :default => false
    t.boolean  "phimosisSecret",                                                 :default => false
    t.boolean  "phimosisCut",                                                    :default => false
    t.boolean  "phimosisUncut",                                                  :default => false
    t.boolean  "phimosisOverhang",                                               :default => false
    t.boolean  "sadomasochismSecret",                                            :default => false
    t.boolean  "sadomasochismSadistic",                                          :default => false
    t.boolean  "sadomasochismMasochistic",                                       :default => false
    t.boolean  "sadomasochismBoth",                                              :default => false
    t.boolean  "sadomasochismNeither",                                           :default => false
    t.boolean  "fetishBDSM",                                                     :default => false
    t.boolean  "fetishBigCock",                                                  :default => false
    t.boolean  "fetishSmallCock",                                                :default => false
    t.boolean  "fetishUncut",                                                    :default => false
    t.boolean  "fetishSmellFetish",                                              :default => false
    t.boolean  "fetishUniformFetish",                                            :default => false
    t.boolean  "fetishRubber",                                                   :default => false
    t.boolean  "fetishDrag",                                                     :default => false
    t.boolean  "fetishFlasher",                                                  :default => false
    t.boolean  "fetishGangbang",                                                 :default => false
    t.boolean  "fetishHardcorePlay",                                             :default => false
    t.boolean  "fetishPhoneSex",                                                 :default => false
    t.boolean  "fetishTeenLover",                                                :default => false
    t.boolean  "fetishMatureLover",                                              :default => false
    t.boolean  "fetishChubbyLover",                                              :default => false
    t.integer  "ageLowerLimitPublish",                                           :default => 18
    t.integer  "ageUpperLimitPublish",                                           :default => 99
    t.boolean  "sexGayPublish",                                                  :default => false
    t.boolean  "sexBisexPublish",                                                :default => false
    t.boolean  "sexStraightPublish",                                             :default => false
    t.boolean  "raceAsianPublish",                                               :default => false
    t.boolean  "raceWhitePublish",                                               :default => false
    t.boolean  "raceBlackPublish",                                               :default => false
    t.boolean  "raceLatinPublish",                                               :default => false
    t.boolean  "raceArabPublish",                                                :default => false
    t.boolean  "racePolynesianPublish",                                          :default => false
    t.boolean  "raceMixPublish",                                                 :default => false
    t.boolean  "raceEtcPublish",                                                 :default => false
    t.decimal  "latitude",                        :precision => 12, :scale => 6
    t.decimal  "longitude",                       :precision => 12, :scale => 6
    t.boolean  "chatNotice",                                                     :default => false
    t.boolean  "friendRequestNotice",                                            :default => false
    t.boolean  "matchNotice",                                                    :default => false
    t.string   "picture1"
    t.string   "picture2"
    t.string   "picture3"
    t.string   "picture4"
    t.string   "picture5"
    t.boolean  "online",                                                         :default => false
    t.boolean  "freezeAccount",                                                  :default => false
    t.datetime "created_at",                                                                        :null => false
    t.datetime "updated_at",                                                                        :null => false
  end

end
