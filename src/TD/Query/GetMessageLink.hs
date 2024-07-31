module TD.Query.GetMessageLink
  (GetMessageLink(..)
  , defaultGetMessageLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns an HTTPS link to a message in a chat. Available only if messageProperties.can_get_link, or if messageProperties.can_get_media_timestamp_links and a media timestamp link is generated. This is an offline request. Returns 'TD.Data.MessageLink.MessageLink'
data GetMessageLink
  = GetMessageLink
    { chat_id           :: Maybe Int  -- ^ Identifier of the chat to which the message belongs
    , message_id        :: Maybe Int  -- ^ Identifier of the message
    , media_timestamp   :: Maybe Int  -- ^ If not 0, timestamp from which the video/audio/video note/voice note/story playing must start, in seconds. The media can be in the message content or in its link preview
    , for_album         :: Maybe Bool -- ^ Pass true to create a link for the whole media album
    , in_message_thread :: Maybe Bool -- ^ Pass true to create a link to the message as a channel post comment, in a message thread, or a forum topic
    }
  deriving (Eq, Show)

instance I.ShortShow GetMessageLink where
  shortShow
    GetMessageLink
      { chat_id           = chat_id_
      , message_id        = message_id_
      , media_timestamp   = media_timestamp_
      , for_album         = for_album_
      , in_message_thread = in_message_thread_
      }
        = "GetMessageLink"
          ++ I.cc
          [ "chat_id"           `I.p` chat_id_
          , "message_id"        `I.p` message_id_
          , "media_timestamp"   `I.p` media_timestamp_
          , "for_album"         `I.p` for_album_
          , "in_message_thread" `I.p` in_message_thread_
          ]

instance AT.ToJSON GetMessageLink where
  toJSON
    GetMessageLink
      { chat_id           = chat_id_
      , message_id        = message_id_
      , media_timestamp   = media_timestamp_
      , for_album         = for_album_
      , in_message_thread = in_message_thread_
      }
        = A.object
          [ "@type"             A..= AT.String "getMessageLink"
          , "chat_id"           A..= chat_id_
          , "message_id"        A..= message_id_
          , "media_timestamp"   A..= media_timestamp_
          , "for_album"         A..= for_album_
          , "in_message_thread" A..= in_message_thread_
          ]

defaultGetMessageLink :: GetMessageLink
defaultGetMessageLink =
  GetMessageLink
    { chat_id           = Nothing
    , message_id        = Nothing
    , media_timestamp   = Nothing
    , for_album         = Nothing
    , in_message_thread = Nothing
    }

