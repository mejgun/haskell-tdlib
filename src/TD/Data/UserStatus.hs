{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.UserStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the last time the user was online
data UserStatus
  = -- | The user status was never changed
    UserStatusEmpty
  | -- | The user is online @expires Point in time (Unix timestamp) when the user's online status will expire
    UserStatusOnline
      { -- |
        expires :: Maybe Int
      }
  | -- | The user is offline @was_online Point in time (Unix timestamp) when the user was last online
    UserStatusOffline
      { -- |
        was_online :: Maybe Int
      }
  | -- | The user was online recently
    UserStatusRecently
  | -- | The user is offline, but was online last week
    UserStatusLastWeek
  | -- | The user is offline, but was online last month
    UserStatusLastMonth
  deriving (Eq)

instance Show UserStatus where
  show UserStatusEmpty =
    "UserStatusEmpty"
      ++ U.cc
        []
  show
    UserStatusOnline
      { expires = expires_
      } =
      "UserStatusOnline"
        ++ U.cc
          [ U.p "expires" expires_
          ]
  show
    UserStatusOffline
      { was_online = was_online_
      } =
      "UserStatusOffline"
        ++ U.cc
          [ U.p "was_online" was_online_
          ]
  show UserStatusRecently =
    "UserStatusRecently"
      ++ U.cc
        []
  show UserStatusLastWeek =
    "UserStatusLastWeek"
      ++ U.cc
        []
  show UserStatusLastMonth =
    "UserStatusLastMonth"
      ++ U.cc
        []

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
      parseUserStatusEmpty = A.withObject "UserStatusEmpty" $ \_ -> return UserStatusEmpty

      parseUserStatusOnline :: A.Value -> T.Parser UserStatus
      parseUserStatusOnline = A.withObject "UserStatusOnline" $ \o -> do
        expires_ <- mconcat [o A..:? "expires", U.rm <$> (o A..: "expires" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UserStatusOnline {expires = expires_}

      parseUserStatusOffline :: A.Value -> T.Parser UserStatus
      parseUserStatusOffline = A.withObject "UserStatusOffline" $ \o -> do
        was_online_ <- mconcat [o A..:? "was_online", U.rm <$> (o A..: "was_online" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ UserStatusOffline {was_online = was_online_}

      parseUserStatusRecently :: A.Value -> T.Parser UserStatus
      parseUserStatusRecently = A.withObject "UserStatusRecently" $ \_ -> return UserStatusRecently

      parseUserStatusLastWeek :: A.Value -> T.Parser UserStatus
      parseUserStatusLastWeek = A.withObject "UserStatusLastWeek" $ \_ -> return UserStatusLastWeek

      parseUserStatusLastMonth :: A.Value -> T.Parser UserStatus
      parseUserStatusLastMonth = A.withObject "UserStatusLastMonth" $ \_ -> return UserStatusLastMonth
  parseJSON _ = mempty

instance T.ToJSON UserStatus where
  toJSON UserStatusEmpty =
    A.object
      [ "@type" A..= T.String "userStatusEmpty"
      ]
  toJSON
    UserStatusOnline
      { expires = expires_
      } =
      A.object
        [ "@type" A..= T.String "userStatusOnline",
          "expires" A..= expires_
        ]
  toJSON
    UserStatusOffline
      { was_online = was_online_
      } =
      A.object
        [ "@type" A..= T.String "userStatusOffline",
          "was_online" A..= was_online_
        ]
  toJSON UserStatusRecently =
    A.object
      [ "@type" A..= T.String "userStatusRecently"
      ]
  toJSON UserStatusLastWeek =
    A.object
      [ "@type" A..= T.String "userStatusLastWeek"
      ]
  toJSON UserStatusLastMonth =
    A.object
      [ "@type" A..= T.String "userStatusLastMonth"
      ]
