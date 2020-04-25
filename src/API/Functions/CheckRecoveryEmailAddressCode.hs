-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckRecoveryEmailAddressCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CheckRecoveryEmailAddressCode = 
 CheckRecoveryEmailAddressCode { code :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON CheckRecoveryEmailAddressCode where
 toJSON (CheckRecoveryEmailAddressCode { code = code }) =
  A.object [ "@type" A..= T.String "checkRecoveryEmailAddressCode", "code" A..= code ]

instance T.FromJSON CheckRecoveryEmailAddressCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkRecoveryEmailAddressCode" -> parseCheckRecoveryEmailAddressCode v
   _ -> mempty
  where
   parseCheckRecoveryEmailAddressCode :: A.Value -> T.Parser CheckRecoveryEmailAddressCode
   parseCheckRecoveryEmailAddressCode = A.withObject "CheckRecoveryEmailAddressCode" $ \o -> do
    code <- o A..:? "code"
    return $ CheckRecoveryEmailAddressCode { code = code }