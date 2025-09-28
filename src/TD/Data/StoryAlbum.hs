module TD.Data.StoryAlbum
  (StoryAlbum(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Video as Video

data StoryAlbum
  = StoryAlbum -- ^ Describes album of stories
    { _id        :: Maybe Int         -- ^ Unique identifier of the album
    , name       :: Maybe T.Text      -- ^ Name of the album
    , photo_icon :: Maybe Photo.Photo -- ^ Icon of the album; may be null if none
    , video_icon :: Maybe Video.Video -- ^ Video icon of the album; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow StoryAlbum where
  shortShow StoryAlbum
    { _id        = _id_
    , name       = name_
    , photo_icon = photo_icon_
    , video_icon = video_icon_
    }
      = "StoryAlbum"
        ++ I.cc
        [ "_id"        `I.p` _id_
        , "name"       `I.p` name_
        , "photo_icon" `I.p` photo_icon_
        , "video_icon" `I.p` video_icon_
        ]

instance AT.FromJSON StoryAlbum where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyAlbum" -> parseStoryAlbum v
      _            -> mempty
    
    where
      parseStoryAlbum :: A.Value -> AT.Parser StoryAlbum
      parseStoryAlbum = A.withObject "StoryAlbum" $ \o -> do
        _id_        <- o A..:?  "id"
        name_       <- o A..:?  "name"
        photo_icon_ <- o A..:?  "photo_icon"
        video_icon_ <- o A..:?  "video_icon"
        pure $ StoryAlbum
          { _id        = _id_
          , name       = name_
          , photo_icon = photo_icon_
          , video_icon = video_icon_
          }
  parseJSON _ = mempty

