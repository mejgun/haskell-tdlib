module TD.Data.ForumTopicIcon
  ( ForumTopicIcon(..)    
  , defaultForumTopicIcon 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ForumTopicIcon
  = ForumTopicIcon -- ^ Describes a forum topic icon
    { color           :: Maybe Int -- ^ Color of the topic icon in RGB format
    , custom_emoji_id :: Maybe Int -- ^ Unique identifier of the custom emoji shown on the topic icon; 0 if none
    }
  deriving (Eq, Show)

instance I.ShortShow ForumTopicIcon where
  shortShow ForumTopicIcon
    { color           = color_
    , custom_emoji_id = custom_emoji_id_
    }
      = "ForumTopicIcon"
        ++ I.cc
        [ "color"           `I.p` color_
        , "custom_emoji_id" `I.p` custom_emoji_id_
        ]

instance AT.FromJSON ForumTopicIcon where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "forumTopicIcon" -> parseForumTopicIcon v
      _                -> mempty
    
    where
      parseForumTopicIcon :: A.Value -> AT.Parser ForumTopicIcon
      parseForumTopicIcon = A.withObject "ForumTopicIcon" $ \o -> do
        color_           <- o A..:?                       "color"
        custom_emoji_id_ <- fmap I.readInt64 <$> o A..:?  "custom_emoji_id"
        pure $ ForumTopicIcon
          { color           = color_
          , custom_emoji_id = custom_emoji_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON ForumTopicIcon where
  toJSON ForumTopicIcon
    { color           = color_
    , custom_emoji_id = custom_emoji_id_
    }
      = A.object
        [ "@type"           A..= AT.String "forumTopicIcon"
        , "color"           A..= color_
        , "custom_emoji_id" A..= fmap I.writeInt64  custom_emoji_id_
        ]

defaultForumTopicIcon :: ForumTopicIcon
defaultForumTopicIcon =
  ForumTopicIcon
    { color           = Nothing
    , custom_emoji_id = Nothing
    }

