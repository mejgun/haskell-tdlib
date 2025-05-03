module TD.Query.StartScheduledVideoChat
  (StartScheduledVideoChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Starts a scheduled video chat. Returns 'TD.Data.Ok.Ok'
data StartScheduledVideoChat
  = StartScheduledVideoChat
    { group_call_id :: Maybe Int -- ^ Group call identifier of the video chat
    }
  deriving (Eq, Show)

instance I.ShortShow StartScheduledVideoChat where
  shortShow
    StartScheduledVideoChat
      { group_call_id = group_call_id_
      }
        = "StartScheduledVideoChat"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          ]

instance AT.ToJSON StartScheduledVideoChat where
  toJSON
    StartScheduledVideoChat
      { group_call_id = group_call_id_
      }
        = A.object
          [ "@type"         A..= AT.String "startScheduledVideoChat"
          , "group_call_id" A..= group_call_id_
          ]

