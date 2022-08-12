{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeleteAccount where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes the account of the current user, deleting all information associated with the user from the server. The phone number of the account can be used to create a new account. Can be called before authorization when the current authorization state is authorizationStateWaitPassword @reason The reason why the account was deleted; optional @password The 2-step verification password of the current user. If not specified, account deletion can be canceled within one week
data DeleteAccount = DeleteAccount
  { -- |
    password :: Maybe String,
    -- |
    reason :: Maybe String
  }
  deriving (Eq)

instance Show DeleteAccount where
  show
    DeleteAccount
      { password = password_,
        reason = reason_
      } =
      "DeleteAccount"
        ++ U.cc
          [ U.p "password" password_,
            U.p "reason" reason_
          ]

instance T.ToJSON DeleteAccount where
  toJSON
    DeleteAccount
      { password = password_,
        reason = reason_
      } =
      A.object
        [ "@type" A..= T.String "deleteAccount",
          "password" A..= password_,
          "reason" A..= reason_
        ]
