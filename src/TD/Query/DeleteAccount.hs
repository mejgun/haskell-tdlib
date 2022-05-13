{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeleteAccount where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes the account of the current user, deleting all information associated with the user from the server. The phone number of the account can be used to create a new account. Can be called before authorization when the current authorization state is authorizationStateWaitPassword @reason The reason why the account was deleted; optional
data DeleteAccount = DeleteAccount
  { -- |
    reason :: Maybe String
  }
  deriving (Eq)

instance Show DeleteAccount where
  show
    DeleteAccount
      { reason = reason_
      } =
      "DeleteAccount"
        ++ U.cc
          [ U.p "reason" reason_
          ]

instance T.ToJSON DeleteAccount where
  toJSON
    DeleteAccount
      { reason = reason_
      } =
      A.object
        [ "@type" A..= T.String "deleteAccount",
          "reason" A..= reason_
        ]
