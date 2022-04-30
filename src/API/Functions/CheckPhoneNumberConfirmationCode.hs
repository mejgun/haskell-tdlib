-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckPhoneNumberConfirmationCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Checks phone number confirmation code 
-- 
-- __code__ Confirmation code to check
data CheckPhoneNumberConfirmationCode = 

 CheckPhoneNumberConfirmationCode { code :: Maybe String }  deriving (Eq)

instance Show CheckPhoneNumberConfirmationCode where
 show CheckPhoneNumberConfirmationCode { code=code } =
  "CheckPhoneNumberConfirmationCode" ++ U.cc [U.p "code" code ]

instance T.ToJSON CheckPhoneNumberConfirmationCode where
 toJSON CheckPhoneNumberConfirmationCode { code = code } =
  A.object [ "@type" A..= T.String "checkPhoneNumberConfirmationCode", "code" A..= code ]

instance T.FromJSON CheckPhoneNumberConfirmationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkPhoneNumberConfirmationCode" -> parseCheckPhoneNumberConfirmationCode v
   _ -> mempty
  where
   parseCheckPhoneNumberConfirmationCode :: A.Value -> T.Parser CheckPhoneNumberConfirmationCode
   parseCheckPhoneNumberConfirmationCode = A.withObject "CheckPhoneNumberConfirmationCode" $ \o -> do
    code <- o A..:? "code"
    return $ CheckPhoneNumberConfirmationCode { code = code }
 parseJSON _ = mempty
