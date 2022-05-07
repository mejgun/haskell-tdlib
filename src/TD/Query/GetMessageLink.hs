{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetMessageLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an HTTPS link to a message in a chat. Available only for already sent messages in supergroups and channels, or if message.can_get_media_timestamp_links and a media timestamp link is generated. This is an offline request
data GetMessageLink = GetMessageLink
  { -- | Pass true to create a link to the message as a channel post comment, or from a message thread
    for_comment :: Maybe Bool,
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
      { for_comment = for_comment,
        for_album = for_album,
        media_timestamp = media_timestamp,
        message_id = message_id,
        chat_id = chat_id
      } =
      "GetMessageLink"
        ++ U.cc
          [ U.p "for_comment" for_comment,
            U.p "for_album" for_album,
            U.p "media_timestamp" media_timestamp,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetMessageLink where
  toJSON
    GetMessageLink
      { for_comment = for_comment,
        for_album = for_album,
        media_timestamp = media_timestamp,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getMessageLink",
          "for_comment" A..= for_comment,
          "for_album" A..= for_album,
          "media_timestamp" A..= media_timestamp,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
