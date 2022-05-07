{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Users where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data Users = -- | Represents a list of users @total_count Approximate total number of users found @user_ids A list of user identifiers
  Users
  { -- |
    user_ids :: Maybe [Int],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show Users where
  show
    Users
      { user_ids = user_ids,
        total_count = total_count
      } =
      "Users"
        ++ U.cc
          [ U.p "user_ids" user_ids,
            U.p "total_count" total_count
          ]

instance T.FromJSON Users where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "users" -> parseUsers v
      _ -> fail ""
    where
      parseUsers :: A.Value -> T.Parser Users
      parseUsers = A.withObject "Users" $ \o -> do
        user_ids_ <- o A..:? "user_ids"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ Users {user_ids = user_ids_, total_count = total_count_}
  parseJSON _ = fail ""

instance T.ToJSON Users where
  toJSON
    Users
      { user_ids = user_ids,
        total_count = total_count
      } =
      A.object
        [ "@type" A..= T.String "users",
          "user_ids" A..= user_ids,
          "total_count" A..= total_count
        ]
