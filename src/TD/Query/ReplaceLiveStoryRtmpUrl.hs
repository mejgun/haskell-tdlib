module TD.Query.ReplaceLiveStoryRtmpUrl
  (ReplaceLiveStoryRtmpUrl(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Replaces the current RTMP URL for streaming to a live story; requires owner privileges for channel chats. Returns 'TD.Data.RtmpUrl.RtmpUrl'
data ReplaceLiveStoryRtmpUrl
  = ReplaceLiveStoryRtmpUrl
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow ReplaceLiveStoryRtmpUrl where
  shortShow
    ReplaceLiveStoryRtmpUrl
      { chat_id = chat_id_
      }
        = "ReplaceLiveStoryRtmpUrl"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON ReplaceLiveStoryRtmpUrl where
  toJSON
    ReplaceLiveStoryRtmpUrl
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "replaceLiveStoryRtmpUrl"
          , "chat_id" A..= chat_id_
          ]

