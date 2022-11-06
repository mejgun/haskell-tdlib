{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetMessageLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an HTTPS link to a message in a chat. Available only for already sent messages in supergroups and channels, or if message.can_get_media_timestamp_links and a media timestamp link is generated. This is an offline request
data GetMessageLink = GetMessageLink
  { -- | Pass true to create a link to the message as a channel post comment, in a message thread, or a forum topic
    in_message_thread :: Maybe Bool,
    -- | Pass true to create a link for the whole media album
    for_album :: Maybe Bool,
    -- | If not 0, timestamp from which the video/audio/video note/voice note playing must start, in seconds. The media can be in the message content or in its web page preview
    media_timestamp :: Maybe Int,
    -- | Identifier of the message
    message_id :: Maybe Int,
    -- | Identifier of the chat to which the message belongs
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessageLink where
  show
    GetMessageLink
      { in_message_thread = in_message_thread_,
        for_album = for_album_,
        media_timestamp = media_timestamp_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetMessageLink"
        ++ U.cc
          [ U.p "in_message_thread" in_message_thread_,
            U.p "for_album" for_album_,
            U.p "media_timestamp" media_timestamp_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetMessageLink where
  toJSON
    GetMessageLink
      { in_message_thread = in_message_thread_,
        for_album = for_album_,
        media_timestamp = media_timestamp_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getMessageLink",
          "in_message_thread" A..= in_message_thread_,
          "for_album" A..= for_album_,
          "media_timestamp" A..= media_timestamp_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
