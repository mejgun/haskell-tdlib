{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.InputPassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Address as Address
import qualified TD.Reply.InputIdentityDocument as InputIdentityDocument
import qualified TD.Reply.InputPersonalDocument as InputPersonalDocument
import qualified TD.Reply.PersonalDetails as PersonalDetails
import qualified Utils as U

-- | Contains information about a Telegram Passport element to be saved
data InputPassportElement
  = -- | A Telegram Passport element to be saved containing the user's personal details @personal_details Personal details of the user
    InputPassportElementPersonalDetails
      { -- |
        personal_details :: Maybe PersonalDetails.PersonalDetails
      }
  | -- | A Telegram Passport element to be saved containing the user's passport @passport The passport to be saved
    InputPassportElementPassport
      { -- |
        passport :: Maybe InputIdentityDocument.InputIdentityDocument
      }
  | -- | A Telegram Passport element to be saved containing the user's driver license @driver_license The driver license to be saved
    InputPassportElementDriverLicense
      { -- |
        driver_license :: Maybe InputIdentityDocument.InputIdentityDocument
      }
  | -- | A Telegram Passport element to be saved containing the user's identity card @identity_card The identity card to be saved
    InputPassportElementIdentityCard
      { -- |
        identity_card :: Maybe InputIdentityDocument.InputIdentityDocument
      }
  | -- | A Telegram Passport element to be saved containing the user's internal passport @internal_passport The internal passport to be saved
    InputPassportElementInternalPassport
      { -- |
        internal_passport :: Maybe InputIdentityDocument.InputIdentityDocument
      }
  | -- | A Telegram Passport element to be saved containing the user's address @address The address to be saved
    InputPassportElementAddress
      { -- |
        address :: Maybe Address.Address
      }
  | -- | A Telegram Passport element to be saved containing the user's utility bill @utility_bill The utility bill to be saved
    InputPassportElementUtilityBill
      { -- |
        utility_bill :: Maybe InputPersonalDocument.InputPersonalDocument
      }
  | -- | A Telegram Passport element to be saved containing the user's bank statement @bank_statement The bank statement to be saved
    InputPassportElementBankStatement
      { -- |
        bank_statement :: Maybe InputPersonalDocument.InputPersonalDocument
      }
  | -- | A Telegram Passport element to be saved containing the user's rental agreement @rental_agreement The rental agreement to be saved
    InputPassportElementRentalAgreement
      { -- |
        rental_agreement :: Maybe InputPersonalDocument.InputPersonalDocument
      }
  | -- | A Telegram Passport element to be saved containing the user's passport registration @passport_registration The passport registration page to be saved
    InputPassportElementPassportRegistration
      { -- |
        passport_registration :: Maybe InputPersonalDocument.InputPersonalDocument
      }
  | -- | A Telegram Passport element to be saved containing the user's temporary registration @temporary_registration The temporary registration document to be saved
    InputPassportElementTemporaryRegistration
      { -- |
        temporary_registration :: Maybe InputPersonalDocument.InputPersonalDocument
      }
  | -- | A Telegram Passport element to be saved containing the user's phone number @phone_number The phone number to be saved
    InputPassportElementPhoneNumber
      { -- |
        phone_number :: Maybe String
      }
  | -- | A Telegram Passport element to be saved containing the user's email address @email_address The email address to be saved
    InputPassportElementEmailAddress
      { -- |
        email_address :: Maybe String
      }
  deriving (Eq)

instance Show InputPassportElement where
  show
    InputPassportElementPersonalDetails
      { personal_details = personal_details
      } =
      "InputPassportElementPersonalDetails"
        ++ U.cc
          [ U.p "personal_details" personal_details
          ]
  show
    InputPassportElementPassport
      { passport = passport
      } =
      "InputPassportElementPassport"
        ++ U.cc
          [ U.p "passport" passport
          ]
  show
    InputPassportElementDriverLicense
      { driver_license = driver_license
      } =
      "InputPassportElementDriverLicense"
        ++ U.cc
          [ U.p "driver_license" driver_license
          ]
  show
    InputPassportElementIdentityCard
      { identity_card = identity_card
      } =
      "InputPassportElementIdentityCard"
        ++ U.cc
          [ U.p "identity_card" identity_card
          ]
  show
    InputPassportElementInternalPassport
      { internal_passport = internal_passport
      } =
      "InputPassportElementInternalPassport"
        ++ U.cc
          [ U.p "internal_passport" internal_passport
          ]
  show
    InputPassportElementAddress
      { address = address
      } =
      "InputPassportElementAddress"
        ++ U.cc
          [ U.p "address" address
          ]
  show
    InputPassportElementUtilityBill
      { utility_bill = utility_bill
      } =
      "InputPassportElementUtilityBill"
        ++ U.cc
          [ U.p "utility_bill" utility_bill
          ]
  show
    InputPassportElementBankStatement
      { bank_statement = bank_statement
      } =
      "InputPassportElementBankStatement"
        ++ U.cc
          [ U.p "bank_statement" bank_statement
          ]
  show
    InputPassportElementRentalAgreement
      { rental_agreement = rental_agreement
      } =
      "InputPassportElementRentalAgreement"
        ++ U.cc
          [ U.p "rental_agreement" rental_agreement
          ]
  show
    InputPassportElementPassportRegistration
      { passport_registration = passport_registration
      } =
      "InputPassportElementPassportRegistration"
        ++ U.cc
          [ U.p "passport_registration" passport_registration
          ]
  show
    InputPassportElementTemporaryRegistration
      { temporary_registration = temporary_registration
      } =
      "InputPassportElementTemporaryRegistration"
        ++ U.cc
          [ U.p "temporary_registration" temporary_registration
          ]
  show
    InputPassportElementPhoneNumber
      { phone_number = phone_number
      } =
      "InputPassportElementPhoneNumber"
        ++ U.cc
          [ U.p "phone_number" phone_number
          ]
  show
    InputPassportElementEmailAddress
      { email_address = email_address
      } =
      "InputPassportElementEmailAddress"
        ++ U.cc
          [ U.p "email_address" email_address
          ]

instance T.FromJSON InputPassportElement where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inputPassportElementPersonalDetails" -> parseInputPassportElementPersonalDetails v
      "inputPassportElementPassport" -> parseInputPassportElementPassport v
      "inputPassportElementDriverLicense" -> parseInputPassportElementDriverLicense v
      "inputPassportElementIdentityCard" -> parseInputPassportElementIdentityCard v
      "inputPassportElementInternalPassport" -> parseInputPassportElementInternalPassport v
      "inputPassportElementAddress" -> parseInputPassportElementAddress v
      "inputPassportElementUtilityBill" -> parseInputPassportElementUtilityBill v
      "inputPassportElementBankStatement" -> parseInputPassportElementBankStatement v
      "inputPassportElementRentalAgreement" -> parseInputPassportElementRentalAgreement v
      "inputPassportElementPassportRegistration" -> parseInputPassportElementPassportRegistration v
      "inputPassportElementTemporaryRegistration" -> parseInputPassportElementTemporaryRegistration v
      "inputPassportElementPhoneNumber" -> parseInputPassportElementPhoneNumber v
      "inputPassportElementEmailAddress" -> parseInputPassportElementEmailAddress v
      _ -> fail ""
    where
      parseInputPassportElementPersonalDetails :: A.Value -> T.Parser InputPassportElement
      parseInputPassportElementPersonalDetails = A.withObject "InputPassportElementPersonalDetails" $ \o -> do
        personal_details_ <- o A..:? "personal_details"
        return $ InputPassportElementPersonalDetails {personal_details = personal_details_}

      parseInputPassportElementPassport :: A.Value -> T.Parser InputPassportElement
      parseInputPassportElementPassport = A.withObject "InputPassportElementPassport" $ \o -> do
        passport_ <- o A..:? "passport"
        return $ InputPassportElementPassport {passport = passport_}

      parseInputPassportElementDriverLicense :: A.Value -> T.Parser InputPassportElement
      parseInputPassportElementDriverLicense = A.withObject "InputPassportElementDriverLicense" $ \o -> do
        driver_license_ <- o A..:? "driver_license"
        return $ InputPassportElementDriverLicense {driver_license = driver_license_}

      parseInputPassportElementIdentityCard :: A.Value -> T.Parser InputPassportElement
      parseInputPassportElementIdentityCard = A.withObject "InputPassportElementIdentityCard" $ \o -> do
        identity_card_ <- o A..:? "identity_card"
        return $ InputPassportElementIdentityCard {identity_card = identity_card_}

      parseInputPassportElementInternalPassport :: A.Value -> T.Parser InputPassportElement
      parseInputPassportElementInternalPassport = A.withObject "InputPassportElementInternalPassport" $ \o -> do
        internal_passport_ <- o A..:? "internal_passport"
        return $ InputPassportElementInternalPassport {internal_passport = internal_passport_}

      parseInputPassportElementAddress :: A.Value -> T.Parser InputPassportElement
      parseInputPassportElementAddress = A.withObject "InputPassportElementAddress" $ \o -> do
        address_ <- o A..:? "address"
        return $ InputPassportElementAddress {address = address_}

      parseInputPassportElementUtilityBill :: A.Value -> T.Parser InputPassportElement
      parseInputPassportElementUtilityBill = A.withObject "InputPassportElementUtilityBill" $ \o -> do
        utility_bill_ <- o A..:? "utility_bill"
        return $ InputPassportElementUtilityBill {utility_bill = utility_bill_}

      parseInputPassportElementBankStatement :: A.Value -> T.Parser InputPassportElement
      parseInputPassportElementBankStatement = A.withObject "InputPassportElementBankStatement" $ \o -> do
        bank_statement_ <- o A..:? "bank_statement"
        return $ InputPassportElementBankStatement {bank_statement = bank_statement_}

      parseInputPassportElementRentalAgreement :: A.Value -> T.Parser InputPassportElement
      parseInputPassportElementRentalAgreement = A.withObject "InputPassportElementRentalAgreement" $ \o -> do
        rental_agreement_ <- o A..:? "rental_agreement"
        return $ InputPassportElementRentalAgreement {rental_agreement = rental_agreement_}

      parseInputPassportElementPassportRegistration :: A.Value -> T.Parser InputPassportElement
      parseInputPassportElementPassportRegistration = A.withObject "InputPassportElementPassportRegistration" $ \o -> do
        passport_registration_ <- o A..:? "passport_registration"
        return $ InputPassportElementPassportRegistration {passport_registration = passport_registration_}

      parseInputPassportElementTemporaryRegistration :: A.Value -> T.Parser InputPassportElement
      parseInputPassportElementTemporaryRegistration = A.withObject "InputPassportElementTemporaryRegistration" $ \o -> do
        temporary_registration_ <- o A..:? "temporary_registration"
        return $ InputPassportElementTemporaryRegistration {temporary_registration = temporary_registration_}

      parseInputPassportElementPhoneNumber :: A.Value -> T.Parser InputPassportElement
      parseInputPassportElementPhoneNumber = A.withObject "InputPassportElementPhoneNumber" $ \o -> do
        phone_number_ <- o A..:? "phone_number"
        return $ InputPassportElementPhoneNumber {phone_number = phone_number_}

      parseInputPassportElementEmailAddress :: A.Value -> T.Parser InputPassportElement
      parseInputPassportElementEmailAddress = A.withObject "InputPassportElementEmailAddress" $ \o -> do
        email_address_ <- o A..:? "email_address"
        return $ InputPassportElementEmailAddress {email_address = email_address_}
  parseJSON _ = fail ""

instance T.ToJSON InputPassportElement where
  toJSON
    InputPassportElementPersonalDetails
      { personal_details = personal_details
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementPersonalDetails",
          "personal_details" A..= personal_details
        ]
  toJSON
    InputPassportElementPassport
      { passport = passport
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementPassport",
          "passport" A..= passport
        ]
  toJSON
    InputPassportElementDriverLicense
      { driver_license = driver_license
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementDriverLicense",
          "driver_license" A..= driver_license
        ]
  toJSON
    InputPassportElementIdentityCard
      { identity_card = identity_card
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementIdentityCard",
          "identity_card" A..= identity_card
        ]
  toJSON
    InputPassportElementInternalPassport
      { internal_passport = internal_passport
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementInternalPassport",
          "internal_passport" A..= internal_passport
        ]
  toJSON
    InputPassportElementAddress
      { address = address
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementAddress",
          "address" A..= address
        ]
  toJSON
    InputPassportElementUtilityBill
      { utility_bill = utility_bill
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementUtilityBill",
          "utility_bill" A..= utility_bill
        ]
  toJSON
    InputPassportElementBankStatement
      { bank_statement = bank_statement
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementBankStatement",
          "bank_statement" A..= bank_statement
        ]
  toJSON
    InputPassportElementRentalAgreement
      { rental_agreement = rental_agreement
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementRentalAgreement",
          "rental_agreement" A..= rental_agreement
        ]
  toJSON
    InputPassportElementPassportRegistration
      { passport_registration = passport_registration
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementPassportRegistration",
          "passport_registration" A..= passport_registration
        ]
  toJSON
    InputPassportElementTemporaryRegistration
      { temporary_registration = temporary_registration
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementTemporaryRegistration",
          "temporary_registration" A..= temporary_registration
        ]
  toJSON
    InputPassportElementPhoneNumber
      { phone_number = phone_number
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementPhoneNumber",
          "phone_number" A..= phone_number
        ]
  toJSON
    InputPassportElementEmailAddress
      { email_address = email_address
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementEmailAddress",
          "email_address" A..= email_address
        ]
