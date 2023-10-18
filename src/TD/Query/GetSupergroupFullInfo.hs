module TD.Query.GetSupergroupFullInfo
  (GetSupergroupFullInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns full information about a supergroup or a channel by its identifier, cached for up to 1 minute. Returns 'TD.Data.SupergroupFullInfo.SupergroupFullInfo'
data GetSupergroupFullInfo
  = GetSupergroupFullInfo
    { supergroup_id :: Maybe Int -- ^ Supergroup or channel identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetSupergroupFullInfo where
  shortShow
    GetSupergroupFullInfo
      { supergroup_id = supergroup_id_
      }
        = "GetSupergroupFullInfo"
          ++ I.cc
          [ "supergroup_id" `I.p` supergroup_id_
          ]

instance AT.ToJSON GetSupergroupFullInfo where
  toJSON
    GetSupergroupFullInfo
      { supergroup_id = supergroup_id_
      }
        = A.object
          [ "@type"         A..= AT.String "getSupergroupFullInfo"
          , "supergroup_id" A..= supergroup_id_
          ]

