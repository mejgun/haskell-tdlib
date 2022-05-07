{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ReplaceVideoChatRtmpUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Replaces the current RTMP URL for streaming to the chat; requires creator privileges @chat_id Chat identifier
data ReplaceVideoChatRtmpUrl = ReplaceVideoChatRtmpUrl
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReplaceVideoChatRtmpUrl where
  show
    ReplaceVideoChatRtmpUrl
      { chat_id = chat_id
      } =
      "ReplaceVideoChatRtmpUrl"
        ++ U.cc
          [ U.p "chat_id" chat_id
          ]

instance T.ToJSON ReplaceVideoChatRtmpUrl where
  toJSON
    ReplaceVideoChatRtmpUrl
      { chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "replaceVideoChatRtmpUrl",
          "chat_id" A..= chat_id
        ]
