-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputPassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PersonalDetails as PersonalDetails
import {-# SOURCE #-} qualified API.InputIdentityDocument as InputIdentityDocument
import {-# SOURCE #-} qualified API.Address as Address
import {-# SOURCE #-} qualified API.InputPersonalDocument as InputPersonalDocument

--main = putStrLn "ok"

data InputPassportElement = 
 InputPassportElementPersonalDetails { personal_details :: PersonalDetails.PersonalDetails }  
 | InputPassportElementPassport { passport :: InputIdentityDocument.InputIdentityDocument }  
 | InputPassportElementDriverLicense { driver_license :: InputIdentityDocument.InputIdentityDocument }  
 | InputPassportElementIdentityCard { identity_card :: InputIdentityDocument.InputIdentityDocument }  
 | InputPassportElementInternalPassport { internal_passport :: InputIdentityDocument.InputIdentityDocument }  
 | InputPassportElementAddress { address :: Address.Address }  
 | InputPassportElementUtilityBill { utility_bill :: InputPersonalDocument.InputPersonalDocument }  
 | InputPassportElementBankStatement { bank_statement :: InputPersonalDocument.InputPersonalDocument }  
 | InputPassportElementRentalAgreement { rental_agreement :: InputPersonalDocument.InputPersonalDocument }  
 | InputPassportElementPassportRegistration { passport_registration :: InputPersonalDocument.InputPersonalDocument }  
 | InputPassportElementTemporaryRegistration { temporary_registration :: InputPersonalDocument.InputPersonalDocument }  
 | InputPassportElementPhoneNumber { phone_number :: String }  
 | InputPassportElementEmailAddress { email_address :: String }  -- deriving (Show)

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
-- inputPassportElementPersonalDetails InputPassportElement  { personal_details :: PersonalDetails.PersonalDetails } 

-- inputPassportElementPassport InputPassportElement  { passport :: InputIdentityDocument.InputIdentityDocument } 

-- inputPassportElementDriverLicense InputPassportElement  { driver_license :: InputIdentityDocument.InputIdentityDocument } 

-- inputPassportElementIdentityCard InputPassportElement  { identity_card :: InputIdentityDocument.InputIdentityDocument } 

-- inputPassportElementInternalPassport InputPassportElement  { internal_passport :: InputIdentityDocument.InputIdentityDocument } 

-- inputPassportElementAddress InputPassportElement  { address :: Address.Address } 

-- inputPassportElementUtilityBill InputPassportElement  { utility_bill :: InputPersonalDocument.InputPersonalDocument } 

-- inputPassportElementBankStatement InputPassportElement  { bank_statement :: InputPersonalDocument.InputPersonalDocument } 

-- inputPassportElementRentalAgreement InputPassportElement  { rental_agreement :: InputPersonalDocument.InputPersonalDocument } 

-- inputPassportElementPassportRegistration InputPassportElement  { passport_registration :: InputPersonalDocument.InputPersonalDocument } 

-- inputPassportElementTemporaryRegistration InputPassportElement  { temporary_registration :: InputPersonalDocument.InputPersonalDocument } 

-- inputPassportElementPhoneNumber InputPassportElement  { phone_number :: String } 

-- inputPassportElementEmailAddress InputPassportElement  { email_address :: String } 

