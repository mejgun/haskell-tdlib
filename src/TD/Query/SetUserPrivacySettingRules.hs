module TD.Query.SetUserPrivacySettingRules(SetUserPrivacySettingRules(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.UserPrivacySetting as UserPrivacySetting
import qualified TD.Data.UserPrivacySettingRules as UserPrivacySettingRules

data SetUserPrivacySettingRules -- ^ Changes user privacy settings
  = SetUserPrivacySettingRules
    { setting :: Maybe UserPrivacySetting.UserPrivacySetting           -- ^ The privacy setting
    , rules   :: Maybe UserPrivacySettingRules.UserPrivacySettingRules -- ^ The new privacy rules
    }
  deriving (Eq)

instance Show SetUserPrivacySettingRules where
  show
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
