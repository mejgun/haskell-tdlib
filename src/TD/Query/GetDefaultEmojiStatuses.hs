module TD.Query.GetDefaultEmojiStatuses where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

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
