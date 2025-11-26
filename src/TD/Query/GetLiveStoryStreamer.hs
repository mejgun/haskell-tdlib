module TD.Query.GetLiveStoryStreamer
  (GetLiveStoryStreamer(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about the user or the chat that streams to a live story; for live stories that aren't an RTMP stream only. Returns 'TD.Data.GroupCallParticipant.GroupCallParticipant'
data GetLiveStoryStreamer
  = GetLiveStoryStreamer
    { group_call_id :: Maybe Int -- ^ Group call identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetLiveStoryStreamer where
  shortShow
    GetLiveStoryStreamer
      { group_call_id = group_call_id_
      }
        = "GetLiveStoryStreamer"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          ]

instance AT.ToJSON GetLiveStoryStreamer where
  toJSON
    GetLiveStoryStreamer
      { group_call_id = group_call_id_
      }
        = A.object
          [ "@type"         A..= AT.String "getLiveStoryStreamer"
          , "group_call_id" A..= group_call_id_
          ]

