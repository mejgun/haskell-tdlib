-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PaymentResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data PaymentResult = 
 PaymentResult { verification_url :: String, success :: Bool }  -- deriving (Show)

instance T.ToJSON PaymentResult where
 toJSON (PaymentResult { verification_url = verification_url, success = success }) =
  A.object [ "@type" A..= T.String "paymentResult", "verification_url" A..= verification_url, "success" A..= success ]
-- paymentResult PaymentResult  { verification_url :: String, success :: Bool } 

