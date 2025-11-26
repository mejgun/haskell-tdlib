module TD.Data.AcceptedGiftTypes
  ( AcceptedGiftTypes(..)    
  , defaultAcceptedGiftTypes 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data AcceptedGiftTypes
  = AcceptedGiftTypes -- ^ Describes gift types that are accepted by a user
    { unlimited_gifts      :: Maybe Bool -- ^ True, if unlimited regular gifts are accepted
    , limited_gifts        :: Maybe Bool -- ^ True, if limited regular gifts are accepted
    , upgraded_gifts       :: Maybe Bool -- ^ True, if upgraded gifts and regular gifts that can be upgraded for free are accepted
    , gifts_from_channels  :: Maybe Bool -- ^ True, if gifts from channels are accepted subject to other restrictions
    , premium_subscription :: Maybe Bool -- ^ True, if Telegram Premium subscription is accepted
    }
  deriving (Eq, Show)

instance I.ShortShow AcceptedGiftTypes where
  shortShow AcceptedGiftTypes
    { unlimited_gifts      = unlimited_gifts_
    , limited_gifts        = limited_gifts_
    , upgraded_gifts       = upgraded_gifts_
    , gifts_from_channels  = gifts_from_channels_
    , premium_subscription = premium_subscription_
    }
      = "AcceptedGiftTypes"
        ++ I.cc
        [ "unlimited_gifts"      `I.p` unlimited_gifts_
        , "limited_gifts"        `I.p` limited_gifts_
        , "upgraded_gifts"       `I.p` upgraded_gifts_
        , "gifts_from_channels"  `I.p` gifts_from_channels_
        , "premium_subscription" `I.p` premium_subscription_
        ]

instance AT.FromJSON AcceptedGiftTypes where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "acceptedGiftTypes" -> parseAcceptedGiftTypes v
      _                   -> mempty
    
    where
      parseAcceptedGiftTypes :: A.Value -> AT.Parser AcceptedGiftTypes
      parseAcceptedGiftTypes = A.withObject "AcceptedGiftTypes" $ \o -> do
        unlimited_gifts_      <- o A..:?  "unlimited_gifts"
        limited_gifts_        <- o A..:?  "limited_gifts"
        upgraded_gifts_       <- o A..:?  "upgraded_gifts"
        gifts_from_channels_  <- o A..:?  "gifts_from_channels"
        premium_subscription_ <- o A..:?  "premium_subscription"
        pure $ AcceptedGiftTypes
          { unlimited_gifts      = unlimited_gifts_
          , limited_gifts        = limited_gifts_
          , upgraded_gifts       = upgraded_gifts_
          , gifts_from_channels  = gifts_from_channels_
          , premium_subscription = premium_subscription_
          }
  parseJSON _ = mempty

instance AT.ToJSON AcceptedGiftTypes where
  toJSON AcceptedGiftTypes
    { unlimited_gifts      = unlimited_gifts_
    , limited_gifts        = limited_gifts_
    , upgraded_gifts       = upgraded_gifts_
    , gifts_from_channels  = gifts_from_channels_
    , premium_subscription = premium_subscription_
    }
      = A.object
        [ "@type"                A..= AT.String "acceptedGiftTypes"
        , "unlimited_gifts"      A..= unlimited_gifts_
        , "limited_gifts"        A..= limited_gifts_
        , "upgraded_gifts"       A..= upgraded_gifts_
        , "gifts_from_channels"  A..= gifts_from_channels_
        , "premium_subscription" A..= premium_subscription_
        ]

defaultAcceptedGiftTypes :: AcceptedGiftTypes
defaultAcceptedGiftTypes =
  AcceptedGiftTypes
    { unlimited_gifts      = Nothing
    , limited_gifts        = Nothing
    , upgraded_gifts       = Nothing
    , gifts_from_channels  = Nothing
    , premium_subscription = Nothing
    }

