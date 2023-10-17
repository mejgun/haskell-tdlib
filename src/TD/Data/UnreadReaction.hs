module TD.Data.UnreadReaction
  (UnreadReaction(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType
import qualified TD.Data.MessageSender as MessageSender

data UnreadReaction
  = UnreadReaction -- ^ Contains information about an unread reaction to a message
    { _type     :: Maybe ReactionType.ReactionType   -- ^ Type of the reaction
    , sender_id :: Maybe MessageSender.MessageSender -- ^ Identifier of the sender, added the reaction
    , is_big    :: Maybe Bool                        -- ^ True, if the reaction was added with a big animation
    }
  deriving (Eq, Show)

instance I.ShortShow UnreadReaction where
  shortShow UnreadReaction
    { _type     = _type_
    , sender_id = sender_id_
    , is_big    = is_big_
    }
      = "UnreadReaction"
        ++ I.cc
        [ "_type"     `I.p` _type_
        , "sender_id" `I.p` sender_id_
        , "is_big"    `I.p` is_big_
        ]

instance AT.FromJSON UnreadReaction where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "unreadReaction" -> parseUnreadReaction v
      _                -> mempty
    
    where
      parseUnreadReaction :: A.Value -> AT.Parser UnreadReaction
      parseUnreadReaction = A.withObject "UnreadReaction" $ \o -> do
        _type_     <- o A..:?  "type"
        sender_id_ <- o A..:?  "sender_id"
        is_big_    <- o A..:?  "is_big"
        pure $ UnreadReaction
          { _type     = _type_
          , sender_id = sender_id_
          , is_big    = is_big_
          }
  parseJSON _ = mempty

