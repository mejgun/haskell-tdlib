module TD.Data.PremiumState
  (PremiumState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.PremiumStatePaymentOption as PremiumStatePaymentOption
import qualified TD.Data.PremiumFeaturePromotionAnimation as PremiumFeaturePromotionAnimation
import qualified TD.Data.BusinessFeaturePromotionAnimation as BusinessFeaturePromotionAnimation

data PremiumState
  = PremiumState -- ^ Contains state of Telegram Premium subscription and promotion videos for Premium features
    { state               :: Maybe FormattedText.FormattedText                                           -- ^ Text description of the state of the current Premium subscription; may be empty if the current user has no Telegram Premium subscription
    , payment_options     :: Maybe [PremiumStatePaymentOption.PremiumStatePaymentOption]                 -- ^ The list of available options for buying Telegram Premium
    , animations          :: Maybe [PremiumFeaturePromotionAnimation.PremiumFeaturePromotionAnimation]   -- ^ The list of available promotion animations for Premium features
    , business_animations :: Maybe [BusinessFeaturePromotionAnimation.BusinessFeaturePromotionAnimation] -- ^ The list of available promotion animations for Business features
    }
  deriving (Eq, Show)

instance I.ShortShow PremiumState where
  shortShow PremiumState
    { state               = state_
    , payment_options     = payment_options_
    , animations          = animations_
    , business_animations = business_animations_
    }
      = "PremiumState"
        ++ I.cc
        [ "state"               `I.p` state_
        , "payment_options"     `I.p` payment_options_
        , "animations"          `I.p` animations_
        , "business_animations" `I.p` business_animations_
        ]

instance AT.FromJSON PremiumState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumState" -> parsePremiumState v
      _              -> mempty
    
    where
      parsePremiumState :: A.Value -> AT.Parser PremiumState
      parsePremiumState = A.withObject "PremiumState" $ \o -> do
        state_               <- o A..:?  "state"
        payment_options_     <- o A..:?  "payment_options"
        animations_          <- o A..:?  "animations"
        business_animations_ <- o A..:?  "business_animations"
        pure $ PremiumState
          { state               = state_
          , payment_options     = payment_options_
          , animations          = animations_
          , business_animations = business_animations_
          }
  parseJSON _ = mempty

