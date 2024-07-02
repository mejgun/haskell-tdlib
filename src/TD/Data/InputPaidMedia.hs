module TD.Data.InputPaidMedia
  ( InputPaidMedia(..)    
  , defaultInputPaidMedia 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputPaidMediaType as InputPaidMediaType
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.InputThumbnail as InputThumbnail

data InputPaidMedia
  = InputPaidMedia -- ^ Describes a paid media to be sent
    { _type                  :: Maybe InputPaidMediaType.InputPaidMediaType -- ^ Type of the media
    , media                  :: Maybe InputFile.InputFile                   -- ^ Photo or video to be sent
    , thumbnail              :: Maybe InputThumbnail.InputThumbnail         -- ^ Media thumbnail; pass null to skip thumbnail uploading
    , added_sticker_file_ids :: Maybe [Int]                                 -- ^ File identifiers of the stickers added to the media, if applicable
    , width                  :: Maybe Int                                   -- ^ Media width
    , height                 :: Maybe Int                                   -- ^ Media height
    }
  deriving (Eq, Show)

instance I.ShortShow InputPaidMedia where
  shortShow InputPaidMedia
    { _type                  = _type_
    , media                  = media_
    , thumbnail              = thumbnail_
    , added_sticker_file_ids = added_sticker_file_ids_
    , width                  = width_
    , height                 = height_
    }
      = "InputPaidMedia"
        ++ I.cc
        [ "_type"                  `I.p` _type_
        , "media"                  `I.p` media_
        , "thumbnail"              `I.p` thumbnail_
        , "added_sticker_file_ids" `I.p` added_sticker_file_ids_
        , "width"                  `I.p` width_
        , "height"                 `I.p` height_
        ]

instance AT.FromJSON InputPaidMedia where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputPaidMedia" -> parseInputPaidMedia v
      _                -> mempty
    
    where
      parseInputPaidMedia :: A.Value -> AT.Parser InputPaidMedia
      parseInputPaidMedia = A.withObject "InputPaidMedia" $ \o -> do
        _type_                  <- o A..:?  "type"
        media_                  <- o A..:?  "media"
        thumbnail_              <- o A..:?  "thumbnail"
        added_sticker_file_ids_ <- o A..:?  "added_sticker_file_ids"
        width_                  <- o A..:?  "width"
        height_                 <- o A..:?  "height"
        pure $ InputPaidMedia
          { _type                  = _type_
          , media                  = media_
          , thumbnail              = thumbnail_
          , added_sticker_file_ids = added_sticker_file_ids_
          , width                  = width_
          , height                 = height_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputPaidMedia where
  toJSON InputPaidMedia
    { _type                  = _type_
    , media                  = media_
    , thumbnail              = thumbnail_
    , added_sticker_file_ids = added_sticker_file_ids_
    , width                  = width_
    , height                 = height_
    }
      = A.object
        [ "@type"                  A..= AT.String "inputPaidMedia"
        , "type"                   A..= _type_
        , "media"                  A..= media_
        , "thumbnail"              A..= thumbnail_
        , "added_sticker_file_ids" A..= added_sticker_file_ids_
        , "width"                  A..= width_
        , "height"                 A..= height_
        ]

defaultInputPaidMedia :: InputPaidMedia
defaultInputPaidMedia =
  InputPaidMedia
    { _type                  = Nothing
    , media                  = Nothing
    , thumbnail              = Nothing
    , added_sticker_file_ids = Nothing
    , width                  = Nothing
    , height                 = Nothing
    }

