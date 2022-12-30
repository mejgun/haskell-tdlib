{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AddContact where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Contact as Contact
import qualified Utils as U

-- |
-- Adds a user to the contact list or edits an existing contact by their user identifier
data AddContact = AddContact
  { -- | Pass true to share the current user's phone number with the new contact. A corresponding rule to userPrivacySettingShowPhoneNumber will be added if needed.
    -- Use the field userFullInfo.need_phone_number_privacy_exception to check whether the current user needs to be asked to share their phone number
    share_phone_number :: Maybe Bool,
    -- | The contact to add or edit; phone number may be empty and needs to be specified only if known, vCard is ignored
    contact :: Maybe Contact.Contact
  }
  deriving (Eq)

instance Show AddContact where
  show
    AddContact
      { share_phone_number = share_phone_number_,
        contact = contact_
      } =
      "AddContact"
        ++ U.cc
          [ U.p "share_phone_number" share_phone_number_,
            U.p "contact" contact_
          ]

instance T.ToJSON AddContact where
  toJSON
    AddContact
      { share_phone_number = share_phone_number_,
        contact = contact_
      } =
      A.object
        [ "@type" A..= T.String "addContact",
          "share_phone_number" A..= share_phone_number_,
          "contact" A..= contact_
        ]
