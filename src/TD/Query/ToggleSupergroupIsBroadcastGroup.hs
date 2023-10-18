module TD.Query.ToggleSupergroupIsBroadcastGroup
  (ToggleSupergroupIsBroadcastGroup(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Upgrades supergroup to a broadcast group; requires owner privileges in the supergroup. Returns 'TD.Data.Ok.Ok'
data ToggleSupergroupIsBroadcastGroup
  = ToggleSupergroupIsBroadcastGroup
    { supergroup_id :: Maybe Int -- ^ Identifier of the supergroup
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleSupergroupIsBroadcastGroup where
  shortShow
    ToggleSupergroupIsBroadcastGroup
      { supergroup_id = supergroup_id_
      }
        = "ToggleSupergroupIsBroadcastGroup"
          ++ I.cc
          [ "supergroup_id" `I.p` supergroup_id_
          ]

instance AT.ToJSON ToggleSupergroupIsBroadcastGroup where
  toJSON
    ToggleSupergroupIsBroadcastGroup
      { supergroup_id = supergroup_id_
      }
        = A.object
          [ "@type"         A..= AT.String "toggleSupergroupIsBroadcastGroup"
          , "supergroup_id" A..= supergroup_id_
          ]

