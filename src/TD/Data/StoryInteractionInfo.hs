{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StoryInteractionInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data StoryInteractionInfo = -- | Contains information about interactions with a story
  StoryInteractionInfo
  { -- | Identifiers of at most 3 recent viewers of the story
    recent_viewer_user_ids :: Maybe [Int],
    -- | Number of times the story was viewed
    view_count :: Maybe Int
  }
  deriving (Eq)

instance Show StoryInteractionInfo where
  show
    StoryInteractionInfo
      { recent_viewer_user_ids = recent_viewer_user_ids_,
        view_count = view_count_
      } =
      "StoryInteractionInfo"
        ++ U.cc
          [ U.p "recent_viewer_user_ids" recent_viewer_user_ids_,
            U.p "view_count" view_count_
          ]

instance T.FromJSON StoryInteractionInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "storyInteractionInfo" -> parseStoryInteractionInfo v
      _ -> mempty
    where
      parseStoryInteractionInfo :: A.Value -> T.Parser StoryInteractionInfo
      parseStoryInteractionInfo = A.withObject "StoryInteractionInfo" $ \o -> do
        recent_viewer_user_ids_ <- o A..:? "recent_viewer_user_ids"
        view_count_ <- o A..:? "view_count"
        return $ StoryInteractionInfo {recent_viewer_user_ids = recent_viewer_user_ids_, view_count = view_count_}
  parseJSON _ = mempty

instance T.ToJSON StoryInteractionInfo where
  toJSON
    StoryInteractionInfo
      { recent_viewer_user_ids = recent_viewer_user_ids_,
        view_count = view_count_
      } =
      A.object
        [ "@type" A..= T.String "storyInteractionInfo",
          "recent_viewer_user_ids" A..= recent_viewer_user_ids_,
          "view_count" A..= view_count_
        ]
