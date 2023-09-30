{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StoryViewer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BlockList as BlockList
import qualified TD.Data.ReactionType as ReactionType
import qualified Utils as U

-- |
data StoryViewer = -- | Represents a viewer of a story
  StoryViewer
  { -- | Type of the reaction that was chosen by the user; may be null if none
    chosen_reaction_type :: Maybe ReactionType.ReactionType,
    -- | Block list to which the user is added; may be null if none
    block_list :: Maybe BlockList.BlockList,
    -- | Approximate point in time (Unix timestamp) when the story was viewed
    view_date :: Maybe Int,
    -- | User identifier of the viewer
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show StoryViewer where
  show
    StoryViewer
      { chosen_reaction_type = chosen_reaction_type_,
        block_list = block_list_,
        view_date = view_date_,
        user_id = user_id_
      } =
      "StoryViewer"
        ++ U.cc
          [ U.p "chosen_reaction_type" chosen_reaction_type_,
            U.p "block_list" block_list_,
            U.p "view_date" view_date_,
            U.p "user_id" user_id_
          ]

instance T.FromJSON StoryViewer where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "storyViewer" -> parseStoryViewer v
      _ -> mempty
    where
      parseStoryViewer :: A.Value -> T.Parser StoryViewer
      parseStoryViewer = A.withObject "StoryViewer" $ \o -> do
        chosen_reaction_type_ <- o A..:? "chosen_reaction_type"
        block_list_ <- o A..:? "block_list"
        view_date_ <- o A..:? "view_date"
        user_id_ <- o A..:? "user_id"
        return $ StoryViewer {chosen_reaction_type = chosen_reaction_type_, block_list = block_list_, view_date = view_date_, user_id = user_id_}
  parseJSON _ = mempty

instance T.ToJSON StoryViewer where
  toJSON
    StoryViewer
      { chosen_reaction_type = chosen_reaction_type_,
        block_list = block_list_,
        view_date = view_date_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "storyViewer",
          "chosen_reaction_type" A..= chosen_reaction_type_,
          "block_list" A..= block_list_,
          "view_date" A..= view_date_,
          "user_id" A..= user_id_
        ]
