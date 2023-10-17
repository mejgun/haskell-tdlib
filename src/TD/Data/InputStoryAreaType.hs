module TD.Data.InputStoryAreaType
  (InputStoryAreaType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Location as Location
import qualified Data.Text as T
import qualified TD.Data.ReactionType as ReactionType

-- | Describes type of a clickable rectangle area on a story media to be added
data InputStoryAreaType
  = InputStoryAreaTypeLocation -- ^ An area pointing to a location
    { location :: Maybe Location.Location -- ^ The location
    }
  | InputStoryAreaTypeFoundVenue -- ^ An area pointing to a venue found by the bot getOption("venue_search_bot_username")
    { query_id  :: Maybe Int    -- ^ Identifier of the inline query, used to found the venue
    , result_id :: Maybe T.Text -- ^ Identifier of the inline query result
    }
  | InputStoryAreaTypePreviousVenue -- ^ An area pointing to a venue already added to the story
    { venue_provider :: Maybe T.Text -- ^ Provider of the venue
    , venue_id       :: Maybe T.Text -- ^ Identifier of the venue in the provider database
    }
  | InputStoryAreaTypeSuggestedReaction -- ^ An area pointing to a suggested reaction
    { reaction_type :: Maybe ReactionType.ReactionType -- ^ Type of the reaction
    , is_dark       :: Maybe Bool                      -- ^ True, if reaction has a dark background
    , is_flipped    :: Maybe Bool                      -- ^ True, if reaction corner is flipped
    }
  deriving (Eq, Show)

instance I.ShortShow InputStoryAreaType where
  shortShow InputStoryAreaTypeLocation
    { location = location_
    }
      = "InputStoryAreaTypeLocation"
        ++ I.cc
        [ "location" `I.p` location_
        ]
  shortShow InputStoryAreaTypeFoundVenue
    { query_id  = query_id_
    , result_id = result_id_
    }
      = "InputStoryAreaTypeFoundVenue"
        ++ I.cc
        [ "query_id"  `I.p` query_id_
        , "result_id" `I.p` result_id_
        ]
  shortShow InputStoryAreaTypePreviousVenue
    { venue_provider = venue_provider_
    , venue_id       = venue_id_
    }
      = "InputStoryAreaTypePreviousVenue"
        ++ I.cc
        [ "venue_provider" `I.p` venue_provider_
        , "venue_id"       `I.p` venue_id_
        ]
  shortShow InputStoryAreaTypeSuggestedReaction
    { reaction_type = reaction_type_
    , is_dark       = is_dark_
    , is_flipped    = is_flipped_
    }
      = "InputStoryAreaTypeSuggestedReaction"
        ++ I.cc
        [ "reaction_type" `I.p` reaction_type_
        , "is_dark"       `I.p` is_dark_
        , "is_flipped"    `I.p` is_flipped_
        ]

instance AT.FromJSON InputStoryAreaType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputStoryAreaTypeLocation"          -> parseInputStoryAreaTypeLocation v
      "inputStoryAreaTypeFoundVenue"        -> parseInputStoryAreaTypeFoundVenue v
      "inputStoryAreaTypePreviousVenue"     -> parseInputStoryAreaTypePreviousVenue v
      "inputStoryAreaTypeSuggestedReaction" -> parseInputStoryAreaTypeSuggestedReaction v
      _                                     -> mempty
    
    where
      parseInputStoryAreaTypeLocation :: A.Value -> AT.Parser InputStoryAreaType
      parseInputStoryAreaTypeLocation = A.withObject "InputStoryAreaTypeLocation" $ \o -> do
        location_ <- o A..:?  "location"
        pure $ InputStoryAreaTypeLocation
          { location = location_
          }
      parseInputStoryAreaTypeFoundVenue :: A.Value -> AT.Parser InputStoryAreaType
      parseInputStoryAreaTypeFoundVenue = A.withObject "InputStoryAreaTypeFoundVenue" $ \o -> do
        query_id_  <- fmap I.readInt64 <$> o A..:?  "query_id"
        result_id_ <- o A..:?                       "result_id"
        pure $ InputStoryAreaTypeFoundVenue
          { query_id  = query_id_
          , result_id = result_id_
          }
      parseInputStoryAreaTypePreviousVenue :: A.Value -> AT.Parser InputStoryAreaType
      parseInputStoryAreaTypePreviousVenue = A.withObject "InputStoryAreaTypePreviousVenue" $ \o -> do
        venue_provider_ <- o A..:?  "venue_provider"
        venue_id_       <- o A..:?  "venue_id"
        pure $ InputStoryAreaTypePreviousVenue
          { venue_provider = venue_provider_
          , venue_id       = venue_id_
          }
      parseInputStoryAreaTypeSuggestedReaction :: A.Value -> AT.Parser InputStoryAreaType
      parseInputStoryAreaTypeSuggestedReaction = A.withObject "InputStoryAreaTypeSuggestedReaction" $ \o -> do
        reaction_type_ <- o A..:?  "reaction_type"
        is_dark_       <- o A..:?  "is_dark"
        is_flipped_    <- o A..:?  "is_flipped"
        pure $ InputStoryAreaTypeSuggestedReaction
          { reaction_type = reaction_type_
          , is_dark       = is_dark_
          , is_flipped    = is_flipped_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputStoryAreaType where
  toJSON InputStoryAreaTypeLocation
    { location = location_
    }
      = A.object
        [ "@type"    A..= AT.String "inputStoryAreaTypeLocation"
        , "location" A..= location_
        ]
  toJSON InputStoryAreaTypeFoundVenue
    { query_id  = query_id_
    , result_id = result_id_
    }
      = A.object
        [ "@type"     A..= AT.String "inputStoryAreaTypeFoundVenue"
        , "query_id"  A..= fmap I.writeInt64  query_id_
        , "result_id" A..= result_id_
        ]
  toJSON InputStoryAreaTypePreviousVenue
    { venue_provider = venue_provider_
    , venue_id       = venue_id_
    }
      = A.object
        [ "@type"          A..= AT.String "inputStoryAreaTypePreviousVenue"
        , "venue_provider" A..= venue_provider_
        , "venue_id"       A..= venue_id_
        ]
  toJSON InputStoryAreaTypeSuggestedReaction
    { reaction_type = reaction_type_
    , is_dark       = is_dark_
    , is_flipped    = is_flipped_
    }
      = A.object
        [ "@type"         A..= AT.String "inputStoryAreaTypeSuggestedReaction"
        , "reaction_type" A..= reaction_type_
        , "is_dark"       A..= is_dark_
        , "is_flipped"    A..= is_flipped_
        ]

