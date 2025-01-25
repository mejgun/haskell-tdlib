module TD.Query.GetUpgradedGiftEmojiStatuses
  (GetUpgradedGiftEmojiStatuses(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns available upgraded gift emoji statuses for self status. Returns 'TD.Data.EmojiStatuses.EmojiStatuses'
data GetUpgradedGiftEmojiStatuses
  = GetUpgradedGiftEmojiStatuses
  deriving (Eq, Show)

instance I.ShortShow GetUpgradedGiftEmojiStatuses where
  shortShow
    GetUpgradedGiftEmojiStatuses
        = "GetUpgradedGiftEmojiStatuses"

instance AT.ToJSON GetUpgradedGiftEmojiStatuses where
  toJSON
    GetUpgradedGiftEmojiStatuses
        = A.object
          [ "@type" A..= AT.String "getUpgradedGiftEmojiStatuses"
          ]

