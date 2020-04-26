-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportElementType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains the type of a Telegram Passport element
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
 | PassportElementTypeEmailAddress deriving (Show, Eq)

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

instance T.FromJSON PassportElementType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "passportElementTypePersonalDetails" -> parsePassportElementTypePersonalDetails v
   "passportElementTypePassport" -> parsePassportElementTypePassport v
   "passportElementTypeDriverLicense" -> parsePassportElementTypeDriverLicense v
   "passportElementTypeIdentityCard" -> parsePassportElementTypeIdentityCard v
   "passportElementTypeInternalPassport" -> parsePassportElementTypeInternalPassport v
   "passportElementTypeAddress" -> parsePassportElementTypeAddress v
   "passportElementTypeUtilityBill" -> parsePassportElementTypeUtilityBill v
   "passportElementTypeBankStatement" -> parsePassportElementTypeBankStatement v
   "passportElementTypeRentalAgreement" -> parsePassportElementTypeRentalAgreement v
   "passportElementTypePassportRegistration" -> parsePassportElementTypePassportRegistration v
   "passportElementTypeTemporaryRegistration" -> parsePassportElementTypeTemporaryRegistration v
   "passportElementTypePhoneNumber" -> parsePassportElementTypePhoneNumber v
   "passportElementTypeEmailAddress" -> parsePassportElementTypeEmailAddress v
   _ -> mempty
  where
   parsePassportElementTypePersonalDetails :: A.Value -> T.Parser PassportElementType
   parsePassportElementTypePersonalDetails = A.withObject "PassportElementTypePersonalDetails" $ \o -> do
    return $ PassportElementTypePersonalDetails {  }

   parsePassportElementTypePassport :: A.Value -> T.Parser PassportElementType
   parsePassportElementTypePassport = A.withObject "PassportElementTypePassport" $ \o -> do
    return $ PassportElementTypePassport {  }

   parsePassportElementTypeDriverLicense :: A.Value -> T.Parser PassportElementType
   parsePassportElementTypeDriverLicense = A.withObject "PassportElementTypeDriverLicense" $ \o -> do
    return $ PassportElementTypeDriverLicense {  }

   parsePassportElementTypeIdentityCard :: A.Value -> T.Parser PassportElementType
   parsePassportElementTypeIdentityCard = A.withObject "PassportElementTypeIdentityCard" $ \o -> do
    return $ PassportElementTypeIdentityCard {  }

   parsePassportElementTypeInternalPassport :: A.Value -> T.Parser PassportElementType
   parsePassportElementTypeInternalPassport = A.withObject "PassportElementTypeInternalPassport" $ \o -> do
    return $ PassportElementTypeInternalPassport {  }

   parsePassportElementTypeAddress :: A.Value -> T.Parser PassportElementType
   parsePassportElementTypeAddress = A.withObject "PassportElementTypeAddress" $ \o -> do
    return $ PassportElementTypeAddress {  }

   parsePassportElementTypeUtilityBill :: A.Value -> T.Parser PassportElementType
   parsePassportElementTypeUtilityBill = A.withObject "PassportElementTypeUtilityBill" $ \o -> do
    return $ PassportElementTypeUtilityBill {  }

   parsePassportElementTypeBankStatement :: A.Value -> T.Parser PassportElementType
   parsePassportElementTypeBankStatement = A.withObject "PassportElementTypeBankStatement" $ \o -> do
    return $ PassportElementTypeBankStatement {  }

   parsePassportElementTypeRentalAgreement :: A.Value -> T.Parser PassportElementType
   parsePassportElementTypeRentalAgreement = A.withObject "PassportElementTypeRentalAgreement" $ \o -> do
    return $ PassportElementTypeRentalAgreement {  }

   parsePassportElementTypePassportRegistration :: A.Value -> T.Parser PassportElementType
   parsePassportElementTypePassportRegistration = A.withObject "PassportElementTypePassportRegistration" $ \o -> do
    return $ PassportElementTypePassportRegistration {  }

   parsePassportElementTypeTemporaryRegistration :: A.Value -> T.Parser PassportElementType
   parsePassportElementTypeTemporaryRegistration = A.withObject "PassportElementTypeTemporaryRegistration" $ \o -> do
    return $ PassportElementTypeTemporaryRegistration {  }

   parsePassportElementTypePhoneNumber :: A.Value -> T.Parser PassportElementType
   parsePassportElementTypePhoneNumber = A.withObject "PassportElementTypePhoneNumber" $ \o -> do
    return $ PassportElementTypePhoneNumber {  }

   parsePassportElementTypeEmailAddress :: A.Value -> T.Parser PassportElementType
   parsePassportElementTypeEmailAddress = A.withObject "PassportElementTypeEmailAddress" $ \o -> do
    return $ PassportElementTypeEmailAddress {  }