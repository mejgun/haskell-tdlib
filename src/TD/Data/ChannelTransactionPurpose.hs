module TD.Data.ChannelTransactionPurpose
  (ChannelTransactionPurpose(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PaidMedia as PaidMedia

-- | Describes purpose of a transaction with a channel
data ChannelTransactionPurpose
  = ChannelTransactionPurposePaidMedia -- ^ Paid media were bought
    { message_id :: Maybe Int                   -- ^ Identifier of the corresponding message with paid media; can be an identifier of a deleted message
    , media      :: Maybe [PaidMedia.PaidMedia] -- ^ The bought media if the trancastion wasn't refunded
    }
  | ChannelTransactionPurposeJoin -- ^ User joined the channel and subscribed to regular payments in Telegram Stars
    { period :: Maybe Int -- ^ The number of seconds between consecutive Telegram Star debiting
    }
  | ChannelTransactionPurposeReaction -- ^ User paid for a reaction
    { message_id :: Maybe Int -- ^ Identifier of the reacted message; can be an identifier of a deleted message
    }
  deriving (Eq, Show)

instance I.ShortShow ChannelTransactionPurpose where
  shortShow ChannelTransactionPurposePaidMedia
    { message_id = message_id_
    , media      = media_
    }
      = "ChannelTransactionPurposePaidMedia"
        ++ I.cc
        [ "message_id" `I.p` message_id_
        , "media"      `I.p` media_
        ]
  shortShow ChannelTransactionPurposeJoin
    { period = period_
    }
      = "ChannelTransactionPurposeJoin"
        ++ I.cc
        [ "period" `I.p` period_
        ]
  shortShow ChannelTransactionPurposeReaction
    { message_id = message_id_
    }
      = "ChannelTransactionPurposeReaction"
        ++ I.cc
        [ "message_id" `I.p` message_id_
        ]

instance AT.FromJSON ChannelTransactionPurpose where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "channelTransactionPurposePaidMedia" -> parseChannelTransactionPurposePaidMedia v
      "channelTransactionPurposeJoin"      -> parseChannelTransactionPurposeJoin v
      "channelTransactionPurposeReaction"  -> parseChannelTransactionPurposeReaction v
      _                                    -> mempty
    
    where
      parseChannelTransactionPurposePaidMedia :: A.Value -> AT.Parser ChannelTransactionPurpose
      parseChannelTransactionPurposePaidMedia = A.withObject "ChannelTransactionPurposePaidMedia" $ \o -> do
        message_id_ <- o A..:?  "message_id"
        media_      <- o A..:?  "media"
        pure $ ChannelTransactionPurposePaidMedia
          { message_id = message_id_
          , media      = media_
          }
      parseChannelTransactionPurposeJoin :: A.Value -> AT.Parser ChannelTransactionPurpose
      parseChannelTransactionPurposeJoin = A.withObject "ChannelTransactionPurposeJoin" $ \o -> do
        period_ <- o A..:?  "period"
        pure $ ChannelTransactionPurposeJoin
          { period = period_
          }
      parseChannelTransactionPurposeReaction :: A.Value -> AT.Parser ChannelTransactionPurpose
      parseChannelTransactionPurposeReaction = A.withObject "ChannelTransactionPurposeReaction" $ \o -> do
        message_id_ <- o A..:?  "message_id"
        pure $ ChannelTransactionPurposeReaction
          { message_id = message_id_
          }
  parseJSON _ = mempty

