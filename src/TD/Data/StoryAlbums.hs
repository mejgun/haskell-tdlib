module TD.Data.StoryAlbums
  (StoryAlbums(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoryAlbum as StoryAlbum

data StoryAlbums
  = StoryAlbums -- ^ Represents a list of story albums
    { albums :: Maybe [StoryAlbum.StoryAlbum] -- ^ List of story albums
    }
  deriving (Eq, Show)

instance I.ShortShow StoryAlbums where
  shortShow StoryAlbums
    { albums = albums_
    }
      = "StoryAlbums"
        ++ I.cc
        [ "albums" `I.p` albums_
        ]

instance AT.FromJSON StoryAlbums where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyAlbums" -> parseStoryAlbums v
      _             -> mempty
    
    where
      parseStoryAlbums :: A.Value -> AT.Parser StoryAlbums
      parseStoryAlbums = A.withObject "StoryAlbums" $ \o -> do
        albums_ <- o A..:?  "albums"
        pure $ StoryAlbums
          { albums = albums_
          }
  parseJSON _ = mempty

