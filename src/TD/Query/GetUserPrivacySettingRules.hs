{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetUserPrivacySettingRules where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.UserPrivacySetting as UserPrivacySetting
import qualified Utils as U

-- |
-- Returns the current privacy settings @setting The privacy setting
data GetUserPrivacySettingRules = GetUserPrivacySettingRules
  { -- |
    setting :: Maybe UserPrivacySetting.UserPrivacySetting
  }
  deriving (Eq)

instance Show GetUserPrivacySettingRules where
  show
    GetUserPrivacySettingRules
      { setting = setting_
      } =
      "GetUserPrivacySettingRules"
        ++ U.cc
          [ U.p "setting" setting_
          ]

instance T.ToJSON GetUserPrivacySettingRules where
  toJSON
    GetUserPrivacySettingRules
      { setting = setting_
      } =
      A.object
        [ "@type" A..= T.String "getUserPrivacySettingRules",
          "setting" A..= setting_
        ]
