module TD.Query.GetUserFullInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetUserFullInfo -- ^ Returns full information about a user by their identifier
  = GetUserFullInfo
    { user_id :: Maybe Int -- ^ User identifier
    }
  deriving (Eq)

instance Show GetUserFullInfo where
  show
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
