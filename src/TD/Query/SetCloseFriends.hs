{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetCloseFriends where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the list of close friends of the current user @user_ids User identifiers of close friends; the users must be contacts of the current user
data SetCloseFriends = SetCloseFriends
  { -- |
    user_ids :: Maybe [Int]
  }
  deriving (Eq)

instance Show SetCloseFriends where
  show
    SetCloseFriends
      { user_ids = user_ids_
      } =
      "SetCloseFriends"
        ++ U.cc
          [ U.p "user_ids" user_ids_
          ]

instance T.ToJSON SetCloseFriends where
  toJSON
    SetCloseFriends
      { user_ids = user_ids_
      } =
      A.object
        [ "@type" A..= T.String "setCloseFriends",
          "user_ids" A..= user_ids_
        ]
