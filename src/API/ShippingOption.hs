-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ShippingOption where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.LabeledPricePart as LabeledPricePart

-- |
-- 
-- One shipping option 
-- 
-- __id__ Shipping option identifier
-- 
-- __title__ Option title
-- 
-- __price_parts__ A list of objects used to calculate the total shipping costs
data ShippingOption = 

 ShippingOption { price_parts :: Maybe [LabeledPricePart.LabeledPricePart], title :: Maybe String, _id :: Maybe String }  deriving (Eq)

instance Show ShippingOption where
 show ShippingOption { price_parts=price_parts, title=title, _id=_id } =
  "ShippingOption" ++ U.cc [U.p "price_parts" price_parts, U.p "title" title, U.p "_id" _id ]

instance T.ToJSON ShippingOption where
 toJSON ShippingOption { price_parts = price_parts, title = title, _id = _id } =
  A.object [ "@type" A..= T.String "shippingOption", "price_parts" A..= price_parts, "title" A..= title, "id" A..= _id ]

instance T.FromJSON ShippingOption where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "shippingOption" -> parseShippingOption v
   _ -> mempty
  where
   parseShippingOption :: A.Value -> T.Parser ShippingOption
   parseShippingOption = A.withObject "ShippingOption" $ \o -> do
    price_parts <- o A..:? "price_parts"
    title <- o A..:? "title"
    _id <- o A..:? "id"
    return $ ShippingOption { price_parts = price_parts, title = title, _id = _id }
 parseJSON _ = mempty
