module TD.Query.GetDisallowedChatEmojiStatuses
  (GetDisallowedChatEmojiStatuses(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of emoji statuses, which can't be used as chat emoji status, even they are from a sticker set with is_allowed_as_chat_emoji_status == true. Returns 'TD.Data.EmojiStatuses.EmojiStatuses'
data GetDisallowedChatEmojiStatuses
  = GetDisallowedChatEmojiStatuses
  deriving (Eq, Show)

instance I.ShortShow GetDisallowedChatEmojiStatuses where
  shortShow
    GetDisallowedChatEmojiStatuses
        = "GetDisallowedChatEmojiStatuses"

instance AT.ToJSON GetDisallowedChatEmojiStatuses where
  toJSON
    GetDisallowedChatEmojiStatuses
        = A.object
          [ "@type" A..= AT.String "getDisallowedChatEmojiStatuses"
          ]

