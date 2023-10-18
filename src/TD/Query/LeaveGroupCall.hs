module TD.Query.LeaveGroupCall
  (LeaveGroupCall(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Leaves a group call. Returns 'TD.Data.Ok.Ok'
data LeaveGroupCall
  = LeaveGroupCall
    { group_call_id :: Maybe Int -- ^ Group call identifier
    }
  deriving (Eq, Show)

instance I.ShortShow LeaveGroupCall where
  shortShow
    LeaveGroupCall
      { group_call_id = group_call_id_
      }
        = "LeaveGroupCall"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          ]

instance AT.ToJSON LeaveGroupCall where
  toJSON
    LeaveGroupCall
      { group_call_id = group_call_id_
      }
        = A.object
          [ "@type"         A..= AT.String "leaveGroupCall"
          , "group_call_id" A..= group_call_id_
          ]

