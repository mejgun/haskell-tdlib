module TD.Query.ReorderActiveUsernames where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ReorderActiveUsernames -- ^ Changes order of active usernames of the current user
  = ReorderActiveUsernames
    { usernames :: Maybe [T.Text] -- ^ The new order of active usernames. All currently active usernames must be specified
    }
  deriving (Eq)

instance Show ReorderActiveUsernames where
  show
    ReorderActiveUsernames
      { usernames = usernames_
      }
        = "ReorderActiveUsernames"
          ++ I.cc
          [ "usernames" `I.p` usernames_
          ]

instance AT.ToJSON ReorderActiveUsernames where
  toJSON
    ReorderActiveUsernames
      { usernames = usernames_
      }
        = A.object
          [ "@type"     A..= AT.String "reorderActiveUsernames"
          , "usernames" A..= usernames_
          ]
