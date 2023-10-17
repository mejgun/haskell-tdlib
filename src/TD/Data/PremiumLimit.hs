module TD.Data.PremiumLimit
  (PremiumLimit(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PremiumLimitType as PremiumLimitType

data PremiumLimit
  = PremiumLimit -- ^ Contains information about a limit, increased for Premium users
    { _type         :: Maybe PremiumLimitType.PremiumLimitType -- ^ The type of the limit
    , default_value :: Maybe Int                               -- ^ Default value of the limit
    , premium_value :: Maybe Int                               -- ^ Value of the limit for Premium users
    }
  deriving (Eq, Show)

instance I.ShortShow PremiumLimit where
  shortShow PremiumLimit
    { _type         = _type_
    , default_value = default_value_
    , premium_value = premium_value_
    }
      = "PremiumLimit"
        ++ I.cc
        [ "_type"         `I.p` _type_
        , "default_value" `I.p` default_value_
        , "premium_value" `I.p` premium_value_
        ]

instance AT.FromJSON PremiumLimit where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumLimit" -> parsePremiumLimit v
      _              -> mempty
    
    where
      parsePremiumLimit :: A.Value -> AT.Parser PremiumLimit
      parsePremiumLimit = A.withObject "PremiumLimit" $ \o -> do
        _type_         <- o A..:?  "type"
        default_value_ <- o A..:?  "default_value"
        premium_value_ <- o A..:?  "premium_value"
        pure $ PremiumLimit
          { _type         = _type_
          , default_value = default_value_
          , premium_value = premium_value_
          }
  parseJSON _ = mempty

