module TD.Query.AddContact
  (AddContact(..)
  , defaultAddContact
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ImportedContact as ImportedContact

-- | Adds a user to the contact list or edits an existing contact by their user identifier. Returns 'TD.Data.Ok.Ok'
data AddContact
  = AddContact
    { user_id            :: Maybe Int                             -- ^ Identifier of the user
    , contact            :: Maybe ImportedContact.ImportedContact -- ^ The contact to add or edit; phone number may be empty and needs to be specified only if known
    , share_phone_number :: Maybe Bool                            -- ^ Pass true to share the current user's phone number with the new contact. A corresponding rule to userPrivacySettingShowPhoneNumber will be added if needed. Use the field userFullInfo.need_phone_number_privacy_exception to check whether the current user needs to be asked to share their phone number
    }
  deriving (Eq, Show)

instance I.ShortShow AddContact where
  shortShow
    AddContact
      { user_id            = user_id_
      , contact            = contact_
      , share_phone_number = share_phone_number_
      }
        = "AddContact"
          ++ I.cc
          [ "user_id"            `I.p` user_id_
          , "contact"            `I.p` contact_
          , "share_phone_number" `I.p` share_phone_number_
          ]

instance AT.ToJSON AddContact where
  toJSON
    AddContact
      { user_id            = user_id_
      , contact            = contact_
      , share_phone_number = share_phone_number_
      }
        = A.object
          [ "@type"              A..= AT.String "addContact"
          , "user_id"            A..= user_id_
          , "contact"            A..= contact_
          , "share_phone_number" A..= share_phone_number_
          ]

defaultAddContact :: AddContact
defaultAddContact =
  AddContact
    { user_id            = Nothing
    , contact            = Nothing
    , share_phone_number = Nothing
    }

