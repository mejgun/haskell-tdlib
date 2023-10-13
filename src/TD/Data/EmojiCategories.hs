module TD.Data.EmojiCategories
  ( EmojiCategories(..)    
  , defaultEmojiCategories 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.EmojiCategory as EmojiCategory

data EmojiCategories
  = EmojiCategories -- ^ Represents a list of emoji categories
    { categories :: Maybe [EmojiCategory.EmojiCategory] -- ^ List of categories
    }
  deriving (Eq)

instance Show EmojiCategories where
  show EmojiCategories
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

instance AT.ToJSON EmojiCategories where
  toJSON EmojiCategories
    { categories = categories_
    }
      = A.object
        [ "@type"      A..= AT.String "emojiCategories"
        , "categories" A..= categories_
        ]

defaultEmojiCategories :: EmojiCategories
defaultEmojiCategories =
  EmojiCategories
    { categories = Nothing
    }

