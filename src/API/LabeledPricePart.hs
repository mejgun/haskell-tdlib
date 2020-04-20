-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LabeledPricePart where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data LabeledPricePart = 
 LabeledPricePart { amount :: Int, label :: String }  -- deriving (Show)

instance T.ToJSON LabeledPricePart where
 toJSON (LabeledPricePart { amount = amount, label = label }) =
  A.object [ "@type" A..= T.String "labeledPricePart", "amount" A..= amount, "label" A..= label ]
-- labeledPricePart LabeledPricePart  { amount :: Int, label :: String } 

