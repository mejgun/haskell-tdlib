module TD.Query.CommitPendingLiveStoryReactions
  (CommitPendingLiveStoryReactions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Applies all pending paid reactions in a live story group call. Returns 'TD.Data.Ok.Ok'
data CommitPendingLiveStoryReactions
  = CommitPendingLiveStoryReactions
    { group_call_id :: Maybe Int -- ^ Group call identifier
    }
  deriving (Eq, Show)

instance I.ShortShow CommitPendingLiveStoryReactions where
  shortShow
    CommitPendingLiveStoryReactions
      { group_call_id = group_call_id_
      }
        = "CommitPendingLiveStoryReactions"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          ]

instance AT.ToJSON CommitPendingLiveStoryReactions where
  toJSON
    CommitPendingLiveStoryReactions
      { group_call_id = group_call_id_
      }
        = A.object
          [ "@type"         A..= AT.String "commitPendingLiveStoryReactions"
          , "group_call_id" A..= group_call_id_
          ]

