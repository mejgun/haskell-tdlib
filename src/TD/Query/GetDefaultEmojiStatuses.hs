module TD.Query.GetDefaultEmojiStatuses(GetDefaultEmojiStatuses(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetDefaultEmojiStatuses -- ^ Returns default emoji statuses
  = GetDefaultEmojiStatuses
  deriving (Eq)

instance Show GetDefaultEmojiStatuses where
  show
    GetDefaultEmojiStatuses
        = "GetDefaultEmojiStatuses"

instance AT.ToJSON GetDefaultEmojiStatuses where
  toJSON
    GetDefaultEmojiStatuses
        = A.object
          [ "@type" A..= AT.String "getDefaultEmojiStatuses"
          ]
