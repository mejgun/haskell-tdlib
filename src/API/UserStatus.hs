-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data UserStatus = 
 UserStatusEmpty 
 | UserStatusOnline { expires :: Int }  
 | UserStatusOffline { was_online :: Int }  
 | UserStatusRecently 
 | UserStatusLastWeek 
 | UserStatusLastMonth -- deriving (Show)

instance T.ToJSON UserStatus where
 toJSON (UserStatusEmpty {  }) =
  A.object [ "@type" A..= T.String "userStatusEmpty" ]

 toJSON (UserStatusOnline { expires = expires }) =
  A.object [ "@type" A..= T.String "userStatusOnline", "expires" A..= expires ]

 toJSON (UserStatusOffline { was_online = was_online }) =
  A.object [ "@type" A..= T.String "userStatusOffline", "was_online" A..= was_online ]

 toJSON (UserStatusRecently {  }) =
  A.object [ "@type" A..= T.String "userStatusRecently" ]

 toJSON (UserStatusLastWeek {  }) =
  A.object [ "@type" A..= T.String "userStatusLastWeek" ]

 toJSON (UserStatusLastMonth {  }) =
  A.object [ "@type" A..= T.String "userStatusLastMonth" ]
-- userStatusEmpty UserStatus 

-- userStatusOnline UserStatus  { expires :: Int } 

-- userStatusOffline UserStatus  { was_online :: Int } 

-- userStatusRecently UserStatus 

-- userStatusLastWeek UserStatus 

-- userStatusLastMonth UserStatus 

