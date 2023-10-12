module TD.Query.SetArchiveChatListSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.ArchiveChatListSettings as ArchiveChatListSettings

data SetArchiveChatListSettings -- ^ Changes settings for automatic moving of chats to and from the Archive chat lists
  = SetArchiveChatListSettings
    { settings :: Maybe ArchiveChatListSettings.ArchiveChatListSettings -- ^ New settings
    }
  deriving (Eq)

instance Show SetArchiveChatListSettings where
  show
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
