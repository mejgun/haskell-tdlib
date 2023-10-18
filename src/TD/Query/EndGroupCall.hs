module TD.Query.EndGroupCall
  (EndGroupCall(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Ends a group call. Requires groupCall.can_be_managed. Returns 'TD.Data.Ok.Ok'
data EndGroupCall
  = EndGroupCall
    { group_call_id :: Maybe Int -- ^ Group call identifier
    }
  deriving (Eq, Show)

instance I.ShortShow EndGroupCall where
  shortShow
    EndGroupCall
      { group_call_id = group_call_id_
      }
        = "EndGroupCall"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          ]

instance AT.ToJSON EndGroupCall where
  toJSON
    EndGroupCall
      { group_call_id = group_call_id_
      }
        = A.object
          [ "@type"         A..= AT.String "endGroupCall"
          , "group_call_id" A..= group_call_id_
          ]

