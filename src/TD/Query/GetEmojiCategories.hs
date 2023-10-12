module TD.Query.GetEmojiCategories where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.EmojiCategoryType as EmojiCategoryType

data GetEmojiCategories -- ^ Returns available emojis categories
  = GetEmojiCategories
    { _type :: Maybe EmojiCategoryType.EmojiCategoryType -- ^ Type of emoji categories to return; pass null to get default emoji categories
    }
  deriving (Eq)

instance Show GetEmojiCategories where
  show
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
