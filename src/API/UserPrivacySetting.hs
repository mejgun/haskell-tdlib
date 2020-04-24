-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserPrivacySetting where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data UserPrivacySetting = 
 UserPrivacySettingShowStatus 
 | UserPrivacySettingShowProfilePhoto 
 | UserPrivacySettingShowLinkInForwardedMessages 
 | UserPrivacySettingShowPhoneNumber 
 | UserPrivacySettingAllowChatInvites 
 | UserPrivacySettingAllowCalls 
 | UserPrivacySettingAllowPeerToPeerCalls 
 | UserPrivacySettingAllowFindingByPhoneNumber deriving (Show, Eq)

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

instance T.FromJSON UserPrivacySetting where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "userPrivacySettingShowStatus" -> parseUserPrivacySettingShowStatus v
   "userPrivacySettingShowProfilePhoto" -> parseUserPrivacySettingShowProfilePhoto v
   "userPrivacySettingShowLinkInForwardedMessages" -> parseUserPrivacySettingShowLinkInForwardedMessages v
   "userPrivacySettingShowPhoneNumber" -> parseUserPrivacySettingShowPhoneNumber v
   "userPrivacySettingAllowChatInvites" -> parseUserPrivacySettingAllowChatInvites v
   "userPrivacySettingAllowCalls" -> parseUserPrivacySettingAllowCalls v
   "userPrivacySettingAllowPeerToPeerCalls" -> parseUserPrivacySettingAllowPeerToPeerCalls v
   "userPrivacySettingAllowFindingByPhoneNumber" -> parseUserPrivacySettingAllowFindingByPhoneNumber v
   _ -> mempty
  where
   parseUserPrivacySettingShowStatus :: A.Value -> T.Parser UserPrivacySetting
   parseUserPrivacySettingShowStatus = A.withObject "UserPrivacySettingShowStatus" $ \o -> do
    return $ UserPrivacySettingShowStatus {  }

   parseUserPrivacySettingShowProfilePhoto :: A.Value -> T.Parser UserPrivacySetting
   parseUserPrivacySettingShowProfilePhoto = A.withObject "UserPrivacySettingShowProfilePhoto" $ \o -> do
    return $ UserPrivacySettingShowProfilePhoto {  }

   parseUserPrivacySettingShowLinkInForwardedMessages :: A.Value -> T.Parser UserPrivacySetting
   parseUserPrivacySettingShowLinkInForwardedMessages = A.withObject "UserPrivacySettingShowLinkInForwardedMessages" $ \o -> do
    return $ UserPrivacySettingShowLinkInForwardedMessages {  }

   parseUserPrivacySettingShowPhoneNumber :: A.Value -> T.Parser UserPrivacySetting
   parseUserPrivacySettingShowPhoneNumber = A.withObject "UserPrivacySettingShowPhoneNumber" $ \o -> do
    return $ UserPrivacySettingShowPhoneNumber {  }

   parseUserPrivacySettingAllowChatInvites :: A.Value -> T.Parser UserPrivacySetting
   parseUserPrivacySettingAllowChatInvites = A.withObject "UserPrivacySettingAllowChatInvites" $ \o -> do
    return $ UserPrivacySettingAllowChatInvites {  }

   parseUserPrivacySettingAllowCalls :: A.Value -> T.Parser UserPrivacySetting
   parseUserPrivacySettingAllowCalls = A.withObject "UserPrivacySettingAllowCalls" $ \o -> do
    return $ UserPrivacySettingAllowCalls {  }

   parseUserPrivacySettingAllowPeerToPeerCalls :: A.Value -> T.Parser UserPrivacySetting
   parseUserPrivacySettingAllowPeerToPeerCalls = A.withObject "UserPrivacySettingAllowPeerToPeerCalls" $ \o -> do
    return $ UserPrivacySettingAllowPeerToPeerCalls {  }

   parseUserPrivacySettingAllowFindingByPhoneNumber :: A.Value -> T.Parser UserPrivacySetting
   parseUserPrivacySettingAllowFindingByPhoneNumber = A.withObject "UserPrivacySettingAllowFindingByPhoneNumber" $ \o -> do
    return $ UserPrivacySettingAllowFindingByPhoneNumber {  }