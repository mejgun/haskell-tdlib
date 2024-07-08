module TD.Data.LinkPreviewAlbumMedia
  (LinkPreviewAlbumMedia(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Video as Video

-- | Describes a media from a link preview album
data LinkPreviewAlbumMedia
  = LinkPreviewAlbumMediaPhoto -- ^ The media is a photo
    { photo :: Maybe Photo.Photo -- ^ Photo description
    }
  | LinkPreviewAlbumMediaVideo -- ^ The media is a video
    { video :: Maybe Video.Video -- ^ Video description
    }
  deriving (Eq, Show)

instance I.ShortShow LinkPreviewAlbumMedia where
  shortShow LinkPreviewAlbumMediaPhoto
    { photo = photo_
    }
      = "LinkPreviewAlbumMediaPhoto"
        ++ I.cc
        [ "photo" `I.p` photo_
        ]
  shortShow LinkPreviewAlbumMediaVideo
    { video = video_
    }
      = "LinkPreviewAlbumMediaVideo"
        ++ I.cc
        [ "video" `I.p` video_
        ]

instance AT.FromJSON LinkPreviewAlbumMedia where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "linkPreviewAlbumMediaPhoto" -> parseLinkPreviewAlbumMediaPhoto v
      "linkPreviewAlbumMediaVideo" -> parseLinkPreviewAlbumMediaVideo v
      _                            -> mempty
    
    where
      parseLinkPreviewAlbumMediaPhoto :: A.Value -> AT.Parser LinkPreviewAlbumMedia
      parseLinkPreviewAlbumMediaPhoto = A.withObject "LinkPreviewAlbumMediaPhoto" $ \o -> do
        photo_ <- o A..:?  "photo"
        pure $ LinkPreviewAlbumMediaPhoto
          { photo = photo_
          }
      parseLinkPreviewAlbumMediaVideo :: A.Value -> AT.Parser LinkPreviewAlbumMedia
      parseLinkPreviewAlbumMediaVideo = A.withObject "LinkPreviewAlbumMediaVideo" $ \o -> do
        video_ <- o A..:?  "video"
        pure $ LinkPreviewAlbumMediaVideo
          { video = video_
          }
  parseJSON _ = mempty

