module TD.Data.PassportElementType
  (PassportElementType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Contains the type of Telegram Passport element
data PassportElementType
  = PassportElementTypePersonalDetails -- ^ A Telegram Passport element containing the user's personal details
  | PassportElementTypePassport -- ^ A Telegram Passport element containing the user's passport
  | PassportElementTypeDriverLicense -- ^ A Telegram Passport element containing the user's driver license
  | PassportElementTypeIdentityCard -- ^ A Telegram Passport element containing the user's identity card
  | PassportElementTypeInternalPassport -- ^ A Telegram Passport element containing the user's internal passport
  | PassportElementTypeAddress -- ^ A Telegram Passport element containing the user's address
  | PassportElementTypeUtilityBill -- ^ A Telegram Passport element containing the user's utility bill
  | PassportElementTypeBankStatement -- ^ A Telegram Passport element containing the user's bank statement
  | PassportElementTypeRentalAgreement -- ^ A Telegram Passport element containing the user's rental agreement
  | PassportElementTypePassportRegistration -- ^ A Telegram Passport element containing the registration page of the user's passport
  | PassportElementTypeTemporaryRegistration -- ^ A Telegram Passport element containing the user's temporary registration
  | PassportElementTypePhoneNumber -- ^ A Telegram Passport element containing the user's phone number
  | PassportElementTypeEmailAddress -- ^ A Telegram Passport element containing the user's email address
  deriving (Eq, Show)

instance I.ShortShow PassportElementType where
  shortShow PassportElementTypePersonalDetails
      = "PassportElementTypePersonalDetails"
  shortShow PassportElementTypePassport
      = "PassportElementTypePassport"
  shortShow PassportElementTypeDriverLicense
      = "PassportElementTypeDriverLicense"
  shortShow PassportElementTypeIdentityCard
      = "PassportElementTypeIdentityCard"
  shortShow PassportElementTypeInternalPassport
      = "PassportElementTypeInternalPassport"
  shortShow PassportElementTypeAddress
      = "PassportElementTypeAddress"
  shortShow PassportElementTypeUtilityBill
      = "PassportElementTypeUtilityBill"
  shortShow PassportElementTypeBankStatement
      = "PassportElementTypeBankStatement"
  shortShow PassportElementTypeRentalAgreement
      = "PassportElementTypeRentalAgreement"
  shortShow PassportElementTypePassportRegistration
      = "PassportElementTypePassportRegistration"
  shortShow PassportElementTypeTemporaryRegistration
      = "PassportElementTypeTemporaryRegistration"
  shortShow PassportElementTypePhoneNumber
      = "PassportElementTypePhoneNumber"
  shortShow PassportElementTypeEmailAddress
      = "PassportElementTypeEmailAddress"

instance AT.FromJSON PassportElementType where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "passportElementTypePersonalDetails"       -> pure PassportElementTypePersonalDetails
      "passportElementTypePassport"              -> pure PassportElementTypePassport
      "passportElementTypeDriverLicense"         -> pure PassportElementTypeDriverLicense
      "passportElementTypeIdentityCard"          -> pure PassportElementTypeIdentityCard
      "passportElementTypeInternalPassport"      -> pure PassportElementTypeInternalPassport
      "passportElementTypeAddress"               -> pure PassportElementTypeAddress
      "passportElementTypeUtilityBill"           -> pure PassportElementTypeUtilityBill
      "passportElementTypeBankStatement"         -> pure PassportElementTypeBankStatement
      "passportElementTypeRentalAgreement"       -> pure PassportElementTypeRentalAgreement
      "passportElementTypePassportRegistration"  -> pure PassportElementTypePassportRegistration
      "passportElementTypeTemporaryRegistration" -> pure PassportElementTypeTemporaryRegistration
      "passportElementTypePhoneNumber"           -> pure PassportElementTypePhoneNumber
      "passportElementTypeEmailAddress"          -> pure PassportElementTypeEmailAddress
      _                                          -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON PassportElementType where
  toJSON PassportElementTypePersonalDetails
      = A.object
        [ "@type" A..= AT.String "passportElementTypePersonalDetails"
        ]
  toJSON PassportElementTypePassport
      = A.object
        [ "@type" A..= AT.String "passportElementTypePassport"
        ]
  toJSON PassportElementTypeDriverLicense
      = A.object
        [ "@type" A..= AT.String "passportElementTypeDriverLicense"
        ]
  toJSON PassportElementTypeIdentityCard
      = A.object
        [ "@type" A..= AT.String "passportElementTypeIdentityCard"
        ]
  toJSON PassportElementTypeInternalPassport
      = A.object
        [ "@type" A..= AT.String "passportElementTypeInternalPassport"
        ]
  toJSON PassportElementTypeAddress
      = A.object
        [ "@type" A..= AT.String "passportElementTypeAddress"
        ]
  toJSON PassportElementTypeUtilityBill
      = A.object
        [ "@type" A..= AT.String "passportElementTypeUtilityBill"
        ]
  toJSON PassportElementTypeBankStatement
      = A.object
        [ "@type" A..= AT.String "passportElementTypeBankStatement"
        ]
  toJSON PassportElementTypeRentalAgreement
      = A.object
        [ "@type" A..= AT.String "passportElementTypeRentalAgreement"
        ]
  toJSON PassportElementTypePassportRegistration
      = A.object
        [ "@type" A..= AT.String "passportElementTypePassportRegistration"
        ]
  toJSON PassportElementTypeTemporaryRegistration
      = A.object
        [ "@type" A..= AT.String "passportElementTypeTemporaryRegistration"
        ]
  toJSON PassportElementTypePhoneNumber
      = A.object
        [ "@type" A..= AT.String "passportElementTypePhoneNumber"
        ]
  toJSON PassportElementTypeEmailAddress
      = A.object
        [ "@type" A..= AT.String "passportElementTypeEmailAddress"
        ]

