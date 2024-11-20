module TD.Query.GetVideoChatRtmpUrl
  (GetVideoChatRtmpUrl(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns RTMP URL for streaming to the chat; requires can_manage_video_chats administrator right. Returns 'TD.Data.RtmpUrl.RtmpUrl'
data GetVideoChatRtmpUrl
  = GetVideoChatRtmpUrl
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetVideoChatRtmpUrl where
  shortShow
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

