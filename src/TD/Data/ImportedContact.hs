module TD.Data.ImportedContact
  ( ImportedContact(..)    
  , defaultImportedContact 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.FormattedText as FormattedText

data ImportedContact
  = ImportedContact -- ^ Describes a contact to import
    { phone_number :: Maybe T.Text                      -- ^ Phone number of the user
    , first_name   :: Maybe T.Text                      -- ^ First name of the user; 1-64 characters
    , last_name    :: Maybe T.Text                      -- ^ Last name of the user; 0-64 characters
    , note         :: Maybe FormattedText.FormattedText -- ^ Note to add about the user; 0-getOption("user_note_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, and CustomEmoji entities are allowed; pass null to keep the current user's note
    }
  deriving (Eq, Show)

instance I.ShortShow ImportedContact where
  shortShow ImportedContact
    { phone_number = phone_number_
    , first_name   = first_name_
    , last_name    = last_name_
    , note         = note_
    }
      = "ImportedContact"
        ++ I.cc
        [ "phone_number" `I.p` phone_number_
        , "first_name"   `I.p` first_name_
        , "last_name"    `I.p` last_name_
        , "note"         `I.p` note_
        ]

instance AT.FromJSON ImportedContact where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "importedContact" -> parseImportedContact v
      _                 -> mempty
    
    where
      parseImportedContact :: A.Value -> AT.Parser ImportedContact
      parseImportedContact = A.withObject "ImportedContact" $ \o -> do
        phone_number_ <- o A..:?  "phone_number"
        first_name_   <- o A..:?  "first_name"
        last_name_    <- o A..:?  "last_name"
        note_         <- o A..:?  "note"
        pure $ ImportedContact
          { phone_number = phone_number_
          , first_name   = first_name_
          , last_name    = last_name_
          , note         = note_
          }
  parseJSON _ = mempty

instance AT.ToJSON ImportedContact where
  toJSON ImportedContact
    { phone_number = phone_number_
    , first_name   = first_name_
    , last_name    = last_name_
    , note         = note_
    }
      = A.object
        [ "@type"        A..= AT.String "importedContact"
        , "phone_number" A..= phone_number_
        , "first_name"   A..= first_name_
        , "last_name"    A..= last_name_
        , "note"         A..= note_
        ]

defaultImportedContact :: ImportedContact
defaultImportedContact =
  ImportedContact
    { phone_number = Nothing
    , first_name   = Nothing
    , last_name    = Nothing
    , note         = Nothing
    }

