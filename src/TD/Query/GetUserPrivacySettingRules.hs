module TD.Query.GetUserPrivacySettingRules
  (GetUserPrivacySettingRules(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.UserPrivacySetting as UserPrivacySetting

-- | Returns the current privacy settings. Returns 'TD.Data.UserPrivacySettingRules.UserPrivacySettingRules'
data GetUserPrivacySettingRules
  = GetUserPrivacySettingRules
    { setting :: Maybe UserPrivacySetting.UserPrivacySetting -- ^ The privacy setting
    }
  deriving (Eq, Show)

instance I.ShortShow GetUserPrivacySettingRules where
  shortShow
    GetUserPrivacySettingRules
      { setting = setting_
      }
        = "GetUserPrivacySettingRules"
          ++ I.cc
          [ "setting" `I.p` setting_
          ]

instance AT.ToJSON GetUserPrivacySettingRules where
  toJSON
    GetUserPrivacySettingRules
      { setting = setting_
      }
        = A.object
          [ "@type"   A..= AT.String "getUserPrivacySettingRules"
          , "setting" A..= setting_
          ]

