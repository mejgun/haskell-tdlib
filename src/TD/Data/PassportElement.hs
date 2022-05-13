{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Address as Address
import qualified TD.Data.IdentityDocument as IdentityDocument
import qualified TD.Data.PersonalDetails as PersonalDetails
import qualified TD.Data.PersonalDocument as PersonalDocument
import qualified Utils as U

-- | Contains information about a Telegram Passport element
data PassportElement
  = -- | A Telegram Passport element containing the user's personal details @personal_details Personal details of the user
    PassportElementPersonalDetails
      { -- |
        personal_details :: Maybe PersonalDetails.PersonalDetails
      }
  | -- | A Telegram Passport element containing the user's passport @passport Passport
    PassportElementPassport
      { -- |
        passport :: Maybe IdentityDocument.IdentityDocument
      }
  | -- | A Telegram Passport element containing the user's driver license @driver_license Driver license
    PassportElementDriverLicense
      { -- |
        driver_license :: Maybe IdentityDocument.IdentityDocument
      }
  | -- | A Telegram Passport element containing the user's identity card @identity_card Identity card
    PassportElementIdentityCard
      { -- |
        identity_card :: Maybe IdentityDocument.IdentityDocument
      }
  | -- | A Telegram Passport element containing the user's internal passport @internal_passport Internal passport
    PassportElementInternalPassport
      { -- |
        internal_passport :: Maybe IdentityDocument.IdentityDocument
      }
  | -- | A Telegram Passport element containing the user's address @address Address
    PassportElementAddress
      { -- |
        address :: Maybe Address.Address
      }
  | -- | A Telegram Passport element containing the user's utility bill @utility_bill Utility bill
    PassportElementUtilityBill
      { -- |
        utility_bill :: Maybe PersonalDocument.PersonalDocument
      }
  | -- | A Telegram Passport element containing the user's bank statement @bank_statement Bank statement
    PassportElementBankStatement
      { -- |
        bank_statement :: Maybe PersonalDocument.PersonalDocument
      }
  | -- | A Telegram Passport element containing the user's rental agreement @rental_agreement Rental agreement
    PassportElementRentalAgreement
      { -- |
        rental_agreement :: Maybe PersonalDocument.PersonalDocument
      }
  | -- | A Telegram Passport element containing the user's passport registration pages @passport_registration Passport registration pages
    PassportElementPassportRegistration
      { -- |
        passport_registration :: Maybe PersonalDocument.PersonalDocument
      }
  | -- | A Telegram Passport element containing the user's temporary registration @temporary_registration Temporary registration
    PassportElementTemporaryRegistration
      { -- |
        temporary_registration :: Maybe PersonalDocument.PersonalDocument
      }
  | -- | A Telegram Passport element containing the user's phone number @phone_number Phone number
    PassportElementPhoneNumber
      { -- |
        phone_number :: Maybe String
      }
  | -- | A Telegram Passport element containing the user's email address @email_address Email address
    PassportElementEmailAddress
      { -- |
        email_address :: Maybe String
      }
  deriving (Eq)

instance Show PassportElement where
  show
    PassportElementPersonalDetails
      { personal_details = personal_details_
      } =
      "PassportElementPersonalDetails"
        ++ U.cc
          [ U.p "personal_details" personal_details_
          ]
  show
    PassportElementPassport
      { passport = passport_
      } =
      "PassportElementPassport"
        ++ U.cc
          [ U.p "passport" passport_
          ]
  show
    PassportElementDriverLicense
      { driver_license = driver_license_
      } =
      "PassportElementDriverLicense"
        ++ U.cc
          [ U.p "driver_license" driver_license_
          ]
  show
    PassportElementIdentityCard
      { identity_card = identity_card_
      } =
      "PassportElementIdentityCard"
        ++ U.cc
          [ U.p "identity_card" identity_card_
          ]
  show
    PassportElementInternalPassport
      { internal_passport = internal_passport_
      } =
      "PassportElementInternalPassport"
        ++ U.cc
          [ U.p "internal_passport" internal_passport_
          ]
  show
    PassportElementAddress
      { address = address_
      } =
      "PassportElementAddress"
        ++ U.cc
          [ U.p "address" address_
          ]
  show
    PassportElementUtilityBill
      { utility_bill = utility_bill_
      } =
      "PassportElementUtilityBill"
        ++ U.cc
          [ U.p "utility_bill" utility_bill_
          ]
  show
    PassportElementBankStatement
      { bank_statement = bank_statement_
      } =
      "PassportElementBankStatement"
        ++ U.cc
          [ U.p "bank_statement" bank_statement_
          ]
  show
    PassportElementRentalAgreement
      { rental_agreement = rental_agreement_
      } =
      "PassportElementRentalAgreement"
        ++ U.cc
          [ U.p "rental_agreement" rental_agreement_
          ]
  show
    PassportElementPassportRegistration
      { passport_registration = passport_registration_
      } =
      "PassportElementPassportRegistration"
        ++ U.cc
          [ U.p "passport_registration" passport_registration_
          ]
  show
    PassportElementTemporaryRegistration
      { temporary_registration = temporary_registration_
      } =
      "PassportElementTemporaryRegistration"
        ++ U.cc
          [ U.p "temporary_registration" temporary_registration_
          ]
  show
    PassportElementPhoneNumber
      { phone_number = phone_number_
      } =
      "PassportElementPhoneNumber"
        ++ U.cc
          [ U.p "phone_number" phone_number_
          ]
  show
    PassportElementEmailAddress
      { email_address = email_address_
      } =
      "PassportElementEmailAddress"
        ++ U.cc
          [ U.p "email_address" email_address_
          ]

instance T.FromJSON PassportElement where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "passportElementPersonalDetails" -> parsePassportElementPersonalDetails v
      "passportElementPassport" -> parsePassportElementPassport v
      "passportElementDriverLicense" -> parsePassportElementDriverLicense v
      "passportElementIdentityCard" -> parsePassportElementIdentityCard v
      "passportElementInternalPassport" -> parsePassportElementInternalPassport v
      "passportElementAddress" -> parsePassportElementAddress v
      "passportElementUtilityBill" -> parsePassportElementUtilityBill v
      "passportElementBankStatement" -> parsePassportElementBankStatement v
      "passportElementRentalAgreement" -> parsePassportElementRentalAgreement v
      "passportElementPassportRegistration" -> parsePassportElementPassportRegistration v
      "passportElementTemporaryRegistration" -> parsePassportElementTemporaryRegistration v
      "passportElementPhoneNumber" -> parsePassportElementPhoneNumber v
      "passportElementEmailAddress" -> parsePassportElementEmailAddress v
      _ -> mempty
    where
      parsePassportElementPersonalDetails :: A.Value -> T.Parser PassportElement
      parsePassportElementPersonalDetails = A.withObject "PassportElementPersonalDetails" $ \o -> do
        personal_details_ <- o A..:? "personal_details"
        return $ PassportElementPersonalDetails {personal_details = personal_details_}

      parsePassportElementPassport :: A.Value -> T.Parser PassportElement
      parsePassportElementPassport = A.withObject "PassportElementPassport" $ \o -> do
        passport_ <- o A..:? "passport"
        return $ PassportElementPassport {passport = passport_}

      parsePassportElementDriverLicense :: A.Value -> T.Parser PassportElement
      parsePassportElementDriverLicense = A.withObject "PassportElementDriverLicense" $ \o -> do
        driver_license_ <- o A..:? "driver_license"
        return $ PassportElementDriverLicense {driver_license = driver_license_}

      parsePassportElementIdentityCard :: A.Value -> T.Parser PassportElement
      parsePassportElementIdentityCard = A.withObject "PassportElementIdentityCard" $ \o -> do
        identity_card_ <- o A..:? "identity_card"
        return $ PassportElementIdentityCard {identity_card = identity_card_}

      parsePassportElementInternalPassport :: A.Value -> T.Parser PassportElement
      parsePassportElementInternalPassport = A.withObject "PassportElementInternalPassport" $ \o -> do
        internal_passport_ <- o A..:? "internal_passport"
        return $ PassportElementInternalPassport {internal_passport = internal_passport_}

      parsePassportElementAddress :: A.Value -> T.Parser PassportElement
      parsePassportElementAddress = A.withObject "PassportElementAddress" $ \o -> do
        address_ <- o A..:? "address"
        return $ PassportElementAddress {address = address_}

      parsePassportElementUtilityBill :: A.Value -> T.Parser PassportElement
      parsePassportElementUtilityBill = A.withObject "PassportElementUtilityBill" $ \o -> do
        utility_bill_ <- o A..:? "utility_bill"
        return $ PassportElementUtilityBill {utility_bill = utility_bill_}

      parsePassportElementBankStatement :: A.Value -> T.Parser PassportElement
      parsePassportElementBankStatement = A.withObject "PassportElementBankStatement" $ \o -> do
        bank_statement_ <- o A..:? "bank_statement"
        return $ PassportElementBankStatement {bank_statement = bank_statement_}

      parsePassportElementRentalAgreement :: A.Value -> T.Parser PassportElement
      parsePassportElementRentalAgreement = A.withObject "PassportElementRentalAgreement" $ \o -> do
        rental_agreement_ <- o A..:? "rental_agreement"
        return $ PassportElementRentalAgreement {rental_agreement = rental_agreement_}

      parsePassportElementPassportRegistration :: A.Value -> T.Parser PassportElement
      parsePassportElementPassportRegistration = A.withObject "PassportElementPassportRegistration" $ \o -> do
        passport_registration_ <- o A..:? "passport_registration"
        return $ PassportElementPassportRegistration {passport_registration = passport_registration_}

      parsePassportElementTemporaryRegistration :: A.Value -> T.Parser PassportElement
      parsePassportElementTemporaryRegistration = A.withObject "PassportElementTemporaryRegistration" $ \o -> do
        temporary_registration_ <- o A..:? "temporary_registration"
        return $ PassportElementTemporaryRegistration {temporary_registration = temporary_registration_}

      parsePassportElementPhoneNumber :: A.Value -> T.Parser PassportElement
      parsePassportElementPhoneNumber = A.withObject "PassportElementPhoneNumber" $ \o -> do
        phone_number_ <- o A..:? "phone_number"
        return $ PassportElementPhoneNumber {phone_number = phone_number_}

      parsePassportElementEmailAddress :: A.Value -> T.Parser PassportElement
      parsePassportElementEmailAddress = A.withObject "PassportElementEmailAddress" $ \o -> do
        email_address_ <- o A..:? "email_address"
        return $ PassportElementEmailAddress {email_address = email_address_}
  parseJSON _ = mempty

instance T.ToJSON PassportElement where
  toJSON
    PassportElementPersonalDetails
      { personal_details = personal_details_
      } =
      A.object
        [ "@type" A..= T.String "passportElementPersonalDetails",
          "personal_details" A..= personal_details_
        ]
  toJSON
    PassportElementPassport
      { passport = passport_
      } =
      A.object
        [ "@type" A..= T.String "passportElementPassport",
          "passport" A..= passport_
        ]
  toJSON
    PassportElementDriverLicense
      { driver_license = driver_license_
      } =
      A.object
        [ "@type" A..= T.String "passportElementDriverLicense",
          "driver_license" A..= driver_license_
        ]
  toJSON
    PassportElementIdentityCard
      { identity_card = identity_card_
      } =
      A.object
        [ "@type" A..= T.String "passportElementIdentityCard",
          "identity_card" A..= identity_card_
        ]
  toJSON
    PassportElementInternalPassport
      { internal_passport = internal_passport_
      } =
      A.object
        [ "@type" A..= T.String "passportElementInternalPassport",
          "internal_passport" A..= internal_passport_
        ]
  toJSON
    PassportElementAddress
      { address = address_
      } =
      A.object
        [ "@type" A..= T.String "passportElementAddress",
          "address" A..= address_
        ]
  toJSON
    PassportElementUtilityBill
      { utility_bill = utility_bill_
      } =
      A.object
        [ "@type" A..= T.String "passportElementUtilityBill",
          "utility_bill" A..= utility_bill_
        ]
  toJSON
    PassportElementBankStatement
      { bank_statement = bank_statement_
      } =
      A.object
        [ "@type" A..= T.String "passportElementBankStatement",
          "bank_statement" A..= bank_statement_
        ]
  toJSON
    PassportElementRentalAgreement
      { rental_agreement = rental_agreement_
      } =
      A.object
        [ "@type" A..= T.String "passportElementRentalAgreement",
          "rental_agreement" A..= rental_agreement_
        ]
  toJSON
    PassportElementPassportRegistration
      { passport_registration = passport_registration_
      } =
      A.object
        [ "@type" A..= T.String "passportElementPassportRegistration",
          "passport_registration" A..= passport_registration_
        ]
  toJSON
    PassportElementTemporaryRegistration
      { temporary_registration = temporary_registration_
      } =
      A.object
        [ "@type" A..= T.String "passportElementTemporaryRegistration",
          "temporary_registration" A..= temporary_registration_
        ]
  toJSON
    PassportElementPhoneNumber
      { phone_number = phone_number_
      } =
      A.object
        [ "@type" A..= T.String "passportElementPhoneNumber",
          "phone_number" A..= phone_number_
        ]
  toJSON
    PassportElementEmailAddress
      { email_address = email_address_
      } =
      A.object
        [ "@type" A..= T.String "passportElementEmailAddress",
          "email_address" A..= email_address_
        ]
