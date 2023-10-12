module TD.Data.LabeledPricePart where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data LabeledPricePart
  = LabeledPricePart -- ^ Portion of the price of a product (e.g., "delivery cost", "tax amount")
    { label  :: Maybe T.Text -- ^ Label for this portion of the product price
    , amount :: Maybe Int    -- ^ Currency amount in the smallest units of the currency
    }
  deriving (Eq)

instance Show LabeledPricePart where
  show LabeledPricePart
    { label  = label_
    , amount = amount_
    }
      = "LabeledPricePart"
        ++ I.cc
        [ "label"  `I.p` label_
        , "amount" `I.p` amount_
        ]

instance AT.FromJSON LabeledPricePart where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "labeledPricePart" -> parseLabeledPricePart v
      _                  -> mempty
    
    where
      parseLabeledPricePart :: A.Value -> AT.Parser LabeledPricePart
      parseLabeledPricePart = A.withObject "LabeledPricePart" $ \o -> do
        label_  <- o A..:?  "label"
        amount_ <- o A..:?  "amount"
        pure $ LabeledPricePart
          { label  = label_
          , amount = amount_
          }

instance AT.ToJSON LabeledPricePart where
  toJSON LabeledPricePart
    { label  = label_
    , amount = amount_
    }
      = A.object
        [ "@type"  A..= AT.String "labeledPricePart"
        , "label"  A..= label_
        , "amount" A..= amount_
        ]
