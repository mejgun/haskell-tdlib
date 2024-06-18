module TD.Query.GetEmojiCategories
  (GetEmojiCategories(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.EmojiCategoryType as EmojiCategoryType

-- | Returns available emoji categories. Returns 'TD.Data.EmojiCategories.EmojiCategories'
data GetEmojiCategories
  = GetEmojiCategories
    { _type :: Maybe EmojiCategoryType.EmojiCategoryType -- ^ Type of emoji categories to return; pass null to get default emoji categories
    }
  deriving (Eq, Show)

instance I.ShortShow GetEmojiCategories where
  shortShow
    GetEmojiCategories
      { _type = _type_
      }
        = "GetEmojiCategories"
          ++ I.cc
          [ "_type" `I.p` _type_
          ]

instance AT.ToJSON GetEmojiCategories where
  toJSON
    GetEmojiCategories
      { _type = _type_
      }
        = A.object
          [ "@type" A..= AT.String "getEmojiCategories"
          , "type"  A..= _type_
          ]

