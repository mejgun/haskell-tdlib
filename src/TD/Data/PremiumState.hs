{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PremiumState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.PremiumFeaturePromotionAnimation as PremiumFeaturePromotionAnimation
import qualified TD.Data.PremiumPaymentOption as PremiumPaymentOption
import qualified Utils as U

-- |
data PremiumState = -- | Contains state of Telegram Premium subscription and promotion videos for Premium features
  PremiumState
  { -- | The list of available promotion animations for Premium features
    animations :: Maybe [PremiumFeaturePromotionAnimation.PremiumFeaturePromotionAnimation],
    -- | The list of available options for buying Telegram Premium
    payment_options :: Maybe [PremiumPaymentOption.PremiumPaymentOption],
    -- | Text description of the state of the current Premium subscription; may be empty if the current user has no Telegram Premium subscription
    state :: Maybe FormattedText.FormattedText
  }
  deriving (Eq)

instance Show PremiumState where
  show
    PremiumState
      { animations = animations_,
        payment_options = payment_options_,
        state = state_
      } =
      "PremiumState"
        ++ U.cc
          [ U.p "animations" animations_,
            U.p "payment_options" payment_options_,
            U.p "state" state_
          ]

instance T.FromJSON PremiumState where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "premiumState" -> parsePremiumState v
      _ -> mempty
    where
      parsePremiumState :: A.Value -> T.Parser PremiumState
      parsePremiumState = A.withObject "PremiumState" $ \o -> do
        animations_ <- o A..:? "animations"
        payment_options_ <- o A..:? "payment_options"
        state_ <- o A..:? "state"
        return $ PremiumState {animations = animations_, payment_options = payment_options_, state = state_}
  parseJSON _ = mempty

instance T.ToJSON PremiumState where
  toJSON
    PremiumState
      { animations = animations_,
        payment_options = payment_options_,
        state = state_
      } =
      A.object
        [ "@type" A..= T.String "premiumState",
          "animations" A..= animations_,
          "payment_options" A..= payment_options_,
          "state" A..= state_
        ]
