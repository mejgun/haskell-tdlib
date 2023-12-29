module TD.Query.ClearRecentEmojiStatuses
  (ClearRecentEmojiStatuses(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Clears the list of recently used emoji statuses for self status. Returns 'TD.Data.Ok.Ok'
data ClearRecentEmojiStatuses
  = ClearRecentEmojiStatuses
  deriving (Eq, Show)

instance I.ShortShow ClearRecentEmojiStatuses where
  shortShow
    ClearRecentEmojiStatuses
        = "ClearRecentEmojiStatuses"

instance AT.ToJSON ClearRecentEmojiStatuses where
  toJSON
    ClearRecentEmojiStatuses
        = A.object
          [ "@type" A..= AT.String "clearRecentEmojiStatuses"
          ]

