-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ShippingOption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LabeledPricePart as LabeledPricePart

--main = putStrLn "ok"

data ShippingOption = 
 ShippingOption { price_parts :: [LabeledPricePart.LabeledPricePart], title :: String, _id :: String }  deriving (Show)

instance T.ToJSON ShippingOption where
 toJSON (ShippingOption { price_parts = price_parts, title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "shippingOption", "price_parts" A..= price_parts, "title" A..= title, "id" A..= _id ]



instance T.FromJSON ShippingOption where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "shippingOption" -> parseShippingOption v

   _ -> mempty ""
  where
   parseShippingOption :: A.Value -> T.Parser ShippingOption
   parseShippingOption = A.withObject "ShippingOption" $ \o -> do
    price_parts <- o A..: "price_parts"
    title <- o A..: "title"
    _id <- o A..: "id"
    return $ ShippingOption { price_parts = price_parts, title = title, _id = _id }