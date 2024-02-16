module TD.Query.SetSupergroupUnrestrictBoostCount
  (SetSupergroupUnrestrictBoostCount(..)
  , defaultSetSupergroupUnrestrictBoostCount
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the number of times the supergroup must be boosted by a user to ignore slow mode and chat permission restrictions; requires can_restrict_members administrator right. Returns 'TD.Data.Ok.Ok'
data SetSupergroupUnrestrictBoostCount
  = SetSupergroupUnrestrictBoostCount
    { supergroup_id          :: Maybe Int -- ^ Identifier of the supergroup
    , unrestrict_boost_count :: Maybe Int -- ^ New value of the unrestrict_boost_count supergroup setting; 0-8. Use 0 to remove the setting
    }
  deriving (Eq, Show)

instance I.ShortShow SetSupergroupUnrestrictBoostCount where
  shortShow
    SetSupergroupUnrestrictBoostCount
      { supergroup_id          = supergroup_id_
      , unrestrict_boost_count = unrestrict_boost_count_
      }
        = "SetSupergroupUnrestrictBoostCount"
          ++ I.cc
          [ "supergroup_id"          `I.p` supergroup_id_
          , "unrestrict_boost_count" `I.p` unrestrict_boost_count_
          ]

instance AT.ToJSON SetSupergroupUnrestrictBoostCount where
  toJSON
    SetSupergroupUnrestrictBoostCount
      { supergroup_id          = supergroup_id_
      , unrestrict_boost_count = unrestrict_boost_count_
      }
        = A.object
          [ "@type"                  A..= AT.String "setSupergroupUnrestrictBoostCount"
          , "supergroup_id"          A..= supergroup_id_
          , "unrestrict_boost_count" A..= unrestrict_boost_count_
          ]

defaultSetSupergroupUnrestrictBoostCount :: SetSupergroupUnrestrictBoostCount
defaultSetSupergroupUnrestrictBoostCount =
  SetSupergroupUnrestrictBoostCount
    { supergroup_id          = Nothing
    , unrestrict_boost_count = Nothing
    }

