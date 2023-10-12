module TD.Query.GetCustomEmojiStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetCustomEmojiStickers -- ^ Returns list of custom emoji stickers by their identifiers. Stickers are returned in arbitrary order. Only found stickers are returned
  = GetCustomEmojiStickers
    { custom_emoji_ids :: Maybe [Int] -- ^ Identifiers of custom emoji stickers. At most 200 custom emoji stickers can be received simultaneously
    }
  deriving (Eq)

instance Show GetCustomEmojiStickers where
  show
    GetCustomEmojiStickers
      { custom_emoji_ids = custom_emoji_ids_
      }
        = "GetCustomEmojiStickers"
          ++ I.cc
          [ "custom_emoji_ids" `I.p` custom_emoji_ids_
          ]

instance AT.ToJSON GetCustomEmojiStickers where
  toJSON
    GetCustomEmojiStickers
      { custom_emoji_ids = custom_emoji_ids_
      }
        = A.object
          [ "@type"            A..= AT.String "getCustomEmojiStickers"
          , "custom_emoji_ids" A..= fmap (fmap I.writeInt64 ) custom_emoji_ids_
          ]
