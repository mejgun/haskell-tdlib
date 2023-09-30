{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StoryViewers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StoryViewer as StoryViewer
import qualified Utils as U

-- |
data StoryViewers = -- | Represents a list of story viewers
  StoryViewers
  { -- | The offset for the next request. If empty, there are no more results
    next_offset :: Maybe String,
    -- | List of story viewers
    viewers :: Maybe [StoryViewer.StoryViewer],
    -- | Approximate total number of reactions set by found story viewers
    total_reaction_count :: Maybe Int,
    -- | Approximate total number of story viewers found
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show StoryViewers where
  show
    StoryViewers
      { next_offset = next_offset_,
        viewers = viewers_,
        total_reaction_count = total_reaction_count_,
        total_count = total_count_
      } =
      "StoryViewers"
        ++ U.cc
          [ U.p "next_offset" next_offset_,
            U.p "viewers" viewers_,
            U.p "total_reaction_count" total_reaction_count_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON StoryViewers where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "storyViewers" -> parseStoryViewers v
      _ -> mempty
    where
      parseStoryViewers :: A.Value -> T.Parser StoryViewers
      parseStoryViewers = A.withObject "StoryViewers" $ \o -> do
        next_offset_ <- o A..:? "next_offset"
        viewers_ <- o A..:? "viewers"
        total_reaction_count_ <- o A..:? "total_reaction_count"
        total_count_ <- o A..:? "total_count"
        return $ StoryViewers {next_offset = next_offset_, viewers = viewers_, total_reaction_count = total_reaction_count_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON StoryViewers where
  toJSON
    StoryViewers
      { next_offset = next_offset_,
        viewers = viewers_,
        total_reaction_count = total_reaction_count_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "storyViewers",
          "next_offset" A..= next_offset_,
          "viewers" A..= viewers_,
          "total_reaction_count" A..= total_reaction_count_,
          "total_count" A..= total_count_
        ]
