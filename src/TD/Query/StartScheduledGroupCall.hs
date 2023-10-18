module TD.Query.StartScheduledGroupCall
  (StartScheduledGroupCall(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Starts a scheduled group call. Returns 'TD.Data.Ok.Ok'
data StartScheduledGroupCall
  = StartScheduledGroupCall
    { group_call_id :: Maybe Int -- ^ Group call identifier
    }
  deriving (Eq, Show)

instance I.ShortShow StartScheduledGroupCall where
  shortShow
    StartScheduledGroupCall
      { group_call_id = group_call_id_
      }
        = "StartScheduledGroupCall"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          ]

instance AT.ToJSON StartScheduledGroupCall where
  toJSON
    StartScheduledGroupCall
      { group_call_id = group_call_id_
      }
        = A.object
          [ "@type"         A..= AT.String "startScheduledGroupCall"
          , "group_call_id" A..= group_call_id_
          ]

