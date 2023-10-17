module TD.Data.InputPassportElement
  (InputPassportElement(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PersonalDetails as PersonalDetails
import qualified TD.Data.InputIdentityDocument as InputIdentityDocument
import qualified TD.Data.Address as Address
import qualified TD.Data.InputPersonalDocument as InputPersonalDocument
import qualified Data.Text as T

-- | Contains information about a Telegram Passport element to be saved
data InputPassportElement
  = InputPassportElementPersonalDetails -- ^ A Telegram Passport element to be saved containing the user's personal details
    { personal_details :: Maybe PersonalDetails.PersonalDetails -- ^ Personal details of the user
    }
  | InputPassportElementPassport -- ^ A Telegram Passport element to be saved containing the user's passport
    { passport :: Maybe InputIdentityDocument.InputIdentityDocument -- ^ The passport to be saved
    }
  | InputPassportElementDriverLicense -- ^ A Telegram Passport element to be saved containing the user's driver license
    { driver_license :: Maybe InputIdentityDocument.InputIdentityDocument -- ^ The driver license to be saved
    }
  | InputPassportElementIdentityCard -- ^ A Telegram Passport element to be saved containing the user's identity card
    { identity_card :: Maybe InputIdentityDocument.InputIdentityDocument -- ^ The identity card to be saved
    }
  | InputPassportElementInternalPassport -- ^ A Telegram Passport element to be saved containing the user's internal passport
    { internal_passport :: Maybe InputIdentityDocument.InputIdentityDocument -- ^ The internal passport to be saved
    }
  | InputPassportElementAddress -- ^ A Telegram Passport element to be saved containing the user's address
    { address :: Maybe Address.Address -- ^ The address to be saved
    }
  | InputPassportElementUtilityBill -- ^ A Telegram Passport element to be saved containing the user's utility bill
    { utility_bill :: Maybe InputPersonalDocument.InputPersonalDocument -- ^ The utility bill to be saved
    }
  | InputPassportElementBankStatement -- ^ A Telegram Passport element to be saved containing the user's bank statement
    { bank_statement :: Maybe InputPersonalDocument.InputPersonalDocument -- ^ The bank statement to be saved
    }
  | InputPassportElementRentalAgreement -- ^ A Telegram Passport element to be saved containing the user's rental agreement
    { rental_agreement :: Maybe InputPersonalDocument.InputPersonalDocument -- ^ The rental agreement to be saved
    }
  | InputPassportElementPassportRegistration -- ^ A Telegram Passport element to be saved containing the user's passport registration
    { passport_registration :: Maybe InputPersonalDocument.InputPersonalDocument -- ^ The passport registration page to be saved
    }
  | InputPassportElementTemporaryRegistration -- ^ A Telegram Passport element to be saved containing the user's temporary registration
    { temporary_registration :: Maybe InputPersonalDocument.InputPersonalDocument -- ^ The temporary registration document to be saved
    }
  | InputPassportElementPhoneNumber -- ^ A Telegram Passport element to be saved containing the user's phone number
    { phone_number :: Maybe T.Text -- ^ The phone number to be saved
    }
  | InputPassportElementEmailAddress -- ^ A Telegram Passport element to be saved containing the user's email address
    { email_address :: Maybe T.Text -- ^ The email address to be saved
    }
  deriving (Eq, Show)

instance I.ShortShow InputPassportElement where
  shortShow InputPassportElementPersonalDetails
    { personal_details = personal_details_
    }
      = "InputPassportElementPersonalDetails"
        ++ I.cc
        [ "personal_details" `I.p` personal_details_
        ]
  shortShow InputPassportElementPassport
    { passport = passport_
    }
      = "InputPassportElementPassport"
        ++ I.cc
        [ "passport" `I.p` passport_
        ]
  shortShow InputPassportElementDriverLicense
    { driver_license = driver_license_
    }
      = "InputPassportElementDriverLicense"
        ++ I.cc
        [ "driver_license" `I.p` driver_license_
        ]
  shortShow InputPassportElementIdentityCard
    { identity_card = identity_card_
    }
      = "InputPassportElementIdentityCard"
        ++ I.cc
        [ "identity_card" `I.p` identity_card_
        ]
  shortShow InputPassportElementInternalPassport
    { internal_passport = internal_passport_
    }
      = "InputPassportElementInternalPassport"
        ++ I.cc
        [ "internal_passport" `I.p` internal_passport_
        ]
  shortShow InputPassportElementAddress
    { address = address_
    }
      = "InputPassportElementAddress"
        ++ I.cc
        [ "address" `I.p` address_
        ]
  shortShow InputPassportElementUtilityBill
    { utility_bill = utility_bill_
    }
      = "InputPassportElementUtilityBill"
        ++ I.cc
        [ "utility_bill" `I.p` utility_bill_
        ]
  shortShow InputPassportElementBankStatement
    { bank_statement = bank_statement_
    }
      = "InputPassportElementBankStatement"
        ++ I.cc
        [ "bank_statement" `I.p` bank_statement_
        ]
  shortShow InputPassportElementRentalAgreement
    { rental_agreement = rental_agreement_
    }
      = "InputPassportElementRentalAgreement"
        ++ I.cc
        [ "rental_agreement" `I.p` rental_agreement_
        ]
  shortShow InputPassportElementPassportRegistration
    { passport_registration = passport_registration_
    }
      = "InputPassportElementPassportRegistration"
        ++ I.cc
        [ "passport_registration" `I.p` passport_registration_
        ]
  shortShow InputPassportElementTemporaryRegistration
    { temporary_registration = temporary_registration_
    }
      = "InputPassportElementTemporaryRegistration"
        ++ I.cc
        [ "temporary_registration" `I.p` temporary_registration_
        ]
  shortShow InputPassportElementPhoneNumber
    { phone_number = phone_number_
    }
      = "InputPassportElementPhoneNumber"
        ++ I.cc
        [ "phone_number" `I.p` phone_number_
        ]
  shortShow InputPassportElementEmailAddress
    { email_address = email_address_
    }
      = "InputPassportElementEmailAddress"
        ++ I.cc
        [ "email_address" `I.p` email_address_
        ]

instance AT.FromJSON InputPassportElement where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputPassportElementPersonalDetails"       -> parseInputPassportElementPersonalDetails v
      "inputPassportElementPassport"              -> parseInputPassportElementPassport v
      "inputPassportElementDriverLicense"         -> parseInputPassportElementDriverLicense v
      "inputPassportElementIdentityCard"          -> parseInputPassportElementIdentityCard v
      "inputPassportElementInternalPassport"      -> parseInputPassportElementInternalPassport v
      "inputPassportElementAddress"               -> parseInputPassportElementAddress v
      "inputPassportElementUtilityBill"           -> parseInputPassportElementUtilityBill v
      "inputPassportElementBankStatement"         -> parseInputPassportElementBankStatement v
      "inputPassportElementRentalAgreement"       -> parseInputPassportElementRentalAgreement v
      "inputPassportElementPassportRegistration"  -> parseInputPassportElementPassportRegistration v
      "inputPassportElementTemporaryRegistration" -> parseInputPassportElementTemporaryRegistration v
      "inputPassportElementPhoneNumber"           -> parseInputPassportElementPhoneNumber v
      "inputPassportElementEmailAddress"          -> parseInputPassportElementEmailAddress v
      _                                           -> mempty
    
    where
      parseInputPassportElementPersonalDetails :: A.Value -> AT.Parser InputPassportElement
      parseInputPassportElementPersonalDetails = A.withObject "InputPassportElementPersonalDetails" $ \o -> do
        personal_details_ <- o A..:?  "personal_details"
        pure $ InputPassportElementPersonalDetails
          { personal_details = personal_details_
          }
      parseInputPassportElementPassport :: A.Value -> AT.Parser InputPassportElement
      parseInputPassportElementPassport = A.withObject "InputPassportElementPassport" $ \o -> do
        passport_ <- o A..:?  "passport"
        pure $ InputPassportElementPassport
          { passport = passport_
          }
      parseInputPassportElementDriverLicense :: A.Value -> AT.Parser InputPassportElement
      parseInputPassportElementDriverLicense = A.withObject "InputPassportElementDriverLicense" $ \o -> do
        driver_license_ <- o A..:?  "driver_license"
        pure $ InputPassportElementDriverLicense
          { driver_license = driver_license_
          }
      parseInputPassportElementIdentityCard :: A.Value -> AT.Parser InputPassportElement
      parseInputPassportElementIdentityCard = A.withObject "InputPassportElementIdentityCard" $ \o -> do
        identity_card_ <- o A..:?  "identity_card"
        pure $ InputPassportElementIdentityCard
          { identity_card = identity_card_
          }
      parseInputPassportElementInternalPassport :: A.Value -> AT.Parser InputPassportElement
      parseInputPassportElementInternalPassport = A.withObject "InputPassportElementInternalPassport" $ \o -> do
        internal_passport_ <- o A..:?  "internal_passport"
        pure $ InputPassportElementInternalPassport
          { internal_passport = internal_passport_
          }
      parseInputPassportElementAddress :: A.Value -> AT.Parser InputPassportElement
      parseInputPassportElementAddress = A.withObject "InputPassportElementAddress" $ \o -> do
        address_ <- o A..:?  "address"
        pure $ InputPassportElementAddress
          { address = address_
          }
      parseInputPassportElementUtilityBill :: A.Value -> AT.Parser InputPassportElement
      parseInputPassportElementUtilityBill = A.withObject "InputPassportElementUtilityBill" $ \o -> do
        utility_bill_ <- o A..:?  "utility_bill"
        pure $ InputPassportElementUtilityBill
          { utility_bill = utility_bill_
          }
      parseInputPassportElementBankStatement :: A.Value -> AT.Parser InputPassportElement
      parseInputPassportElementBankStatement = A.withObject "InputPassportElementBankStatement" $ \o -> do
        bank_statement_ <- o A..:?  "bank_statement"
        pure $ InputPassportElementBankStatement
          { bank_statement = bank_statement_
          }
      parseInputPassportElementRentalAgreement :: A.Value -> AT.Parser InputPassportElement
      parseInputPassportElementRentalAgreement = A.withObject "InputPassportElementRentalAgreement" $ \o -> do
        rental_agreement_ <- o A..:?  "rental_agreement"
        pure $ InputPassportElementRentalAgreement
          { rental_agreement = rental_agreement_
          }
      parseInputPassportElementPassportRegistration :: A.Value -> AT.Parser InputPassportElement
      parseInputPassportElementPassportRegistration = A.withObject "InputPassportElementPassportRegistration" $ \o -> do
        passport_registration_ <- o A..:?  "passport_registration"
        pure $ InputPassportElementPassportRegistration
          { passport_registration = passport_registration_
          }
      parseInputPassportElementTemporaryRegistration :: A.Value -> AT.Parser InputPassportElement
      parseInputPassportElementTemporaryRegistration = A.withObject "InputPassportElementTemporaryRegistration" $ \o -> do
        temporary_registration_ <- o A..:?  "temporary_registration"
        pure $ InputPassportElementTemporaryRegistration
          { temporary_registration = temporary_registration_
          }
      parseInputPassportElementPhoneNumber :: A.Value -> AT.Parser InputPassportElement
      parseInputPassportElementPhoneNumber = A.withObject "InputPassportElementPhoneNumber" $ \o -> do
        phone_number_ <- o A..:?  "phone_number"
        pure $ InputPassportElementPhoneNumber
          { phone_number = phone_number_
          }
      parseInputPassportElementEmailAddress :: A.Value -> AT.Parser InputPassportElement
      parseInputPassportElementEmailAddress = A.withObject "InputPassportElementEmailAddress" $ \o -> do
        email_address_ <- o A..:?  "email_address"
        pure $ InputPassportElementEmailAddress
          { email_address = email_address_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputPassportElement where
  toJSON InputPassportElementPersonalDetails
    { personal_details = personal_details_
    }
      = A.object
        [ "@type"            A..= AT.String "inputPassportElementPersonalDetails"
        , "personal_details" A..= personal_details_
        ]
  toJSON InputPassportElementPassport
    { passport = passport_
    }
      = A.object
        [ "@type"    A..= AT.String "inputPassportElementPassport"
        , "passport" A..= passport_
        ]
  toJSON InputPassportElementDriverLicense
    { driver_license = driver_license_
    }
      = A.object
        [ "@type"          A..= AT.String "inputPassportElementDriverLicense"
        , "driver_license" A..= driver_license_
        ]
  toJSON InputPassportElementIdentityCard
    { identity_card = identity_card_
    }
      = A.object
        [ "@type"         A..= AT.String "inputPassportElementIdentityCard"
        , "identity_card" A..= identity_card_
        ]
  toJSON InputPassportElementInternalPassport
    { internal_passport = internal_passport_
    }
      = A.object
        [ "@type"             A..= AT.String "inputPassportElementInternalPassport"
        , "internal_passport" A..= internal_passport_
        ]
  toJSON InputPassportElementAddress
    { address = address_
    }
      = A.object
        [ "@type"   A..= AT.String "inputPassportElementAddress"
        , "address" A..= address_
        ]
  toJSON InputPassportElementUtilityBill
    { utility_bill = utility_bill_
    }
      = A.object
        [ "@type"        A..= AT.String "inputPassportElementUtilityBill"
        , "utility_bill" A..= utility_bill_
        ]
  toJSON InputPassportElementBankStatement
    { bank_statement = bank_statement_
    }
      = A.object
        [ "@type"          A..= AT.String "inputPassportElementBankStatement"
        , "bank_statement" A..= bank_statement_
        ]
  toJSON InputPassportElementRentalAgreement
    { rental_agreement = rental_agreement_
    }
      = A.object
        [ "@type"            A..= AT.String "inputPassportElementRentalAgreement"
        , "rental_agreement" A..= rental_agreement_
        ]
  toJSON InputPassportElementPassportRegistration
    { passport_registration = passport_registration_
    }
      = A.object
        [ "@type"                 A..= AT.String "inputPassportElementPassportRegistration"
        , "passport_registration" A..= passport_registration_
        ]
  toJSON InputPassportElementTemporaryRegistration
    { temporary_registration = temporary_registration_
    }
      = A.object
        [ "@type"                  A..= AT.String "inputPassportElementTemporaryRegistration"
        , "temporary_registration" A..= temporary_registration_
        ]
  toJSON InputPassportElementPhoneNumber
    { phone_number = phone_number_
    }
      = A.object
        [ "@type"        A..= AT.String "inputPassportElementPhoneNumber"
        , "phone_number" A..= phone_number_
        ]
  toJSON InputPassportElementEmailAddress
    { email_address = email_address_
    }
      = A.object
        [ "@type"         A..= AT.String "inputPassportElementEmailAddress"
        , "email_address" A..= email_address_
        ]

