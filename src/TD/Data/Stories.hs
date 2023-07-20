{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Stories where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Story as Story
import qualified Utils as U

-- |
data Stories = -- | Represents a list of stories @total_count Approximate total number of stories found @stories The list of stories
  Stories
  { -- |
    stories :: Maybe [Story.Story],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show Stories where
  show
    Stories
      { stories = stories_,
        total_count = total_count_
      } =
      "Stories"
        ++ U.cc
          [ U.p "stories" stories_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON Stories where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "stories" -> parseStories v
      _ -> mempty
    where
      parseStories :: A.Value -> T.Parser Stories
      parseStories = A.withObject "Stories" $ \o -> do
        stories_ <- o A..:? "stories"
        total_count_ <- o A..:? "total_count"
        return $ Stories {stories = stories_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON Stories where
  toJSON
    Stories
      { stories = stories_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "stories",
          "stories" A..= stories_,
          "total_count" A..= total_count_
        ]
