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



instance T.FromJSON UserStatus where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "userStatusEmpty" -> parseUserStatusEmpty v
   "userStatusOnline" -> parseUserStatusOnline v
   "userStatusOffline" -> parseUserStatusOffline v
   "userStatusRecently" -> parseUserStatusRecently v
   "userStatusLastWeek" -> parseUserStatusLastWeek v
   "userStatusLastMonth" -> parseUserStatusLastMonth v
  where
   parseUserStatusEmpty :: A.Value -> T.Parser UserStatus
   parseUserStatusEmpty = A.withObject "UserStatusEmpty" $ \o -> do
    return $ UserStatusEmpty {  }

   parseUserStatusOnline :: A.Value -> T.Parser UserStatus
   parseUserStatusOnline = A.withObject "UserStatusOnline" $ \o -> do
    expires <- o A..: "expires"
    return $ UserStatusOnline { expires = expires }

   parseUserStatusOffline :: A.Value -> T.Parser UserStatus
   parseUserStatusOffline = A.withObject "UserStatusOffline" $ \o -> do
    was_online <- o A..: "was_online"
    return $ UserStatusOffline { was_online = was_online }

   parseUserStatusRecently :: A.Value -> T.Parser UserStatus
   parseUserStatusRecently = A.withObject "UserStatusRecently" $ \o -> do
    return $ UserStatusRecently {  }

   parseUserStatusLastWeek :: A.Value -> T.Parser UserStatus
   parseUserStatusLastWeek = A.withObject "UserStatusLastWeek" $ \o -> do
    return $ UserStatusLastWeek {  }

   parseUserStatusLastMonth :: A.Value -> T.Parser UserStatus
   parseUserStatusLastMonth = A.withObject "UserStatusLastMonth" $ \o -> do
    return $ UserStatusLastMonth {  }