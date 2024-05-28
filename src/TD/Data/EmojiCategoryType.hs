module TD.Data.EmojiCategoryType
  (EmojiCategoryType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes type of emoji category
data EmojiCategoryType
  = EmojiCategoryTypeDefault -- ^ The category must be used by default (e.g., for custom emoji or animation search)
  | EmojiCategoryTypeRegularStickers -- ^ The category must be used by default for regular sticker selection. It may contain greeting emoji category and premium stickers
  | EmojiCategoryTypeEmojiStatus -- ^ The category must be used for emoji status selection
  | EmojiCategoryTypeChatPhoto -- ^ The category must be used for chat photo emoji selection
  deriving (Eq, Show)

instance I.ShortShow EmojiCategoryType where
  shortShow EmojiCategoryTypeDefault
      = "EmojiCategoryTypeDefault"
  shortShow EmojiCategoryTypeRegularStickers
      = "EmojiCategoryTypeRegularStickers"
  shortShow EmojiCategoryTypeEmojiStatus
      = "EmojiCategoryTypeEmojiStatus"
  shortShow EmojiCategoryTypeChatPhoto
      = "EmojiCategoryTypeChatPhoto"

instance AT.FromJSON EmojiCategoryType where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojiCategoryTypeDefault"         -> pure EmojiCategoryTypeDefault
      "emojiCategoryTypeRegularStickers" -> pure EmojiCategoryTypeRegularStickers
      "emojiCategoryTypeEmojiStatus"     -> pure EmojiCategoryTypeEmojiStatus
      "emojiCategoryTypeChatPhoto"       -> pure EmojiCategoryTypeChatPhoto
      _                                  -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON EmojiCategoryType where
  toJSON EmojiCategoryTypeDefault
      = A.object
        [ "@type" A..= AT.String "emojiCategoryTypeDefault"
        ]
  toJSON EmojiCategoryTypeRegularStickers
      = A.object
        [ "@type" A..= AT.String "emojiCategoryTypeRegularStickers"
        ]
  toJSON EmojiCategoryTypeEmojiStatus
      = A.object
        [ "@type" A..= AT.String "emojiCategoryTypeEmojiStatus"
        ]
  toJSON EmojiCategoryTypeChatPhoto
      = A.object
        [ "@type" A..= AT.String "emojiCategoryTypeChatPhoto"
        ]

