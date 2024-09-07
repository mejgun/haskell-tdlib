module TD.Data.ChatTransactionPurpose
  (ChatTransactionPurpose(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PaidMedia as PaidMedia

-- | Describes purpose of a transaction with a supergroup or a channel
data ChatTransactionPurpose
  = ChatTransactionPurposePaidMedia -- ^ Paid media were bought
    { message_id :: Maybe Int                   -- ^ Identifier of the corresponding message with paid media; can be 0 or an identifier of a deleted message
    , media      :: Maybe [PaidMedia.PaidMedia] -- ^ The bought media if the trancastion wasn't refunded
    }
  | ChatTransactionPurposeJoin -- ^ User joined the channel and subscribed to regular payments in Telegram Stars
    { period :: Maybe Int -- ^ The number of seconds between consecutive Telegram Star debiting
    }
  | ChatTransactionPurposeReaction -- ^ User paid for a reaction
    { message_id :: Maybe Int -- ^ Identifier of the reacted message; can be 0 or an identifier of a deleted message
    }
  | ChatTransactionPurposeGiveaway -- ^ User received Telegram Stars from a giveaway
    { giveaway_message_id :: Maybe Int -- ^ Identifier of the message with giveaway; can be 0 or an identifier of a deleted message
    }
  deriving (Eq, Show)

instance I.ShortShow ChatTransactionPurpose where
  shortShow ChatTransactionPurposePaidMedia
    { message_id = message_id_
    , media      = media_
    }
      = "ChatTransactionPurposePaidMedia"
        ++ I.cc
        [ "message_id" `I.p` message_id_
        , "media"      `I.p` media_
        ]
  shortShow ChatTransactionPurposeJoin
    { period = period_
    }
      = "ChatTransactionPurposeJoin"
        ++ I.cc
        [ "period" `I.p` period_
        ]
  shortShow ChatTransactionPurposeReaction
    { message_id = message_id_
    }
      = "ChatTransactionPurposeReaction"
        ++ I.cc
        [ "message_id" `I.p` message_id_
        ]
  shortShow ChatTransactionPurposeGiveaway
    { giveaway_message_id = giveaway_message_id_
    }
      = "ChatTransactionPurposeGiveaway"
        ++ I.cc
        [ "giveaway_message_id" `I.p` giveaway_message_id_
        ]

instance AT.FromJSON ChatTransactionPurpose where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatTransactionPurposePaidMedia" -> parseChatTransactionPurposePaidMedia v
      "chatTransactionPurposeJoin"      -> parseChatTransactionPurposeJoin v
      "chatTransactionPurposeReaction"  -> parseChatTransactionPurposeReaction v
      "chatTransactionPurposeGiveaway"  -> parseChatTransactionPurposeGiveaway v
      _                                 -> mempty
    
    where
      parseChatTransactionPurposePaidMedia :: A.Value -> AT.Parser ChatTransactionPurpose
      parseChatTransactionPurposePaidMedia = A.withObject "ChatTransactionPurposePaidMedia" $ \o -> do
        message_id_ <- o A..:?  "message_id"
        media_      <- o A..:?  "media"
        pure $ ChatTransactionPurposePaidMedia
          { message_id = message_id_
          , media      = media_
          }
      parseChatTransactionPurposeJoin :: A.Value -> AT.Parser ChatTransactionPurpose
      parseChatTransactionPurposeJoin = A.withObject "ChatTransactionPurposeJoin" $ \o -> do
        period_ <- o A..:?  "period"
        pure $ ChatTransactionPurposeJoin
          { period = period_
          }
      parseChatTransactionPurposeReaction :: A.Value -> AT.Parser ChatTransactionPurpose
      parseChatTransactionPurposeReaction = A.withObject "ChatTransactionPurposeReaction" $ \o -> do
        message_id_ <- o A..:?  "message_id"
        pure $ ChatTransactionPurposeReaction
          { message_id = message_id_
          }
      parseChatTransactionPurposeGiveaway :: A.Value -> AT.Parser ChatTransactionPurpose
      parseChatTransactionPurposeGiveaway = A.withObject "ChatTransactionPurposeGiveaway" $ \o -> do
        giveaway_message_id_ <- o A..:?  "giveaway_message_id"
        pure $ ChatTransactionPurposeGiveaway
          { giveaway_message_id = giveaway_message_id_
          }
  parseJSON _ = mempty

