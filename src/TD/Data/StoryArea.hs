module TD.Data.StoryArea
  (StoryArea(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoryAreaPosition as StoryAreaPosition
import qualified TD.Data.StoryAreaType as StoryAreaType

data StoryArea
  = StoryArea -- ^ Describes a clickable rectangle area on a story media
    { position :: Maybe StoryAreaPosition.StoryAreaPosition -- ^ Position of the area
    , _type    :: Maybe StoryAreaType.StoryAreaType         -- ^ Type of the area
    }
  deriving (Eq, Show)

instance I.ShortShow StoryArea where
  shortShow StoryArea
    { position = position_
    , _type    = _type_
    }
      = "StoryArea"
        ++ I.cc
        [ "position" `I.p` position_
        , "_type"    `I.p` _type_
        ]

instance AT.FromJSON StoryArea where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyArea" -> parseStoryArea v
      _           -> mempty
    
    where
      parseStoryArea :: A.Value -> AT.Parser StoryArea
      parseStoryArea = A.withObject "StoryArea" $ \o -> do
        position_ <- o A..:?  "position"
        _type_    <- o A..:?  "type"
        pure $ StoryArea
          { position = position_
          , _type    = _type_
          }
  parseJSON _ = mempty

