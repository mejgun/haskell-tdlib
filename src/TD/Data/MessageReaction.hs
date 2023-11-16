module TD.Data.MessageReaction
  (MessageReaction(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType
import qualified TD.Data.MessageSender as MessageSender

data MessageReaction
  = MessageReaction -- ^ Contains information about a reaction to a message
    { _type             :: Maybe ReactionType.ReactionType     -- ^ Type of the reaction
    , total_count       :: Maybe Int                           -- ^ Number of times the reaction was added
    , is_chosen         :: Maybe Bool                          -- ^ True, if the reaction is chosen by the current user
    , used_sender_id    :: Maybe MessageSender.MessageSender   -- ^ Identifier of the message sender used by the current user to add the reaction; may be null if unknown or the reaction isn't chosen
    , recent_sender_ids :: Maybe [MessageSender.MessageSender] -- ^ Identifiers of at most 3 recent message senders, added the reaction; available in private, basic group and supergroup chats
    }
  deriving (Eq, Show)

instance I.ShortShow MessageReaction where
  shortShow MessageReaction
    { _type             = _type_
    , total_count       = total_count_
    , is_chosen         = is_chosen_
    , used_sender_id    = used_sender_id_
    , recent_sender_ids = recent_sender_ids_
    }
      = "MessageReaction"
        ++ I.cc
        [ "_type"             `I.p` _type_
        , "total_count"       `I.p` total_count_
        , "is_chosen"         `I.p` is_chosen_
        , "used_sender_id"    `I.p` used_sender_id_
        , "recent_sender_ids" `I.p` recent_sender_ids_
        ]

instance AT.FromJSON MessageReaction where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageReaction" -> parseMessageReaction v
      _                 -> mempty
    
    where
      parseMessageReaction :: A.Value -> AT.Parser MessageReaction
      parseMessageReaction = A.withObject "MessageReaction" $ \o -> do
        _type_             <- o A..:?  "type"
        total_count_       <- o A..:?  "total_count"
        is_chosen_         <- o A..:?  "is_chosen"
        used_sender_id_    <- o A..:?  "used_sender_id"
        recent_sender_ids_ <- o A..:?  "recent_sender_ids"
        pure $ MessageReaction
          { _type             = _type_
          , total_count       = total_count_
          , is_chosen         = is_chosen_
          , used_sender_id    = used_sender_id_
          , recent_sender_ids = recent_sender_ids_
          }
  parseJSON _ = mempty

