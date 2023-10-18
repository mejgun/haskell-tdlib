module TD.Query.GetBasicGroupFullInfo
  (GetBasicGroupFullInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns full information about a basic group by its identifier. Returns 'TD.Data.BasicGroupFullInfo.BasicGroupFullInfo'
data GetBasicGroupFullInfo
  = GetBasicGroupFullInfo
    { basic_group_id :: Maybe Int -- ^ Basic group identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetBasicGroupFullInfo where
  shortShow
    GetBasicGroupFullInfo
      { basic_group_id = basic_group_id_
      }
        = "GetBasicGroupFullInfo"
          ++ I.cc
          [ "basic_group_id" `I.p` basic_group_id_
          ]

instance AT.ToJSON GetBasicGroupFullInfo where
  toJSON
    GetBasicGroupFullInfo
      { basic_group_id = basic_group_id_
      }
        = A.object
          [ "@type"          A..= AT.String "getBasicGroupFullInfo"
          , "basic_group_id" A..= basic_group_id_
          ]

