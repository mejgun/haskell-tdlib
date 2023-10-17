module TD.Data.StoryViewer
  (StoryViewer(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BlockList as BlockList
import qualified TD.Data.ReactionType as ReactionType

data StoryViewer
  = StoryViewer -- ^ Represents a viewer of a story
    { user_id              :: Maybe Int                       -- ^ User identifier of the viewer
    , view_date            :: Maybe Int                       -- ^ Approximate point in time (Unix timestamp) when the story was viewed
    , block_list           :: Maybe BlockList.BlockList       -- ^ Block list to which the user is added; may be null if none
    , chosen_reaction_type :: Maybe ReactionType.ReactionType -- ^ Type of the reaction that was chosen by the user; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow StoryViewer where
  shortShow StoryViewer
    { user_id              = user_id_
    , view_date            = view_date_
    , block_list           = block_list_
    , chosen_reaction_type = chosen_reaction_type_
    }
      = "StoryViewer"
        ++ I.cc
        [ "user_id"              `I.p` user_id_
        , "view_date"            `I.p` view_date_
        , "block_list"           `I.p` block_list_
        , "chosen_reaction_type" `I.p` chosen_reaction_type_
        ]

instance AT.FromJSON StoryViewer where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyViewer" -> parseStoryViewer v
      _             -> mempty
    
    where
      parseStoryViewer :: A.Value -> AT.Parser StoryViewer
      parseStoryViewer = A.withObject "StoryViewer" $ \o -> do
        user_id_              <- o A..:?  "user_id"
        view_date_            <- o A..:?  "view_date"
        block_list_           <- o A..:?  "block_list"
        chosen_reaction_type_ <- o A..:?  "chosen_reaction_type"
        pure $ StoryViewer
          { user_id              = user_id_
          , view_date            = view_date_
          , block_list           = block_list_
          , chosen_reaction_type = chosen_reaction_type_
          }
  parseJSON _ = mempty

