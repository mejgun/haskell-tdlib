{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ForumTopicIcon where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ForumTopicIcon = -- | Describes a forum topic icon @color Color of the topic icon in RGB format @custom_emoji_id Unique identifier of the custom emoji shown on the topic icon; 0 if none
  ForumTopicIcon
  { -- |
    custom_emoji_id :: Maybe Int,
    -- |
    color :: Maybe Int
  }
  deriving (Eq)

instance Show ForumTopicIcon where
  show
    ForumTopicIcon
      { custom_emoji_id = custom_emoji_id_,
        color = color_
      } =
      "ForumTopicIcon"
        ++ U.cc
          [ U.p "custom_emoji_id" custom_emoji_id_,
            U.p "color" color_
          ]

instance T.FromJSON ForumTopicIcon where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "forumTopicIcon" -> parseForumTopicIcon v
      _ -> mempty
    where
      parseForumTopicIcon :: A.Value -> T.Parser ForumTopicIcon
      parseForumTopicIcon = A.withObject "ForumTopicIcon" $ \o -> do
        custom_emoji_id_ <- U.rm <$> (o A..:? "custom_emoji_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        color_ <- o A..:? "color"
        return $ ForumTopicIcon {custom_emoji_id = custom_emoji_id_, color = color_}
  parseJSON _ = mempty

instance T.ToJSON ForumTopicIcon where
  toJSON
    ForumTopicIcon
      { custom_emoji_id = custom_emoji_id_,
        color = color_
      } =
      A.object
        [ "@type" A..= T.String "forumTopicIcon",
          "custom_emoji_id" A..= U.toS custom_emoji_id_,
          "color" A..= color_
        ]
