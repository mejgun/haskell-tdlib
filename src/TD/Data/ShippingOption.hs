module TD.Data.ShippingOption
  ( ShippingOption(..)    
  , defaultShippingOption 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.LabeledPricePart as LabeledPricePart

data ShippingOption
  = ShippingOption -- ^ One shipping option
    { _id         :: Maybe T.Text                              -- ^ Shipping option identifier
    , title       :: Maybe T.Text                              -- ^ Option title
    , price_parts :: Maybe [LabeledPricePart.LabeledPricePart] -- ^ A list of objects used to calculate the total shipping costs
    }
  deriving (Eq, Show)

instance I.ShortShow ShippingOption where
  shortShow ShippingOption
    { _id         = _id_
    , title       = title_
    , price_parts = price_parts_
    }
      = "ShippingOption"
        ++ I.cc
        [ "_id"         `I.p` _id_
        , "title"       `I.p` title_
        , "price_parts" `I.p` price_parts_
        ]

instance AT.FromJSON ShippingOption where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "shippingOption" -> parseShippingOption v
      _                -> mempty
    
    where
      parseShippingOption :: A.Value -> AT.Parser ShippingOption
      parseShippingOption = A.withObject "ShippingOption" $ \o -> do
        _id_         <- o A..:?  "id"
        title_       <- o A..:?  "title"
        price_parts_ <- o A..:?  "price_parts"
        pure $ ShippingOption
          { _id         = _id_
          , title       = title_
          , price_parts = price_parts_
          }
  parseJSON _ = mempty

instance AT.ToJSON ShippingOption where
  toJSON ShippingOption
    { _id         = _id_
    , title       = title_
    , price_parts = price_parts_
    }
      = A.object
        [ "@type"       A..= AT.String "shippingOption"
        , "id"          A..= _id_
        , "title"       A..= title_
        , "price_parts" A..= price_parts_
        ]

defaultShippingOption :: ShippingOption
defaultShippingOption =
  ShippingOption
    { _id         = Nothing
    , title       = Nothing
    , price_parts = Nothing
    }

