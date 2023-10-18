module TD.Query.AddContact
  (AddContact(..)
  , defaultAddContact
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Contact as Contact

-- | Adds a user to the contact list or edits an existing contact by their user identifier. Returns 'TD.Data.Ok.Ok'
data AddContact
  = AddContact
    { contact            :: Maybe Contact.Contact -- ^ The contact to add or edit; phone number may be empty and needs to be specified only if known, vCard is ignored
    , share_phone_number :: Maybe Bool            -- ^ Pass true to share the current user's phone number with the new contact. A corresponding rule to userPrivacySettingShowPhoneNumber will be added if needed. Use the field userFullInfo.need_phone_number_privacy_exception to check whether the current user needs to be asked to share their phone number
    }
  deriving (Eq, Show)

instance I.ShortShow AddContact where
  shortShow
    AddContact
      { contact            = contact_
      , share_phone_number = share_phone_number_
      }
        = "AddContact"
          ++ I.cc
          [ "contact"            `I.p` contact_
          , "share_phone_number" `I.p` share_phone_number_
          ]

instance AT.ToJSON AddContact where
  toJSON
    AddContact
      { contact            = contact_
      , share_phone_number = share_phone_number_
      }
        = A.object
          [ "@type"              A..= AT.String "addContact"
          , "contact"            A..= contact_
          , "share_phone_number" A..= share_phone_number_
          ]

defaultAddContact :: AddContact
defaultAddContact =
  AddContact
    { contact            = Nothing
    , share_phone_number = Nothing
    }

