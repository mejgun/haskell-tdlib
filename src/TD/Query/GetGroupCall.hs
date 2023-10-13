module TD.Query.GetGroupCall
  (GetGroupCall(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a group call
data GetGroupCall
  = GetGroupCall
    { group_call_id :: Maybe Int -- ^ Group call identifier
    }
  deriving (Eq)

instance Show GetGroupCall where
  show
    GetGroupCall
      { group_call_id = group_call_id_
      }
        = "GetGroupCall"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          ]

instance AT.ToJSON GetGroupCall where
  toJSON
    GetGroupCall
      { group_call_id = group_call_id_
      }
        = A.object
          [ "@type"         A..= AT.String "getGroupCall"
          , "group_call_id" A..= group_call_id_
          ]

