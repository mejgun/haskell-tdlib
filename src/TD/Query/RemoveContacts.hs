{-# LANGUAGE OverloadedStrings #-}

module TD.Query.RemoveContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Removes users from the contact list @user_ids Identifiers of users to be deleted
data RemoveContacts = RemoveContacts
  { -- |
    user_ids :: Maybe [Int]
  }
  deriving (Eq)

instance Show RemoveContacts where
  show
    RemoveContacts
      { user_ids = user_ids
      } =
      "RemoveContacts"
        ++ U.cc
          [ U.p "user_ids" user_ids
          ]

instance T.ToJSON RemoveContacts where
  toJSON
    RemoveContacts
      { user_ids = user_ids
      } =
      A.object
        [ "@type" A..= T.String "removeContacts",
          "user_ids" A..= user_ids
        ]
