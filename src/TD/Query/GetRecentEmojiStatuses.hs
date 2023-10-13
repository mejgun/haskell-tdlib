module TD.Query.GetRecentEmojiStatuses(GetRecentEmojiStatuses(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetRecentEmojiStatuses -- ^ Returns recent emoji statuses
  = GetRecentEmojiStatuses
  deriving (Eq)

instance Show GetRecentEmojiStatuses where
  show
    GetRecentEmojiStatuses
        = "GetRecentEmojiStatuses"

instance AT.ToJSON GetRecentEmojiStatuses where
  toJSON
    GetRecentEmojiStatuses
        = A.object
          [ "@type" A..= AT.String "getRecentEmojiStatuses"
          ]
