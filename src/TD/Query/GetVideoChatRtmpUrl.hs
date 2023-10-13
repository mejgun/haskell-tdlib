module TD.Query.GetVideoChatRtmpUrl
  (GetVideoChatRtmpUrl(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetVideoChatRtmpUrl -- ^ Returns RTMP URL for streaming to the chat; requires creator privileges
  = GetVideoChatRtmpUrl
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq)

instance Show GetVideoChatRtmpUrl where
  show
    GetVideoChatRtmpUrl
      { chat_id = chat_id_
      }
        = "GetVideoChatRtmpUrl"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetVideoChatRtmpUrl where
  toJSON
    GetVideoChatRtmpUrl
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getVideoChatRtmpUrl"
          , "chat_id" A..= chat_id_
          ]

