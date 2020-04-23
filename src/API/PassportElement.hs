-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportElement where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PersonalDetails as PersonalDetails
import {-# SOURCE #-} qualified API.IdentityDocument as IdentityDocument
import {-# SOURCE #-} qualified API.Address as Address
import {-# SOURCE #-} qualified API.PersonalDocument as PersonalDocument

data PassportElement = 
 PassportElementPersonalDetails { personal_details :: Maybe PersonalDetails.PersonalDetails }  
 | PassportElementPassport { passport :: Maybe IdentityDocument.IdentityDocument }  
 | PassportElementDriverLicense { driver_license :: Maybe IdentityDocument.IdentityDocument }  
 | PassportElementIdentityCard { identity_card :: Maybe IdentityDocument.IdentityDocument }  
 | PassportElementInternalPassport { internal_passport :: Maybe IdentityDocument.IdentityDocument }  
 | PassportElementAddress { address :: Maybe Address.Address }  
 | PassportElementUtilityBill { utility_bill :: Maybe PersonalDocument.PersonalDocument }  
 | PassportElementBankStatement { bank_statement :: Maybe PersonalDocument.PersonalDocument }  
 | PassportElementRentalAgreement { rental_agreement :: Maybe PersonalDocument.PersonalDocument }  
 | PassportElementPassportRegistration { passport_registration :: Maybe PersonalDocument.PersonalDocument }  
 | PassportElementTemporaryRegistration { temporary_registration :: Maybe PersonalDocument.PersonalDocument }  
 | PassportElementPhoneNumber { phone_number :: Maybe String }  
 | PassportElementEmailAddress { email_address :: Maybe String }  deriving (Show)

instance T.ToJSON PassportElement where
 toJSON (PassportElementPersonalDetails { personal_details = personal_details }) =
  A.object [ "@type" A..= T.String "passportElementPersonalDetails", "personal_details" A..= personal_details ]

 toJSON (PassportElementPassport { passport = passport }) =
  A.object [ "@type" A..= T.String "passportElementPassport", "passport" A..= passport ]

 toJSON (PassportElementDriverLicense { driver_license = driver_license }) =
  A.object [ "@type" A..= T.String "passportElementDriverLicense", "driver_license" A..= driver_license ]

 toJSON (PassportElementIdentityCard { identity_card = identity_card }) =
  A.object [ "@type" A..= T.String "passportElementIdentityCard", "identity_card" A..= identity_card ]

 toJSON (PassportElementInternalPassport { internal_passport = internal_passport }) =
  A.object [ "@type" A..= T.String "passportElementInternalPassport", "internal_passport" A..= internal_passport ]

 toJSON (PassportElementAddress { address = address }) =
  A.object [ "@type" A..= T.String "passportElementAddress", "address" A..= address ]

 toJSON (PassportElementUtilityBill { utility_bill = utility_bill }) =
  A.object [ "@type" A..= T.String "passportElementUtilityBill", "utility_bill" A..= utility_bill ]

 toJSON (PassportElementBankStatement { bank_statement = bank_statement }) =
  A.object [ "@type" A..= T.String "passportElementBankStatement", "bank_statement" A..= bank_statement ]

 toJSON (PassportElementRentalAgreement { rental_agreement = rental_agreement }) =
  A.object [ "@type" A..= T.String "passportElementRentalAgreement", "rental_agreement" A..= rental_agreement ]

 toJSON (PassportElementPassportRegistration { passport_registration = passport_registration }) =
  A.object [ "@type" A..= T.String "passportElementPassportRegistration", "passport_registration" A..= passport_registration ]

 toJSON (PassportElementTemporaryRegistration { temporary_registration = temporary_registration }) =
  A.object [ "@type" A..= T.String "passportElementTemporaryRegistration", "temporary_registration" A..= temporary_registration ]

 toJSON (PassportElementPhoneNumber { phone_number = phone_number }) =
  A.object [ "@type" A..= T.String "passportElementPhoneNumber", "phone_number" A..= phone_number ]

 toJSON (PassportElementEmailAddress { email_address = email_address }) =
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
    personal_details <- optional $ o A..: "personal_details"
    return $ PassportElementPersonalDetails { personal_details = personal_details }

   parsePassportElementPassport :: A.Value -> T.Parser PassportElement
   parsePassportElementPassport = A.withObject "PassportElementPassport" $ \o -> do
    passport <- optional $ o A..: "passport"
    return $ PassportElementPassport { passport = passport }

   parsePassportElementDriverLicense :: A.Value -> T.Parser PassportElement
   parsePassportElementDriverLicense = A.withObject "PassportElementDriverLicense" $ \o -> do
    driver_license <- optional $ o A..: "driver_license"
    return $ PassportElementDriverLicense { driver_license = driver_license }

   parsePassportElementIdentityCard :: A.Value -> T.Parser PassportElement
   parsePassportElementIdentityCard = A.withObject "PassportElementIdentityCard" $ \o -> do
    identity_card <- optional $ o A..: "identity_card"
    return $ PassportElementIdentityCard { identity_card = identity_card }

   parsePassportElementInternalPassport :: A.Value -> T.Parser PassportElement
   parsePassportElementInternalPassport = A.withObject "PassportElementInternalPassport" $ \o -> do
    internal_passport <- optional $ o A..: "internal_passport"
    return $ PassportElementInternalPassport { internal_passport = internal_passport }

   parsePassportElementAddress :: A.Value -> T.Parser PassportElement
   parsePassportElementAddress = A.withObject "PassportElementAddress" $ \o -> do
    address <- optional $ o A..: "address"
    return $ PassportElementAddress { address = address }

   parsePassportElementUtilityBill :: A.Value -> T.Parser PassportElement
   parsePassportElementUtilityBill = A.withObject "PassportElementUtilityBill" $ \o -> do
    utility_bill <- optional $ o A..: "utility_bill"
    return $ PassportElementUtilityBill { utility_bill = utility_bill }

   parsePassportElementBankStatement :: A.Value -> T.Parser PassportElement
   parsePassportElementBankStatement = A.withObject "PassportElementBankStatement" $ \o -> do
    bank_statement <- optional $ o A..: "bank_statement"
    return $ PassportElementBankStatement { bank_statement = bank_statement }

   parsePassportElementRentalAgreement :: A.Value -> T.Parser PassportElement
   parsePassportElementRentalAgreement = A.withObject "PassportElementRentalAgreement" $ \o -> do
    rental_agreement <- optional $ o A..: "rental_agreement"
    return $ PassportElementRentalAgreement { rental_agreement = rental_agreement }

   parsePassportElementPassportRegistration :: A.Value -> T.Parser PassportElement
   parsePassportElementPassportRegistration = A.withObject "PassportElementPassportRegistration" $ \o -> do
    passport_registration <- optional $ o A..: "passport_registration"
    return $ PassportElementPassportRegistration { passport_registration = passport_registration }

   parsePassportElementTemporaryRegistration :: A.Value -> T.Parser PassportElement
   parsePassportElementTemporaryRegistration = A.withObject "PassportElementTemporaryRegistration" $ \o -> do
    temporary_registration <- optional $ o A..: "temporary_registration"
    return $ PassportElementTemporaryRegistration { temporary_registration = temporary_registration }

   parsePassportElementPhoneNumber :: A.Value -> T.Parser PassportElement
   parsePassportElementPhoneNumber = A.withObject "PassportElementPhoneNumber" $ \o -> do
    phone_number <- optional $ o A..: "phone_number"
    return $ PassportElementPhoneNumber { phone_number = phone_number }

   parsePassportElementEmailAddress :: A.Value -> T.Parser PassportElement
   parsePassportElementEmailAddress = A.withObject "PassportElementEmailAddress" $ \o -> do
    email_address <- optional $ o A..: "email_address"
    return $ PassportElementEmailAddress { email_address = email_address }