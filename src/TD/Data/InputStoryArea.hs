{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InputStoryArea where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputStoryAreaType as InputStoryAreaType
import qualified TD.Data.StoryAreaPosition as StoryAreaPosition
import qualified Utils as U

-- |
data InputStoryArea = -- | Describes a clickable rectangle area on a story media to be added @position Position of the area @type Type of the area
  InputStoryArea
  { -- |
    _type :: Maybe InputStoryAreaType.InputStoryAreaType,
    -- |
    position :: Maybe StoryAreaPosition.StoryAreaPosition
  }
  deriving (Eq)

instance Show InputStoryArea where
  show
    InputStoryArea
      { _type = _type_,
        position = position_
      } =
      "InputStoryArea"
        ++ U.cc
          [ U.p "_type" _type_,
            U.p "position" position_
          ]

instance T.FromJSON InputStoryArea where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inputStoryArea" -> parseInputStoryArea v
      _ -> mempty
    where
      parseInputStoryArea :: A.Value -> T.Parser InputStoryArea
      parseInputStoryArea = A.withObject "InputStoryArea" $ \o -> do
        _type_ <- o A..:? "type"
        position_ <- o A..:? "position"
        return $ InputStoryArea {_type = _type_, position = position_}
  parseJSON _ = mempty

instance T.ToJSON InputStoryArea where
  toJSON
    InputStoryArea
      { _type = _type_,
        position = position_
      } =
      A.object
        [ "@type" A..= T.String "inputStoryArea",
          "type" A..= _type_,
          "position" A..= position_
        ]
