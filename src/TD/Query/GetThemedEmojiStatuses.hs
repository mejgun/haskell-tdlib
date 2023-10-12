module TD.Query.GetThemedEmojiStatuses where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

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
