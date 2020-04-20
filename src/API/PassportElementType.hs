-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportElementType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data PassportElementType = 
 PassportElementTypePersonalDetails 
 | PassportElementTypePassport 
 | PassportElementTypeDriverLicense 
 | PassportElementTypeIdentityCard 
 | PassportElementTypeInternalPassport 
 | PassportElementTypeAddress 
 | PassportElementTypeUtilityBill 
 | PassportElementTypeBankStatement 
 | PassportElementTypeRentalAgreement 
 | PassportElementTypePassportRegistration 
 | PassportElementTypeTemporaryRegistration 
 | PassportElementTypePhoneNumber 
 | PassportElementTypeEmailAddress -- deriving (Show)

instance T.ToJSON PassportElementType where
 toJSON (PassportElementTypePersonalDetails {  }) =
  A.object [ "@type" A..= T.String "passportElementTypePersonalDetails" ]

 toJSON (PassportElementTypePassport {  }) =
  A.object [ "@type" A..= T.String "passportElementTypePassport" ]

 toJSON (PassportElementTypeDriverLicense {  }) =
  A.object [ "@type" A..= T.String "passportElementTypeDriverLicense" ]

 toJSON (PassportElementTypeIdentityCard {  }) =
  A.object [ "@type" A..= T.String "passportElementTypeIdentityCard" ]

 toJSON (PassportElementTypeInternalPassport {  }) =
  A.object [ "@type" A..= T.String "passportElementTypeInternalPassport" ]

 toJSON (PassportElementTypeAddress {  }) =
  A.object [ "@type" A..= T.String "passportElementTypeAddress" ]

 toJSON (PassportElementTypeUtilityBill {  }) =
  A.object [ "@type" A..= T.String "passportElementTypeUtilityBill" ]

 toJSON (PassportElementTypeBankStatement {  }) =
  A.object [ "@type" A..= T.String "passportElementTypeBankStatement" ]

 toJSON (PassportElementTypeRentalAgreement {  }) =
  A.object [ "@type" A..= T.String "passportElementTypeRentalAgreement" ]

 toJSON (PassportElementTypePassportRegistration {  }) =
  A.object [ "@type" A..= T.String "passportElementTypePassportRegistration" ]

 toJSON (PassportElementTypeTemporaryRegistration {  }) =
  A.object [ "@type" A..= T.String "passportElementTypeTemporaryRegistration" ]

 toJSON (PassportElementTypePhoneNumber {  }) =
  A.object [ "@type" A..= T.String "passportElementTypePhoneNumber" ]

 toJSON (PassportElementTypeEmailAddress {  }) =
  A.object [ "@type" A..= T.String "passportElementTypeEmailAddress" ]
-- passportElementTypePersonalDetails PassportElementType 

-- passportElementTypePassport PassportElementType 

-- passportElementTypeDriverLicense PassportElementType 

-- passportElementTypeIdentityCard PassportElementType 

-- passportElementTypeInternalPassport PassportElementType 

-- passportElementTypeAddress PassportElementType 

-- passportElementTypeUtilityBill PassportElementType 

-- passportElementTypeBankStatement PassportElementType 

-- passportElementTypeRentalAgreement PassportElementType 

-- passportElementTypePassportRegistration PassportElementType 

-- passportElementTypeTemporaryRegistration PassportElementType 

-- passportElementTypePhoneNumber PassportElementType 

-- passportElementTypeEmailAddress PassportElementType 

