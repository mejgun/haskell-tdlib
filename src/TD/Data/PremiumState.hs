module TD.Data.PremiumState
  ( PremiumState(..)    
  , defaultPremiumState 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.PremiumStatePaymentOption as PremiumStatePaymentOption
import qualified TD.Data.PremiumFeaturePromotionAnimation as PremiumFeaturePromotionAnimation

data PremiumState
  = PremiumState -- ^ Contains state of Telegram Premium subscription and promotion videos for Premium features
    { state           :: Maybe FormattedText.FormattedText                                         -- ^ Text description of the state of the current Premium subscription; may be empty if the current user has no Telegram Premium subscription
    , payment_options :: Maybe [PremiumStatePaymentOption.PremiumStatePaymentOption]               -- ^ The list of available options for buying Telegram Premium
    , animations      :: Maybe [PremiumFeaturePromotionAnimation.PremiumFeaturePromotionAnimation] -- ^ The list of available promotion animations for Premium features
    }
  deriving (Eq)

instance Show PremiumState where
  show PremiumState
    { state           = state_
    , payment_options = payment_options_
    , animations      = animations_
    }
      = "PremiumState"
        ++ I.cc
        [ "state"           `I.p` state_
        , "payment_options" `I.p` payment_options_
        , "animations"      `I.p` animations_
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
        state_           <- o A..:?  "state"
        payment_options_ <- o A..:?  "payment_options"
        animations_      <- o A..:?  "animations"
        pure $ PremiumState
          { state           = state_
          , payment_options = payment_options_
          , animations      = animations_
          }
  parseJSON _ = mempty

instance AT.ToJSON PremiumState where
  toJSON PremiumState
    { state           = state_
    , payment_options = payment_options_
    , animations      = animations_
    }
      = A.object
        [ "@type"           A..= AT.String "premiumState"
        , "state"           A..= state_
        , "payment_options" A..= payment_options_
        , "animations"      A..= animations_
        ]

defaultPremiumState :: PremiumState
defaultPremiumState =
  PremiumState
    { state           = Nothing
    , payment_options = Nothing
    , animations      = Nothing
    }

