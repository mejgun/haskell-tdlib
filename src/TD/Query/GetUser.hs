module TD.Query.GetUser
  (GetUser(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetUser -- ^ Returns information about a user by their identifier. This is an offline request if the current user is not a bot
  = GetUser
    { user_id :: Maybe Int -- ^ User identifier
    }
  deriving (Eq)

instance Show GetUser where
  show
    GetUser
      { user_id = user_id_
      }
        = "GetUser"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          ]

instance AT.ToJSON GetUser where
  toJSON
    GetUser
      { user_id = user_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getUser"
          , "user_id" A..= user_id_
          ]

