module TD.Query.SetUsername
  (SetUsername(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes the editable username of the current user. Returns 'TD.Data.Ok.Ok'
data SetUsername
  = SetUsername
    { username :: Maybe T.Text -- ^ The new value of the username. Use an empty string to remove the username. The username can't be completely removed if there is another active or disabled username
    }
  deriving (Eq, Show)

instance I.ShortShow SetUsername where
  shortShow
    SetUsername
      { username = username_
      }
        = "SetUsername"
          ++ I.cc
          [ "username" `I.p` username_
          ]

instance AT.ToJSON SetUsername where
  toJSON
    SetUsername
      { username = username_
      }
        = A.object
          [ "@type"    A..= AT.String "setUsername"
          , "username" A..= username_
          ]

