module TD.Data.InputStoryArea
  ( InputStoryArea(..)    
  , defaultInputStoryArea 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoryAreaPosition as StoryAreaPosition
import qualified TD.Data.InputStoryAreaType as InputStoryAreaType

data InputStoryArea
  = InputStoryArea -- ^ Describes a clickable rectangle area on a story media to be added
    { position :: Maybe StoryAreaPosition.StoryAreaPosition   -- ^ Position of the area
    , _type    :: Maybe InputStoryAreaType.InputStoryAreaType -- ^ Type of the area
    }
  deriving (Eq, Show)

instance I.ShortShow InputStoryArea where
  shortShow InputStoryArea
    { position = position_
    , _type    = _type_
    }
      = "InputStoryArea"
        ++ I.cc
        [ "position" `I.p` position_
        , "_type"    `I.p` _type_
        ]

instance AT.FromJSON InputStoryArea where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputStoryArea" -> parseInputStoryArea v
      _                -> mempty
    
    where
      parseInputStoryArea :: A.Value -> AT.Parser InputStoryArea
      parseInputStoryArea = A.withObject "InputStoryArea" $ \o -> do
        position_ <- o A..:?  "position"
        _type_    <- o A..:?  "type"
        pure $ InputStoryArea
          { position = position_
          , _type    = _type_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputStoryArea where
  toJSON InputStoryArea
    { position = position_
    , _type    = _type_
    }
      = A.object
        [ "@type"    A..= AT.String "inputStoryArea"
        , "position" A..= position_
        , "type"     A..= _type_
        ]

defaultInputStoryArea :: InputStoryArea
defaultInputStoryArea =
  InputStoryArea
    { position = Nothing
    , _type    = Nothing
    }

