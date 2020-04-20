-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PersonalDetails as PersonalDetails
import {-# SOURCE #-} qualified API.IdentityDocument as IdentityDocument
import {-# SOURCE #-} qualified API.Address as Address
import {-# SOURCE #-} qualified API.PersonalDocument as PersonalDocument

--main = putStrLn "ok"

data PassportElement = 
 PassportElementPersonalDetails { personal_details :: PersonalDetails.PersonalDetails }  
 | PassportElementPassport { passport :: IdentityDocument.IdentityDocument }  
 | PassportElementDriverLicense { driver_license :: IdentityDocument.IdentityDocument }  
 | PassportElementIdentityCard { identity_card :: IdentityDocument.IdentityDocument }  
 | PassportElementInternalPassport { internal_passport :: IdentityDocument.IdentityDocument }  
 | PassportElementAddress { address :: Address.Address }  
 | PassportElementUtilityBill { utility_bill :: PersonalDocument.PersonalDocument }  
 | PassportElementBankStatement { bank_statement :: PersonalDocument.PersonalDocument }  
 | PassportElementRentalAgreement { rental_agreement :: PersonalDocument.PersonalDocument }  
 | PassportElementPassportRegistration { passport_registration :: PersonalDocument.PersonalDocument }  
 | PassportElementTemporaryRegistration { temporary_registration :: PersonalDocument.PersonalDocument }  
 | PassportElementPhoneNumber { phone_number :: String }  
 | PassportElementEmailAddress { email_address :: String }  -- deriving (Show)

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
-- passportElementPersonalDetails PassportElement  { personal_details :: PersonalDetails.PersonalDetails } 

-- passportElementPassport PassportElement  { passport :: IdentityDocument.IdentityDocument } 

-- passportElementDriverLicense PassportElement  { driver_license :: IdentityDocument.IdentityDocument } 

-- passportElementIdentityCard PassportElement  { identity_card :: IdentityDocument.IdentityDocument } 

-- passportElementInternalPassport PassportElement  { internal_passport :: IdentityDocument.IdentityDocument } 

-- passportElementAddress PassportElement  { address :: Address.Address } 

-- passportElementUtilityBill PassportElement  { utility_bill :: PersonalDocument.PersonalDocument } 

-- passportElementBankStatement PassportElement  { bank_statement :: PersonalDocument.PersonalDocument } 

-- passportElementRentalAgreement PassportElement  { rental_agreement :: PersonalDocument.PersonalDocument } 

-- passportElementPassportRegistration PassportElement  { passport_registration :: PersonalDocument.PersonalDocument } 

-- passportElementTemporaryRegistration PassportElement  { temporary_registration :: PersonalDocument.PersonalDocument } 

-- passportElementPhoneNumber PassportElement  { phone_number :: String } 

-- passportElementEmailAddress PassportElement  { email_address :: String } 

