module TD.Query.GetArchiveChatListSettings
  (GetArchiveChatListSettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns settings for automatic moving of chats to and from the Archive chat lists. Returns 'TD.Data.ArchiveChatListSettings.ArchiveChatListSettings'
data GetArchiveChatListSettings
  = GetArchiveChatListSettings
  deriving (Eq, Show)

instance I.ShortShow GetArchiveChatListSettings where
  shortShow
    GetArchiveChatListSettings
        = "GetArchiveChatListSettings"

instance AT.ToJSON GetArchiveChatListSettings where
  toJSON
    GetArchiveChatListSettings
        = A.object
          [ "@type" A..= AT.String "getArchiveChatListSettings"
          ]

