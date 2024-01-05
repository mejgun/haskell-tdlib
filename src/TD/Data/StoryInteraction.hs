module TD.Data.StoryInteraction
  (StoryInteraction(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.BlockList as BlockList
import qualified TD.Data.StoryInteractionType as StoryInteractionType

data StoryInteraction
  = StoryInteraction -- ^ Represents interaction with a story
    { actor_id         :: Maybe MessageSender.MessageSender               -- ^ Identifier of the user or chat that made the interaction
    , interaction_date :: Maybe Int                                       -- ^ Approximate point in time (Unix timestamp) when the interaction happened
    , block_list       :: Maybe BlockList.BlockList                       -- ^ Block list to which the actor is added; may be null if none or for chat stories
    , _type            :: Maybe StoryInteractionType.StoryInteractionType -- ^ Type of the interaction
    }
  deriving (Eq, Show)

instance I.ShortShow StoryInteraction where
  shortShow StoryInteraction
    { actor_id         = actor_id_
    , interaction_date = interaction_date_
    , block_list       = block_list_
    , _type            = _type_
    }
      = "StoryInteraction"
        ++ I.cc
        [ "actor_id"         `I.p` actor_id_
        , "interaction_date" `I.p` interaction_date_
        , "block_list"       `I.p` block_list_
        , "_type"            `I.p` _type_
        ]

instance AT.FromJSON StoryInteraction where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyInteraction" -> parseStoryInteraction v
      _                  -> mempty
    
    where
      parseStoryInteraction :: A.Value -> AT.Parser StoryInteraction
      parseStoryInteraction = A.withObject "StoryInteraction" $ \o -> do
        actor_id_         <- o A..:?  "actor_id"
        interaction_date_ <- o A..:?  "interaction_date"
        block_list_       <- o A..:?  "block_list"
        _type_            <- o A..:?  "type"
        pure $ StoryInteraction
          { actor_id         = actor_id_
          , interaction_date = interaction_date_
          , block_list       = block_list_
          , _type            = _type_
          }
  parseJSON _ = mempty

