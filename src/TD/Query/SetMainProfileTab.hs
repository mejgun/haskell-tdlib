module TD.Query.SetMainProfileTab
  (SetMainProfileTab(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ProfileTab as ProfileTab

-- | Changes the main profile tab of the current user. Returns 'TD.Data.Ok.Ok'
data SetMainProfileTab
  = SetMainProfileTab
    { main_profile_tab :: Maybe ProfileTab.ProfileTab -- ^ The new value of the main profile tab
    }
  deriving (Eq, Show)

instance I.ShortShow SetMainProfileTab where
  shortShow
    SetMainProfileTab
      { main_profile_tab = main_profile_tab_
      }
        = "SetMainProfileTab"
          ++ I.cc
          [ "main_profile_tab" `I.p` main_profile_tab_
          ]

instance AT.ToJSON SetMainProfileTab where
  toJSON
    SetMainProfileTab
      { main_profile_tab = main_profile_tab_
      }
        = A.object
          [ "@type"            A..= AT.String "setMainProfileTab"
          , "main_profile_tab" A..= main_profile_tab_
          ]

