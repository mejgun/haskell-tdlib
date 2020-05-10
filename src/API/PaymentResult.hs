-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PaymentResult where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains the result of a payment request 
-- 
-- __success__ True, if the payment request was successful; otherwise the verification_url will be not empty
-- 
-- __verification_url__ URL for additional payment credentials verification
data PaymentResult = 

 PaymentResult { verification_url :: Maybe String, success :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON PaymentResult where
 toJSON (PaymentResult { verification_url = verification_url, success = success }) =
  A.object [ "@type" A..= T.String "paymentResult", "verification_url" A..= verification_url, "success" A..= success ]

instance T.FromJSON PaymentResult where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "paymentResult" -> parsePaymentResult v
   _ -> mempty
  where
   parsePaymentResult :: A.Value -> T.Parser PaymentResult
   parsePaymentResult = A.withObject "PaymentResult" $ \o -> do
    verification_url <- o A..:? "verification_url"
    success <- o A..:? "success"
    return $ PaymentResult { verification_url = verification_url, success = success }