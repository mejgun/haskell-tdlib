module TD.Query.ClearRecentEmojiStatuses
  (ClearRecentEmojiStatuses(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Clears the list of recently used emoji statuses
data ClearRecentEmojiStatuses
  = ClearRecentEmojiStatuses
  deriving (Eq)

instance Show ClearRecentEmojiStatuses where
  show
    ClearRecentEmojiStatuses
        = "ClearRecentEmojiStatuses"

instance AT.ToJSON ClearRecentEmojiStatuses where
  toJSON
    ClearRecentEmojiStatuses
        = A.object
          [ "@type" A..= AT.String "clearRecentEmojiStatuses"
          ]

