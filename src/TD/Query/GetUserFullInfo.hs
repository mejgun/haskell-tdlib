{-# LANGUAGE OverloadedStrings #-}

-- |
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
      { user_id = user_id_
      } =
      "GetUserFullInfo"
        ++ U.cc
          [ U.p "user_id" user_id_
          ]

instance T.ToJSON GetUserFullInfo where
  toJSON
    GetUserFullInfo
      { user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "getUserFullInfo",
          "user_id" A..= user_id_
        ]
