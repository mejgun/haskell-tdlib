module TD.Data.Contact
  ( Contact(..)    
  , defaultContact 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data Contact
  = Contact -- ^ Describes a user contact
    { phone_number :: Maybe T.Text -- ^ Phone number of the user
    , first_name   :: Maybe T.Text -- ^ First name of the user; 1-255 characters in length
    , last_name    :: Maybe T.Text -- ^ Last name of the user
    , vcard        :: Maybe T.Text -- ^ Additional data about the user in a form of vCard; 0-2048 bytes in length
    , user_id      :: Maybe Int    -- ^ Identifier of the user, if known; 0 otherwise
    }
  deriving (Eq, Show)

instance I.ShortShow Contact where
  shortShow Contact
    { phone_number = phone_number_
    , first_name   = first_name_
    , last_name    = last_name_
    , vcard        = vcard_
    , user_id      = user_id_
    }
      = "Contact"
        ++ I.cc
        [ "phone_number" `I.p` phone_number_
        , "first_name"   `I.p` first_name_
        , "last_name"    `I.p` last_name_
        , "vcard"        `I.p` vcard_
        , "user_id"      `I.p` user_id_
        ]

instance AT.FromJSON Contact where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "contact" -> parseContact v
      _         -> mempty
    
    where
      parseContact :: A.Value -> AT.Parser Contact
      parseContact = A.withObject "Contact" $ \o -> do
        phone_number_ <- o A..:?  "phone_number"
        first_name_   <- o A..:?  "first_name"
        last_name_    <- o A..:?  "last_name"
        vcard_        <- o A..:?  "vcard"
        user_id_      <- o A..:?  "user_id"
        pure $ Contact
          { phone_number = phone_number_
          , first_name   = first_name_
          , last_name    = last_name_
          , vcard        = vcard_
          , user_id      = user_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON Contact where
  toJSON Contact
    { phone_number = phone_number_
    , first_name   = first_name_
    , last_name    = last_name_
    , vcard        = vcard_
    , user_id      = user_id_
    }
      = A.object
        [ "@type"        A..= AT.String "contact"
        , "phone_number" A..= phone_number_
        , "first_name"   A..= first_name_
        , "last_name"    A..= last_name_
        , "vcard"        A..= vcard_
        , "user_id"      A..= user_id_
        ]

defaultContact :: Contact
defaultContact =
  Contact
    { phone_number = Nothing
    , first_name   = Nothing
    , last_name    = Nothing
    , vcard        = Nothing
    , user_id      = Nothing
    }

