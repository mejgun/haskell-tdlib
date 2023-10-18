module TD.Query.SetArchiveChatListSettings
  (SetArchiveChatListSettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ArchiveChatListSettings as ArchiveChatListSettings

-- | Changes settings for automatic moving of chats to and from the Archive chat lists. Returns 'TD.Data.Ok.Ok'
data SetArchiveChatListSettings
  = SetArchiveChatListSettings
    { settings :: Maybe ArchiveChatListSettings.ArchiveChatListSettings -- ^ New settings
    }
  deriving (Eq, Show)

instance I.ShortShow SetArchiveChatListSettings where
  shortShow
    SetArchiveChatListSettings
      { settings = settings_
      }
        = "SetArchiveChatListSettings"
          ++ I.cc
          [ "settings" `I.p` settings_
          ]

instance AT.ToJSON SetArchiveChatListSettings where
  toJSON
    SetArchiveChatListSettings
      { settings = settings_
      }
        = A.object
          [ "@type"    A..= AT.String "setArchiveChatListSettings"
          , "settings" A..= settings_
          ]

