module TD.Query.GetThemedEmojiStatuses
  (GetThemedEmojiStatuses(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns up to 8 emoji statuses, which must be shown right after the default Premium Badge in the emoji status list for self status. Returns 'TD.Data.EmojiStatuses.EmojiStatuses'
data GetThemedEmojiStatuses
  = GetThemedEmojiStatuses
  deriving (Eq, Show)

instance I.ShortShow GetThemedEmojiStatuses where
  shortShow
    GetThemedEmojiStatuses
        = "GetThemedEmojiStatuses"

instance AT.ToJSON GetThemedEmojiStatuses where
  toJSON
    GetThemedEmojiStatuses
        = A.object
          [ "@type" A..= AT.String "getThemedEmojiStatuses"
          ]

