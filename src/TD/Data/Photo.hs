module TD.Data.Photo
  (Photo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.PhotoSize as PhotoSize

data Photo
  = Photo -- ^ Describes a photo
    { has_stickers  :: Maybe Bool                        -- ^ True, if stickers were added to the photo. The list of corresponding sticker sets can be received using getAttachedStickerSets
    , minithumbnail :: Maybe Minithumbnail.Minithumbnail -- ^ Photo minithumbnail; may be null
    , sizes         :: Maybe [PhotoSize.PhotoSize]       -- ^ Available variants of the photo, in different sizes
    }
  deriving (Eq, Show)

instance I.ShortShow Photo where
  shortShow Photo
    { has_stickers  = has_stickers_
    , minithumbnail = minithumbnail_
    , sizes         = sizes_
    }
      = "Photo"
        ++ I.cc
        [ "has_stickers"  `I.p` has_stickers_
        , "minithumbnail" `I.p` minithumbnail_
        , "sizes"         `I.p` sizes_
        ]

instance AT.FromJSON Photo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "photo" -> parsePhoto v
      _       -> mempty
    
    where
      parsePhoto :: A.Value -> AT.Parser Photo
      parsePhoto = A.withObject "Photo" $ \o -> do
        has_stickers_  <- o A..:?  "has_stickers"
        minithumbnail_ <- o A..:?  "minithumbnail"
        sizes_         <- o A..:?  "sizes"
        pure $ Photo
          { has_stickers  = has_stickers_
          , minithumbnail = minithumbnail_
          , sizes         = sizes_
          }
  parseJSON _ = mempty

