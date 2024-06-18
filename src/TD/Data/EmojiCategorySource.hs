module TD.Data.EmojiCategorySource
  (EmojiCategorySource(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes source of stickers for an emoji category
data EmojiCategorySource
  = EmojiCategorySourceSearch -- ^ The category contains a list of similar emoji to search for in getStickers and searchStickers for stickers, or getInlineQueryResults with the bot getOption("animation_search_bot_username") for animations
    { emojis :: Maybe [T.Text] -- ^ List of emojis to search for
    }
  | EmojiCategorySourcePremium -- ^ The category contains premium stickers that must be found by getPremiumStickers
  deriving (Eq, Show)

instance I.ShortShow EmojiCategorySource where
  shortShow EmojiCategorySourceSearch
    { emojis = emojis_
    }
      = "EmojiCategorySourceSearch"
        ++ I.cc
        [ "emojis" `I.p` emojis_
        ]
  shortShow EmojiCategorySourcePremium
      = "EmojiCategorySourcePremium"

instance AT.FromJSON EmojiCategorySource where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojiCategorySourceSearch"  -> parseEmojiCategorySourceSearch v
      "emojiCategorySourcePremium" -> pure EmojiCategorySourcePremium
      _                            -> mempty
    
    where
      parseEmojiCategorySourceSearch :: A.Value -> AT.Parser EmojiCategorySource
      parseEmojiCategorySourceSearch = A.withObject "EmojiCategorySourceSearch" $ \o -> do
        emojis_ <- o A..:?  "emojis"
        pure $ EmojiCategorySourceSearch
          { emojis = emojis_
          }
  parseJSON _ = mempty

