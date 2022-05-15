{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Users where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
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
      { user_ids = user_ids_,
        total_count = total_count_
      } =
      "Users"
        ++ U.cc
          [ U.p "user_ids" user_ids_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON Users where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "users" -> parseUsers v
      _ -> mempty
    where
      parseUsers :: A.Value -> T.Parser Users
      parseUsers = A.withObject "Users" $ \o -> do
        user_ids_ <- o A..:? "user_ids"
        total_count_ <- o A..:? "total_count"
        return $ Users {user_ids = user_ids_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON Users where
  toJSON
    Users
      { user_ids = user_ids_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "users",
          "user_ids" A..= user_ids_,
          "total_count" A..= total_count_
        ]
