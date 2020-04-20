-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.OrderInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Address as Address

--main = putStrLn "ok"

data OrderInfo = 
 OrderInfo { shipping_address :: Address.Address, email_address :: String, phone_number :: String, name :: String }  -- deriving (Show)

instance T.ToJSON OrderInfo where
 toJSON (OrderInfo { shipping_address = shipping_address, email_address = email_address, phone_number = phone_number, name = name }) =
  A.object [ "@type" A..= T.String "orderInfo", "shipping_address" A..= shipping_address, "email_address" A..= email_address, "phone_number" A..= phone_number, "name" A..= name ]
-- orderInfo OrderInfo  { shipping_address :: Address.Address, email_address :: String, phone_number :: String, name :: String } 

