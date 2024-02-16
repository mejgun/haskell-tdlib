module TD.Query.ReplaceVideoChatRtmpUrl
  (ReplaceVideoChatRtmpUrl(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Replaces the current RTMP URL for streaming to the chat; requires owner privileges. Returns 'TD.Data.RtmpUrl.RtmpUrl'
data ReplaceVideoChatRtmpUrl
  = ReplaceVideoChatRtmpUrl
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow ReplaceVideoChatRtmpUrl where
  shortShow
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

