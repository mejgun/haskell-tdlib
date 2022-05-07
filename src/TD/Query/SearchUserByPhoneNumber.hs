{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchUserByPhoneNumber where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches a user by their phone number. Returns a 404 error if the user can't be found @phone_number Phone number to search for
data SearchUserByPhoneNumber = SearchUserByPhoneNumber
  { -- |
    phone_number :: Maybe String
  }
  deriving (Eq)

instance Show SearchUserByPhoneNumber where
  show
    SearchUserByPhoneNumber
      { phone_number = phone_number
      } =
      "SearchUserByPhoneNumber"
        ++ U.cc
          [ U.p "phone_number" phone_number
          ]

instance T.ToJSON SearchUserByPhoneNumber where
  toJSON
    SearchUserByPhoneNumber
      { phone_number = phone_number
      } =
      A.object
        [ "@type" A..= T.String "searchUserByPhoneNumber",
          "phone_number" A..= phone_number
        ]
