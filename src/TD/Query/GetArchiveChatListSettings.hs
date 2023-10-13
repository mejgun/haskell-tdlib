module TD.Query.GetArchiveChatListSettings
  (GetArchiveChatListSettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns settings for automatic moving of chats to and from the Archive chat lists
data GetArchiveChatListSettings
  = GetArchiveChatListSettings
  deriving (Eq)

instance Show GetArchiveChatListSettings where
  show
    GetArchiveChatListSettings
        = "GetArchiveChatListSettings"

instance AT.ToJSON GetArchiveChatListSettings where
  toJSON
    GetArchiveChatListSettings
        = A.object
          [ "@type" A..= AT.String "getArchiveChatListSettings"
          ]

