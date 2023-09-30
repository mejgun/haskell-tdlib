{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StoryArea where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StoryAreaPosition as StoryAreaPosition
import qualified TD.Data.StoryAreaType as StoryAreaType
import qualified Utils as U

-- |
data StoryArea = -- | Describes a clickable rectangle area on a story media @position Position of the area @type Type of the area
  StoryArea
  { -- |
    _type :: Maybe StoryAreaType.StoryAreaType,
    -- |
    position :: Maybe StoryAreaPosition.StoryAreaPosition
  }
  deriving (Eq)

instance Show StoryArea where
  show
    StoryArea
      { _type = _type_,
        position = position_
      } =
      "StoryArea"
        ++ U.cc
          [ U.p "_type" _type_,
            U.p "position" position_
          ]

instance T.FromJSON StoryArea where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "storyArea" -> parseStoryArea v
      _ -> mempty
    where
      parseStoryArea :: A.Value -> T.Parser StoryArea
      parseStoryArea = A.withObject "StoryArea" $ \o -> do
        _type_ <- o A..:? "type"
        position_ <- o A..:? "position"
        return $ StoryArea {_type = _type_, position = position_}
  parseJSON _ = mempty

instance T.ToJSON StoryArea where
  toJSON
    StoryArea
      { _type = _type_,
        position = position_
      } =
      A.object
        [ "@type" A..= T.String "storyArea",
          "type" A..= _type_,
          "position" A..= position_
        ]
