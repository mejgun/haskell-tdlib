-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CheckChatUsernameResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CheckChatUsernameResult = 
 CheckChatUsernameResultOk 
 | CheckChatUsernameResultUsernameInvalid 
 | CheckChatUsernameResultUsernameOccupied 
 | CheckChatUsernameResultPublicChatsTooMuch 
 | CheckChatUsernameResultPublicGroupsUnavailable deriving (Show)

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

   _ -> mempty ""
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