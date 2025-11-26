module TD.Query.GetLiveStoryRtmpUrl
  (GetLiveStoryRtmpUrl(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns RTMP URL for streaming to a live story; requires can_post_stories administrator right for channel chats. Returns 'TD.Data.RtmpUrl.RtmpUrl'
data GetLiveStoryRtmpUrl
  = GetLiveStoryRtmpUrl
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetLiveStoryRtmpUrl where
  shortShow
    GetLiveStoryRtmpUrl
      { chat_id = chat_id_
      }
        = "GetLiveStoryRtmpUrl"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetLiveStoryRtmpUrl where
  toJSON
    GetLiveStoryRtmpUrl
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getLiveStoryRtmpUrl"
          , "chat_id" A..= chat_id_
          ]

