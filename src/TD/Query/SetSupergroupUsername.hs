module TD.Query.SetSupergroupUsername where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SetSupergroupUsername -- ^ Changes the editable username of a supergroup or channel, requires owner privileges in the supergroup or channel
  = SetSupergroupUsername
    { supergroup_id :: Maybe Int    -- ^ Identifier of the supergroup or channel
    , username      :: Maybe T.Text -- ^ New value of the username. Use an empty string to remove the username. The username can't be completely removed if there is another active or disabled username
    }
  deriving (Eq)

instance Show SetSupergroupUsername where
  show
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
