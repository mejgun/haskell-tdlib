module TD.Query.ReorderActiveUsernames
  (ReorderActiveUsernames(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes order of active usernames of the current user. Returns 'TD.Data.Ok.Ok'
data ReorderActiveUsernames
  = ReorderActiveUsernames
    { usernames :: Maybe [T.Text] -- ^ The new order of active usernames. All currently active usernames must be specified
    }
  deriving (Eq, Show)

instance I.ShortShow ReorderActiveUsernames where
  shortShow
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

