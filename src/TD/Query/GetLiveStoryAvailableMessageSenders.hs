module TD.Query.GetLiveStoryAvailableMessageSenders
  (GetLiveStoryAvailableMessageSenders(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of message sender identifiers, on whose behalf messages can be sent to a live story. Returns 'TD.Data.ChatMessageSenders.ChatMessageSenders'
data GetLiveStoryAvailableMessageSenders
  = GetLiveStoryAvailableMessageSenders
    { group_call_id :: Maybe Int -- ^ Group call identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetLiveStoryAvailableMessageSenders where
  shortShow
    GetLiveStoryAvailableMessageSenders
      { group_call_id = group_call_id_
      }
        = "GetLiveStoryAvailableMessageSenders"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          ]

instance AT.ToJSON GetLiveStoryAvailableMessageSenders where
  toJSON
    GetLiveStoryAvailableMessageSenders
      { group_call_id = group_call_id_
      }
        = A.object
          [ "@type"         A..= AT.String "getLiveStoryAvailableMessageSenders"
          , "group_call_id" A..= group_call_id_
          ]

