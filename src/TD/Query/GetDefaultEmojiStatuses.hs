module TD.Query.GetDefaultEmojiStatuses
  (GetDefaultEmojiStatuses(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns default emoji statuses for self status. Returns 'TD.Data.EmojiStatuses.EmojiStatuses'
data GetDefaultEmojiStatuses
  = GetDefaultEmojiStatuses
  deriving (Eq, Show)

instance I.ShortShow GetDefaultEmojiStatuses where
  shortShow
    GetDefaultEmojiStatuses
        = "GetDefaultEmojiStatuses"

instance AT.ToJSON GetDefaultEmojiStatuses where
  toJSON
    GetDefaultEmojiStatuses
        = A.object
          [ "@type" A..= AT.String "getDefaultEmojiStatuses"
          ]

