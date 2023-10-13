module TD.Data.BackgroundType
  ( BackgroundType(..)             
  , defaultBackgroundTypeWallpaper 
  , defaultBackgroundTypePattern   
  , defaultBackgroundTypeFill      
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BackgroundFill as BackgroundFill

data BackgroundType -- ^ Describes the type of a background
  = BackgroundTypeWallpaper -- ^ A wallpaper in JPEG format
    { is_blurred :: Maybe Bool -- ^ True, if the wallpaper must be downscaled to fit in 450x450 square and then box-blurred with radius 12
    , is_moving  :: Maybe Bool -- ^ True, if the background needs to be slightly moved when device is tilted
    }
  | BackgroundTypePattern -- ^ A PNG or TGV (gzipped subset of SVG with MIME type "application/x-tgwallpattern") pattern to be combined with the background fill chosen by the user
    { fill        :: Maybe BackgroundFill.BackgroundFill -- ^ Fill of the background
    , intensity   :: Maybe Int                           -- ^ Intensity of the pattern when it is shown above the filled background; 0-100.
    , is_inverted :: Maybe Bool                          -- ^ True, if the background fill must be applied only to the pattern itself. All other pixels are black in this case. For dark themes only
    , is_moving   :: Maybe Bool                          -- ^ True, if the background needs to be slightly moved when device is tilted
    }
  | BackgroundTypeFill -- ^ A filled background
    { fill :: Maybe BackgroundFill.BackgroundFill -- ^ The background fill
    }
  deriving (Eq)

instance Show BackgroundType where
  show BackgroundTypeWallpaper
    { is_blurred = is_blurred_
    , is_moving  = is_moving_
    }
      = "BackgroundTypeWallpaper"
        ++ I.cc
        [ "is_blurred" `I.p` is_blurred_
        , "is_moving"  `I.p` is_moving_
        ]
  show BackgroundTypePattern
    { fill        = fill_
    , intensity   = intensity_
    , is_inverted = is_inverted_
    , is_moving   = is_moving_
    }
      = "BackgroundTypePattern"
        ++ I.cc
        [ "fill"        `I.p` fill_
        , "intensity"   `I.p` intensity_
        , "is_inverted" `I.p` is_inverted_
        , "is_moving"   `I.p` is_moving_
        ]
  show BackgroundTypeFill
    { fill = fill_
    }
      = "BackgroundTypeFill"
        ++ I.cc
        [ "fill" `I.p` fill_
        ]

instance AT.FromJSON BackgroundType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "backgroundTypeWallpaper" -> parseBackgroundTypeWallpaper v
      "backgroundTypePattern"   -> parseBackgroundTypePattern v
      "backgroundTypeFill"      -> parseBackgroundTypeFill v
      _                         -> mempty
    
    where
      parseBackgroundTypeWallpaper :: A.Value -> AT.Parser BackgroundType
      parseBackgroundTypeWallpaper = A.withObject "BackgroundTypeWallpaper" $ \o -> do
        is_blurred_ <- o A..:?  "is_blurred"
        is_moving_  <- o A..:?  "is_moving"
        pure $ BackgroundTypeWallpaper
          { is_blurred = is_blurred_
          , is_moving  = is_moving_
          }
      parseBackgroundTypePattern :: A.Value -> AT.Parser BackgroundType
      parseBackgroundTypePattern = A.withObject "BackgroundTypePattern" $ \o -> do
        fill_        <- o A..:?  "fill"
        intensity_   <- o A..:?  "intensity"
        is_inverted_ <- o A..:?  "is_inverted"
        is_moving_   <- o A..:?  "is_moving"
        pure $ BackgroundTypePattern
          { fill        = fill_
          , intensity   = intensity_
          , is_inverted = is_inverted_
          , is_moving   = is_moving_
          }
      parseBackgroundTypeFill :: A.Value -> AT.Parser BackgroundType
      parseBackgroundTypeFill = A.withObject "BackgroundTypeFill" $ \o -> do
        fill_ <- o A..:?  "fill"
        pure $ BackgroundTypeFill
          { fill = fill_
          }
  parseJSON _ = mempty

instance AT.ToJSON BackgroundType where
  toJSON BackgroundTypeWallpaper
    { is_blurred = is_blurred_
    , is_moving  = is_moving_
    }
      = A.object
        [ "@type"      A..= AT.String "backgroundTypeWallpaper"
        , "is_blurred" A..= is_blurred_
        , "is_moving"  A..= is_moving_
        ]
  toJSON BackgroundTypePattern
    { fill        = fill_
    , intensity   = intensity_
    , is_inverted = is_inverted_
    , is_moving   = is_moving_
    }
      = A.object
        [ "@type"       A..= AT.String "backgroundTypePattern"
        , "fill"        A..= fill_
        , "intensity"   A..= intensity_
        , "is_inverted" A..= is_inverted_
        , "is_moving"   A..= is_moving_
        ]
  toJSON BackgroundTypeFill
    { fill = fill_
    }
      = A.object
        [ "@type" A..= AT.String "backgroundTypeFill"
        , "fill"  A..= fill_
        ]

defaultBackgroundTypeWallpaper :: BackgroundType
defaultBackgroundTypeWallpaper =
  BackgroundTypeWallpaper
    { is_blurred = Nothing
    , is_moving  = Nothing
    }

defaultBackgroundTypePattern :: BackgroundType
defaultBackgroundTypePattern =
  BackgroundTypePattern
    { fill        = Nothing
    , intensity   = Nothing
    , is_inverted = Nothing
    , is_moving   = Nothing
    }

defaultBackgroundTypeFill :: BackgroundType
defaultBackgroundTypeFill =
  BackgroundTypeFill
    { fill = Nothing
    }

