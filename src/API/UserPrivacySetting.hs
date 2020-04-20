-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserPrivacySetting where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data UserPrivacySetting = 
 UserPrivacySettingShowStatus 
 | UserPrivacySettingShowProfilePhoto 
 | UserPrivacySettingShowLinkInForwardedMessages 
 | UserPrivacySettingShowPhoneNumber 
 | UserPrivacySettingAllowChatInvites 
 | UserPrivacySettingAllowCalls 
 | UserPrivacySettingAllowPeerToPeerCalls 
 | UserPrivacySettingAllowFindingByPhoneNumber -- deriving (Show)

instance T.ToJSON UserPrivacySetting where
 toJSON (UserPrivacySettingShowStatus {  }) =
  A.object [ "@type" A..= T.String "userPrivacySettingShowStatus" ]

 toJSON (UserPrivacySettingShowProfilePhoto {  }) =
  A.object [ "@type" A..= T.String "userPrivacySettingShowProfilePhoto" ]

 toJSON (UserPrivacySettingShowLinkInForwardedMessages {  }) =
  A.object [ "@type" A..= T.String "userPrivacySettingShowLinkInForwardedMessages" ]

 toJSON (UserPrivacySettingShowPhoneNumber {  }) =
  A.object [ "@type" A..= T.String "userPrivacySettingShowPhoneNumber" ]

 toJSON (UserPrivacySettingAllowChatInvites {  }) =
  A.object [ "@type" A..= T.String "userPrivacySettingAllowChatInvites" ]

 toJSON (UserPrivacySettingAllowCalls {  }) =
  A.object [ "@type" A..= T.String "userPrivacySettingAllowCalls" ]

 toJSON (UserPrivacySettingAllowPeerToPeerCalls {  }) =
  A.object [ "@type" A..= T.String "userPrivacySettingAllowPeerToPeerCalls" ]

 toJSON (UserPrivacySettingAllowFindingByPhoneNumber {  }) =
  A.object [ "@type" A..= T.String "userPrivacySettingAllowFindingByPhoneNumber" ]
-- userPrivacySettingShowStatus UserPrivacySetting 

-- userPrivacySettingShowProfilePhoto UserPrivacySetting 

-- userPrivacySettingShowLinkInForwardedMessages UserPrivacySetting 

-- userPrivacySettingShowPhoneNumber UserPrivacySetting 

-- userPrivacySettingAllowChatInvites UserPrivacySetting 

-- userPrivacySettingAllowCalls UserPrivacySetting 

-- userPrivacySettingAllowPeerToPeerCalls UserPrivacySetting 

-- userPrivacySettingAllowFindingByPhoneNumber UserPrivacySetting 

