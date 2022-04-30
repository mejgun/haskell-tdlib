-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportElement where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.PersonalDetails as PersonalDetails
import {-# SOURCE #-} qualified API.IdentityDocument as IdentityDocument
import {-# SOURCE #-} qualified API.Address as Address
import {-# SOURCE #-} qualified API.PersonalDocument as PersonalDocument

-- |
-- 
-- Contains information about a Telegram Passport element
data PassportElement = 
 -- |
 -- 
 -- A Telegram Passport element containing the user's personal details 
 -- 
 -- __personal_details__ Personal details of the user
 PassportElementPersonalDetails { personal_details :: Maybe PersonalDetails.PersonalDetails }  |
 -- |
 -- 
 -- A Telegram Passport element containing the user's passport 
 -- 
 -- __passport__ Passport
 PassportElementPassport { passport :: Maybe IdentityDocument.IdentityDocument }  |
 -- |
 -- 
 -- A Telegram Passport element containing the user's driver license 
 -- 
 -- __driver_license__ Driver license
 PassportElementDriverLicense { driver_license :: Maybe IdentityDocument.IdentityDocument }  |
 -- |
 -- 
 -- A Telegram Passport element containing the user's identity card 
 -- 
 -- __identity_card__ Identity card
 PassportElementIdentityCard { identity_card :: Maybe IdentityDocument.IdentityDocument }  |
 -- |
 -- 
 -- A Telegram Passport element containing the user's internal passport 
 -- 
 -- __internal_passport__ Internal passport
 PassportElementInternalPassport { internal_passport :: Maybe IdentityDocument.IdentityDocument }  |
 -- |
 -- 
 -- A Telegram Passport element containing the user's address 
 -- 
 -- __address__ Address
 PassportElementAddress { address :: Maybe Address.Address }  |
 -- |
 -- 
 -- A Telegram Passport element containing the user's utility bill 
 -- 
 -- __utility_bill__ Utility bill
 PassportElementUtilityBill { utility_bill :: Maybe PersonalDocument.PersonalDocument }  |
 -- |
 -- 
 -- A Telegram Passport element containing the user's bank statement 
 -- 
 -- __bank_statement__ Bank statement
 PassportElementBankStatement { bank_statement :: Maybe PersonalDocument.PersonalDocument }  |
 -- |
 -- 
 -- A Telegram Passport element containing the user's rental agreement 
 -- 
 -- __rental_agreement__ Rental agreement
 PassportElementRentalAgreement { rental_agreement :: Maybe PersonalDocument.PersonalDocument }  |
 -- |
 -- 
 -- A Telegram Passport element containing the user's passport registration pages 
 -- 
 -- __passport_registration__ Passport registration pages
 PassportElementPassportRegistration { passport_registration :: Maybe PersonalDocument.PersonalDocument }  |
 -- |
 -- 
 -- A Telegram Passport element containing the user's temporary registration 
 -- 
 -- __temporary_registration__ Temporary registration
 PassportElementTemporaryRegistration { temporary_registration :: Maybe PersonalDocument.PersonalDocument }  |
 -- |
 -- 
 -- A Telegram Passport element containing the user's phone number 
 -- 
 -- __phone_number__ Phone number
 PassportElementPhoneNumber { phone_number :: Maybe String }  |
 -- |
 -- 
 -- A Telegram Passport element containing the user's email address 
 -- 
 -- __email_address__ Email address
 PassportElementEmailAddress { email_address :: Maybe String }  deriving (Eq)

instance Show PassportElement where
 show PassportElementPersonalDetails { personal_details=personal_details } =
  "PassportElementPersonalDetails" ++ U.cc [U.p "personal_details" personal_details ]

 show PassportElementPassport { passport=passport } =
  "PassportElementPassport" ++ U.cc [U.p "passport" passport ]

 show PassportElementDriverLicense { driver_license=driver_license } =
  "PassportElementDriverLicense" ++ U.cc [U.p "driver_license" driver_license ]

 show PassportElementIdentityCard { identity_card=identity_card } =
  "PassportElementIdentityCard" ++ U.cc [U.p "identity_card" identity_card ]

 show PassportElementInternalPassport { internal_passport=internal_passport } =
  "PassportElementInternalPassport" ++ U.cc [U.p "internal_passport" internal_passport ]

 show PassportElementAddress { address=address } =
  "PassportElementAddress" ++ U.cc [U.p "address" address ]

 show PassportElementUtilityBill { utility_bill=utility_bill } =
  "PassportElementUtilityBill" ++ U.cc [U.p "utility_bill" utility_bill ]

 show PassportElementBankStatement { bank_statement=bank_statement } =
  "PassportElementBankStatement" ++ U.cc [U.p "bank_statement" bank_statement ]

 show PassportElementRentalAgreement { rental_agreement=rental_agreement } =
  "PassportElementRentalAgreement" ++ U.cc [U.p "rental_agreement" rental_agreement ]

 show PassportElementPassportRegistration { passport_registration=passport_registration } =
  "PassportElementPassportRegistration" ++ U.cc [U.p "passport_registration" passport_registration ]

 show PassportElementTemporaryRegistration { temporary_registration=temporary_registration } =
  "PassportElementTemporaryRegistration" ++ U.cc [U.p "temporary_registration" temporary_registration ]

 show PassportElementPhoneNumber { phone_number=phone_number } =
  "PassportElementPhoneNumber" ++ U.cc [U.p "phone_number" phone_number ]

 show PassportElementEmailAddress { email_address=email_address } =
  "PassportElementEmailAddress" ++ U.cc [U.p "email_address" email_address ]

instance T.ToJSON PassportElement where
 toJSON PassportElementPersonalDetails { personal_details = personal_details } =
  A.object [ "@type" A..= T.String "passportElementPersonalDetails", "personal_details" A..= personal_details ]

 toJSON PassportElementPassport { passport = passport } =
  A.object [ "@type" A..= T.String "passportElementPassport", "passport" A..= passport ]

 toJSON PassportElementDriverLicense { driver_license = driver_license } =
  A.object [ "@type" A..= T.String "passportElementDriverLicense", "driver_license" A..= driver_license ]

 toJSON PassportElementIdentityCard { identity_card = identity_card } =
  A.object [ "@type" A..= T.String "passportElementIdentityCard", "identity_card" A..= identity_card ]

 toJSON PassportElementInternalPassport { internal_passport = internal_passport } =
  A.object [ "@type" A..= T.String "passportElementInternalPassport", "internal_passport" A..= internal_passport ]

 toJSON PassportElementAddress { address = address } =
  A.object [ "@type" A..= T.String "passportElementAddress", "address" A..= address ]

 toJSON PassportElementUtilityBill { utility_bill = utility_bill } =
  A.object [ "@type" A..= T.String "passportElementUtilityBill", "utility_bill" A..= utility_bill ]

 toJSON PassportElementBankStatement { bank_statement = bank_statement } =
  A.object [ "@type" A..= T.String "passportElementBankStatement", "bank_statement" A..= bank_statement ]

 toJSON PassportElementRentalAgreement { rental_agreement = rental_agreement } =
  A.object [ "@type" A..= T.String "passportElementRentalAgreement", "rental_agreement" A..= rental_agreement ]

 toJSON PassportElementPassportRegistration { passport_registration = passport_registration } =
  A.object [ "@type" A..= T.String "passportElementPassportRegistration", "passport_registration" A..= passport_registration ]

 toJSON PassportElementTemporaryRegistration { temporary_registration = temporary_registration } =
  A.object [ "@type" A..= T.String "passportElementTemporaryRegistration", "temporary_registration" A..= temporary_registration ]

 toJSON PassportElementPhoneNumber { phone_number = phone_number } =
  A.object [ "@type" A..= T.String "passportElementPhoneNumber", "phone_number" A..= phone_number ]

 toJSON PassportElementEmailAddress { email_address = email_address } =
  A.object [ "@type" A..= T.String "passportElementEmailAddress", "email_address" A..= email_address ]

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
    personal_details <- o A..:? "personal_details"
    return $ PassportElementPersonalDetails { personal_details = personal_details }

   parsePassportElementPassport :: A.Value -> T.Parser PassportElement
   parsePassportElementPassport = A.withObject "PassportElementPassport" $ \o -> do
    passport <- o A..:? "passport"
    return $ PassportElementPassport { passport = passport }

   parsePassportElementDriverLicense :: A.Value -> T.Parser PassportElement
   parsePassportElementDriverLicense = A.withObject "PassportElementDriverLicense" $ \o -> do
    driver_license <- o A..:? "driver_license"
    return $ PassportElementDriverLicense { driver_license = driver_license }

   parsePassportElementIdentityCard :: A.Value -> T.Parser PassportElement
   parsePassportElementIdentityCard = A.withObject "PassportElementIdentityCard" $ \o -> do
    identity_card <- o A..:? "identity_card"
    return $ PassportElementIdentityCard { identity_card = identity_card }

   parsePassportElementInternalPassport :: A.Value -> T.Parser PassportElement
   parsePassportElementInternalPassport = A.withObject "PassportElementInternalPassport" $ \o -> do
    internal_passport <- o A..:? "internal_passport"
    return $ PassportElementInternalPassport { internal_passport = internal_passport }

   parsePassportElementAddress :: A.Value -> T.Parser PassportElement
   parsePassportElementAddress = A.withObject "PassportElementAddress" $ \o -> do
    address <- o A..:? "address"
    return $ PassportElementAddress { address = address }

   parsePassportElementUtilityBill :: A.Value -> T.Parser PassportElement
   parsePassportElementUtilityBill = A.withObject "PassportElementUtilityBill" $ \o -> do
    utility_bill <- o A..:? "utility_bill"
    return $ PassportElementUtilityBill { utility_bill = utility_bill }

   parsePassportElementBankStatement :: A.Value -> T.Parser PassportElement
   parsePassportElementBankStatement = A.withObject "PassportElementBankStatement" $ \o -> do
    bank_statement <- o A..:? "bank_statement"
    return $ PassportElementBankStatement { bank_statement = bank_statement }

   parsePassportElementRentalAgreement :: A.Value -> T.Parser PassportElement
   parsePassportElementRentalAgreement = A.withObject "PassportElementRentalAgreement" $ \o -> do
    rental_agreement <- o A..:? "rental_agreement"
    return $ PassportElementRentalAgreement { rental_agreement = rental_agreement }

   parsePassportElementPassportRegistration :: A.Value -> T.Parser PassportElement
   parsePassportElementPassportRegistration = A.withObject "PassportElementPassportRegistration" $ \o -> do
    passport_registration <- o A..:? "passport_registration"
    return $ PassportElementPassportRegistration { passport_registration = passport_registration }

   parsePassportElementTemporaryRegistration :: A.Value -> T.Parser PassportElement
   parsePassportElementTemporaryRegistration = A.withObject "PassportElementTemporaryRegistration" $ \o -> do
    temporary_registration <- o A..:? "temporary_registration"
    return $ PassportElementTemporaryRegistration { temporary_registration = temporary_registration }

   parsePassportElementPhoneNumber :: A.Value -> T.Parser PassportElement
   parsePassportElementPhoneNumber = A.withObject "PassportElementPhoneNumber" $ \o -> do
    phone_number <- o A..:? "phone_number"
    return $ PassportElementPhoneNumber { phone_number = phone_number }

   parsePassportElementEmailAddress :: A.Value -> T.Parser PassportElement
   parsePassportElementEmailAddress = A.withObject "PassportElementEmailAddress" $ \o -> do
    email_address <- o A..:? "email_address"
    return $ PassportElementEmailAddress { email_address = email_address }
 parseJSON _ = mempty
