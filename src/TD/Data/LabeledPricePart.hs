{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.LabeledPricePart where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data LabeledPricePart = -- | Portion of the price of a product (e.g., "delivery cost", "tax amount") @label Label for this portion of the product price @amount Currency amount in the smallest units of the currency
  LabeledPricePart
  { -- |
    amount :: Maybe Int,
    -- |
    label :: Maybe String
  }
  deriving (Eq)

instance Show LabeledPricePart where
  show
    LabeledPricePart
      { amount = amount_,
        label = label_
      } =
      "LabeledPricePart"
        ++ U.cc
          [ U.p "amount" amount_,
            U.p "label" label_
          ]

instance T.FromJSON LabeledPricePart where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "labeledPricePart" -> parseLabeledPricePart v
      _ -> mempty
    where
      parseLabeledPricePart :: A.Value -> T.Parser LabeledPricePart
      parseLabeledPricePart = A.withObject "LabeledPricePart" $ \o -> do
        amount_ <- o A..:? "amount"
        label_ <- o A..:? "label"
        return $ LabeledPricePart {amount = amount_, label = label_}
  parseJSON _ = mempty

instance T.ToJSON LabeledPricePart where
  toJSON
    LabeledPricePart
      { amount = amount_,
        label = label_
      } =
      A.object
        [ "@type" A..= T.String "labeledPricePart",
          "amount" A..= amount_,
          "label" A..= label_
        ]
