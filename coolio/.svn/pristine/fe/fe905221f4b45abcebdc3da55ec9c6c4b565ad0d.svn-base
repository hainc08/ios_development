Coolio::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  match '/getUser', :controller => 'ProfileService', :action => 'getUser'
  match '/getMyInfo', :controller => 'CoolioService', :action => 'getMyInfo'
  match '/getMasterPassword', :controller => 'CoolioService', :action => 'getMasterPassword'
  match '/getUserOne', :controller => 'CoolioService', :action => 'getUserOne'

  match '/getMyUnreadCount', :controller => 'CoolioService', :action => 'getMyUnreadCount'

  match '/getFriend', :controller => 'FriendService', :action => 'getFriend'
  match '/getFriendRequest', :controller => 'FriendService', :action => 'getFriendRequest'
  match '/getSilentMatch', :controller => 'SilentMatchService', :action => 'getSilentMatch'
  match '/getMatch', :controller => 'SilentMatchService', :action => 'getMatch'
  match '/getHistory', :controller => 'HistoryService', :action => 'getHistory'
  match '/getFootPrint', :controller => 'FootPrintService', :action => 'getFootPrint'
  match '/getBlocks', :controller => 'BlockService', :action => 'getBlocks'

  match '/setDevice', :controller => 'ProfileService', :action => 'setDevice'
  match '/setProfile', :controller => 'ProfileService', :action => 'setProfile'

  match '/setProfileImage1', :controller => 'ProfileService', :action => 'setProfileImage1'
  match '/setProfileImage2', :controller => 'ProfileService', :action => 'setProfileImage2'
  match '/setProfileImage3', :controller => 'ProfileService', :action => 'setProfileImage3'
  match '/setProfileImage4', :controller => 'ProfileService', :action => 'setProfileImage4'
  match '/setProfileImage5', :controller => 'ProfileService', :action => 'setProfileImage5'
  match '/setLocation', :controller => 'ProfileService', :action => 'setLocation'

  match '/setFriendRequest', :controller => 'FriendService', :action => 'setFriendRequest'
  match '/setSilentMatchRequest', :controller => 'SilentMatchService', :action => 'setSilentMatchRequest'
  match '/removeFriend', :controller => 'FriendService', :action => 'removeFriendRequest'
  match '/removeSilentMatch', :controller => 'SilentMatchService', :action => 'removeSilentMatchRequest'

  match '/setHistory', :controller => 'HistoryService', :action => 'setHistory'
  match '/setFootPrint', :controller => 'FootPrintService', :action => 'setFootPrint'
  match '/setBlock', :controller => 'BlockService', :action => 'setBlock'
  match '/setBlockOff', :controller => 'BlockService', :action => 'setBlockOff'

  match '/setReport', :controller => 'ReportService', :action => 'setReport'
  match '/getState', :controller => 'CoolioService', :action => 'getState'




  match '/getChatUnreadCount', :controller => 'ChatService', :action => 'getChatUnreadCount'
  match '/getChatMessage', :controller => 'ChatService', :action => 'getChatList'
  match '/getChatMessages', :controller => 'ChatService', :action => 'getChatListDetail'
  match '/setChatMessage', :controller => 'ChatService', :action => 'setChatMessage'

  match '/doBlackListCheck', :controller => 'CoolioService', :action => 'doBlackListCheck'      
  match '/doNewAccountCheck', :controller => 'CoolioService', :action => 'doNewAccountCheck'      
  match '/doLogin', :controller => 'CoolioService', :action => 'doLogin'
  match '/doLogout', :controller => 'CoolioService', :action => 'doLogout'
  match '/doOnline', :controller => 'CoolioService', :action => 'doOnline'
  match '/doOffline', :controller => 'CoolioService', :action => 'doOffline'

  match '/doFriend', :controller => 'FriendService', :action => 'doFriend'
  match '/doSilentMatch', :controller => 'SilentMatchService', :action => 'doSilentMatch'
  match '/doBlock', :controller => 'BlockService', :action => 'doBlock'


  match '/getAlert', :controller => 'AlertService', :action => 'getAlert'
  match '/getInfo', :controller => 'InfoService', :action => 'getInfo'

  match '/sendRegistEmail', :controller => 'Mailer', :action => 'sendRegistEmail'
  match '/sendMailForgotPass', :controller => 'Mailer', :action => 'sendMailForgotPass'
  match '/doUnSubscribe', :controller => 'CoolioService', :action => 'doUnSubscribe'

  match '/doNoticeCountReset', :controller => 'CoolioService', :action => 'doNoticeCountReset'
  match '/doChatCountReset', :controller => 'CoolioService', :action => 'doChatCountReset'

  #match '/hello', :controller => 'CoolioService', :action => 'Hello'

  # Coolio Manager route
  match '/userReload', :controller => 'CoolioManager', :action => 'getUsers'
  match '/userDetailReload', :controller => 'CoolioManager', :action => 'getUserDetail'
  match '/userEnabled', :controller => 'CoolioManager', :action => 'userEnabled'
  match '/userDisabled', :controller => 'CoolioManager', :action => 'userDisabled'

  match '/chatReload', :controller => 'CoolioManager', :action => 'getChatMessages'
  match '/chatAllReload', :controller => 'CoolioManager', :action => 'getChatAllMessages'
  match '/chatDelete', :controller => 'CoolioManager', :action => 'doChatDelMessage'

  match '/reportReload', :controller => 'CoolioManager', :action => 'getReportAll'
  match '/reportDetailReload', :controller => 'CoolioManager', :action => 'getReportDetail'

  match '/alertReload', :controller => 'CoolioManager', :action => 'getAlertAll'
  match '/alertDetailReload', :controller => 'CoolioManager', :action => 'getAlertDetail'
  match '/alertSend', :controller => 'CoolioManager', :action => 'doAlertSend'

  match '/blackListReload', :controller => 'CoolioManager', :action => 'getBlackListAll'
  match '/blackListAdd', :controller => 'CoolioManager', :action => 'doBlackListAdd'
  match '/blackListDel', :controller => 'CoolioManager', :action => 'doBlackListDelete'

  match '/infoReload', :controller => 'CoolioManager', :action => 'getInfoAll'
  match '/infoAdd', :controller => 'CoolioManager', :action => 'doInfoAdd'
  match '/infoDel', :controller => 'CoolioManager', :action => 'doInfoDelete'

end
