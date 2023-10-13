module TD.Data.Minithumbnail
  ( Minithumbnail(..)    
  , defaultMinithumbnail 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS

data Minithumbnail
  = Minithumbnail -- ^ Thumbnail image of a very poor quality and low resolution
    { width  :: Maybe Int           -- ^ Thumbnail width, usually doesn't exceed 40
    , height :: Maybe Int           -- ^ Thumbnail height, usually doesn't exceed 40
    , _data  :: Maybe BS.ByteString -- ^ The thumbnail in JPEG format
    }
  deriving (Eq)

instance Show Minithumbnail where
  show Minithumbnail
    { width  = width_
    , height = height_
    , _data  = _data_
    }
      = "Minithumbnail"
        ++ I.cc
        [ "width"  `I.p` width_
        , "height" `I.p` height_
        , "_data"  `I.p` _data_
        ]

instance AT.FromJSON Minithumbnail where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "minithumbnail" -> parseMinithumbnail v
      _               -> mempty
    
    where
      parseMinithumbnail :: A.Value -> AT.Parser Minithumbnail
      parseMinithumbnail = A.withObject "Minithumbnail" $ \o -> do
        width_  <- o A..:?                       "width"
        height_ <- o A..:?                       "height"
        _data_  <- fmap I.readBytes <$> o A..:?  "data"
        pure $ Minithumbnail
          { width  = width_
          , height = height_
          , _data  = _data_
          }
  parseJSON _ = mempty

instance AT.ToJSON Minithumbnail where
  toJSON Minithumbnail
    { width  = width_
    , height = height_
    , _data  = _data_
    }
      = A.object
        [ "@type"  A..= AT.String "minithumbnail"
        , "width"  A..= width_
        , "height" A..= height_
        , "data"   A..= fmap I.writeBytes  _data_
        ]

defaultMinithumbnail :: Minithumbnail
defaultMinithumbnail =
  Minithumbnail
    { width  = Nothing
    , height = Nothing
    , _data  = Nothing
    }

