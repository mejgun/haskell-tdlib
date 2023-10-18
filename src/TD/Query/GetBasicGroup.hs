module TD.Query.GetBasicGroup
  (GetBasicGroup(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a basic group by its identifier. This is an offline request if the current user is not a bot. Returns 'TD.Data.BasicGroup.BasicGroup'
data GetBasicGroup
  = GetBasicGroup
    { basic_group_id :: Maybe Int -- ^ Basic group identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetBasicGroup where
  shortShow
    GetBasicGroup
      { basic_group_id = basic_group_id_
      }
        = "GetBasicGroup"
          ++ I.cc
          [ "basic_group_id" `I.p` basic_group_id_
          ]

instance AT.ToJSON GetBasicGroup where
  toJSON
    GetBasicGroup
      { basic_group_id = basic_group_id_
      }
        = A.object
          [ "@type"          A..= AT.String "getBasicGroup"
          , "basic_group_id" A..= basic_group_id_
          ]

