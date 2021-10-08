-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ValidatedOrderInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ShippingOption as ShippingOption

-- |
-- 
-- Contains a temporary identifier of validated order information, which is stored for one hour. Also contains the available shipping options 
-- 
-- __order_info_id__ Temporary identifier of the order information
-- 
-- __shipping_options__ Available shipping options
data ValidatedOrderInfo = 

 ValidatedOrderInfo { shipping_options :: Maybe [ShippingOption.ShippingOption], order_info_id :: Maybe String }  deriving (Eq)

instance Show ValidatedOrderInfo where
 show ValidatedOrderInfo { shipping_options=shipping_options, order_info_id=order_info_id } =
  "ValidatedOrderInfo" ++ cc [p "shipping_options" shipping_options, p "order_info_id" order_info_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ValidatedOrderInfo where
 toJSON ValidatedOrderInfo { shipping_options = shipping_options, order_info_id = order_info_id } =
  A.object [ "@type" A..= T.String "validatedOrderInfo", "shipping_options" A..= shipping_options, "order_info_id" A..= order_info_id ]

instance T.FromJSON ValidatedOrderInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "validatedOrderInfo" -> parseValidatedOrderInfo v
   _ -> mempty
  where
   parseValidatedOrderInfo :: A.Value -> T.Parser ValidatedOrderInfo
   parseValidatedOrderInfo = A.withObject "ValidatedOrderInfo" $ \o -> do
    shipping_options <- o A..:? "shipping_options"
    order_info_id <- o A..:? "order_info_id"
    return $ ValidatedOrderInfo { shipping_options = shipping_options, order_info_id = order_info_id }
 parseJSON _ = mempty
