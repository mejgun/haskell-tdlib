module TD.Data.StoryAreaType
  (StoryAreaType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Location as Location
import qualified TD.Data.Venue as Venue
import qualified TD.Data.ReactionType as ReactionType

-- | Describes type of clickable rectangle area on a story media
data StoryAreaType
  = StoryAreaTypeLocation -- ^ An area pointing to a location
    { location :: Maybe Location.Location -- ^ The location
    }
  | StoryAreaTypeVenue -- ^ An area pointing to a venue
    { venue :: Maybe Venue.Venue -- ^ Information about the venue
    }
  | StoryAreaTypeSuggestedReaction -- ^ An area pointing to a suggested reaction. App needs to show a clickable reaction on the area and call setStoryReaction when the are is clicked
    { reaction_type :: Maybe ReactionType.ReactionType -- ^ Type of the reaction
    , total_count   :: Maybe Int                       -- ^ Number of times the reaction was added
    , is_dark       :: Maybe Bool                      -- ^ True, if reaction has a dark background
    , is_flipped    :: Maybe Bool                      -- ^ True, if reaction corner is flipped
    }
  | StoryAreaTypeMessage -- ^ An area pointing to a message
    { chat_id    :: Maybe Int -- ^ Identifier of the chat with the message
    , message_id :: Maybe Int -- ^ Identifier of the message
    }
  deriving (Eq, Show)

instance I.ShortShow StoryAreaType where
  shortShow StoryAreaTypeLocation
    { location = location_
    }
      = "StoryAreaTypeLocation"
        ++ I.cc
        [ "location" `I.p` location_
        ]
  shortShow StoryAreaTypeVenue
    { venue = venue_
    }
      = "StoryAreaTypeVenue"
        ++ I.cc
        [ "venue" `I.p` venue_
        ]
  shortShow StoryAreaTypeSuggestedReaction
    { reaction_type = reaction_type_
    , total_count   = total_count_
    , is_dark       = is_dark_
    , is_flipped    = is_flipped_
    }
      = "StoryAreaTypeSuggestedReaction"
        ++ I.cc
        [ "reaction_type" `I.p` reaction_type_
        , "total_count"   `I.p` total_count_
        , "is_dark"       `I.p` is_dark_
        , "is_flipped"    `I.p` is_flipped_
        ]
  shortShow StoryAreaTypeMessage
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = "StoryAreaTypeMessage"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        ]

instance AT.FromJSON StoryAreaType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyAreaTypeLocation"          -> parseStoryAreaTypeLocation v
      "storyAreaTypeVenue"             -> parseStoryAreaTypeVenue v
      "storyAreaTypeSuggestedReaction" -> parseStoryAreaTypeSuggestedReaction v
      "storyAreaTypeMessage"           -> parseStoryAreaTypeMessage v
      _                                -> mempty
    
    where
      parseStoryAreaTypeLocation :: A.Value -> AT.Parser StoryAreaType
      parseStoryAreaTypeLocation = A.withObject "StoryAreaTypeLocation" $ \o -> do
        location_ <- o A..:?  "location"
        pure $ StoryAreaTypeLocation
          { location = location_
          }
      parseStoryAreaTypeVenue :: A.Value -> AT.Parser StoryAreaType
      parseStoryAreaTypeVenue = A.withObject "StoryAreaTypeVenue" $ \o -> do
        venue_ <- o A..:?  "venue"
        pure $ StoryAreaTypeVenue
          { venue = venue_
          }
      parseStoryAreaTypeSuggestedReaction :: A.Value -> AT.Parser StoryAreaType
      parseStoryAreaTypeSuggestedReaction = A.withObject "StoryAreaTypeSuggestedReaction" $ \o -> do
        reaction_type_ <- o A..:?  "reaction_type"
        total_count_   <- o A..:?  "total_count"
        is_dark_       <- o A..:?  "is_dark"
        is_flipped_    <- o A..:?  "is_flipped"
        pure $ StoryAreaTypeSuggestedReaction
          { reaction_type = reaction_type_
          , total_count   = total_count_
          , is_dark       = is_dark_
          , is_flipped    = is_flipped_
          }
      parseStoryAreaTypeMessage :: A.Value -> AT.Parser StoryAreaType
      parseStoryAreaTypeMessage = A.withObject "StoryAreaTypeMessage" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        message_id_ <- o A..:?  "message_id"
        pure $ StoryAreaTypeMessage
          { chat_id    = chat_id_
          , message_id = message_id_
          }
  parseJSON _ = mempty

