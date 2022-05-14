{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ShippingOption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.LabeledPricePart as LabeledPricePart
import qualified Utils as U

-- |
data ShippingOption = -- | One shipping option @id Shipping option identifier @title Option title @price_parts A list of objects used to calculate the total shipping costs
  ShippingOption
  { -- |
    price_parts :: Maybe [LabeledPricePart.LabeledPricePart],
    -- |
    title :: Maybe String,
    -- |
    _id :: Maybe String
  }
  deriving (Eq)

instance Show ShippingOption where
  show
    ShippingOption
      { price_parts = price_parts_,
        title = title_,
        _id = _id_
      } =
      "ShippingOption"
        ++ U.cc
          [ U.p "price_parts" price_parts_,
            U.p "title" title_,
            U.p "_id" _id_
          ]

instance T.FromJSON ShippingOption where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "shippingOption" -> parseShippingOption v
      _ -> mempty
    where
      parseShippingOption :: A.Value -> T.Parser ShippingOption
      parseShippingOption = A.withObject "ShippingOption" $ \o -> do
        price_parts_ <- o A..:? "price_parts"
        title_ <- o A..:? "title"
        _id_ <- o A..:? "id"
        return $ ShippingOption {price_parts = price_parts_, title = title_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON ShippingOption where
  toJSON
    ShippingOption
      { price_parts = price_parts_,
        title = title_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "shippingOption",
          "price_parts" A..= price_parts_,
          "title" A..= title_,
          "id" A..= _id_
        ]
