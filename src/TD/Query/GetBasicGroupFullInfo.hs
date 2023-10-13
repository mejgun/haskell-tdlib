module TD.Query.GetBasicGroupFullInfo
  (GetBasicGroupFullInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetBasicGroupFullInfo -- ^ Returns full information about a basic group by its identifier
  = GetBasicGroupFullInfo
    { basic_group_id :: Maybe Int -- ^ Basic group identifier
    }
  deriving (Eq)

instance Show GetBasicGroupFullInfo where
  show
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

