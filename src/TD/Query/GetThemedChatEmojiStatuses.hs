module TD.Query.GetThemedChatEmojiStatuses
  (GetThemedChatEmojiStatuses(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns up to 8 emoji statuses, which must be shown in the emoji status list for chats. Returns 'TD.Data.EmojiStatuses.EmojiStatuses'
data GetThemedChatEmojiStatuses
  = GetThemedChatEmojiStatuses
  deriving (Eq, Show)

instance I.ShortShow GetThemedChatEmojiStatuses where
  shortShow
    GetThemedChatEmojiStatuses
        = "GetThemedChatEmojiStatuses"

instance AT.ToJSON GetThemedChatEmojiStatuses where
  toJSON
    GetThemedChatEmojiStatuses
        = A.object
          [ "@type" A..= AT.String "getThemedChatEmojiStatuses"
          ]

