module TD.Data.GroupCallMessage
  (GroupCallMessage(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.FormattedText as FormattedText

data GroupCallMessage
  = GroupCallMessage -- ^ Represents a message sent in a group call
    { message_id              :: Maybe Int                         -- ^ Unique message identifier within the group call
    , sender_id               :: Maybe MessageSender.MessageSender -- ^ Identifier of the sender of the message
    , date                    :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the message was sent
    , text                    :: Maybe FormattedText.FormattedText -- ^ Text of the message. If empty, then the message is a paid reaction in a live story
    , paid_message_star_count :: Maybe Int                         -- ^ The number of Telegram Stars that were paid to send the message; for live stories only
    , is_from_owner           :: Maybe Bool                        -- ^ True, if the message is sent by the owner of the call and must be treated as a message of the maximum level; for live stories only
    , can_be_deleted          :: Maybe Bool                        -- ^ True, if the message can be deleted by the current user; for live stories only
    }
  deriving (Eq, Show)

instance I.ShortShow GroupCallMessage where
  shortShow GroupCallMessage
    { message_id              = message_id_
    , sender_id               = sender_id_
    , date                    = date_
    , text                    = text_
    , paid_message_star_count = paid_message_star_count_
    , is_from_owner           = is_from_owner_
    , can_be_deleted          = can_be_deleted_
    }
      = "GroupCallMessage"
        ++ I.cc
        [ "message_id"              `I.p` message_id_
        , "sender_id"               `I.p` sender_id_
        , "date"                    `I.p` date_
        , "text"                    `I.p` text_
        , "paid_message_star_count" `I.p` paid_message_star_count_
        , "is_from_owner"           `I.p` is_from_owner_
        , "can_be_deleted"          `I.p` can_be_deleted_
        ]

instance AT.FromJSON GroupCallMessage where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "groupCallMessage" -> parseGroupCallMessage v
      _                  -> mempty
    
    where
      parseGroupCallMessage :: A.Value -> AT.Parser GroupCallMessage
      parseGroupCallMessage = A.withObject "GroupCallMessage" $ \o -> do
        message_id_              <- o A..:?  "message_id"
        sender_id_               <- o A..:?  "sender_id"
        date_                    <- o A..:?  "date"
        text_                    <- o A..:?  "text"
        paid_message_star_count_ <- o A..:?  "paid_message_star_count"
        is_from_owner_           <- o A..:?  "is_from_owner"
        can_be_deleted_          <- o A..:?  "can_be_deleted"
        pure $ GroupCallMessage
          { message_id              = message_id_
          , sender_id               = sender_id_
          , date                    = date_
          , text                    = text_
          , paid_message_star_count = paid_message_star_count_
          , is_from_owner           = is_from_owner_
          , can_be_deleted          = can_be_deleted_
          }
  parseJSON _ = mempty

