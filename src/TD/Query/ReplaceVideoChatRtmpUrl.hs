module TD.Query.ReplaceVideoChatRtmpUrl(ReplaceVideoChatRtmpUrl(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ReplaceVideoChatRtmpUrl -- ^ Replaces the current RTMP URL for streaming to the chat; requires creator privileges
  = ReplaceVideoChatRtmpUrl
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq)

instance Show ReplaceVideoChatRtmpUrl where
  show
    ReplaceVideoChatRtmpUrl
      { chat_id = chat_id_
      }
        = "ReplaceVideoChatRtmpUrl"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON ReplaceVideoChatRtmpUrl where
  toJSON
    ReplaceVideoChatRtmpUrl
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "replaceVideoChatRtmpUrl"
          , "chat_id" A..= chat_id_
          ]
