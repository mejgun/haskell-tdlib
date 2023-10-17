module TD.Data.OrderInfo
  ( OrderInfo(..)    
  , defaultOrderInfo 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Address as Address

data OrderInfo
  = OrderInfo -- ^ Order information
    { name             :: Maybe T.Text          -- ^ Name of the user
    , phone_number     :: Maybe T.Text          -- ^ Phone number of the user
    , email_address    :: Maybe T.Text          -- ^ Email address of the user
    , shipping_address :: Maybe Address.Address -- ^ Shipping address for this order; may be null
    }
  deriving (Eq, Show)

instance I.ShortShow OrderInfo where
  shortShow OrderInfo
    { name             = name_
    , phone_number     = phone_number_
    , email_address    = email_address_
    , shipping_address = shipping_address_
    }
      = "OrderInfo"
        ++ I.cc
        [ "name"             `I.p` name_
        , "phone_number"     `I.p` phone_number_
        , "email_address"    `I.p` email_address_
        , "shipping_address" `I.p` shipping_address_
        ]

instance AT.FromJSON OrderInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "orderInfo" -> parseOrderInfo v
      _           -> mempty
    
    where
      parseOrderInfo :: A.Value -> AT.Parser OrderInfo
      parseOrderInfo = A.withObject "OrderInfo" $ \o -> do
        name_             <- o A..:?  "name"
        phone_number_     <- o A..:?  "phone_number"
        email_address_    <- o A..:?  "email_address"
        shipping_address_ <- o A..:?  "shipping_address"
        pure $ OrderInfo
          { name             = name_
          , phone_number     = phone_number_
          , email_address    = email_address_
          , shipping_address = shipping_address_
          }
  parseJSON _ = mempty

instance AT.ToJSON OrderInfo where
  toJSON OrderInfo
    { name             = name_
    , phone_number     = phone_number_
    , email_address    = email_address_
    , shipping_address = shipping_address_
    }
      = A.object
        [ "@type"            A..= AT.String "orderInfo"
        , "name"             A..= name_
        , "phone_number"     A..= phone_number_
        , "email_address"    A..= email_address_
        , "shipping_address" A..= shipping_address_
        ]

defaultOrderInfo :: OrderInfo
defaultOrderInfo =
  OrderInfo
    { name             = Nothing
    , phone_number     = Nothing
    , email_address    = Nothing
    , shipping_address = Nothing
    }

