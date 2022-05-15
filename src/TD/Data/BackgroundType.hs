{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.BackgroundType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BackgroundFill as BackgroundFill
import qualified Utils as U

-- | Describes the type of a background
data BackgroundType
  = -- | A wallpaper in JPEG format
    BackgroundTypeWallpaper
      { -- | True, if the background needs to be slightly moved when device is tilted
        is_moving :: Maybe Bool,
        -- | True, if the wallpaper must be downscaled to fit in 450x450 square and then box-blurred with radius 12
        is_blurred :: Maybe Bool
      }
  | -- | A PNG or TGV (gzipped subset of SVG with MIME type "application/x-tgwallpattern") pattern to be combined with the background fill chosen by the user
    BackgroundTypePattern
      { -- | True, if the background needs to be slightly moved when device is tilted
        is_moving :: Maybe Bool,
        -- | True, if the background fill must be applied only to the pattern itself. All other pixels are black in this case. For dark themes only
        is_inverted :: Maybe Bool,
        -- | Intensity of the pattern when it is shown above the filled background; 0-100.
        intensity :: Maybe Int,
        -- | Fill of the background
        fill :: Maybe BackgroundFill.BackgroundFill
      }
  | -- | A filled background @fill The background fill
    BackgroundTypeFill
      { -- |
        fill :: Maybe BackgroundFill.BackgroundFill
      }
  deriving (Eq)

instance Show BackgroundType where
  show
    BackgroundTypeWallpaper
      { is_moving = is_moving_,
        is_blurred = is_blurred_
      } =
      "BackgroundTypeWallpaper"
        ++ U.cc
          [ U.p "is_moving" is_moving_,
            U.p "is_blurred" is_blurred_
          ]
  show
    BackgroundTypePattern
      { is_moving = is_moving_,
        is_inverted = is_inverted_,
        intensity = intensity_,
        fill = fill_
      } =
      "BackgroundTypePattern"
        ++ U.cc
          [ U.p "is_moving" is_moving_,
            U.p "is_inverted" is_inverted_,
            U.p "intensity" intensity_,
            U.p "fill" fill_
          ]
  show
    BackgroundTypeFill
      { fill = fill_
      } =
      "BackgroundTypeFill"
        ++ U.cc
          [ U.p "fill" fill_
          ]

instance T.FromJSON BackgroundType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "backgroundTypeWallpaper" -> parseBackgroundTypeWallpaper v
      "backgroundTypePattern" -> parseBackgroundTypePattern v
      "backgroundTypeFill" -> parseBackgroundTypeFill v
      _ -> mempty
    where
      parseBackgroundTypeWallpaper :: A.Value -> T.Parser BackgroundType
      parseBackgroundTypeWallpaper = A.withObject "BackgroundTypeWallpaper" $ \o -> do
        is_moving_ <- o A..:? "is_moving"
        is_blurred_ <- o A..:? "is_blurred"
        return $ BackgroundTypeWallpaper {is_moving = is_moving_, is_blurred = is_blurred_}

      parseBackgroundTypePattern :: A.Value -> T.Parser BackgroundType
      parseBackgroundTypePattern = A.withObject "BackgroundTypePattern" $ \o -> do
        is_moving_ <- o A..:? "is_moving"
        is_inverted_ <- o A..:? "is_inverted"
        intensity_ <- o A..:? "intensity"
        fill_ <- o A..:? "fill"
        return $ BackgroundTypePattern {is_moving = is_moving_, is_inverted = is_inverted_, intensity = intensity_, fill = fill_}

      parseBackgroundTypeFill :: A.Value -> T.Parser BackgroundType
      parseBackgroundTypeFill = A.withObject "BackgroundTypeFill" $ \o -> do
        fill_ <- o A..:? "fill"
        return $ BackgroundTypeFill {fill = fill_}
  parseJSON _ = mempty

instance T.ToJSON BackgroundType where
  toJSON
    BackgroundTypeWallpaper
      { is_moving = is_moving_,
        is_blurred = is_blurred_
      } =
      A.object
        [ "@type" A..= T.String "backgroundTypeWallpaper",
          "is_moving" A..= is_moving_,
          "is_blurred" A..= is_blurred_
        ]
  toJSON
    BackgroundTypePattern
      { is_moving = is_moving_,
        is_inverted = is_inverted_,
        intensity = intensity_,
        fill = fill_
      } =
      A.object
        [ "@type" A..= T.String "backgroundTypePattern",
          "is_moving" A..= is_moving_,
          "is_inverted" A..= is_inverted_,
          "intensity" A..= intensity_,
          "fill" A..= fill_
        ]
  toJSON
    BackgroundTypeFill
      { fill = fill_
      } =
      A.object
        [ "@type" A..= T.String "backgroundTypeFill",
          "fill" A..= fill_
        ]
