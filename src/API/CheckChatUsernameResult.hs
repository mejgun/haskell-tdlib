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
 | CheckChatUsernameResultPublicGroupsUnavailable -- deriving (Show)

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
-- checkChatUsernameResultOk CheckChatUsernameResult 

-- checkChatUsernameResultUsernameInvalid CheckChatUsernameResult 

-- checkChatUsernameResultUsernameOccupied CheckChatUsernameResult 

-- checkChatUsernameResultPublicChatsTooMuch CheckChatUsernameResult 

-- checkChatUsernameResultPublicGroupsUnavailable CheckChatUsernameResult 

