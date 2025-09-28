module TD.Query.SetSupergroupMainProfileTab
  (SetSupergroupMainProfileTab(..)
  , defaultSetSupergroupMainProfileTab
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ProfileTab as ProfileTab

-- | Changes the main profile tab of the channel; requires can_change_info administrator right. Returns 'TD.Data.Ok.Ok'
data SetSupergroupMainProfileTab
  = SetSupergroupMainProfileTab
    { supergroup_id    :: Maybe Int                   -- ^ Identifier of the channel
    , main_profile_tab :: Maybe ProfileTab.ProfileTab -- ^ The new value of the main profile tab
    }
  deriving (Eq, Show)

instance I.ShortShow SetSupergroupMainProfileTab where
  shortShow
    SetSupergroupMainProfileTab
      { supergroup_id    = supergroup_id_
      , main_profile_tab = main_profile_tab_
      }
        = "SetSupergroupMainProfileTab"
          ++ I.cc
          [ "supergroup_id"    `I.p` supergroup_id_
          , "main_profile_tab" `I.p` main_profile_tab_
          ]

instance AT.ToJSON SetSupergroupMainProfileTab where
  toJSON
    SetSupergroupMainProfileTab
      { supergroup_id    = supergroup_id_
      , main_profile_tab = main_profile_tab_
      }
        = A.object
          [ "@type"            A..= AT.String "setSupergroupMainProfileTab"
          , "supergroup_id"    A..= supergroup_id_
          , "main_profile_tab" A..= main_profile_tab_
          ]

defaultSetSupergroupMainProfileTab :: SetSupergroupMainProfileTab
defaultSetSupergroupMainProfileTab =
  SetSupergroupMainProfileTab
    { supergroup_id    = Nothing
    , main_profile_tab = Nothing
    }

