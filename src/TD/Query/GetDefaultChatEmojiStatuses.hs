module TD.Query.GetDefaultChatEmojiStatuses
  (GetDefaultChatEmojiStatuses(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns default emoji statuses for chats. Returns 'TD.Data.EmojiStatuses.EmojiStatuses'
data GetDefaultChatEmojiStatuses
  = GetDefaultChatEmojiStatuses
  deriving (Eq, Show)

instance I.ShortShow GetDefaultChatEmojiStatuses where
  shortShow
    GetDefaultChatEmojiStatuses
        = "GetDefaultChatEmojiStatuses"

instance AT.ToJSON GetDefaultChatEmojiStatuses where
  toJSON
    GetDefaultChatEmojiStatuses
        = A.object
          [ "@type" A..= AT.String "getDefaultChatEmojiStatuses"
          ]

