module TD.Data.BackgroundType
  (BackgroundType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BackgroundFill as BackgroundFill
import qualified Data.Text as T

-- | Describes the type of background
data BackgroundType
  = BackgroundTypeWallpaper -- ^ A wallpaper in JPEG format
    { is_blurred :: Maybe Bool -- ^ True, if the wallpaper must be downscaled to fit in 450x450 square and then box-blurred with radius 12
    , is_moving  :: Maybe Bool -- ^ True, if the background needs to be slightly moved when device is tilted
    }
  | BackgroundTypePattern -- ^ A PNG or TGV (gzipped subset of SVG with MIME type "application/x-tgwallpattern") pattern to be combined with the background fill chosen by the user
    { fill        :: Maybe BackgroundFill.BackgroundFill -- ^ Fill of the background
    , intensity   :: Maybe Int                           -- ^ Intensity of the pattern when it is shown above the filled background; 0-100
    , is_inverted :: Maybe Bool                          -- ^ True, if the background fill must be applied only to the pattern itself. All other pixels are black in this case. For dark themes only
    , is_moving   :: Maybe Bool                          -- ^ True, if the background needs to be slightly moved when device is tilted
    }
  | BackgroundTypeFill -- ^ A filled background
    { fill :: Maybe BackgroundFill.BackgroundFill -- ^ The background fill
    }
  | BackgroundTypeChatTheme -- ^ A background from a chat theme; can be used only as a chat background in channels
    { theme_name :: Maybe T.Text -- ^ Name of the chat theme
    }
  deriving (Eq, Show)

instance I.ShortShow BackgroundType where
  shortShow BackgroundTypeWallpaper
    { is_blurred = is_blurred_
    , is_moving  = is_moving_
    }
      = "BackgroundTypeWallpaper"
        ++ I.cc
        [ "is_blurred" `I.p` is_blurred_
        , "is_moving"  `I.p` is_moving_
        ]
  shortShow BackgroundTypePattern
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
  shortShow BackgroundTypeFill
    { fill = fill_
    }
      = "BackgroundTypeFill"
        ++ I.cc
        [ "fill" `I.p` fill_
        ]
  shortShow BackgroundTypeChatTheme
    { theme_name = theme_name_
    }
      = "BackgroundTypeChatTheme"
        ++ I.cc
        [ "theme_name" `I.p` theme_name_
        ]

instance AT.FromJSON BackgroundType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "backgroundTypeWallpaper" -> parseBackgroundTypeWallpaper v
      "backgroundTypePattern"   -> parseBackgroundTypePattern v
      "backgroundTypeFill"      -> parseBackgroundTypeFill v
      "backgroundTypeChatTheme" -> parseBackgroundTypeChatTheme v
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
      parseBackgroundTypeChatTheme :: A.Value -> AT.Parser BackgroundType
      parseBackgroundTypeChatTheme = A.withObject "BackgroundTypeChatTheme" $ \o -> do
        theme_name_ <- o A..:?  "theme_name"
        pure $ BackgroundTypeChatTheme
          { theme_name = theme_name_
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
  toJSON BackgroundTypeChatTheme
    { theme_name = theme_name_
    }
      = A.object
        [ "@type"      A..= AT.String "backgroundTypeChatTheme"
        , "theme_name" A..= theme_name_
        ]

