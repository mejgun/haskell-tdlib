module TD.Data.SentGift
  (SentGift(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Gift as Gift
import qualified TD.Data.UpgradedGift as UpgradedGift

-- | Represents content of a gift received by a user or a channel chat
data SentGift
  = SentGiftRegular -- ^ Regular gift
    { gift :: Maybe Gift.Gift -- ^ The gift
    }
  | SentGiftUpgraded -- ^ Upgraded gift
    { _gift :: Maybe UpgradedGift.UpgradedGift -- ^ The gift
    }
  deriving (Eq, Show)

instance I.ShortShow SentGift where
  shortShow SentGiftRegular
    { gift = gift_
    }
      = "SentGiftRegular"
        ++ I.cc
        [ "gift" `I.p` gift_
        ]
  shortShow SentGiftUpgraded
    { _gift = _gift_
    }
      = "SentGiftUpgraded"
        ++ I.cc
        [ "_gift" `I.p` _gift_
        ]

instance AT.FromJSON SentGift where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "sentGiftRegular"  -> parseSentGiftRegular v
      "sentGiftUpgraded" -> parseSentGiftUpgraded v
      _                  -> mempty
    
    where
      parseSentGiftRegular :: A.Value -> AT.Parser SentGift
      parseSentGiftRegular = A.withObject "SentGiftRegular" $ \o -> do
        gift_ <- o A..:?  "gift"
        pure $ SentGiftRegular
          { gift = gift_
          }
      parseSentGiftUpgraded :: A.Value -> AT.Parser SentGift
      parseSentGiftUpgraded = A.withObject "SentGiftUpgraded" $ \o -> do
        _gift_ <- o A..:?  "gift"
        pure $ SentGiftUpgraded
          { _gift = _gift_
          }
  parseJSON _ = mempty

