module TD.Data.UserTransactionPurpose
  (UserTransactionPurpose(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.Gift as Gift

-- | Describes purpose of a transaction with a user
data UserTransactionPurpose
  = UserTransactionPurposeGiftedStars -- ^ A user gifted Telegram Stars
    { sticker :: Maybe Sticker.Sticker -- ^ A sticker to be shown in the transaction information; may be null if unknown
    }
  | UserTransactionPurposeGiftSell -- ^ The user sold a gift received from another user or bot
    { gift :: Maybe Gift.Gift -- ^ The gift
    }
  | UserTransactionPurposeGiftSend -- ^ The user or the bot sent a gift to a user
    { gift :: Maybe Gift.Gift -- ^ The gift
    }
  deriving (Eq, Show)

instance I.ShortShow UserTransactionPurpose where
  shortShow UserTransactionPurposeGiftedStars
    { sticker = sticker_
    }
      = "UserTransactionPurposeGiftedStars"
        ++ I.cc
        [ "sticker" `I.p` sticker_
        ]
  shortShow UserTransactionPurposeGiftSell
    { gift = gift_
    }
      = "UserTransactionPurposeGiftSell"
        ++ I.cc
        [ "gift" `I.p` gift_
        ]
  shortShow UserTransactionPurposeGiftSend
    { gift = gift_
    }
      = "UserTransactionPurposeGiftSend"
        ++ I.cc
        [ "gift" `I.p` gift_
        ]

instance AT.FromJSON UserTransactionPurpose where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userTransactionPurposeGiftedStars" -> parseUserTransactionPurposeGiftedStars v
      "userTransactionPurposeGiftSell"    -> parseUserTransactionPurposeGiftSell v
      "userTransactionPurposeGiftSend"    -> parseUserTransactionPurposeGiftSend v
      _                                   -> mempty
    
    where
      parseUserTransactionPurposeGiftedStars :: A.Value -> AT.Parser UserTransactionPurpose
      parseUserTransactionPurposeGiftedStars = A.withObject "UserTransactionPurposeGiftedStars" $ \o -> do
        sticker_ <- o A..:?  "sticker"
        pure $ UserTransactionPurposeGiftedStars
          { sticker = sticker_
          }
      parseUserTransactionPurposeGiftSell :: A.Value -> AT.Parser UserTransactionPurpose
      parseUserTransactionPurposeGiftSell = A.withObject "UserTransactionPurposeGiftSell" $ \o -> do
        gift_ <- o A..:?  "gift"
        pure $ UserTransactionPurposeGiftSell
          { gift = gift_
          }
      parseUserTransactionPurposeGiftSend :: A.Value -> AT.Parser UserTransactionPurpose
      parseUserTransactionPurposeGiftSend = A.withObject "UserTransactionPurposeGiftSend" $ \o -> do
        gift_ <- o A..:?  "gift"
        pure $ UserTransactionPurposeGiftSend
          { gift = gift_
          }
  parseJSON _ = mempty

