{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetVideoChatRtmpUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns RTMP URL for streaming to the chat; requires creator privileges @chat_id Chat identifier
data GetVideoChatRtmpUrl = GetVideoChatRtmpUrl
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetVideoChatRtmpUrl where
  show
    GetVideoChatRtmpUrl
      { chat_id = chat_id_
      } =
      "GetVideoChatRtmpUrl"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetVideoChatRtmpUrl where
  toJSON
    GetVideoChatRtmpUrl
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getVideoChatRtmpUrl",
          "chat_id" A..= chat_id_
        ]
