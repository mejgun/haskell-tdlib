-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.EmailAddressAuthenticationCodeInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data EmailAddressAuthenticationCodeInfo = 
 EmailAddressAuthenticationCodeInfo { _length :: Int, email_address_pattern :: String }  deriving (Show)

instance T.ToJSON EmailAddressAuthenticationCodeInfo where
 toJSON (EmailAddressAuthenticationCodeInfo { _length = _length, email_address_pattern = email_address_pattern }) =
  A.object [ "@type" A..= T.String "emailAddressAuthenticationCodeInfo", "length" A..= _length, "email_address_pattern" A..= email_address_pattern ]



instance T.FromJSON EmailAddressAuthenticationCodeInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "emailAddressAuthenticationCodeInfo" -> parseEmailAddressAuthenticationCodeInfo v

   _ -> mempty ""
  where
   parseEmailAddressAuthenticationCodeInfo :: A.Value -> T.Parser EmailAddressAuthenticationCodeInfo
   parseEmailAddressAuthenticationCodeInfo = A.withObject "EmailAddressAuthenticationCodeInfo" $ \o -> do
    _length <- o A..: "length"
    email_address_pattern <- o A..: "email_address_pattern"
    return $ EmailAddressAuthenticationCodeInfo { _length = _length, email_address_pattern = email_address_pattern }