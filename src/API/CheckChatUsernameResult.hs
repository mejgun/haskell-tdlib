-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CheckChatUsernameResult where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Represents result of checking whether a username can be set for a chat
data CheckChatUsernameResult = 
 -- |
 -- 
 -- The username can be set
 CheckChatUsernameResultOk |
 -- |
 -- 
 -- The username is invalid
 CheckChatUsernameResultUsernameInvalid |
 -- |
 -- 
 -- The username is occupied
 CheckChatUsernameResultUsernameOccupied |
 -- |
 -- 
 -- The user has too much chats with username, one of them should be made private first
 CheckChatUsernameResultPublicChatsTooMuch |
 -- |
 -- 
 -- The user can't be a member of a public supergroup
 CheckChatUsernameResultPublicGroupsUnavailable deriving (Show, Eq)

instance T.ToJSON CheckChatUsernameResult where
 toJSON (CheckChatUsernameResultOk {  }) =
  A.object [ "@type" A..= T.String "checkChatUsernameResultOk" ]

 toJSON (CheckChatUsernameResultUsernameInvalid {  }) =
  A.object [ "@type" A..= T.String "checkChatUsernameResultUsernameInvalid" ]

 toJSON (CheckChatUsernameResultUsernameOccupied {  }) =
  A.object [ "@type" A..= T.String "checkChatUsernameResultUsernameOccupied" ]

 toJSON (CheckChatUsernameResultPublicChatsTooMuch {  }) =
  A.object [ "@type" A..= T.String "checkChatUsernameResultPublicChatsTooMuch" ]

 toJSON (CheckChatUsernameResultPublicGroupsUnavailable {  }) =
  A.object [ "@type" A..= T.String "checkChatUsernameResultPublicGroupsUnavailable" ]

instance T.FromJSON CheckChatUsernameResult where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkChatUsernameResultOk" -> parseCheckChatUsernameResultOk v
   "checkChatUsernameResultUsernameInvalid" -> parseCheckChatUsernameResultUsernameInvalid v
   "checkChatUsernameResultUsernameOccupied" -> parseCheckChatUsernameResultUsernameOccupied v
   "checkChatUsernameResultPublicChatsTooMuch" -> parseCheckChatUsernameResultPublicChatsTooMuch v
   "checkChatUsernameResultPublicGroupsUnavailable" -> parseCheckChatUsernameResultPublicGroupsUnavailable v
   _ -> mempty
  where
   parseCheckChatUsernameResultOk :: A.Value -> T.Parser CheckChatUsernameResult
   parseCheckChatUsernameResultOk = A.withObject "CheckChatUsernameResultOk" $ \o -> do
    return $ CheckChatUsernameResultOk {  }

   parseCheckChatUsernameResultUsernameInvalid :: A.Value -> T.Parser CheckChatUsernameResult
   parseCheckChatUsernameResultUsernameInvalid = A.withObject "CheckChatUsernameResultUsernameInvalid" $ \o -> do
    return $ CheckChatUsernameResultUsernameInvalid {  }

   parseCheckChatUsernameResultUsernameOccupied :: A.Value -> T.Parser CheckChatUsernameResult
   parseCheckChatUsernameResultUsernameOccupied = A.withObject "CheckChatUsernameResultUsernameOccupied" $ \o -> do
    return $ CheckChatUsernameResultUsernameOccupied {  }

   parseCheckChatUsernameResultPublicChatsTooMuch :: A.Value -> T.Parser CheckChatUsernameResult
   parseCheckChatUsernameResultPublicChatsTooMuch = A.withObject "CheckChatUsernameResultPublicChatsTooMuch" $ \o -> do
    return $ CheckChatUsernameResultPublicChatsTooMuch {  }

   parseCheckChatUsernameResultPublicGroupsUnavailable :: A.Value -> T.Parser CheckChatUsernameResult
   parseCheckChatUsernameResultPublicGroupsUnavailable = A.withObject "CheckChatUsernameResultPublicGroupsUnavailable" $ \o -> do
    return $ CheckChatUsernameResultPublicGroupsUnavailable {  }