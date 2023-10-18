module TD.Query.GetUserFullInfo
  (GetUserFullInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns full information about a user by their identifier. Returns 'TD.Data.UserFullInfo.UserFullInfo'
data GetUserFullInfo
  = GetUserFullInfo
    { user_id :: Maybe Int -- ^ User identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetUserFullInfo where
  shortShow
    GetUserFullInfo
      { user_id = user_id_
      }
        = "GetUserFullInfo"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          ]

instance AT.ToJSON GetUserFullInfo where
  toJSON
    GetUserFullInfo
      { user_id = user_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getUserFullInfo"
          , "user_id" A..= user_id_
          ]

