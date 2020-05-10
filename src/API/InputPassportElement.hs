-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputPassportElement where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PersonalDetails as PersonalDetails
import {-# SOURCE #-} qualified API.InputIdentityDocument as InputIdentityDocument
import {-# SOURCE #-} qualified API.Address as Address
import {-# SOURCE #-} qualified API.InputPersonalDocument as InputPersonalDocument

-- |
-- 
-- Contains information about a Telegram Passport element to be saved
data InputPassportElement = 
 -- |
 -- 
 -- A Telegram Passport element to be saved containing the user's personal details 
 -- 
 -- __personal_details__ Personal details of the user
 InputPassportElementPersonalDetails { personal_details :: Maybe PersonalDetails.PersonalDetails }  |
 -- |
 -- 
 -- A Telegram Passport element to be saved containing the user's passport 
 -- 
 -- __passport__ The passport to be saved
 InputPassportElementPassport { passport :: Maybe InputIdentityDocument.InputIdentityDocument }  |
 -- |
 -- 
 -- A Telegram Passport element to be saved containing the user's driver license 
 -- 
 -- __driver_license__ The driver license to be saved
 InputPassportElementDriverLicense { driver_license :: Maybe InputIdentityDocument.InputIdentityDocument }  |
 -- |
 -- 
 -- A Telegram Passport element to be saved containing the user's identity card 
 -- 
 -- __identity_card__ The identity card to be saved
 InputPassportElementIdentityCard { identity_card :: Maybe InputIdentityDocument.InputIdentityDocument }  |
 -- |
 -- 
 -- A Telegram Passport element to be saved containing the user's internal passport 
 -- 
 -- __internal_passport__ The internal passport to be saved
 InputPassportElementInternalPassport { internal_passport :: Maybe InputIdentityDocument.InputIdentityDocument }  |
 -- |
 -- 
 -- A Telegram Passport element to be saved containing the user's address 
 -- 
 -- __address__ The address to be saved
 InputPassportElementAddress { address :: Maybe Address.Address }  |
 -- |
 -- 
 -- A Telegram Passport element to be saved containing the user's utility bill 
 -- 
 -- __utility_bill__ The utility bill to be saved
 InputPassportElementUtilityBill { utility_bill :: Maybe InputPersonalDocument.InputPersonalDocument }  |
 -- |
 -- 
 -- A Telegram Passport element to be saved containing the user's bank statement 
 -- 
 -- __bank_statement__ The bank statement to be saved
 InputPassportElementBankStatement { bank_statement :: Maybe InputPersonalDocument.InputPersonalDocument }  |
 -- |
 -- 
 -- A Telegram Passport element to be saved containing the user's rental agreement 
 -- 
 -- __rental_agreement__ The rental agreement to be saved
 InputPassportElementRentalAgreement { rental_agreement :: Maybe InputPersonalDocument.InputPersonalDocument }  |
 -- |
 -- 
 -- A Telegram Passport element to be saved containing the user's passport registration 
 -- 
 -- __passport_registration__ The passport registration page to be saved
 InputPassportElementPassportRegistration { passport_registration :: Maybe InputPersonalDocument.InputPersonalDocument }  |
 -- |
 -- 
 -- A Telegram Passport element to be saved containing the user's temporary registration 
 -- 
 -- __temporary_registration__ The temporary registration document to be saved
 InputPassportElementTemporaryRegistration { temporary_registration :: Maybe InputPersonalDocument.InputPersonalDocument }  |
 -- |
 -- 
 -- A Telegram Passport element to be saved containing the user's phone number 
 -- 
 -- __phone_number__ The phone number to be saved
 InputPassportElementPhoneNumber { phone_number :: Maybe String }  |
 -- |
 -- 
 -- A Telegram Passport element to be saved containing the user's email address 
 -- 
 -- __email_address__ The email address to be saved
 InputPassportElementEmailAddress { email_address :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON InputPassportElement where
 toJSON (InputPassportElementPersonalDetails { personal_details = personal_details }) =
  A.object [ "@type" A..= T.String "inputPassportElementPersonalDetails", "personal_details" A..= personal_details ]

 toJSON (InputPassportElementPassport { passport = passport }) =
  A.object [ "@type" A..= T.String "inputPassportElementPassport", "passport" A..= passport ]

 toJSON (InputPassportElementDriverLicense { driver_license = driver_license }) =
  A.object [ "@type" A..= T.String "inputPassportElementDriverLicense", "driver_license" A..= driver_license ]

 toJSON (InputPassportElementIdentityCard { identity_card = identity_card }) =
  A.object [ "@type" A..= T.String "inputPassportElementIdentityCard", "identity_card" A..= identity_card ]

 toJSON (InputPassportElementInternalPassport { internal_passport = internal_passport }) =
  A.object [ "@type" A..= T.String "inputPassportElementInternalPassport", "internal_passport" A..= internal_passport ]

 toJSON (InputPassportElementAddress { address = address }) =
  A.object [ "@type" A..= T.String "inputPassportElementAddress", "address" A..= address ]

 toJSON (InputPassportElementUtilityBill { utility_bill = utility_bill }) =
  A.object [ "@type" A..= T.String "inputPassportElementUtilityBill", "utility_bill" A..= utility_bill ]

 toJSON (InputPassportElementBankStatement { bank_statement = bank_statement }) =
  A.object [ "@type" A..= T.String "inputPassportElementBankStatement", "bank_statement" A..= bank_statement ]

 toJSON (InputPassportElementRentalAgreement { rental_agreement = rental_agreement }) =
  A.object [ "@type" A..= T.String "inputPassportElementRentalAgreement", "rental_agreement" A..= rental_agreement ]

 toJSON (InputPassportElementPassportRegistration { passport_registration = passport_registration }) =
  A.object [ "@type" A..= T.String "inputPassportElementPassportRegistration", "passport_registration" A..= passport_registration ]

 toJSON (InputPassportElementTemporaryRegistration { temporary_registration = temporary_registration }) =
  A.object [ "@type" A..= T.String "inputPassportElementTemporaryRegistration", "temporary_registration" A..= temporary_registration ]

 toJSON (InputPassportElementPhoneNumber { phone_number = phone_number }) =
  A.object [ "@type" A..= T.String "inputPassportElementPhoneNumber", "phone_number" A..= phone_number ]

 toJSON (InputPassportElementEmailAddress { email_address = email_address }) =
  A.object [ "@type" A..= T.String "inputPassportElementEmailAddress", "email_address" A..= email_address ]

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
    personal_details <- o A..:? "personal_details"
    return $ InputPassportElementPersonalDetails { personal_details = personal_details }

   parseInputPassportElementPassport :: A.Value -> T.Parser InputPassportElement
   parseInputPassportElementPassport = A.withObject "InputPassportElementPassport" $ \o -> do
    passport <- o A..:? "passport"
    return $ InputPassportElementPassport { passport = passport }

   parseInputPassportElementDriverLicense :: A.Value -> T.Parser InputPassportElement
   parseInputPassportElementDriverLicense = A.withObject "InputPassportElementDriverLicense" $ \o -> do
    driver_license <- o A..:? "driver_license"
    return $ InputPassportElementDriverLicense { driver_license = driver_license }

   parseInputPassportElementIdentityCard :: A.Value -> T.Parser InputPassportElement
   parseInputPassportElementIdentityCard = A.withObject "InputPassportElementIdentityCard" $ \o -> do
    identity_card <- o A..:? "identity_card"
    return $ InputPassportElementIdentityCard { identity_card = identity_card }

   parseInputPassportElementInternalPassport :: A.Value -> T.Parser InputPassportElement
   parseInputPassportElementInternalPassport = A.withObject "InputPassportElementInternalPassport" $ \o -> do
    internal_passport <- o A..:? "internal_passport"
    return $ InputPassportElementInternalPassport { internal_passport = internal_passport }

   parseInputPassportElementAddress :: A.Value -> T.Parser InputPassportElement
   parseInputPassportElementAddress = A.withObject "InputPassportElementAddress" $ \o -> do
    address <- o A..:? "address"
    return $ InputPassportElementAddress { address = address }

   parseInputPassportElementUtilityBill :: A.Value -> T.Parser InputPassportElement
   parseInputPassportElementUtilityBill = A.withObject "InputPassportElementUtilityBill" $ \o -> do
    utility_bill <- o A..:? "utility_bill"
    return $ InputPassportElementUtilityBill { utility_bill = utility_bill }

   parseInputPassportElementBankStatement :: A.Value -> T.Parser InputPassportElement
   parseInputPassportElementBankStatement = A.withObject "InputPassportElementBankStatement" $ \o -> do
    bank_statement <- o A..:? "bank_statement"
    return $ InputPassportElementBankStatement { bank_statement = bank_statement }

   parseInputPassportElementRentalAgreement :: A.Value -> T.Parser InputPassportElement
   parseInputPassportElementRentalAgreement = A.withObject "InputPassportElementRentalAgreement" $ \o -> do
    rental_agreement <- o A..:? "rental_agreement"
    return $ InputPassportElementRentalAgreement { rental_agreement = rental_agreement }

   parseInputPassportElementPassportRegistration :: A.Value -> T.Parser InputPassportElement
   parseInputPassportElementPassportRegistration = A.withObject "InputPassportElementPassportRegistration" $ \o -> do
    passport_registration <- o A..:? "passport_registration"
    return $ InputPassportElementPassportRegistration { passport_registration = passport_registration }

   parseInputPassportElementTemporaryRegistration :: A.Value -> T.Parser InputPassportElement
   parseInputPassportElementTemporaryRegistration = A.withObject "InputPassportElementTemporaryRegistration" $ \o -> do
    temporary_registration <- o A..:? "temporary_registration"
    return $ InputPassportElementTemporaryRegistration { temporary_registration = temporary_registration }

   parseInputPassportElementPhoneNumber :: A.Value -> T.Parser InputPassportElement
   parseInputPassportElementPhoneNumber = A.withObject "InputPassportElementPhoneNumber" $ \o -> do
    phone_number <- o A..:? "phone_number"
    return $ InputPassportElementPhoneNumber { phone_number = phone_number }

   parseInputPassportElementEmailAddress :: A.Value -> T.Parser InputPassportElement
   parseInputPassportElementEmailAddress = A.withObject "InputPassportElementEmailAddress" $ \o -> do
    email_address <- o A..:? "email_address"
    return $ InputPassportElementEmailAddress { email_address = email_address }