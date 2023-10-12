module TD.Query.GetUserPrivacySettingRules where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.UserPrivacySetting as UserPrivacySetting

data GetUserPrivacySettingRules -- ^ Returns the current privacy settings
  = GetUserPrivacySettingRules
    { setting :: Maybe UserPrivacySetting.UserPrivacySetting -- ^ The privacy setting
    }
  deriving (Eq)

instance Show GetUserPrivacySettingRules where
  show
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
