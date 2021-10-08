-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LabeledPricePart where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Portion of the price of a product (e.g., "delivery cost", "tax amount") 
-- 
-- __label__ Label for this portion of the product price
-- 
-- __amount__ Currency amount in the smallest units of the currency
data LabeledPricePart = 

 LabeledPricePart { amount :: Maybe Int, label :: Maybe String }  deriving (Eq)

instance Show LabeledPricePart where
 show LabeledPricePart { amount=amount, label=label } =
  "LabeledPricePart" ++ cc [p "amount" amount, p "label" label ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON LabeledPricePart where
 toJSON LabeledPricePart { amount = amount, label = label } =
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
    amount <- mconcat [ o A..:? "amount", readMaybe <$> (o A..: "amount" :: T.Parser String)] :: T.Parser (Maybe Int)
    label <- o A..:? "label"
    return $ LabeledPricePart { amount = amount, label = label }
 parseJSON _ = mempty
