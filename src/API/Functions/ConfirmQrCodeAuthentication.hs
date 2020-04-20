-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ConfirmQrCodeAuthentication where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ConfirmQrCodeAuthentication = 
 ConfirmQrCodeAuthentication { link :: String }  -- deriving (Show)

instance T.ToJSON ConfirmQrCodeAuthentication where
 toJSON (ConfirmQrCodeAuthentication { link = link }) =
  A.object [ "@type" A..= T.String "confirmQrCodeAuthentication", "link" A..= link ]
-- confirmQrCodeAuthentication ConfirmQrCodeAuthentication  { link :: String } 

