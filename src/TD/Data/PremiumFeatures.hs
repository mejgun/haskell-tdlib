module TD.Data.PremiumFeatures
  (PremiumFeatures(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PremiumFeature as PremiumFeature
import qualified TD.Data.PremiumLimit as PremiumLimit
import qualified TD.Data.InternalLinkType as InternalLinkType

data PremiumFeatures
  = PremiumFeatures -- ^ Contains information about features, available to Premium users
    { features     :: Maybe [PremiumFeature.PremiumFeature]   -- ^ The list of available features
    , limits       :: Maybe [PremiumLimit.PremiumLimit]       -- ^ The list of limits, increased for Premium users
    , payment_link :: Maybe InternalLinkType.InternalLinkType -- ^ An internal link to be opened to pay for Telegram Premium if store payment isn't possible; may be null if direct payment isn't available
    }
  deriving (Eq, Show)

instance I.ShortShow PremiumFeatures where
  shortShow PremiumFeatures
    { features     = features_
    , limits       = limits_
    , payment_link = payment_link_
    }
      = "PremiumFeatures"
        ++ I.cc
        [ "features"     `I.p` features_
        , "limits"       `I.p` limits_
        , "payment_link" `I.p` payment_link_
        ]

instance AT.FromJSON PremiumFeatures where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumFeatures" -> parsePremiumFeatures v
      _                 -> mempty
    
    where
      parsePremiumFeatures :: A.Value -> AT.Parser PremiumFeatures
      parsePremiumFeatures = A.withObject "PremiumFeatures" $ \o -> do
        features_     <- o A..:?  "features"
        limits_       <- o A..:?  "limits"
        payment_link_ <- o A..:?  "payment_link"
        pure $ PremiumFeatures
          { features     = features_
          , limits       = limits_
          , payment_link = payment_link_
          }
  parseJSON _ = mempty

