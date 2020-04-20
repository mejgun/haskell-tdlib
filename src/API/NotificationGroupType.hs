-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NotificationGroupType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data NotificationGroupType = 
 NotificationGroupTypeMessages 
 | NotificationGroupTypeMentions 
 | NotificationGroupTypeSecretChat 
 | NotificationGroupTypeCalls -- deriving (Show)

instance T.ToJSON NotificationGroupType where
 toJSON (NotificationGroupTypeMessages {  }) =
  A.object [ "@type" A..= T.String "notificationGroupTypeMessages" ]

 toJSON (NotificationGroupTypeMentions {  }) =
  A.object [ "@type" A..= T.String "notificationGroupTypeMentions" ]

 toJSON (NotificationGroupTypeSecretChat {  }) =
  A.object [ "@type" A..= T.String "notificationGroupTypeSecretChat" ]

 toJSON (NotificationGroupTypeCalls {  }) =
  A.object [ "@type" A..= T.String "notificationGroupTypeCalls" ]
-- notificationGroupTypeMessages NotificationGroupType 

-- notificationGroupTypeMentions NotificationGroupType 

-- notificationGroupTypeSecretChat NotificationGroupType 

-- notificationGroupTypeCalls NotificationGroupType 

