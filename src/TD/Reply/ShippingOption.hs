{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.ShippingOption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.LabeledPricePart as LabeledPricePart
import qualified Utils as U

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
      { price_parts = price_parts,
        title = title,
        _id = _id
      } =
      "ShippingOption"
        ++ U.cc
          [ U.p "price_parts" price_parts,
            U.p "title" title,
            U.p "_id" _id
          ]

instance T.FromJSON ShippingOption where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "shippingOption" -> parseShippingOption v
      _ -> fail ""
    where
      parseShippingOption :: A.Value -> T.Parser ShippingOption
      parseShippingOption = A.withObject "ShippingOption" $ \o -> do
        price_parts_ <- o A..:? "price_parts"
        title_ <- o A..:? "title"
        _id_ <- o A..:? "id"
        return $ ShippingOption {price_parts = price_parts_, title = title_, _id = _id_}
  parseJSON _ = fail ""

instance T.ToJSON ShippingOption where
  toJSON
    ShippingOption
      { price_parts = price_parts,
        title = title,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "shippingOption",
          "price_parts" A..= price_parts,
          "title" A..= title,
          "id" A..= _id
        ]
