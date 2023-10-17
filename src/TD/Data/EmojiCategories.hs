module TD.Data.EmojiCategories
  (EmojiCategories(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.EmojiCategory as EmojiCategory

data EmojiCategories
  = EmojiCategories -- ^ Represents a list of emoji categories
    { categories :: Maybe [EmojiCategory.EmojiCategory] -- ^ List of categories
    }
  deriving (Eq, Show)

instance I.ShortShow EmojiCategories where
  shortShow EmojiCategories
    { categories = categories_
    }
      = "EmojiCategories"
        ++ I.cc
        [ "categories" `I.p` categories_
        ]

instance AT.FromJSON EmojiCategories where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojiCategories" -> parseEmojiCategories v
      _                 -> mempty
    
    where
      parseEmojiCategories :: A.Value -> AT.Parser EmojiCategories
      parseEmojiCategories = A.withObject "EmojiCategories" $ \o -> do
        categories_ <- o A..:?  "categories"
        pure $ EmojiCategories
          { categories = categories_
          }
  parseJSON _ = mempty

