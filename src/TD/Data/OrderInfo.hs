{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.OrderInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Address as Address
import qualified Utils as U

data OrderInfo = -- | Order information @name Name of the user @phone_number Phone number of the user @email_address Email address of the user @shipping_address Shipping address for this order; may be null
  OrderInfo
  { -- |
    shipping_address :: Maybe Address.Address,
    -- |
    email_address :: Maybe String,
    -- |
    phone_number :: Maybe String,
    -- |
    name :: Maybe String
  }
  deriving (Eq)

instance Show OrderInfo where
  show
    OrderInfo
      { shipping_address = shipping_address_,
        email_address = email_address_,
        phone_number = phone_number_,
        name = name_
      } =
      "OrderInfo"
        ++ U.cc
          [ U.p "shipping_address" shipping_address_,
            U.p "email_address" email_address_,
            U.p "phone_number" phone_number_,
            U.p "name" name_
          ]

instance T.FromJSON OrderInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "orderInfo" -> parseOrderInfo v
      _ -> mempty
    where
      parseOrderInfo :: A.Value -> T.Parser OrderInfo
      parseOrderInfo = A.withObject "OrderInfo" $ \o -> do
        shipping_address_ <- o A..:? "shipping_address"
        email_address_ <- o A..:? "email_address"
        phone_number_ <- o A..:? "phone_number"
        name_ <- o A..:? "name"
        return $ OrderInfo {shipping_address = shipping_address_, email_address = email_address_, phone_number = phone_number_, name = name_}
  parseJSON _ = mempty

instance T.ToJSON OrderInfo where
  toJSON
    OrderInfo
      { shipping_address = shipping_address_,
        email_address = email_address_,
        phone_number = phone_number_,
        name = name_
      } =
      A.object
        [ "@type" A..= T.String "orderInfo",
          "shipping_address" A..= shipping_address_,
          "email_address" A..= email_address_,
          "phone_number" A..= phone_number_,
          "name" A..= name_
        ]
