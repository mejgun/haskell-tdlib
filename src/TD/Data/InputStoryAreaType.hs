{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InputStoryAreaType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Location as Location
import qualified TD.Data.ReactionType as ReactionType
import qualified Utils as U

-- | Describes type of a clickable rectangle area on a story media to be added
data InputStoryAreaType
  = -- | An area pointing to a location @location The location
    InputStoryAreaTypeLocation
      { -- |
        location :: Maybe Location.Location
      }
  | -- | An area pointing to a venue found by the bot getOption("venue_search_bot_username")
    InputStoryAreaTypeFoundVenue
      { -- | Identifier of the inline query result
        result_id :: Maybe String,
        -- | Identifier of the inline query, used to found the venue
        query_id :: Maybe Int
      }
  | -- | An area pointing to a venue already added to the story
    InputStoryAreaTypePreviousVenue
      { -- | Identifier of the venue in the provider database
        venue_id :: Maybe String,
        -- | Provider of the venue
        venue_provider :: Maybe String
      }
  | -- | An area pointing to a suggested reaction
    InputStoryAreaTypeSuggestedReaction
      { -- | True, if reaction corner is flipped
        is_flipped :: Maybe Bool,
        -- | True, if reaction has a dark background
        is_dark :: Maybe Bool,
        -- | Type of the reaction
        reaction_type :: Maybe ReactionType.ReactionType
      }
  deriving (Eq)

instance Show InputStoryAreaType where
  show
    InputStoryAreaTypeLocation
      { location = location_
      } =
      "InputStoryAreaTypeLocation"
        ++ U.cc
          [ U.p "location" location_
          ]
  show
    InputStoryAreaTypeFoundVenue
      { result_id = result_id_,
        query_id = query_id_
      } =
      "InputStoryAreaTypeFoundVenue"
        ++ U.cc
          [ U.p "result_id" result_id_,
            U.p "query_id" query_id_
          ]
  show
    InputStoryAreaTypePreviousVenue
      { venue_id = venue_id_,
        venue_provider = venue_provider_
      } =
      "InputStoryAreaTypePreviousVenue"
        ++ U.cc
          [ U.p "venue_id" venue_id_,
            U.p "venue_provider" venue_provider_
          ]
  show
    InputStoryAreaTypeSuggestedReaction
      { is_flipped = is_flipped_,
        is_dark = is_dark_,
        reaction_type = reaction_type_
      } =
      "InputStoryAreaTypeSuggestedReaction"
        ++ U.cc
          [ U.p "is_flipped" is_flipped_,
            U.p "is_dark" is_dark_,
            U.p "reaction_type" reaction_type_
          ]

instance T.FromJSON InputStoryAreaType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inputStoryAreaTypeLocation" -> parseInputStoryAreaTypeLocation v
      "inputStoryAreaTypeFoundVenue" -> parseInputStoryAreaTypeFoundVenue v
      "inputStoryAreaTypePreviousVenue" -> parseInputStoryAreaTypePreviousVenue v
      "inputStoryAreaTypeSuggestedReaction" -> parseInputStoryAreaTypeSuggestedReaction v
      _ -> mempty
    where
      parseInputStoryAreaTypeLocation :: A.Value -> T.Parser InputStoryAreaType
      parseInputStoryAreaTypeLocation = A.withObject "InputStoryAreaTypeLocation" $ \o -> do
        location_ <- o A..:? "location"
        return $ InputStoryAreaTypeLocation {location = location_}

      parseInputStoryAreaTypeFoundVenue :: A.Value -> T.Parser InputStoryAreaType
      parseInputStoryAreaTypeFoundVenue = A.withObject "InputStoryAreaTypeFoundVenue" $ \o -> do
        result_id_ <- o A..:? "result_id"
        query_id_ <- U.rm <$> (o A..:? "query_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ InputStoryAreaTypeFoundVenue {result_id = result_id_, query_id = query_id_}

      parseInputStoryAreaTypePreviousVenue :: A.Value -> T.Parser InputStoryAreaType
      parseInputStoryAreaTypePreviousVenue = A.withObject "InputStoryAreaTypePreviousVenue" $ \o -> do
        venue_id_ <- o A..:? "venue_id"
        venue_provider_ <- o A..:? "venue_provider"
        return $ InputStoryAreaTypePreviousVenue {venue_id = venue_id_, venue_provider = venue_provider_}

      parseInputStoryAreaTypeSuggestedReaction :: A.Value -> T.Parser InputStoryAreaType
      parseInputStoryAreaTypeSuggestedReaction = A.withObject "InputStoryAreaTypeSuggestedReaction" $ \o -> do
        is_flipped_ <- o A..:? "is_flipped"
        is_dark_ <- o A..:? "is_dark"
        reaction_type_ <- o A..:? "reaction_type"
        return $ InputStoryAreaTypeSuggestedReaction {is_flipped = is_flipped_, is_dark = is_dark_, reaction_type = reaction_type_}
  parseJSON _ = mempty

instance T.ToJSON InputStoryAreaType where
  toJSON
    InputStoryAreaTypeLocation
      { location = location_
      } =
      A.object
        [ "@type" A..= T.String "inputStoryAreaTypeLocation",
          "location" A..= location_
        ]
  toJSON
    InputStoryAreaTypeFoundVenue
      { result_id = result_id_,
        query_id = query_id_
      } =
      A.object
        [ "@type" A..= T.String "inputStoryAreaTypeFoundVenue",
          "result_id" A..= result_id_,
          "query_id" A..= U.toS query_id_
        ]
  toJSON
    InputStoryAreaTypePreviousVenue
      { venue_id = venue_id_,
        venue_provider = venue_provider_
      } =
      A.object
        [ "@type" A..= T.String "inputStoryAreaTypePreviousVenue",
          "venue_id" A..= venue_id_,
          "venue_provider" A..= venue_provider_
        ]
  toJSON
    InputStoryAreaTypeSuggestedReaction
      { is_flipped = is_flipped_,
        is_dark = is_dark_,
        reaction_type = reaction_type_
      } =
      A.object
        [ "@type" A..= T.String "inputStoryAreaTypeSuggestedReaction",
          "is_flipped" A..= is_flipped_,
          "is_dark" A..= is_dark_,
          "reaction_type" A..= reaction_type_
        ]
