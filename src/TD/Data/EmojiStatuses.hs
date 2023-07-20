{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.EmojiStatuses where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data EmojiStatuses = -- | Contains a list of custom emoji identifiers, which can be set as emoji statuses @custom_emoji_ids The list of custom emoji identifiers
  EmojiStatuses
  { -- |
    custom_emoji_ids :: Maybe [Int]
  }
  deriving (Eq)

instance Show EmojiStatuses where
  show
    EmojiStatuses
      { custom_emoji_ids = custom_emoji_ids_
      } =
      "EmojiStatuses"
        ++ U.cc
          [ U.p "custom_emoji_ids" custom_emoji_ids_
          ]

instance T.FromJSON EmojiStatuses where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "emojiStatuses" -> parseEmojiStatuses v
      _ -> mempty
    where
      parseEmojiStatuses :: A.Value -> T.Parser EmojiStatuses
      parseEmojiStatuses = A.withObject "EmojiStatuses" $ \o -> do
        custom_emoji_ids_ <- U.rl <$> (o A..:? "custom_emoji_ids" :: T.Parser (Maybe [String])) :: T.Parser (Maybe [Int])
        return $ EmojiStatuses {custom_emoji_ids = custom_emoji_ids_}
  parseJSON _ = mempty

instance T.ToJSON EmojiStatuses where
  toJSON
    EmojiStatuses
      { custom_emoji_ids = custom_emoji_ids_
      } =
      A.object
        [ "@type" A..= T.String "emojiStatuses",
          "custom_emoji_ids" A..= U.toLS custom_emoji_ids_
        ]
