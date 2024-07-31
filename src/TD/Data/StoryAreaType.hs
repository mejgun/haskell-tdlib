module TD.Data.StoryAreaType
  (StoryAreaType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Location as Location
import qualified TD.Data.LocationAddress as LocationAddress
import qualified TD.Data.Venue as Venue
import qualified TD.Data.ReactionType as ReactionType
import qualified Data.Text as T

-- | Describes type of clickable area on a story media
data StoryAreaType
  = StoryAreaTypeLocation -- ^ An area pointing to a location
    { location :: Maybe Location.Location               -- ^ The location
    , address  :: Maybe LocationAddress.LocationAddress -- ^ Address of the location; may be null if unknown
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
  | StoryAreaTypeLink -- ^ An area pointing to a HTTP or tg:// link
    { url :: Maybe T.Text -- ^ HTTP or tg:// URL to be opened when the area is clicked
    }
  | StoryAreaTypeWeather -- ^ An area with information about weather
    { temperature      :: Maybe Double -- ^ Temperature, in degree Celsius
    , emoji            :: Maybe T.Text -- ^ Emoji representing the weather
    , background_color :: Maybe Int    -- ^ A color of the area background in the ARGB format
    }
  deriving (Eq, Show)

instance I.ShortShow StoryAreaType where
  shortShow StoryAreaTypeLocation
    { location = location_
    , address  = address_
    }
      = "StoryAreaTypeLocation"
        ++ I.cc
        [ "location" `I.p` location_
        , "address"  `I.p` address_
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
  shortShow StoryAreaTypeLink
    { url = url_
    }
      = "StoryAreaTypeLink"
        ++ I.cc
        [ "url" `I.p` url_
        ]
  shortShow StoryAreaTypeWeather
    { temperature      = temperature_
    , emoji            = emoji_
    , background_color = background_color_
    }
      = "StoryAreaTypeWeather"
        ++ I.cc
        [ "temperature"      `I.p` temperature_
        , "emoji"            `I.p` emoji_
        , "background_color" `I.p` background_color_
        ]

instance AT.FromJSON StoryAreaType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyAreaTypeLocation"          -> parseStoryAreaTypeLocation v
      "storyAreaTypeVenue"             -> parseStoryAreaTypeVenue v
      "storyAreaTypeSuggestedReaction" -> parseStoryAreaTypeSuggestedReaction v
      "storyAreaTypeMessage"           -> parseStoryAreaTypeMessage v
      "storyAreaTypeLink"              -> parseStoryAreaTypeLink v
      "storyAreaTypeWeather"           -> parseStoryAreaTypeWeather v
      _                                -> mempty
    
    where
      parseStoryAreaTypeLocation :: A.Value -> AT.Parser StoryAreaType
      parseStoryAreaTypeLocation = A.withObject "StoryAreaTypeLocation" $ \o -> do
        location_ <- o A..:?  "location"
        address_  <- o A..:?  "address"
        pure $ StoryAreaTypeLocation
          { location = location_
          , address  = address_
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
      parseStoryAreaTypeLink :: A.Value -> AT.Parser StoryAreaType
      parseStoryAreaTypeLink = A.withObject "StoryAreaTypeLink" $ \o -> do
        url_ <- o A..:?  "url"
        pure $ StoryAreaTypeLink
          { url = url_
          }
      parseStoryAreaTypeWeather :: A.Value -> AT.Parser StoryAreaType
      parseStoryAreaTypeWeather = A.withObject "StoryAreaTypeWeather" $ \o -> do
        temperature_      <- o A..:?  "temperature"
        emoji_            <- o A..:?  "emoji"
        background_color_ <- o A..:?  "background_color"
        pure $ StoryAreaTypeWeather
          { temperature      = temperature_
          , emoji            = emoji_
          , background_color = background_color_
          }
  parseJSON _ = mempty

