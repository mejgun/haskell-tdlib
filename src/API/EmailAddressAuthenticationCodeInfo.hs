-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.EmailAddressAuthenticationCodeInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Information about the email address authentication code that was sent 
-- 
-- __email_address_pattern__ Pattern of the email address to which an authentication code was sent
-- 
-- __length__ Length of the code; 0 if unknown
data EmailAddressAuthenticationCodeInfo = 

 EmailAddressAuthenticationCodeInfo { _length :: Maybe Int, email_address_pattern :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON EmailAddressAuthenticationCodeInfo where
 toJSON (EmailAddressAuthenticationCodeInfo { _length = _length, email_address_pattern = email_address_pattern }) =
  A.object [ "@type" A..= T.String "emailAddressAuthenticationCodeInfo", "length" A..= _length, "email_address_pattern" A..= email_address_pattern ]

instance T.FromJSON EmailAddressAuthenticationCodeInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "emailAddressAuthenticationCodeInfo" -> parseEmailAddressAuthenticationCodeInfo v
   _ -> mempty
  where
   parseEmailAddressAuthenticationCodeInfo :: A.Value -> T.Parser EmailAddressAuthenticationCodeInfo
   parseEmailAddressAuthenticationCodeInfo = A.withObject "EmailAddressAuthenticationCodeInfo" $ \o -> do
    _length <- mconcat [ o A..:? "length", readMaybe <$> (o A..: "length" :: T.Parser String)] :: T.Parser (Maybe Int)
    email_address_pattern <- o A..:? "email_address_pattern"
    return $ EmailAddressAuthenticationCodeInfo { _length = _length, email_address_pattern = email_address_pattern }