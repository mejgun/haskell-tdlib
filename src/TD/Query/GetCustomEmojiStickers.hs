module TD.Query.GetCustomEmojiStickers
  (GetCustomEmojiStickers(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of custom emoji stickers by their identifiers. Stickers are returned in arbitrary order. Only found stickers are returned. Returns 'TD.Data.Stickers.Stickers'
data GetCustomEmojiStickers
  = GetCustomEmojiStickers
    { custom_emoji_ids :: Maybe [Int] -- ^ Identifiers of custom emoji stickers. At most 200 custom emoji stickers can be received simultaneously
    }
  deriving (Eq, Show)

instance I.ShortShow GetCustomEmojiStickers where
  shortShow
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

