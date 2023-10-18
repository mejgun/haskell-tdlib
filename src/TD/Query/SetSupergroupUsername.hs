module TD.Query.SetSupergroupUsername
  (SetSupergroupUsername(..)
  , defaultSetSupergroupUsername
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes the editable username of a supergroup or channel, requires owner privileges in the supergroup or channel. Returns 'TD.Data.Ok.Ok'
data SetSupergroupUsername
  = SetSupergroupUsername
    { supergroup_id :: Maybe Int    -- ^ Identifier of the supergroup or channel
    , username      :: Maybe T.Text -- ^ New value of the username. Use an empty string to remove the username. The username can't be completely removed if there is another active or disabled username
    }
  deriving (Eq, Show)

instance I.ShortShow SetSupergroupUsername where
  shortShow
    SetSupergroupUsername
      { supergroup_id = supergroup_id_
      , username      = username_
      }
        = "SetSupergroupUsername"
          ++ I.cc
          [ "supergroup_id" `I.p` supergroup_id_
          , "username"      `I.p` username_
          ]

instance AT.ToJSON SetSupergroupUsername where
  toJSON
    SetSupergroupUsername
      { supergroup_id = supergroup_id_
      , username      = username_
      }
        = A.object
          [ "@type"         A..= AT.String "setSupergroupUsername"
          , "supergroup_id" A..= supergroup_id_
          , "username"      A..= username_
          ]

defaultSetSupergroupUsername :: SetSupergroupUsername
defaultSetSupergroupUsername =
  SetSupergroupUsername
    { supergroup_id = Nothing
    , username      = Nothing
    }

