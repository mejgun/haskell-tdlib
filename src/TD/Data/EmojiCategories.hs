{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.EmojiCategories where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.EmojiCategory as EmojiCategory
import qualified Utils as U

-- |
data EmojiCategories = -- | Represents a list of emoji categories @categories List of categories
  EmojiCategories
  { -- |
    categories :: Maybe [EmojiCategory.EmojiCategory]
  }
  deriving (Eq)

instance Show EmojiCategories where
  show
    EmojiCategories
      { categories = categories_
      } =
      "EmojiCategories"
        ++ U.cc
          [ U.p "categories" categories_
          ]

instance T.FromJSON EmojiCategories where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "emojiCategories" -> parseEmojiCategories v
      _ -> mempty
    where
      parseEmojiCategories :: A.Value -> T.Parser EmojiCategories
      parseEmojiCategories = A.withObject "EmojiCategories" $ \o -> do
        categories_ <- o A..:? "categories"
        return $ EmojiCategories {categories = categories_}
  parseJSON _ = mempty

instance T.ToJSON EmojiCategories where
  toJSON
    EmojiCategories
      { categories = categories_
      } =
      A.object
        [ "@type" A..= T.String "emojiCategories",
          "categories" A..= categories_
        ]
