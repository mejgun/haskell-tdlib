-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.OrderInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Address as Address

-- |
-- 
-- Order information 
-- 
-- __name__ Name of the user
-- 
-- __phone_number__ Phone number of the user
-- 
-- __email_address__ Email address of the user
-- 
-- __shipping_address__ Shipping address for this order; may be null
data OrderInfo = 

 OrderInfo { shipping_address :: Maybe Address.Address, email_address :: Maybe String, phone_number :: Maybe String, name :: Maybe String }  deriving (Eq)

instance Show OrderInfo where
 show OrderInfo { shipping_address=shipping_address, email_address=email_address, phone_number=phone_number, name=name } =
  "OrderInfo" ++ cc [p "shipping_address" shipping_address, p "email_address" email_address, p "phone_number" phone_number, p "name" name ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON OrderInfo where
 toJSON OrderInfo { shipping_address = shipping_address, email_address = email_address, phone_number = phone_number, name = name } =
  A.object [ "@type" A..= T.String "orderInfo", "shipping_address" A..= shipping_address, "email_address" A..= email_address, "phone_number" A..= phone_number, "name" A..= name ]

instance T.FromJSON OrderInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "orderInfo" -> parseOrderInfo v
   _ -> mempty
  where
   parseOrderInfo :: A.Value -> T.Parser OrderInfo
   parseOrderInfo = A.withObject "OrderInfo" $ \o -> do
    shipping_address <- o A..:? "shipping_address"
    email_address <- o A..:? "email_address"
    phone_number <- o A..:? "phone_number"
    name <- o A..:? "name"
    return $ OrderInfo { shipping_address = shipping_address, email_address = email_address, phone_number = phone_number, name = name }
 parseJSON _ = mempty
