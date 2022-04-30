-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BackgroundType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.BackgroundFill as BackgroundFill

-- |
-- 
-- Describes the type of a background
data BackgroundType = 
 -- |
 -- 
 -- A wallpaper in JPEG format
 -- 
 -- __is_blurred__ True, if the wallpaper must be downscaled to fit in 450x450 square and then box-blurred with radius 12
 -- 
 -- __is_moving__ True, if the background needs to be slightly moved when device is tilted
 BackgroundTypeWallpaper { is_moving :: Maybe Bool, is_blurred :: Maybe Bool }  |
 -- |
 -- 
 -- A PNG or TGV (gzipped subset of SVG with MIME type "application/x-tgwallpattern") pattern to be combined with the background fill chosen by the user
 -- 
 -- __fill__ Fill of the background
 -- 
 -- __intensity__ Intensity of the pattern when it is shown above the filled background; 0-100.
 -- 
 -- __is_inverted__ True, if the background fill must be applied only to the pattern itself. All other pixels are black in this case. For dark themes only
 -- 
 -- __is_moving__ True, if the background needs to be slightly moved when device is tilted
 BackgroundTypePattern { is_moving :: Maybe Bool, is_inverted :: Maybe Bool, intensity :: Maybe Int, fill :: Maybe BackgroundFill.BackgroundFill }  |
 -- |
 -- 
 -- A filled background 
 -- 
 -- __fill__ The background fill
 BackgroundTypeFill { fill :: Maybe BackgroundFill.BackgroundFill }  deriving (Eq)

instance Show BackgroundType where
 show BackgroundTypeWallpaper { is_moving=is_moving, is_blurred=is_blurred } =
  "BackgroundTypeWallpaper" ++ U.cc [U.p "is_moving" is_moving, U.p "is_blurred" is_blurred ]

 show BackgroundTypePattern { is_moving=is_moving, is_inverted=is_inverted, intensity=intensity, fill=fill } =
  "BackgroundTypePattern" ++ U.cc [U.p "is_moving" is_moving, U.p "is_inverted" is_inverted, U.p "intensity" intensity, U.p "fill" fill ]

 show BackgroundTypeFill { fill=fill } =
  "BackgroundTypeFill" ++ U.cc [U.p "fill" fill ]

instance T.ToJSON BackgroundType where
 toJSON BackgroundTypeWallpaper { is_moving = is_moving, is_blurred = is_blurred } =
  A.object [ "@type" A..= T.String "backgroundTypeWallpaper", "is_moving" A..= is_moving, "is_blurred" A..= is_blurred ]

 toJSON BackgroundTypePattern { is_moving = is_moving, is_inverted = is_inverted, intensity = intensity, fill = fill } =
  A.object [ "@type" A..= T.String "backgroundTypePattern", "is_moving" A..= is_moving, "is_inverted" A..= is_inverted, "intensity" A..= intensity, "fill" A..= fill ]

 toJSON BackgroundTypeFill { fill = fill } =
  A.object [ "@type" A..= T.String "backgroundTypeFill", "fill" A..= fill ]

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
    is_moving <- o A..:? "is_moving"
    is_blurred <- o A..:? "is_blurred"
    return $ BackgroundTypeWallpaper { is_moving = is_moving, is_blurred = is_blurred }

   parseBackgroundTypePattern :: A.Value -> T.Parser BackgroundType
   parseBackgroundTypePattern = A.withObject "BackgroundTypePattern" $ \o -> do
    is_moving <- o A..:? "is_moving"
    is_inverted <- o A..:? "is_inverted"
    intensity <- mconcat [ o A..:? "intensity", readMaybe <$> (o A..: "intensity" :: T.Parser String)] :: T.Parser (Maybe Int)
    fill <- o A..:? "fill"
    return $ BackgroundTypePattern { is_moving = is_moving, is_inverted = is_inverted, intensity = intensity, fill = fill }

   parseBackgroundTypeFill :: A.Value -> T.Parser BackgroundType
   parseBackgroundTypeFill = A.withObject "BackgroundTypeFill" $ \o -> do
    fill <- o A..:? "fill"
    return $ BackgroundTypeFill { fill = fill }
 parseJSON _ = mempty
