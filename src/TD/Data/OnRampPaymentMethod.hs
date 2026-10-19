module TD.Data.OnRampPaymentMethod
  (OnRampPaymentMethod(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data OnRampPaymentMethod
  = OnRampPaymentMethod -- ^ Describes a payment method of an on-ramp provider
    { name         :: Maybe T.Text -- ^ Name of the method
    , is_available :: Maybe Bool   -- ^ True, if the method is available to the user
    }
  deriving (Eq, Show)

instance I.ShortShow OnRampPaymentMethod where
  shortShow OnRampPaymentMethod
    { name         = name_
    , is_available = is_available_
    }
      = "OnRampPaymentMethod"
        ++ I.cc
        [ "name"         `I.p` name_
        , "is_available" `I.p` is_available_
        ]

instance AT.FromJSON OnRampPaymentMethod where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "onRampPaymentMethod" -> parseOnRampPaymentMethod v
      _                     -> mempty
    
    where
      parseOnRampPaymentMethod :: A.Value -> AT.Parser OnRampPaymentMethod
      parseOnRampPaymentMethod = A.withObject "OnRampPaymentMethod" $ \o -> do
        name_         <- o A..:?  "name"
        is_available_ <- o A..:?  "is_available"
        pure $ OnRampPaymentMethod
          { name         = name_
          , is_available = is_available_
          }
  parseJSON _ = mempty

