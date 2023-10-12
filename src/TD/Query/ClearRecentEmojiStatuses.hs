module TD.Query.ClearRecentEmojiStatuses where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ClearRecentEmojiStatuses -- ^ Clears the list of recently used emoji statuses
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
