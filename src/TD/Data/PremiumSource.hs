module TD.Data.PremiumSource
  (PremiumSource(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PremiumLimitType as PremiumLimitType
import qualified TD.Data.PremiumFeature as PremiumFeature
import qualified TD.Data.BusinessFeature as BusinessFeature
import qualified TD.Data.PremiumStoryFeature as PremiumStoryFeature
import qualified Data.Text as T

-- | Describes a source from which the Premium features screen is opened
data PremiumSource
  = PremiumSourceLimitExceeded -- ^ A limit was exceeded
    { limit_type :: Maybe PremiumLimitType.PremiumLimitType -- ^ Type of the exceeded limit
    }
  | PremiumSourceFeature -- ^ A user tried to use a Premium feature
    { feature :: Maybe PremiumFeature.PremiumFeature -- ^ The used feature
    }
  | PremiumSourceBusinessFeature -- ^ A user tried to use a Business feature
    { _feature :: Maybe BusinessFeature.BusinessFeature -- ^ The used feature; pass null if none specific feature was used
    }
  | PremiumSourceStoryFeature -- ^ A user tried to use a Premium story feature
    { __feature :: Maybe PremiumStoryFeature.PremiumStoryFeature -- ^ The used feature
    }
  | PremiumSourceLink -- ^ A user opened an internal link of the type internalLinkTypePremiumFeatures
    { referrer :: Maybe T.Text -- ^ The referrer from the link
    }
  | PremiumSourceSettings -- ^ A user opened the Premium features screen from settings
  deriving (Eq, Show)

instance I.ShortShow PremiumSource where
  shortShow PremiumSourceLimitExceeded
    { limit_type = limit_type_
    }
      = "PremiumSourceLimitExceeded"
        ++ I.cc
        [ "limit_type" `I.p` limit_type_
        ]
  shortShow PremiumSourceFeature
    { feature = feature_
    }
      = "PremiumSourceFeature"
        ++ I.cc
        [ "feature" `I.p` feature_
        ]
  shortShow PremiumSourceBusinessFeature
    { _feature = _feature_
    }
      = "PremiumSourceBusinessFeature"
        ++ I.cc
        [ "_feature" `I.p` _feature_
        ]
  shortShow PremiumSourceStoryFeature
    { __feature = __feature_
    }
      = "PremiumSourceStoryFeature"
        ++ I.cc
        [ "__feature" `I.p` __feature_
        ]
  shortShow PremiumSourceLink
    { referrer = referrer_
    }
      = "PremiumSourceLink"
        ++ I.cc
        [ "referrer" `I.p` referrer_
        ]
  shortShow PremiumSourceSettings
      = "PremiumSourceSettings"

instance AT.FromJSON PremiumSource where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumSourceLimitExceeded"   -> parsePremiumSourceLimitExceeded v
      "premiumSourceFeature"         -> parsePremiumSourceFeature v
      "premiumSourceBusinessFeature" -> parsePremiumSourceBusinessFeature v
      "premiumSourceStoryFeature"    -> parsePremiumSourceStoryFeature v
      "premiumSourceLink"            -> parsePremiumSourceLink v
      "premiumSourceSettings"        -> pure PremiumSourceSettings
      _                              -> mempty
    
    where
      parsePremiumSourceLimitExceeded :: A.Value -> AT.Parser PremiumSource
      parsePremiumSourceLimitExceeded = A.withObject "PremiumSourceLimitExceeded" $ \o -> do
        limit_type_ <- o A..:?  "limit_type"
        pure $ PremiumSourceLimitExceeded
          { limit_type = limit_type_
          }
      parsePremiumSourceFeature :: A.Value -> AT.Parser PremiumSource
      parsePremiumSourceFeature = A.withObject "PremiumSourceFeature" $ \o -> do
        feature_ <- o A..:?  "feature"
        pure $ PremiumSourceFeature
          { feature = feature_
          }
      parsePremiumSourceBusinessFeature :: A.Value -> AT.Parser PremiumSource
      parsePremiumSourceBusinessFeature = A.withObject "PremiumSourceBusinessFeature" $ \o -> do
        _feature_ <- o A..:?  "feature"
        pure $ PremiumSourceBusinessFeature
          { _feature = _feature_
          }
      parsePremiumSourceStoryFeature :: A.Value -> AT.Parser PremiumSource
      parsePremiumSourceStoryFeature = A.withObject "PremiumSourceStoryFeature" $ \o -> do
        __feature_ <- o A..:?  "feature"
        pure $ PremiumSourceStoryFeature
          { __feature = __feature_
          }
      parsePremiumSourceLink :: A.Value -> AT.Parser PremiumSource
      parsePremiumSourceLink = A.withObject "PremiumSourceLink" $ \o -> do
        referrer_ <- o A..:?  "referrer"
        pure $ PremiumSourceLink
          { referrer = referrer_
          }
  parseJSON _ = mempty

instance AT.ToJSON PremiumSource where
  toJSON PremiumSourceLimitExceeded
    { limit_type = limit_type_
    }
      = A.object
        [ "@type"      A..= AT.String "premiumSourceLimitExceeded"
        , "limit_type" A..= limit_type_
        ]
  toJSON PremiumSourceFeature
    { feature = feature_
    }
      = A.object
        [ "@type"   A..= AT.String "premiumSourceFeature"
        , "feature" A..= feature_
        ]
  toJSON PremiumSourceBusinessFeature
    { _feature = _feature_
    }
      = A.object
        [ "@type"   A..= AT.String "premiumSourceBusinessFeature"
        , "feature" A..= _feature_
        ]
  toJSON PremiumSourceStoryFeature
    { __feature = __feature_
    }
      = A.object
        [ "@type"   A..= AT.String "premiumSourceStoryFeature"
        , "feature" A..= __feature_
        ]
  toJSON PremiumSourceLink
    { referrer = referrer_
    }
      = A.object
        [ "@type"    A..= AT.String "premiumSourceLink"
        , "referrer" A..= referrer_
        ]
  toJSON PremiumSourceSettings
      = A.object
        [ "@type" A..= AT.String "premiumSourceSettings"
        ]

