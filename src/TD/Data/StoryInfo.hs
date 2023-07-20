{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StoryInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data StoryInfo = -- | Contains basic information about a story
  StoryInfo
  { -- | True, if the story is available only to close friends
    is_for_close_friends :: Maybe Bool,
    -- | Point in time (Unix timestamp) when the story was published
    date :: Maybe Int,
    -- | Unique story identifier among stories of the given sender
    story_id :: Maybe Int
  }
  deriving (Eq)

instance Show StoryInfo where
  show
    StoryInfo
      { is_for_close_friends = is_for_close_friends_,
        date = date_,
        story_id = story_id_
      } =
      "StoryInfo"
        ++ U.cc
          [ U.p "is_for_close_friends" is_for_close_friends_,
            U.p "date" date_,
            U.p "story_id" story_id_
          ]

instance T.FromJSON StoryInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "storyInfo" -> parseStoryInfo v
      _ -> mempty
    where
      parseStoryInfo :: A.Value -> T.Parser StoryInfo
      parseStoryInfo = A.withObject "StoryInfo" $ \o -> do
        is_for_close_friends_ <- o A..:? "is_for_close_friends"
        date_ <- o A..:? "date"
        story_id_ <- o A..:? "story_id"
        return $ StoryInfo {is_for_close_friends = is_for_close_friends_, date = date_, story_id = story_id_}
  parseJSON _ = mempty

instance T.ToJSON StoryInfo where
  toJSON
    StoryInfo
      { is_for_close_friends = is_for_close_friends_,
        date = date_,
        story_id = story_id_
      } =
      A.object
        [ "@type" A..= T.String "storyInfo",
          "is_for_close_friends" A..= is_for_close_friends_,
          "date" A..= date_,
          "story_id" A..= story_id_
        ]
