module TD.Data.PassportElement
  (PassportElement(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PersonalDetails as PersonalDetails
import qualified TD.Data.IdentityDocument as IdentityDocument
import qualified TD.Data.Address as Address
import qualified TD.Data.PersonalDocument as PersonalDocument
import qualified Data.Text as T

-- | Contains information about a Telegram Passport element
data PassportElement
  = PassportElementPersonalDetails -- ^ A Telegram Passport element containing the user's personal details
    { personal_details :: Maybe PersonalDetails.PersonalDetails -- ^ Personal details of the user
    }
  | PassportElementPassport -- ^ A Telegram Passport element containing the user's passport
    { passport :: Maybe IdentityDocument.IdentityDocument -- ^ Passport
    }
  | PassportElementDriverLicense -- ^ A Telegram Passport element containing the user's driver license
    { driver_license :: Maybe IdentityDocument.IdentityDocument -- ^ Driver license
    }
  | PassportElementIdentityCard -- ^ A Telegram Passport element containing the user's identity card
    { identity_card :: Maybe IdentityDocument.IdentityDocument -- ^ Identity card
    }
  | PassportElementInternalPassport -- ^ A Telegram Passport element containing the user's internal passport
    { internal_passport :: Maybe IdentityDocument.IdentityDocument -- ^ Internal passport
    }
  | PassportElementAddress -- ^ A Telegram Passport element containing the user's address
    { address :: Maybe Address.Address -- ^ Address
    }
  | PassportElementUtilityBill -- ^ A Telegram Passport element containing the user's utility bill
    { utility_bill :: Maybe PersonalDocument.PersonalDocument -- ^ Utility bill
    }
  | PassportElementBankStatement -- ^ A Telegram Passport element containing the user's bank statement
    { bank_statement :: Maybe PersonalDocument.PersonalDocument -- ^ Bank statement
    }
  | PassportElementRentalAgreement -- ^ A Telegram Passport element containing the user's rental agreement
    { rental_agreement :: Maybe PersonalDocument.PersonalDocument -- ^ Rental agreement
    }
  | PassportElementPassportRegistration -- ^ A Telegram Passport element containing the user's passport registration pages
    { passport_registration :: Maybe PersonalDocument.PersonalDocument -- ^ Passport registration pages
    }
  | PassportElementTemporaryRegistration -- ^ A Telegram Passport element containing the user's temporary registration
    { temporary_registration :: Maybe PersonalDocument.PersonalDocument -- ^ Temporary registration
    }
  | PassportElementPhoneNumber -- ^ A Telegram Passport element containing the user's phone number
    { phone_number :: Maybe T.Text -- ^ Phone number
    }
  | PassportElementEmailAddress -- ^ A Telegram Passport element containing the user's email address
    { email_address :: Maybe T.Text -- ^ Email address
    }
  deriving (Eq, Show)

instance I.ShortShow PassportElement where
  shortShow PassportElementPersonalDetails
    { personal_details = personal_details_
    }
      = "PassportElementPersonalDetails"
        ++ I.cc
        [ "personal_details" `I.p` personal_details_
        ]
  shortShow PassportElementPassport
    { passport = passport_
    }
      = "PassportElementPassport"
        ++ I.cc
        [ "passport" `I.p` passport_
        ]
  shortShow PassportElementDriverLicense
    { driver_license = driver_license_
    }
      = "PassportElementDriverLicense"
        ++ I.cc
        [ "driver_license" `I.p` driver_license_
        ]
  shortShow PassportElementIdentityCard
    { identity_card = identity_card_
    }
      = "PassportElementIdentityCard"
        ++ I.cc
        [ "identity_card" `I.p` identity_card_
        ]
  shortShow PassportElementInternalPassport
    { internal_passport = internal_passport_
    }
      = "PassportElementInternalPassport"
        ++ I.cc
        [ "internal_passport" `I.p` internal_passport_
        ]
  shortShow PassportElementAddress
    { address = address_
    }
      = "PassportElementAddress"
        ++ I.cc
        [ "address" `I.p` address_
        ]
  shortShow PassportElementUtilityBill
    { utility_bill = utility_bill_
    }
      = "PassportElementUtilityBill"
        ++ I.cc
        [ "utility_bill" `I.p` utility_bill_
        ]
  shortShow PassportElementBankStatement
    { bank_statement = bank_statement_
    }
      = "PassportElementBankStatement"
        ++ I.cc
        [ "bank_statement" `I.p` bank_statement_
        ]
  shortShow PassportElementRentalAgreement
    { rental_agreement = rental_agreement_
    }
      = "PassportElementRentalAgreement"
        ++ I.cc
        [ "rental_agreement" `I.p` rental_agreement_
        ]
  shortShow PassportElementPassportRegistration
    { passport_registration = passport_registration_
    }
      = "PassportElementPassportRegistration"
        ++ I.cc
        [ "passport_registration" `I.p` passport_registration_
        ]
  shortShow PassportElementTemporaryRegistration
    { temporary_registration = temporary_registration_
    }
      = "PassportElementTemporaryRegistration"
        ++ I.cc
        [ "temporary_registration" `I.p` temporary_registration_
        ]
  shortShow PassportElementPhoneNumber
    { phone_number = phone_number_
    }
      = "PassportElementPhoneNumber"
        ++ I.cc
        [ "phone_number" `I.p` phone_number_
        ]
  shortShow PassportElementEmailAddress
    { email_address = email_address_
    }
      = "PassportElementEmailAddress"
        ++ I.cc
        [ "email_address" `I.p` email_address_
        ]

instance AT.FromJSON PassportElement where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "passportElementPersonalDetails"       -> parsePassportElementPersonalDetails v
      "passportElementPassport"              -> parsePassportElementPassport v
      "passportElementDriverLicense"         -> parsePassportElementDriverLicense v
      "passportElementIdentityCard"          -> parsePassportElementIdentityCard v
      "passportElementInternalPassport"      -> parsePassportElementInternalPassport v
      "passportElementAddress"               -> parsePassportElementAddress v
      "passportElementUtilityBill"           -> parsePassportElementUtilityBill v
      "passportElementBankStatement"         -> parsePassportElementBankStatement v
      "passportElementRentalAgreement"       -> parsePassportElementRentalAgreement v
      "passportElementPassportRegistration"  -> parsePassportElementPassportRegistration v
      "passportElementTemporaryRegistration" -> parsePassportElementTemporaryRegistration v
      "passportElementPhoneNumber"           -> parsePassportElementPhoneNumber v
      "passportElementEmailAddress"          -> parsePassportElementEmailAddress v
      _                                      -> mempty
    
    where
      parsePassportElementPersonalDetails :: A.Value -> AT.Parser PassportElement
      parsePassportElementPersonalDetails = A.withObject "PassportElementPersonalDetails" $ \o -> do
        personal_details_ <- o A..:?  "personal_details"
        pure $ PassportElementPersonalDetails
          { personal_details = personal_details_
          }
      parsePassportElementPassport :: A.Value -> AT.Parser PassportElement
      parsePassportElementPassport = A.withObject "PassportElementPassport" $ \o -> do
        passport_ <- o A..:?  "passport"
        pure $ PassportElementPassport
          { passport = passport_
          }
      parsePassportElementDriverLicense :: A.Value -> AT.Parser PassportElement
      parsePassportElementDriverLicense = A.withObject "PassportElementDriverLicense" $ \o -> do
        driver_license_ <- o A..:?  "driver_license"
        pure $ PassportElementDriverLicense
          { driver_license = driver_license_
          }
      parsePassportElementIdentityCard :: A.Value -> AT.Parser PassportElement
      parsePassportElementIdentityCard = A.withObject "PassportElementIdentityCard" $ \o -> do
        identity_card_ <- o A..:?  "identity_card"
        pure $ PassportElementIdentityCard
          { identity_card = identity_card_
          }
      parsePassportElementInternalPassport :: A.Value -> AT.Parser PassportElement
      parsePassportElementInternalPassport = A.withObject "PassportElementInternalPassport" $ \o -> do
        internal_passport_ <- o A..:?  "internal_passport"
        pure $ PassportElementInternalPassport
          { internal_passport = internal_passport_
          }
      parsePassportElementAddress :: A.Value -> AT.Parser PassportElement
      parsePassportElementAddress = A.withObject "PassportElementAddress" $ \o -> do
        address_ <- o A..:?  "address"
        pure $ PassportElementAddress
          { address = address_
          }
      parsePassportElementUtilityBill :: A.Value -> AT.Parser PassportElement
      parsePassportElementUtilityBill = A.withObject "PassportElementUtilityBill" $ \o -> do
        utility_bill_ <- o A..:?  "utility_bill"
        pure $ PassportElementUtilityBill
          { utility_bill = utility_bill_
          }
      parsePassportElementBankStatement :: A.Value -> AT.Parser PassportElement
      parsePassportElementBankStatement = A.withObject "PassportElementBankStatement" $ \o -> do
        bank_statement_ <- o A..:?  "bank_statement"
        pure $ PassportElementBankStatement
          { bank_statement = bank_statement_
          }
      parsePassportElementRentalAgreement :: A.Value -> AT.Parser PassportElement
      parsePassportElementRentalAgreement = A.withObject "PassportElementRentalAgreement" $ \o -> do
        rental_agreement_ <- o A..:?  "rental_agreement"
        pure $ PassportElementRentalAgreement
          { rental_agreement = rental_agreement_
          }
      parsePassportElementPassportRegistration :: A.Value -> AT.Parser PassportElement
      parsePassportElementPassportRegistration = A.withObject "PassportElementPassportRegistration" $ \o -> do
        passport_registration_ <- o A..:?  "passport_registration"
        pure $ PassportElementPassportRegistration
          { passport_registration = passport_registration_
          }
      parsePassportElementTemporaryRegistration :: A.Value -> AT.Parser PassportElement
      parsePassportElementTemporaryRegistration = A.withObject "PassportElementTemporaryRegistration" $ \o -> do
        temporary_registration_ <- o A..:?  "temporary_registration"
        pure $ PassportElementTemporaryRegistration
          { temporary_registration = temporary_registration_
          }
      parsePassportElementPhoneNumber :: A.Value -> AT.Parser PassportElement
      parsePassportElementPhoneNumber = A.withObject "PassportElementPhoneNumber" $ \o -> do
        phone_number_ <- o A..:?  "phone_number"
        pure $ PassportElementPhoneNumber
          { phone_number = phone_number_
          }
      parsePassportElementEmailAddress :: A.Value -> AT.Parser PassportElement
      parsePassportElementEmailAddress = A.withObject "PassportElementEmailAddress" $ \o -> do
        email_address_ <- o A..:?  "email_address"
        pure $ PassportElementEmailAddress
          { email_address = email_address_
          }
  parseJSON _ = mempty

