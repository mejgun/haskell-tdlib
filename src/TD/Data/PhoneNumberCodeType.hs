module TD.Data.PhoneNumberCodeType
  (PhoneNumberCodeType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes type of the request for which a code is sent to a phone number
data PhoneNumberCodeType
  = PhoneNumberCodeTypeChange -- ^ Checks ownership of a new phone number to change the user's authentication phone number; for official Android and iOS applications only
  | PhoneNumberCodeTypeVerify -- ^ Verifies ownership of a phone number to be added to the user's Telegram Passport
  | PhoneNumberCodeTypeConfirmOwnership -- ^ Confirms ownership of a phone number to prevent account deletion while handling links of the type internalLinkTypePhoneNumberConfirmation
    { hash :: Maybe T.Text -- ^ Hash value from the link
    }
  deriving (Eq, Show)

instance I.ShortShow PhoneNumberCodeType where
  shortShow PhoneNumberCodeTypeChange
      = "PhoneNumberCodeTypeChange"
  shortShow PhoneNumberCodeTypeVerify
      = "PhoneNumberCodeTypeVerify"
  shortShow PhoneNumberCodeTypeConfirmOwnership
    { hash = hash_
    }
      = "PhoneNumberCodeTypeConfirmOwnership"
        ++ I.cc
        [ "hash" `I.p` hash_
        ]

instance AT.FromJSON PhoneNumberCodeType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "phoneNumberCodeTypeChange"           -> pure PhoneNumberCodeTypeChange
      "phoneNumberCodeTypeVerify"           -> pure PhoneNumberCodeTypeVerify
      "phoneNumberCodeTypeConfirmOwnership" -> parsePhoneNumberCodeTypeConfirmOwnership v
      _                                     -> mempty
    
    where
      parsePhoneNumberCodeTypeConfirmOwnership :: A.Value -> AT.Parser PhoneNumberCodeType
      parsePhoneNumberCodeTypeConfirmOwnership = A.withObject "PhoneNumberCodeTypeConfirmOwnership" $ \o -> do
        hash_ <- o A..:?  "hash"
        pure $ PhoneNumberCodeTypeConfirmOwnership
          { hash = hash_
          }
  parseJSON _ = mempty

instance AT.ToJSON PhoneNumberCodeType where
  toJSON PhoneNumberCodeTypeChange
      = A.object
        [ "@type" A..= AT.String "phoneNumberCodeTypeChange"
        ]
  toJSON PhoneNumberCodeTypeVerify
      = A.object
        [ "@type" A..= AT.String "phoneNumberCodeTypeVerify"
        ]
  toJSON PhoneNumberCodeTypeConfirmOwnership
    { hash = hash_
    }
      = A.object
        [ "@type" A..= AT.String "phoneNumberCodeTypeConfirmOwnership"
        , "hash"  A..= hash_
        ]

