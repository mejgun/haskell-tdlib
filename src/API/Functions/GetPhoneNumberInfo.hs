-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPhoneNumberInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns information about a phone number by its prefix. Can be called before authorization 
-- 
-- __phone_number_prefix__ The phone number prefix
data GetPhoneNumberInfo = 

 GetPhoneNumberInfo { phone_number_prefix :: Maybe String }  deriving (Eq)

instance Show GetPhoneNumberInfo where
 show GetPhoneNumberInfo { phone_number_prefix=phone_number_prefix } =
  "GetPhoneNumberInfo" ++ U.cc [U.p "phone_number_prefix" phone_number_prefix ]

instance T.ToJSON GetPhoneNumberInfo where
 toJSON GetPhoneNumberInfo { phone_number_prefix = phone_number_prefix } =
  A.object [ "@type" A..= T.String "getPhoneNumberInfo", "phone_number_prefix" A..= phone_number_prefix ]

instance T.FromJSON GetPhoneNumberInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPhoneNumberInfo" -> parseGetPhoneNumberInfo v
   _ -> mempty
  where
   parseGetPhoneNumberInfo :: A.Value -> T.Parser GetPhoneNumberInfo
   parseGetPhoneNumberInfo = A.withObject "GetPhoneNumberInfo" $ \o -> do
    phone_number_prefix <- o A..:? "phone_number_prefix"
    return $ GetPhoneNumberInfo { phone_number_prefix = phone_number_prefix }
 parseJSON _ = mempty
