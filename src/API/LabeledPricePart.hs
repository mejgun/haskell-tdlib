-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LabeledPricePart where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data LabeledPricePart = 
 LabeledPricePart { amount :: Int, label :: String }  deriving (Show)

instance T.ToJSON LabeledPricePart where
 toJSON (LabeledPricePart { amount = amount, label = label }) =
  A.object [ "@type" A..= T.String "labeledPricePart", "amount" A..= amount, "label" A..= label ]

instance T.FromJSON LabeledPricePart where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "labeledPricePart" -> parseLabeledPricePart v
   _ -> mempty
  where
   parseLabeledPricePart :: A.Value -> T.Parser LabeledPricePart
   parseLabeledPricePart = A.withObject "LabeledPricePart" $ \o -> do
    amount <- o A..: "amount"
    label <- o A..: "label"
    return $ LabeledPricePart { amount = amount, label = label }