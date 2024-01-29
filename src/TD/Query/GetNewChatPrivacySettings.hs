module TD.Query.GetNewChatPrivacySettings
  (GetNewChatPrivacySettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns privacy settings for new chat creation. Returns 'TD.Data.NewChatPrivacySettings.NewChatPrivacySettings'
data GetNewChatPrivacySettings
  = GetNewChatPrivacySettings
  deriving (Eq, Show)

instance I.ShortShow GetNewChatPrivacySettings where
  shortShow
    GetNewChatPrivacySettings
        = "GetNewChatPrivacySettings"

instance AT.ToJSON GetNewChatPrivacySettings where
  toJSON
    GetNewChatPrivacySettings
        = A.object
          [ "@type" A..= AT.String "getNewChatPrivacySettings"
          ]

