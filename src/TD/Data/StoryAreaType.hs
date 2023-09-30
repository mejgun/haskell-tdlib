{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StoryAreaType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Location as Location
import qualified TD.Data.ReactionType as ReactionType
import qualified TD.Data.Venue as Venue
import qualified Utils as U

-- | Describes type of a clickable rectangle area on a story media
data StoryAreaType
  = -- | An area pointing to a location @location The location
    StoryAreaTypeLocation
      { -- |
        location :: Maybe Location.Location
      }
  | -- | An area pointing to a venue @venue Information about the venue
    StoryAreaTypeVenue
      { -- |
        venue :: Maybe Venue.Venue
      }
  | -- | An area pointing to a suggested reaction. App needs to show a clickable reaction on the area and call setStoryReaction when the are is clicked
    StoryAreaTypeSuggestedReaction
      { -- | True, if reaction corner is flipped
        is_flipped :: Maybe Bool,
        -- | True, if reaction has a dark background
        is_dark :: Maybe Bool,
        -- | Number of times the reaction was added
        total_count :: Maybe Int,
        -- | Type of the reaction
        reaction_type :: Maybe ReactionType.ReactionType
      }
  deriving (Eq)

instance Show StoryAreaType where
  show
    StoryAreaTypeLocation
      { location = location_
      } =
      "StoryAreaTypeLocation"
        ++ U.cc
          [ U.p "location" location_
          ]
  show
    StoryAreaTypeVenue
      { venue = venue_
      } =
      "StoryAreaTypeVenue"
        ++ U.cc
          [ U.p "venue" venue_
          ]
  show
    StoryAreaTypeSuggestedReaction
      { is_flipped = is_flipped_,
        is_dark = is_dark_,
        total_count = total_count_,
        reaction_type = reaction_type_
      } =
      "StoryAreaTypeSuggestedReaction"
        ++ U.cc
          [ U.p "is_flipped" is_flipped_,
            U.p "is_dark" is_dark_,
            U.p "total_count" total_count_,
            U.p "reaction_type" reaction_type_
          ]

instance T.FromJSON StoryAreaType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "storyAreaTypeLocation" -> parseStoryAreaTypeLocation v
      "storyAreaTypeVenue" -> parseStoryAreaTypeVenue v
      "storyAreaTypeSuggestedReaction" -> parseStoryAreaTypeSuggestedReaction v
      _ -> mempty
    where
      parseStoryAreaTypeLocation :: A.Value -> T.Parser StoryAreaType
      parseStoryAreaTypeLocation = A.withObject "StoryAreaTypeLocation" $ \o -> do
        location_ <- o A..:? "location"
        return $ StoryAreaTypeLocation {location = location_}

      parseStoryAreaTypeVenue :: A.Value -> T.Parser StoryAreaType
      parseStoryAreaTypeVenue = A.withObject "StoryAreaTypeVenue" $ \o -> do
        venue_ <- o A..:? "venue"
        return $ StoryAreaTypeVenue {venue = venue_}

      parseStoryAreaTypeSuggestedReaction :: A.Value -> T.Parser StoryAreaType
      parseStoryAreaTypeSuggestedReaction = A.withObject "StoryAreaTypeSuggestedReaction" $ \o -> do
        is_flipped_ <- o A..:? "is_flipped"
        is_dark_ <- o A..:? "is_dark"
        total_count_ <- o A..:? "total_count"
        reaction_type_ <- o A..:? "reaction_type"
        return $ StoryAreaTypeSuggestedReaction {is_flipped = is_flipped_, is_dark = is_dark_, total_count = total_count_, reaction_type = reaction_type_}
  parseJSON _ = mempty

instance T.ToJSON StoryAreaType where
  toJSON
    StoryAreaTypeLocation
      { location = location_
      } =
      A.object
        [ "@type" A..= T.String "storyAreaTypeLocation",
          "location" A..= location_
        ]
  toJSON
    StoryAreaTypeVenue
      { venue = venue_
      } =
      A.object
        [ "@type" A..= T.String "storyAreaTypeVenue",
          "venue" A..= venue_
        ]
  toJSON
    StoryAreaTypeSuggestedReaction
      { is_flipped = is_flipped_,
        is_dark = is_dark_,
        total_count = total_count_,
        reaction_type = reaction_type_
      } =
      A.object
        [ "@type" A..= T.String "storyAreaTypeSuggestedReaction",
          "is_flipped" A..= is_flipped_,
          "is_dark" A..= is_dark_,
          "total_count" A..= total_count_,
          "reaction_type" A..= reaction_type_
        ]
