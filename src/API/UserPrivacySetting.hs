-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserPrivacySetting where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Describes available user privacy settings
data UserPrivacySetting = 
 -- |
 -- 
 -- A privacy setting for managing whether the user's online status is visible
 UserPrivacySettingShowStatus |
 -- |
 -- 
 -- A privacy setting for managing whether the user's profile photo is visible
 UserPrivacySettingShowProfilePhoto |
 -- |
 -- 
 -- A privacy setting for managing whether a link to the user's account is included in forwarded messages
 UserPrivacySettingShowLinkInForwardedMessages |
 -- |
 -- 
 -- A privacy setting for managing whether the user's phone number is visible
 UserPrivacySettingShowPhoneNumber |
 -- |
 -- 
 -- A privacy setting for managing whether the user can be invited to chats
 UserPrivacySettingAllowChatInvites |
 -- |
 -- 
 -- A privacy setting for managing whether the user can be called
 UserPrivacySettingAllowCalls |
 -- |
 -- 
 -- A privacy setting for managing whether peer-to-peer connections can be used for calls
 UserPrivacySettingAllowPeerToPeerCalls |
 -- |
 -- 
 -- A privacy setting for managing whether the user can be found by their phone number. Checked only if the phone number is not known to the other user. Can be set only to "Allow contacts" or "Allow all"
 UserPrivacySettingAllowFindingByPhoneNumber deriving (Eq)

instance Show UserPrivacySetting where
 show UserPrivacySettingShowStatus {  } =
  "UserPrivacySettingShowStatus" ++ U.cc [ ]

 show UserPrivacySettingShowProfilePhoto {  } =
  "UserPrivacySettingShowProfilePhoto" ++ U.cc [ ]

 show UserPrivacySettingShowLinkInForwardedMessages {  } =
  "UserPrivacySettingShowLinkInForwardedMessages" ++ U.cc [ ]

 show UserPrivacySettingShowPhoneNumber {  } =
  "UserPrivacySettingShowPhoneNumber" ++ U.cc [ ]

 show UserPrivacySettingAllowChatInvites {  } =
  "UserPrivacySettingAllowChatInvites" ++ U.cc [ ]

 show UserPrivacySettingAllowCalls {  } =
  "UserPrivacySettingAllowCalls" ++ U.cc [ ]

 show UserPrivacySettingAllowPeerToPeerCalls {  } =
  "UserPrivacySettingAllowPeerToPeerCalls" ++ U.cc [ ]

 show UserPrivacySettingAllowFindingByPhoneNumber {  } =
  "UserPrivacySettingAllowFindingByPhoneNumber" ++ U.cc [ ]

instance T.ToJSON UserPrivacySetting where
 toJSON UserPrivacySettingShowStatus {  } =
  A.object [ "@type" A..= T.String "userPrivacySettingShowStatus" ]

 toJSON UserPrivacySettingShowProfilePhoto {  } =
  A.object [ "@type" A..= T.String "userPrivacySettingShowProfilePhoto" ]

 toJSON UserPrivacySettingShowLinkInForwardedMessages {  } =
  A.object [ "@type" A..= T.String "userPrivacySettingShowLinkInForwardedMessages" ]

 toJSON UserPrivacySettingShowPhoneNumber {  } =
  A.object [ "@type" A..= T.String "userPrivacySettingShowPhoneNumber" ]

 toJSON UserPrivacySettingAllowChatInvites {  } =
  A.object [ "@type" A..= T.String "userPrivacySettingAllowChatInvites" ]

 toJSON UserPrivacySettingAllowCalls {  } =
  A.object [ "@type" A..= T.String "userPrivacySettingAllowCalls" ]

 toJSON UserPrivacySettingAllowPeerToPeerCalls {  } =
  A.object [ "@type" A..= T.String "userPrivacySettingAllowPeerToPeerCalls" ]

 toJSON UserPrivacySettingAllowFindingByPhoneNumber {  } =
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
 parseJSON _ = mempty
