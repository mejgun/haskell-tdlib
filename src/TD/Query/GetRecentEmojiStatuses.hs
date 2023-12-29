module TD.Query.GetRecentEmojiStatuses
  (GetRecentEmojiStatuses(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns recent emoji statuses for self status. Returns 'TD.Data.EmojiStatuses.EmojiStatuses'
data GetRecentEmojiStatuses
  = GetRecentEmojiStatuses
  deriving (Eq, Show)

instance I.ShortShow GetRecentEmojiStatuses where
  shortShow
    GetRecentEmojiStatuses
        = "GetRecentEmojiStatuses"

instance AT.ToJSON GetRecentEmojiStatuses where
  toJSON
    GetRecentEmojiStatuses
        = A.object
          [ "@type" A..= AT.String "getRecentEmojiStatuses"
          ]

