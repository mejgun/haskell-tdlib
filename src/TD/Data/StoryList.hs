{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StoryList where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes a list of stories
data StoryList
  = -- | The list of stories, shown in the main chat list and folder chat lists
    StoryListMain
  | -- | The list of stories, shown in the Arvhive chat list
    StoryListArchive
  deriving (Eq)

instance Show StoryList where
  show StoryListMain =
    "StoryListMain"
      ++ U.cc
        []
  show StoryListArchive =
    "StoryListArchive"
      ++ U.cc
        []

instance T.FromJSON StoryList where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "storyListMain" -> parseStoryListMain v
      "storyListArchive" -> parseStoryListArchive v
      _ -> mempty
    where
      parseStoryListMain :: A.Value -> T.Parser StoryList
      parseStoryListMain = A.withObject "StoryListMain" $ \_ -> return StoryListMain

      parseStoryListArchive :: A.Value -> T.Parser StoryList
      parseStoryListArchive = A.withObject "StoryListArchive" $ \_ -> return StoryListArchive
  parseJSON _ = mempty

instance T.ToJSON StoryList where
  toJSON StoryListMain =
    A.object
      [ "@type" A..= T.String "storyListMain"
      ]
  toJSON StoryListArchive =
    A.object
      [ "@type" A..= T.String "storyListArchive"
      ]
