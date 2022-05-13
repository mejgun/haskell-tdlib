{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetUser where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a user by their identifier. This is an offline request if the current user is not a bot @user_id User identifier
data GetUser = GetUser
  { -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetUser where
  show
    GetUser
      { user_id = user_id_
      } =
      "GetUser"
        ++ U.cc
          [ U.p "user_id" user_id_
          ]

instance T.ToJSON GetUser where
  toJSON
    GetUser
      { user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "getUser",
          "user_id" A..= user_id_
        ]
