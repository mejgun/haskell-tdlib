module TD.Data.OnRampPaymentAvailability
  (OnRampPaymentAvailability(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.OnRampPaymentMethod as OnRampPaymentMethod
import qualified Data.Text as T

data OnRampPaymentAvailability
  = OnRampPaymentAvailability -- ^ Describes availability of cryptocurrency purchase through an on-ramp provider
    { is_allowed          :: Maybe Bool                                      -- ^ True, if the current user can use the provider
    , is_purchase_allowed :: Maybe Bool                                      -- ^ True, if the current user can purchase through the provider
    , methods             :: Maybe [OnRampPaymentMethod.OnRampPaymentMethod] -- ^ The list of available payment methods
    , country_code        :: Maybe T.Text                                    -- ^ A two-letter ISO 3166-1 alpha-2 country code of the current user's country
    , state               :: Maybe T.Text                                    -- ^ Code of the state of the current user; may be empty if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow OnRampPaymentAvailability where
  shortShow OnRampPaymentAvailability
    { is_allowed          = is_allowed_
    , is_purchase_allowed = is_purchase_allowed_
    , methods             = methods_
    , country_code        = country_code_
    , state               = state_
    }
      = "OnRampPaymentAvailability"
        ++ I.cc
        [ "is_allowed"          `I.p` is_allowed_
        , "is_purchase_allowed" `I.p` is_purchase_allowed_
        , "methods"             `I.p` methods_
        , "country_code"        `I.p` country_code_
        , "state"               `I.p` state_
        ]

instance AT.FromJSON OnRampPaymentAvailability where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "onRampPaymentAvailability" -> parseOnRampPaymentAvailability v
      _                           -> mempty
    
    where
      parseOnRampPaymentAvailability :: A.Value -> AT.Parser OnRampPaymentAvailability
      parseOnRampPaymentAvailability = A.withObject "OnRampPaymentAvailability" $ \o -> do
        is_allowed_          <- o A..:?  "is_allowed"
        is_purchase_allowed_ <- o A..:?  "is_purchase_allowed"
        methods_             <- o A..:?  "methods"
        country_code_        <- o A..:?  "country_code"
        state_               <- o A..:?  "state"
        pure $ OnRampPaymentAvailability
          { is_allowed          = is_allowed_
          , is_purchase_allowed = is_purchase_allowed_
          , methods             = methods_
          , country_code        = country_code_
          , state               = state_
          }
  parseJSON _ = mempty

