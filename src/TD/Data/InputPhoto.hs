module TD.Data.InputPhoto
  ( InputPhoto(..)    
  , defaultInputPhoto 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.InputThumbnail as InputThumbnail

data InputPhoto
  = InputPhoto -- ^ A photo to be sent
    { photo                  :: Maybe InputFile.InputFile           -- ^ Photo to be sent. The photo must be at most 10 MB in size. The photo's width and height must not exceed 10000 in total. Width and height ratio must be at most 20
    , thumbnail              :: Maybe InputThumbnail.InputThumbnail -- ^ Photo thumbnail; pass null to skip thumbnail uploading. The thumbnail is sent to the other party only in secret chats
    , video                  :: Maybe InputFile.InputFile           -- ^ Video of the live photo; not supported in secret chats; pass null if the photo isn't a live photo
    , added_sticker_file_ids :: Maybe [Int]                         -- ^ File identifiers of the stickers added to the photo, if applicable
    , width                  :: Maybe Int                           -- ^ Photo width; may be replaced by the server
    , height                 :: Maybe Int                           -- ^ Photo height; may be replaced by the server
    }
  deriving (Eq, Show)

instance I.ShortShow InputPhoto where
  shortShow InputPhoto
    { photo                  = photo_
    , thumbnail              = thumbnail_
    , video                  = video_
    , added_sticker_file_ids = added_sticker_file_ids_
    , width                  = width_
    , height                 = height_
    }
      = "InputPhoto"
        ++ I.cc
        [ "photo"                  `I.p` photo_
        , "thumbnail"              `I.p` thumbnail_
        , "video"                  `I.p` video_
        , "added_sticker_file_ids" `I.p` added_sticker_file_ids_
        , "width"                  `I.p` width_
        , "height"                 `I.p` height_
        ]

instance AT.FromJSON InputPhoto where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputPhoto" -> parseInputPhoto v
      _            -> mempty
    
    where
      parseInputPhoto :: A.Value -> AT.Parser InputPhoto
      parseInputPhoto = A.withObject "InputPhoto" $ \o -> do
        photo_                  <- o A..:?  "photo"
        thumbnail_              <- o A..:?  "thumbnail"
        video_                  <- o A..:?  "video"
        added_sticker_file_ids_ <- o A..:?  "added_sticker_file_ids"
        width_                  <- o A..:?  "width"
        height_                 <- o A..:?  "height"
        pure $ InputPhoto
          { photo                  = photo_
          , thumbnail              = thumbnail_
          , video                  = video_
          , added_sticker_file_ids = added_sticker_file_ids_
          , width                  = width_
          , height                 = height_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputPhoto where
  toJSON InputPhoto
    { photo                  = photo_
    , thumbnail              = thumbnail_
    , video                  = video_
    , added_sticker_file_ids = added_sticker_file_ids_
    , width                  = width_
    , height                 = height_
    }
      = A.object
        [ "@type"                  A..= AT.String "inputPhoto"
        , "photo"                  A..= photo_
        , "thumbnail"              A..= thumbnail_
        , "video"                  A..= video_
        , "added_sticker_file_ids" A..= added_sticker_file_ids_
        , "width"                  A..= width_
        , "height"                 A..= height_
        ]

defaultInputPhoto :: InputPhoto
defaultInputPhoto =
  InputPhoto
    { photo                  = Nothing
    , thumbnail              = Nothing
    , video                  = Nothing
    , added_sticker_file_ids = Nothing
    , width                  = Nothing
    , height                 = Nothing
    }

