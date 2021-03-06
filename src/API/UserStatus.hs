-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserStatus where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes the last time the user was online
data UserStatus = 
 -- |
 -- 
 -- The user status was never changed
 UserStatusEmpty |
 -- |
 -- 
 -- The user is online 
 -- 
 -- __expires__ Point in time (Unix timestamp) when the user's online status will expire
 UserStatusOnline { expires :: Maybe Int }  |
 -- |
 -- 
 -- The user is offline 
 -- 
 -- __was_online__ Point in time (Unix timestamp) when the user was last online
 UserStatusOffline { was_online :: Maybe Int }  |
 -- |
 -- 
 -- The user was online recently
 UserStatusRecently |
 -- |
 -- 
 -- The user is offline, but was online last week
 UserStatusLastWeek |
 -- |
 -- 
 -- The user is offline, but was online last month
 UserStatusLastMonth deriving (Show, Eq)

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
   _ -> mempty
  where
   parseUserStatusEmpty :: A.Value -> T.Parser UserStatus
   parseUserStatusEmpty = A.withObject "UserStatusEmpty" $ \o -> do
    return $ UserStatusEmpty {  }

   parseUserStatusOnline :: A.Value -> T.Parser UserStatus
   parseUserStatusOnline = A.withObject "UserStatusOnline" $ \o -> do
    expires <- mconcat [ o A..:? "expires", readMaybe <$> (o A..: "expires" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UserStatusOnline { expires = expires }

   parseUserStatusOffline :: A.Value -> T.Parser UserStatus
   parseUserStatusOffline = A.withObject "UserStatusOffline" $ \o -> do
    was_online <- mconcat [ o A..:? "was_online", readMaybe <$> (o A..: "was_online" :: T.Parser String)] :: T.Parser (Maybe Int)
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