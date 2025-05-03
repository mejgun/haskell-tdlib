module TD.Query.GetVideoChatStreams
  (GetVideoChatStreams(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about available video chat streams. Returns 'TD.Data.VideoChatStreams.VideoChatStreams'
data GetVideoChatStreams
  = GetVideoChatStreams
    { group_call_id :: Maybe Int -- ^ Group call identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetVideoChatStreams where
  shortShow
    GetVideoChatStreams
      { group_call_id = group_call_id_
      }
        = "GetVideoChatStreams"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          ]

instance AT.ToJSON GetVideoChatStreams where
  toJSON
    GetVideoChatStreams
      { group_call_id = group_call_id_
      }
        = A.object
          [ "@type"         A..= AT.String "getVideoChatStreams"
          , "group_call_id" A..= group_call_id_
          ]

