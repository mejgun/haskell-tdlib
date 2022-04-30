-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckChangePhoneNumberCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Checks the authentication code sent to confirm a new phone number of the user 
-- 
-- __code__ Authentication code to check
data CheckChangePhoneNumberCode = 

 CheckChangePhoneNumberCode { code :: Maybe String }  deriving (Eq)

instance Show CheckChangePhoneNumberCode where
 show CheckChangePhoneNumberCode { code=code } =
  "CheckChangePhoneNumberCode" ++ U.cc [U.p "code" code ]

instance T.ToJSON CheckChangePhoneNumberCode where
 toJSON CheckChangePhoneNumberCode { code = code } =
  A.object [ "@type" A..= T.String "checkChangePhoneNumberCode", "code" A..= code ]

instance T.FromJSON CheckChangePhoneNumberCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkChangePhoneNumberCode" -> parseCheckChangePhoneNumberCode v
   _ -> mempty
  where
   parseCheckChangePhoneNumberCode :: A.Value -> T.Parser CheckChangePhoneNumberCode
   parseCheckChangePhoneNumberCode = A.withObject "CheckChangePhoneNumberCode" $ \o -> do
    code <- o A..:? "code"
    return $ CheckChangePhoneNumberCode { code = code }
 parseJSON _ = mempty
