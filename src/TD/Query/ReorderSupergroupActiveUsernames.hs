module TD.Query.ReorderSupergroupActiveUsernames
  (ReorderSupergroupActiveUsernames(..)
  , defaultReorderSupergroupActiveUsernames
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes order of active usernames of a supergroup or channel, requires owner privileges in the supergroup or channel. Returns 'TD.Data.Ok.Ok'
data ReorderSupergroupActiveUsernames
  = ReorderSupergroupActiveUsernames
    { supergroup_id :: Maybe Int      -- ^ Identifier of the supergroup or channel
    , usernames     :: Maybe [T.Text] -- ^ The new order of active usernames. All currently active usernames must be specified
    }
  deriving (Eq, Show)

instance I.ShortShow ReorderSupergroupActiveUsernames where
  shortShow
    ReorderSupergroupActiveUsernames
      { supergroup_id = supergroup_id_
      , usernames     = usernames_
      }
        = "ReorderSupergroupActiveUsernames"
          ++ I.cc
          [ "supergroup_id" `I.p` supergroup_id_
          , "usernames"     `I.p` usernames_
          ]

instance AT.ToJSON ReorderSupergroupActiveUsernames where
  toJSON
    ReorderSupergroupActiveUsernames
      { supergroup_id = supergroup_id_
      , usernames     = usernames_
      }
        = A.object
          [ "@type"         A..= AT.String "reorderSupergroupActiveUsernames"
          , "supergroup_id" A..= supergroup_id_
          , "usernames"     A..= usernames_
          ]

defaultReorderSupergroupActiveUsernames :: ReorderSupergroupActiveUsernames
defaultReorderSupergroupActiveUsernames =
  ReorderSupergroupActiveUsernames
    { supergroup_id = Nothing
    , usernames     = Nothing
    }

