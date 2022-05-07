{-# LANGUAGE OverloadedStrings #-}

module TD.Data.ValidatedOrderInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ShippingOption as ShippingOption
import qualified Utils as U

data ValidatedOrderInfo = -- | Contains a temporary identifier of validated order information, which is stored for one hour. Also contains the available shipping options @order_info_id Temporary identifier of the order information @shipping_options Available shipping options
  ValidatedOrderInfo
  { -- |
    shipping_options :: Maybe [ShippingOption.ShippingOption],
    -- |
    order_info_id :: Maybe String
  }
  deriving (Eq)

instance Show ValidatedOrderInfo where
  show
    ValidatedOrderInfo
      { shipping_options = shipping_options,
        order_info_id = order_info_id
      } =
      "ValidatedOrderInfo"
        ++ U.cc
          [ U.p "shipping_options" shipping_options,
            U.p "order_info_id" order_info_id
          ]

instance T.FromJSON ValidatedOrderInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "validatedOrderInfo" -> parseValidatedOrderInfo v
      _ -> mempty
    where
      parseValidatedOrderInfo :: A.Value -> T.Parser ValidatedOrderInfo
      parseValidatedOrderInfo = A.withObject "ValidatedOrderInfo" $ \o -> do
        shipping_options_ <- o A..:? "shipping_options"
        order_info_id_ <- o A..:? "order_info_id"
        return $ ValidatedOrderInfo {shipping_options = shipping_options_, order_info_id = order_info_id_}
  parseJSON _ = mempty

instance T.ToJSON ValidatedOrderInfo where
  toJSON
    ValidatedOrderInfo
      { shipping_options = shipping_options,
        order_info_id = order_info_id
      } =
      A.object
        [ "@type" A..= T.String "validatedOrderInfo",
          "shipping_options" A..= shipping_options,
          "order_info_id" A..= order_info_id
        ]
