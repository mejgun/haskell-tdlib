module TD.Data.ValidatedOrderInfo
  (ValidatedOrderInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ShippingOption as ShippingOption

data ValidatedOrderInfo
  = ValidatedOrderInfo -- ^ Contains a temporary identifier of validated order information, which is stored for one hour, and the available shipping options
    { order_info_id    :: Maybe T.Text                          -- ^ Temporary identifier of the order information
    , shipping_options :: Maybe [ShippingOption.ShippingOption] -- ^ Available shipping options
    }
  deriving (Eq, Show)

instance I.ShortShow ValidatedOrderInfo where
  shortShow ValidatedOrderInfo
    { order_info_id    = order_info_id_
    , shipping_options = shipping_options_
    }
      = "ValidatedOrderInfo"
        ++ I.cc
        [ "order_info_id"    `I.p` order_info_id_
        , "shipping_options" `I.p` shipping_options_
        ]

instance AT.FromJSON ValidatedOrderInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "validatedOrderInfo" -> parseValidatedOrderInfo v
      _                    -> mempty
    
    where
      parseValidatedOrderInfo :: A.Value -> AT.Parser ValidatedOrderInfo
      parseValidatedOrderInfo = A.withObject "ValidatedOrderInfo" $ \o -> do
        order_info_id_    <- o A..:?  "order_info_id"
        shipping_options_ <- o A..:?  "shipping_options"
        pure $ ValidatedOrderInfo
          { order_info_id    = order_info_id_
          , shipping_options = shipping_options_
          }
  parseJSON _ = mempty

