module TD.Query.DisableAllSupergroupUsernames
  (DisableAllSupergroupUsernames(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Disables all active non-editable usernames of a supergroup or channel, requires owner privileges in the supergroup or channel. Returns 'TD.Data.Ok.Ok'
data DisableAllSupergroupUsernames
  = DisableAllSupergroupUsernames
    { supergroup_id :: Maybe Int -- ^ Identifier of the supergroup or channel
    }
  deriving (Eq, Show)

instance I.ShortShow DisableAllSupergroupUsernames where
  shortShow
    DisableAllSupergroupUsernames
      { supergroup_id = supergroup_id_
      }
        = "DisableAllSupergroupUsernames"
          ++ I.cc
          [ "supergroup_id" `I.p` supergroup_id_
          ]

instance AT.ToJSON DisableAllSupergroupUsernames where
  toJSON
    DisableAllSupergroupUsernames
      { supergroup_id = supergroup_id_
      }
        = A.object
          [ "@type"         A..= AT.String "disableAllSupergroupUsernames"
          , "supergroup_id" A..= supergroup_id_
          ]

