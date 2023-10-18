module TD.Query.GetGroupCallStreams
  (GetGroupCallStreams(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about available group call streams. Returns 'TD.Data.GroupCallStreams.GroupCallStreams'
data GetGroupCallStreams
  = GetGroupCallStreams
    { group_call_id :: Maybe Int -- ^ Group call identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetGroupCallStreams where
  shortShow
    GetGroupCallStreams
      { group_call_id = group_call_id_
      }
        = "GetGroupCallStreams"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          ]

instance AT.ToJSON GetGroupCallStreams where
  toJSON
    GetGroupCallStreams
      { group_call_id = group_call_id_
      }
        = A.object
          [ "@type"         A..= AT.String "getGroupCallStreams"
          , "group_call_id" A..= group_call_id_
          ]

