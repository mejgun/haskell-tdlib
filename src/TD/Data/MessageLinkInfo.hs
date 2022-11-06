{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Message as Message
import qualified Utils as U

-- |
data MessageLinkInfo = -- | Contains information about a link to a message in a chat
  MessageLinkInfo
  { -- | True, if the whole media album to which the message belongs is linked
    for_album :: Maybe Bool,
    -- | Timestamp from which the video/audio/video note/voice note playing must start, in seconds; 0 if not specified. The media can be in the message content or in its web page preview
    media_timestamp :: Maybe Int,
    -- | If found, the linked message; may be null
    message :: Maybe Message.Message,
    -- | If found, identifier of the message thread in which to open the message, or which to open in case of a missing message
    message_thread_id :: Maybe Int,
    -- | If found, identifier of the chat to which the message belongs, 0 otherwise
    chat_id :: Maybe Int,
    -- | True, if the link is a public link for a message in a chat
    is_public :: Maybe Bool
  }
  deriving (Eq)

instance Show MessageLinkInfo where
  show
    MessageLinkInfo
      { for_album = for_album_,
        media_timestamp = media_timestamp_,
        message = message_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_,
        is_public = is_public_
      } =
      "MessageLinkInfo"
        ++ U.cc
          [ U.p "for_album" for_album_,
            U.p "media_timestamp" media_timestamp_,
            U.p "message" message_,
            U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_,
            U.p "is_public" is_public_
          ]

instance T.FromJSON MessageLinkInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageLinkInfo" -> parseMessageLinkInfo v
      _ -> mempty
    where
      parseMessageLinkInfo :: A.Value -> T.Parser MessageLinkInfo
      parseMessageLinkInfo = A.withObject "MessageLinkInfo" $ \o -> do
        for_album_ <- o A..:? "for_album"
        media_timestamp_ <- o A..:? "media_timestamp"
        message_ <- o A..:? "message"
        message_thread_id_ <- o A..:? "message_thread_id"
        chat_id_ <- o A..:? "chat_id"
        is_public_ <- o A..:? "is_public"
        return $ MessageLinkInfo {for_album = for_album_, media_timestamp = media_timestamp_, message = message_, message_thread_id = message_thread_id_, chat_id = chat_id_, is_public = is_public_}
  parseJSON _ = mempty

instance T.ToJSON MessageLinkInfo where
  toJSON
    MessageLinkInfo
      { for_album = for_album_,
        media_timestamp = media_timestamp_,
        message = message_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_,
        is_public = is_public_
      } =
      A.object
        [ "@type" A..= T.String "messageLinkInfo",
          "for_album" A..= for_album_,
          "media_timestamp" A..= media_timestamp_,
          "message" A..= message_,
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_,
          "is_public" A..= is_public_
        ]
