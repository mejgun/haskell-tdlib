module TD.Data.InputStoryAreaType
  (InputStoryAreaType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Location as Location
import qualified TD.Data.LocationAddress as LocationAddress
import qualified Data.Text as T
import qualified TD.Data.ReactionType as ReactionType

-- | Describes type of clickable area on a story media to be added
data InputStoryAreaType
  = InputStoryAreaTypeLocation -- ^ An area pointing to a location
    { location :: Maybe Location.Location               -- ^ The location
    , address  :: Maybe LocationAddress.LocationAddress -- ^ Address of the location; pass null if unknown
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
  | InputStoryAreaTypeMessage -- ^ An area pointing to a message
    { chat_id    :: Maybe Int -- ^ Identifier of the chat with the message. Currently, the chat must be a supergroup or a channel chat
    , message_id :: Maybe Int -- ^ Identifier of the message. Use messageProperties.can_be_shared_in_story to check whether the message is suitable
    }
  | InputStoryAreaTypeLink -- ^ An area pointing to a HTTP or tg:// link
    { url :: Maybe T.Text -- ^ HTTP or tg:// URL to be opened when the area is clicked
    }
  | InputStoryAreaTypeWeather -- ^ An area with information about weather
    { temperature      :: Maybe Double -- ^ Temperature, in degree Celsius
    , emoji            :: Maybe T.Text -- ^ Emoji representing the weather
    , background_color :: Maybe Int    -- ^ A color of the area background in the ARGB format
    }
  deriving (Eq, Show)

instance I.ShortShow InputStoryAreaType where
  shortShow InputStoryAreaTypeLocation
    { location = location_
    , address  = address_
    }
      = "InputStoryAreaTypeLocation"
        ++ I.cc
        [ "location" `I.p` location_
        , "address"  `I.p` address_
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
  shortShow InputStoryAreaTypeMessage
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = "InputStoryAreaTypeMessage"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        ]
  shortShow InputStoryAreaTypeLink
    { url = url_
    }
      = "InputStoryAreaTypeLink"
        ++ I.cc
        [ "url" `I.p` url_
        ]
  shortShow InputStoryAreaTypeWeather
    { temperature      = temperature_
    , emoji            = emoji_
    , background_color = background_color_
    }
      = "InputStoryAreaTypeWeather"
        ++ I.cc
        [ "temperature"      `I.p` temperature_
        , "emoji"            `I.p` emoji_
        , "background_color" `I.p` background_color_
        ]

instance AT.FromJSON InputStoryAreaType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputStoryAreaTypeLocation"          -> parseInputStoryAreaTypeLocation v
      "inputStoryAreaTypeFoundVenue"        -> parseInputStoryAreaTypeFoundVenue v
      "inputStoryAreaTypePreviousVenue"     -> parseInputStoryAreaTypePreviousVenue v
      "inputStoryAreaTypeSuggestedReaction" -> parseInputStoryAreaTypeSuggestedReaction v
      "inputStoryAreaTypeMessage"           -> parseInputStoryAreaTypeMessage v
      "inputStoryAreaTypeLink"              -> parseInputStoryAreaTypeLink v
      "inputStoryAreaTypeWeather"           -> parseInputStoryAreaTypeWeather v
      _                                     -> mempty
    
    where
      parseInputStoryAreaTypeLocation :: A.Value -> AT.Parser InputStoryAreaType
      parseInputStoryAreaTypeLocation = A.withObject "InputStoryAreaTypeLocation" $ \o -> do
        location_ <- o A..:?  "location"
        address_  <- o A..:?  "address"
        pure $ InputStoryAreaTypeLocation
          { location = location_
          , address  = address_
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
      parseInputStoryAreaTypeMessage :: A.Value -> AT.Parser InputStoryAreaType
      parseInputStoryAreaTypeMessage = A.withObject "InputStoryAreaTypeMessage" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        message_id_ <- o A..:?  "message_id"
        pure $ InputStoryAreaTypeMessage
          { chat_id    = chat_id_
          , message_id = message_id_
          }
      parseInputStoryAreaTypeLink :: A.Value -> AT.Parser InputStoryAreaType
      parseInputStoryAreaTypeLink = A.withObject "InputStoryAreaTypeLink" $ \o -> do
        url_ <- o A..:?  "url"
        pure $ InputStoryAreaTypeLink
          { url = url_
          }
      parseInputStoryAreaTypeWeather :: A.Value -> AT.Parser InputStoryAreaType
      parseInputStoryAreaTypeWeather = A.withObject "InputStoryAreaTypeWeather" $ \o -> do
        temperature_      <- o A..:?  "temperature"
        emoji_            <- o A..:?  "emoji"
        background_color_ <- o A..:?  "background_color"
        pure $ InputStoryAreaTypeWeather
          { temperature      = temperature_
          , emoji            = emoji_
          , background_color = background_color_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputStoryAreaType where
  toJSON InputStoryAreaTypeLocation
    { location = location_
    , address  = address_
    }
      = A.object
        [ "@type"    A..= AT.String "inputStoryAreaTypeLocation"
        , "location" A..= location_
        , "address"  A..= address_
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
  toJSON InputStoryAreaTypeMessage
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = A.object
        [ "@type"      A..= AT.String "inputStoryAreaTypeMessage"
        , "chat_id"    A..= chat_id_
        , "message_id" A..= message_id_
        ]
  toJSON InputStoryAreaTypeLink
    { url = url_
    }
      = A.object
        [ "@type" A..= AT.String "inputStoryAreaTypeLink"
        , "url"   A..= url_
        ]
  toJSON InputStoryAreaTypeWeather
    { temperature      = temperature_
    , emoji            = emoji_
    , background_color = background_color_
    }
      = A.object
        [ "@type"            A..= AT.String "inputStoryAreaTypeWeather"
        , "temperature"      A..= temperature_
        , "emoji"            A..= emoji_
        , "background_color" A..= background_color_
        ]

