{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InputPassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Address as Address
import qualified TD.Data.InputIdentityDocument as InputIdentityDocument
import qualified TD.Data.InputPersonalDocument as InputPersonalDocument
import qualified TD.Data.PersonalDetails as PersonalDetails
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
      { personal_details = personal_details_
      } =
      "InputPassportElementPersonalDetails"
        ++ U.cc
          [ U.p "personal_details" personal_details_
          ]
  show
    InputPassportElementPassport
      { passport = passport_
      } =
      "InputPassportElementPassport"
        ++ U.cc
          [ U.p "passport" passport_
          ]
  show
    InputPassportElementDriverLicense
      { driver_license = driver_license_
      } =
      "InputPassportElementDriverLicense"
        ++ U.cc
          [ U.p "driver_license" driver_license_
          ]
  show
    InputPassportElementIdentityCard
      { identity_card = identity_card_
      } =
      "InputPassportElementIdentityCard"
        ++ U.cc
          [ U.p "identity_card" identity_card_
          ]
  show
    InputPassportElementInternalPassport
      { internal_passport = internal_passport_
      } =
      "InputPassportElementInternalPassport"
        ++ U.cc
          [ U.p "internal_passport" internal_passport_
          ]
  show
    InputPassportElementAddress
      { address = address_
      } =
      "InputPassportElementAddress"
        ++ U.cc
          [ U.p "address" address_
          ]
  show
    InputPassportElementUtilityBill
      { utility_bill = utility_bill_
      } =
      "InputPassportElementUtilityBill"
        ++ U.cc
          [ U.p "utility_bill" utility_bill_
          ]
  show
    InputPassportElementBankStatement
      { bank_statement = bank_statement_
      } =
      "InputPassportElementBankStatement"
        ++ U.cc
          [ U.p "bank_statement" bank_statement_
          ]
  show
    InputPassportElementRentalAgreement
      { rental_agreement = rental_agreement_
      } =
      "InputPassportElementRentalAgreement"
        ++ U.cc
          [ U.p "rental_agreement" rental_agreement_
          ]
  show
    InputPassportElementPassportRegistration
      { passport_registration = passport_registration_
      } =
      "InputPassportElementPassportRegistration"
        ++ U.cc
          [ U.p "passport_registration" passport_registration_
          ]
  show
    InputPassportElementTemporaryRegistration
      { temporary_registration = temporary_registration_
      } =
      "InputPassportElementTemporaryRegistration"
        ++ U.cc
          [ U.p "temporary_registration" temporary_registration_
          ]
  show
    InputPassportElementPhoneNumber
      { phone_number = phone_number_
      } =
      "InputPassportElementPhoneNumber"
        ++ U.cc
          [ U.p "phone_number" phone_number_
          ]
  show
    InputPassportElementEmailAddress
      { email_address = email_address_
      } =
      "InputPassportElementEmailAddress"
        ++ U.cc
          [ U.p "email_address" email_address_
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
      _ -> mempty
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
  parseJSON _ = mempty

instance T.ToJSON InputPassportElement where
  toJSON
    InputPassportElementPersonalDetails
      { personal_details = personal_details_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementPersonalDetails",
          "personal_details" A..= personal_details_
        ]
  toJSON
    InputPassportElementPassport
      { passport = passport_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementPassport",
          "passport" A..= passport_
        ]
  toJSON
    InputPassportElementDriverLicense
      { driver_license = driver_license_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementDriverLicense",
          "driver_license" A..= driver_license_
        ]
  toJSON
    InputPassportElementIdentityCard
      { identity_card = identity_card_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementIdentityCard",
          "identity_card" A..= identity_card_
        ]
  toJSON
    InputPassportElementInternalPassport
      { internal_passport = internal_passport_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementInternalPassport",
          "internal_passport" A..= internal_passport_
        ]
  toJSON
    InputPassportElementAddress
      { address = address_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementAddress",
          "address" A..= address_
        ]
  toJSON
    InputPassportElementUtilityBill
      { utility_bill = utility_bill_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementUtilityBill",
          "utility_bill" A..= utility_bill_
        ]
  toJSON
    InputPassportElementBankStatement
      { bank_statement = bank_statement_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementBankStatement",
          "bank_statement" A..= bank_statement_
        ]
  toJSON
    InputPassportElementRentalAgreement
      { rental_agreement = rental_agreement_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementRentalAgreement",
          "rental_agreement" A..= rental_agreement_
        ]
  toJSON
    InputPassportElementPassportRegistration
      { passport_registration = passport_registration_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementPassportRegistration",
          "passport_registration" A..= passport_registration_
        ]
  toJSON
    InputPassportElementTemporaryRegistration
      { temporary_registration = temporary_registration_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementTemporaryRegistration",
          "temporary_registration" A..= temporary_registration_
        ]
  toJSON
    InputPassportElementPhoneNumber
      { phone_number = phone_number_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementPhoneNumber",
          "phone_number" A..= phone_number_
        ]
  toJSON
    InputPassportElementEmailAddress
      { email_address = email_address_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementEmailAddress",
          "email_address" A..= email_address_
        ]
