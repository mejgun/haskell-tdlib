module TD.Data.InputAnimation
  ( InputAnimation(..)    
  , defaultInputAnimation 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.InputThumbnail as InputThumbnail

data InputAnimation
  = InputAnimation -- ^ An animation to be sent
    { animation              :: Maybe InputFile.InputFile           -- ^ Animation file to be sent
    , thumbnail              :: Maybe InputThumbnail.InputThumbnail -- ^ Animation thumbnail; pass null to skip thumbnail uploading
    , added_sticker_file_ids :: Maybe [Int]                         -- ^ File identifiers of the stickers added to the animation, if applicable
    , duration               :: Maybe Int                           -- ^ Duration of the animation, in seconds; may be replaced by the server
    , width                  :: Maybe Int                           -- ^ Width of the animation; may be replaced by the server
    , height                 :: Maybe Int                           -- ^ Height of the animation; may be replaced by the server
    }
  deriving (Eq, Show)

instance I.ShortShow InputAnimation where
  shortShow InputAnimation
    { animation              = animation_
    , thumbnail              = thumbnail_
    , added_sticker_file_ids = added_sticker_file_ids_
    , duration               = duration_
    , width                  = width_
    , height                 = height_
    }
      = "InputAnimation"
        ++ I.cc
        [ "animation"              `I.p` animation_
        , "thumbnail"              `I.p` thumbnail_
        , "added_sticker_file_ids" `I.p` added_sticker_file_ids_
        , "duration"               `I.p` duration_
        , "width"                  `I.p` width_
        , "height"                 `I.p` height_
        ]

instance AT.FromJSON InputAnimation where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputAnimation" -> parseInputAnimation v
      _                -> mempty
    
    where
      parseInputAnimation :: A.Value -> AT.Parser InputAnimation
      parseInputAnimation = A.withObject "InputAnimation" $ \o -> do
        animation_              <- o A..:?  "animation"
        thumbnail_              <- o A..:?  "thumbnail"
        added_sticker_file_ids_ <- o A..:?  "added_sticker_file_ids"
        duration_               <- o A..:?  "duration"
        width_                  <- o A..:?  "width"
        height_                 <- o A..:?  "height"
        pure $ InputAnimation
          { animation              = animation_
          , thumbnail              = thumbnail_
          , added_sticker_file_ids = added_sticker_file_ids_
          , duration               = duration_
          , width                  = width_
          , height                 = height_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputAnimation where
  toJSON InputAnimation
    { animation              = animation_
    , thumbnail              = thumbnail_
    , added_sticker_file_ids = added_sticker_file_ids_
    , duration               = duration_
    , width                  = width_
    , height                 = height_
    }
      = A.object
        [ "@type"                  A..= AT.String "inputAnimation"
        , "animation"              A..= animation_
        , "thumbnail"              A..= thumbnail_
        , "added_sticker_file_ids" A..= added_sticker_file_ids_
        , "duration"               A..= duration_
        , "width"                  A..= width_
        , "height"                 A..= height_
        ]

defaultInputAnimation :: InputAnimation
defaultInputAnimation =
  InputAnimation
    { animation              = Nothing
    , thumbnail              = Nothing
    , added_sticker_file_ids = Nothing
    , duration               = Nothing
    , width                  = Nothing
    , height                 = Nothing
    }

