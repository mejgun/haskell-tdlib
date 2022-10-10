{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.EmojiStatuses where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.EmojiStatus as EmojiStatus
import qualified Utils as U

-- |
data EmojiStatuses = -- | Contains a list of emoji statuses @emoji_statuses The list of emoji statuses
  EmojiStatuses
  { -- |
    emoji_statuses :: Maybe [EmojiStatus.EmojiStatus]
  }
  deriving (Eq)

instance Show EmojiStatuses where
  show
    EmojiStatuses
      { emoji_statuses = emoji_statuses_
      } =
      "EmojiStatuses"
        ++ U.cc
          [ U.p "emoji_statuses" emoji_statuses_
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
        emoji_statuses_ <- o A..:? "emoji_statuses"
        return $ EmojiStatuses {emoji_statuses = emoji_statuses_}
  parseJSON _ = mempty

instance T.ToJSON EmojiStatuses where
  toJSON
    EmojiStatuses
      { emoji_statuses = emoji_statuses_
      } =
      A.object
        [ "@type" A..= T.String "emojiStatuses",
          "emoji_statuses" A..= emoji_statuses_
        ]
