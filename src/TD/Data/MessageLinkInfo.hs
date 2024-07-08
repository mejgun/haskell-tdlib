module TD.Data.MessageLinkInfo
  (MessageLinkInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Message as Message

data MessageLinkInfo
  = MessageLinkInfo -- ^ Contains information about a link to a message or a forum topic in a chat
    { is_public         :: Maybe Bool            -- ^ True, if the link is a public link for a message or a forum topic in a chat
    , chat_id           :: Maybe Int             -- ^ If found, identifier of the chat to which the link points, 0 otherwise
    , message_thread_id :: Maybe Int             -- ^ If found, identifier of the message thread in which to open the message, or a forum topic to open if the message is missing
    , message           :: Maybe Message.Message -- ^ If found, the linked message; may be null
    , media_timestamp   :: Maybe Int             -- ^ Timestamp from which the video/audio/video note/voice note/story playing must start, in seconds; 0 if not specified. The media can be in the message content or in its link preview
    , for_album         :: Maybe Bool            -- ^ True, if the whole media album to which the message belongs is linked
    }
  deriving (Eq, Show)

instance I.ShortShow MessageLinkInfo where
  shortShow MessageLinkInfo
    { is_public         = is_public_
    , chat_id           = chat_id_
    , message_thread_id = message_thread_id_
    , message           = message_
    , media_timestamp   = media_timestamp_
    , for_album         = for_album_
    }
      = "MessageLinkInfo"
        ++ I.cc
        [ "is_public"         `I.p` is_public_
        , "chat_id"           `I.p` chat_id_
        , "message_thread_id" `I.p` message_thread_id_
        , "message"           `I.p` message_
        , "media_timestamp"   `I.p` media_timestamp_
        , "for_album"         `I.p` for_album_
        ]

instance AT.FromJSON MessageLinkInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageLinkInfo" -> parseMessageLinkInfo v
      _                 -> mempty
    
    where
      parseMessageLinkInfo :: A.Value -> AT.Parser MessageLinkInfo
      parseMessageLinkInfo = A.withObject "MessageLinkInfo" $ \o -> do
        is_public_         <- o A..:?  "is_public"
        chat_id_           <- o A..:?  "chat_id"
        message_thread_id_ <- o A..:?  "message_thread_id"
        message_           <- o A..:?  "message"
        media_timestamp_   <- o A..:?  "media_timestamp"
        for_album_         <- o A..:?  "for_album"
        pure $ MessageLinkInfo
          { is_public         = is_public_
          , chat_id           = chat_id_
          , message_thread_id = message_thread_id_
          , message           = message_
          , media_timestamp   = media_timestamp_
          , for_album         = for_album_
          }
  parseJSON _ = mempty

