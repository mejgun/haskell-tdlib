{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PremiumState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.PremiumFeaturePromotionAnimation as PremiumFeaturePromotionAnimation
import qualified Utils as U

-- |
data PremiumState = -- | Contains state of Telegram Premium subscription and promotion videos for Premium features
  PremiumState
  { -- | The list of available promotion animations for Premium features
    animations :: Maybe [PremiumFeaturePromotionAnimation.PremiumFeaturePromotionAnimation],
    -- | Monthly subscription payment for Telegram Premium subscription, in the smallest units of the currency
    monthly_amount :: Maybe Int,
    -- | ISO 4217 currency code for Telegram Premium subscription payment
    currency :: Maybe String,
    -- | Text description of the state of the current Premium subscription; may be empty if the current user has no Telegram Premium subscription
    state :: Maybe FormattedText.FormattedText
  }
  deriving (Eq)

instance Show PremiumState where
  show
    PremiumState
      { animations = animations_,
        monthly_amount = monthly_amount_,
        currency = currency_,
        state = state_
      } =
      "PremiumState"
        ++ U.cc
          [ U.p "animations" animations_,
            U.p "monthly_amount" monthly_amount_,
            U.p "currency" currency_,
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
        monthly_amount_ <- o A..:? "monthly_amount"
        currency_ <- o A..:? "currency"
        state_ <- o A..:? "state"
        return $ PremiumState {animations = animations_, monthly_amount = monthly_amount_, currency = currency_, state = state_}
  parseJSON _ = mempty

instance T.ToJSON PremiumState where
  toJSON
    PremiumState
      { animations = animations_,
        monthly_amount = monthly_amount_,
        currency = currency_,
        state = state_
      } =
      A.object
        [ "@type" A..= T.String "premiumState",
          "animations" A..= animations_,
          "monthly_amount" A..= monthly_amount_,
          "currency" A..= currency_,
          "state" A..= state_
        ]
