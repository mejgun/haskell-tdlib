module TD.Data.EmojiCategoryType
  (EmojiCategoryType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes type of an emoji category
data EmojiCategoryType
  = EmojiCategoryTypeDefault -- ^ The category must be used by default
  | EmojiCategoryTypeEmojiStatus -- ^ The category must be used for emoji status selection
  | EmojiCategoryTypeChatPhoto -- ^ The category must be used for chat photo emoji selection
  deriving (Eq, Show)

instance I.ShortShow EmojiCategoryType where
  shortShow EmojiCategoryTypeDefault
      = "EmojiCategoryTypeDefault"
  shortShow EmojiCategoryTypeEmojiStatus
      = "EmojiCategoryTypeEmojiStatus"
  shortShow EmojiCategoryTypeChatPhoto
      = "EmojiCategoryTypeChatPhoto"

instance AT.FromJSON EmojiCategoryType where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojiCategoryTypeDefault"     -> pure EmojiCategoryTypeDefault
      "emojiCategoryTypeEmojiStatus" -> pure EmojiCategoryTypeEmojiStatus
      "emojiCategoryTypeChatPhoto"   -> pure EmojiCategoryTypeChatPhoto
      _                              -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON EmojiCategoryType where
  toJSON EmojiCategoryTypeDefault
      = A.object
        [ "@type" A..= AT.String "emojiCategoryTypeDefault"
        ]
  toJSON EmojiCategoryTypeEmojiStatus
      = A.object
        [ "@type" A..= AT.String "emojiCategoryTypeEmojiStatus"
        ]
  toJSON EmojiCategoryTypeChatPhoto
      = A.object
        [ "@type" A..= AT.String "emojiCategoryTypeChatPhoto"
        ]

