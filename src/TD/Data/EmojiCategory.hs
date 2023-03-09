{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.EmojiCategory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Sticker as Sticker
import qualified Utils as U

-- |
data EmojiCategory = -- | Contains a list of similar emoji to search for in getStickers and searchStickers
  EmojiCategory
  { -- | List of emojis in the category
    emojis :: Maybe [String],
    -- | Custom emoji sticker, which represents icon of the category
    icon :: Maybe Sticker.Sticker,
    -- | Name of the category
    name :: Maybe String
  }
  deriving (Eq)

instance Show EmojiCategory where
  show
    EmojiCategory
      { emojis = emojis_,
        icon = icon_,
        name = name_
      } =
      "EmojiCategory"
        ++ U.cc
          [ U.p "emojis" emojis_,
            U.p "icon" icon_,
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
        icon_ <- o A..:? "icon"
        name_ <- o A..:? "name"
        return $ EmojiCategory {emojis = emojis_, icon = icon_, name = name_}
  parseJSON _ = mempty

instance T.ToJSON EmojiCategory where
  toJSON
    EmojiCategory
      { emojis = emojis_,
        icon = icon_,
        name = name_
      } =
      A.object
        [ "@type" A..= T.String "emojiCategory",
          "emojis" A..= emojis_,
          "icon" A..= icon_,
          "name" A..= name_
        ]
