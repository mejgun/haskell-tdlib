{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetLoginEmailAddress where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the login email address of the user. The change will not be applied until the new login email address is confirmed with `checkLoginEmailAddressCode`. To use Apple ID/Google ID instead of a email address, call `checkLoginEmailAddressCode` directly @new_login_email_address New login email address
data SetLoginEmailAddress = SetLoginEmailAddress
  { -- |
    new_login_email_address :: Maybe String
  }
  deriving (Eq)

instance Show SetLoginEmailAddress where
  show
    SetLoginEmailAddress
      { new_login_email_address = new_login_email_address_
      } =
      "SetLoginEmailAddress"
        ++ U.cc
          [ U.p "new_login_email_address" new_login_email_address_
          ]

instance T.ToJSON SetLoginEmailAddress where
  toJSON
    SetLoginEmailAddress
      { new_login_email_address = new_login_email_address_
      } =
      A.object
        [ "@type" A..= T.String "setLoginEmailAddress",
          "new_login_email_address" A..= new_login_email_address_
        ]
