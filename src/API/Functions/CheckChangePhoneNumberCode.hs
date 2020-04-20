-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckChangePhoneNumberCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CheckChangePhoneNumberCode = 
 CheckChangePhoneNumberCode { code :: String }  -- deriving (Show)

instance T.ToJSON CheckChangePhoneNumberCode where
 toJSON (CheckChangePhoneNumberCode { code = code }) =
  A.object [ "@type" A..= T.String "checkChangePhoneNumberCode", "code" A..= code ]
-- checkChangePhoneNumberCode CheckChangePhoneNumberCode  { code :: String } 



instance T.FromJSON CheckChangePhoneNumberCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkChangePhoneNumberCode" -> parseCheckChangePhoneNumberCode v
  where
   parseCheckChangePhoneNumberCode :: A.Value -> T.Parser CheckChangePhoneNumberCode
   parseCheckChangePhoneNumberCode = A.withObject "CheckChangePhoneNumberCode" $ \o -> do
    code <- o A..: "code"
    return $ CheckChangePhoneNumberCode { code = code }