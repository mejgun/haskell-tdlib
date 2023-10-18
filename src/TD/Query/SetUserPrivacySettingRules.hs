module TD.Query.SetUserPrivacySettingRules
  (SetUserPrivacySettingRules(..)
  , defaultSetUserPrivacySettingRules
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.UserPrivacySetting as UserPrivacySetting
import qualified TD.Data.UserPrivacySettingRules as UserPrivacySettingRules

-- | Changes user privacy settings. Returns 'TD.Data.Ok.Ok'
data SetUserPrivacySettingRules
  = SetUserPrivacySettingRules
    { setting :: Maybe UserPrivacySetting.UserPrivacySetting           -- ^ The privacy setting
    , rules   :: Maybe UserPrivacySettingRules.UserPrivacySettingRules -- ^ The new privacy rules
    }
  deriving (Eq, Show)

instance I.ShortShow SetUserPrivacySettingRules where
  shortShow
    SetUserPrivacySettingRules
      { setting = setting_
      , rules   = rules_
      }
        = "SetUserPrivacySettingRules"
          ++ I.cc
          [ "setting" `I.p` setting_
          , "rules"   `I.p` rules_
          ]

instance AT.ToJSON SetUserPrivacySettingRules where
  toJSON
    SetUserPrivacySettingRules
      { setting = setting_
      , rules   = rules_
      }
        = A.object
          [ "@type"   A..= AT.String "setUserPrivacySettingRules"
          , "setting" A..= setting_
          , "rules"   A..= rules_
          ]

defaultSetUserPrivacySettingRules :: SetUserPrivacySettingRules
defaultSetUserPrivacySettingRules =
  SetUserPrivacySettingRules
    { setting = Nothing
    , rules   = Nothing
    }

