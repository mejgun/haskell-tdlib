{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.LabeledPricePart where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

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
      { amount = amount,
        label = label
      } =
      "LabeledPricePart"
        ++ U.cc
          [ U.p "amount" amount,
            U.p "label" label
          ]

instance T.FromJSON LabeledPricePart where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "labeledPricePart" -> parseLabeledPricePart v
      _ -> fail ""
    where
      parseLabeledPricePart :: A.Value -> T.Parser LabeledPricePart
      parseLabeledPricePart = A.withObject "LabeledPricePart" $ \o -> do
        amount_ <- mconcat [o A..:? "amount", U.rm <$> (o A..: "amount" :: T.Parser String)] :: T.Parser (Maybe Int)
        label_ <- o A..:? "label"
        return $ LabeledPricePart {amount = amount_, label = label_}
  parseJSON _ = fail ""

instance T.ToJSON LabeledPricePart where
  toJSON
    LabeledPricePart
      { amount = amount,
        label = label
      } =
      A.object
        [ "@type" A..= T.String "labeledPricePart",
          "amount" A..= amount,
          "label" A..= label
        ]
