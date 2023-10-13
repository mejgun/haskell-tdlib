module TD.Query.GetThemedEmojiStatuses(GetThemedEmojiStatuses(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetThemedEmojiStatuses -- ^ Returns up to 8 emoji statuses, which must be shown right after the default Premium Badge in the emoji status list
  = GetThemedEmojiStatuses
  deriving (Eq)

instance Show GetThemedEmojiStatuses where
  show
    GetThemedEmojiStatuses
        = "GetThemedEmojiStatuses"

instance AT.ToJSON GetThemedEmojiStatuses where
  toJSON
    GetThemedEmojiStatuses
        = A.object
          [ "@type" A..= AT.String "getThemedEmojiStatuses"
          ]
