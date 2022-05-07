{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SharePhoneNumber where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Shares the phone number of the current user with a mutual contact. Supposed to be called when the user clicks on chatActionBarSharePhoneNumber @user_id Identifier of the user with whom to share the phone number. The user must be a mutual contact
data SharePhoneNumber = SharePhoneNumber
  { -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show SharePhoneNumber where
  show
    SharePhoneNumber
      { user_id = user_id
      } =
      "SharePhoneNumber"
        ++ U.cc
          [ U.p "user_id" user_id
          ]

instance T.ToJSON SharePhoneNumber where
  toJSON
    SharePhoneNumber
      { user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "sharePhoneNumber",
          "user_id" A..= user_id
        ]
