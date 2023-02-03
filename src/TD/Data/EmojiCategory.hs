{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.EmojiCategory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data EmojiCategory = -- | Contains a list of similar emoji to search for in getStickers and searchStickers
  EmojiCategory
  { -- | List of emojis in the category
    emojis :: Maybe [String],
    -- | Unique identifier of the custom emoji, which represents icon of the category
    icon_custom_emoji_id :: Maybe Int,
    -- | Name of the category
    name :: Maybe String
  }
  deriving (Eq)

instance Show EmojiCategory where
  show
    EmojiCategory
      { emojis = emojis_,
        icon_custom_emoji_id = icon_custom_emoji_id_,
        name = name_
      } =
      "EmojiCategory"
        ++ U.cc
          [ U.p "emojis" emojis_,
            U.p "icon_custom_emoji_id" icon_custom_emoji_id_,
            U.p "name" name_
          ]

instance T.FromJSON EmojiCategory where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "emojiCategory" -> parseEmojiCategory v
      _ -> mempty
    where
      parseEmojiCategory :: A.Value -> T.Parser EmojiCategory
      parseEmojiCategory = A.withObject "EmojiCategory" $ \o -> do
        emojis_ <- o A..:? "emojis"
        icon_custom_emoji_id_ <- U.rm <$> (o A..:? "icon_custom_emoji_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        name_ <- o A..:? "name"
        return $ EmojiCategory {emojis = emojis_, icon_custom_emoji_id = icon_custom_emoji_id_, name = name_}
  parseJSON _ = mempty

instance T.ToJSON EmojiCategory where
  toJSON
    EmojiCategory
      { emojis = emojis_,
        icon_custom_emoji_id = icon_custom_emoji_id_,
        name = name_
      } =
      A.object
        [ "@type" A..= T.String "emojiCategory",
          "emojis" A..= emojis_,
          "icon_custom_emoji_id" A..= U.toS icon_custom_emoji_id_,
          "name" A..= name_
        ]
