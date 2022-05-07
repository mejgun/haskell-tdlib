{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetUserFullInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns full information about a user by their identifier @user_id User identifier
data GetUserFullInfo = GetUserFullInfo
  { -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetUserFullInfo where
  show
    GetUserFullInfo
      { user_id = user_id
      } =
      "GetUserFullInfo"
        ++ U.cc
          [ U.p "user_id" user_id
          ]

instance T.ToJSON GetUserFullInfo where
  toJSON
    GetUserFullInfo
      { user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "getUserFullInfo",
          "user_id" A..= user_id
        ]
