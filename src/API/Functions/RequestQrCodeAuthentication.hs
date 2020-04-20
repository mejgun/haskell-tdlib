-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RequestQrCodeAuthentication where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RequestQrCodeAuthentication = 
 RequestQrCodeAuthentication { other_user_ids :: [Int] }  -- deriving (Show)

instance T.ToJSON RequestQrCodeAuthentication where
 toJSON (RequestQrCodeAuthentication { other_user_ids = other_user_ids }) =
  A.object [ "@type" A..= T.String "requestQrCodeAuthentication", "other_user_ids" A..= other_user_ids ]
-- requestQrCodeAuthentication RequestQrCodeAuthentication  { other_user_ids :: [Int] } 

