module TD.Data.InputSticker
  ( InputSticker(..)    
  , defaultInputSticker 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.InputThumbnail as InputThumbnail

data InputSticker
  = InputSticker -- ^ A sticker to be sent
    { sticker   :: Maybe InputFile.InputFile           -- ^ Sticker to be sent
    , thumbnail :: Maybe InputThumbnail.InputThumbnail -- ^ Sticker thumbnail; pass null to skip thumbnail uploading
    , width     :: Maybe Int                           -- ^ Sticker width
    , height    :: Maybe Int                           -- ^ Sticker height
    }
  deriving (Eq, Show)

instance I.ShortShow InputSticker where
  shortShow InputSticker
    { sticker   = sticker_
    , thumbnail = thumbnail_
    , width     = width_
    , height    = height_
    }
      = "InputSticker"
        ++ I.cc
        [ "sticker"   `I.p` sticker_
        , "thumbnail" `I.p` thumbnail_
        , "width"     `I.p` width_
        , "height"    `I.p` height_
        ]

instance AT.FromJSON InputSticker where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputSticker" -> parseInputSticker v
      _              -> mempty
    
    where
      parseInputSticker :: A.Value -> AT.Parser InputSticker
      parseInputSticker = A.withObject "InputSticker" $ \o -> do
        sticker_   <- o A..:?  "sticker"
        thumbnail_ <- o A..:?  "thumbnail"
        width_     <- o A..:?  "width"
        height_    <- o A..:?  "height"
        pure $ InputSticker
          { sticker   = sticker_
          , thumbnail = thumbnail_
          , width     = width_
          , height    = height_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputSticker where
  toJSON InputSticker
    { sticker   = sticker_
    , thumbnail = thumbnail_
    , width     = width_
    , height    = height_
    }
      = A.object
        [ "@type"     A..= AT.String "inputSticker"
        , "sticker"   A..= sticker_
        , "thumbnail" A..= thumbnail_
        , "width"     A..= width_
        , "height"    A..= height_
        ]

defaultInputSticker :: InputSticker
defaultInputSticker =
  InputSticker
    { sticker   = Nothing
    , thumbnail = Nothing
    , width     = Nothing
    , height    = Nothing
    }

