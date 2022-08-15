{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetUserSupportInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns support information for the given user; for Telegram support only @user_id User identifier
data GetUserSupportInfo = GetUserSupportInfo
  { -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetUserSupportInfo where
  show
    GetUserSupportInfo
      { user_id = user_id_
      } =
      "GetUserSupportInfo"
        ++ U.cc
          [ U.p "user_id" user_id_
          ]

instance T.ToJSON GetUserSupportInfo where
  toJSON
    GetUserSupportInfo
      { user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "getUserSupportInfo",
          "user_id" A..= user_id_
        ]
