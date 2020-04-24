-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BackgroundType where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BackgroundFill as BackgroundFill

data BackgroundType = 
 BackgroundTypeWallpaper { is_moving :: Maybe Bool, is_blurred :: Maybe Bool }  
 | BackgroundTypePattern { is_moving :: Maybe Bool, intensity :: Maybe Int, fill :: Maybe BackgroundFill.BackgroundFill }  
 | BackgroundTypeFill { fill :: Maybe BackgroundFill.BackgroundFill }  deriving (Show, Eq)

instance T.ToJSON BackgroundType where
 toJSON (BackgroundTypeWallpaper { is_moving = is_moving, is_blurred = is_blurred }) =
  A.object [ "@type" A..= T.String "backgroundTypeWallpaper", "is_moving" A..= is_moving, "is_blurred" A..= is_blurred ]

 toJSON (BackgroundTypePattern { is_moving = is_moving, intensity = intensity, fill = fill }) =
  A.object [ "@type" A..= T.String "backgroundTypePattern", "is_moving" A..= is_moving, "intensity" A..= intensity, "fill" A..= fill ]

 toJSON (BackgroundTypeFill { fill = fill }) =
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
    is_moving <- optional $ o A..: "is_moving"
    is_blurred <- optional $ o A..: "is_blurred"
    return $ BackgroundTypeWallpaper { is_moving = is_moving, is_blurred = is_blurred }

   parseBackgroundTypePattern :: A.Value -> T.Parser BackgroundType
   parseBackgroundTypePattern = A.withObject "BackgroundTypePattern" $ \o -> do
    is_moving <- optional $ o A..: "is_moving"
    intensity <- optional $ o A..: "intensity"
    fill <- optional $ o A..: "fill"
    return $ BackgroundTypePattern { is_moving = is_moving, intensity = intensity, fill = fill }

   parseBackgroundTypeFill :: A.Value -> T.Parser BackgroundType
   parseBackgroundTypeFill = A.withObject "BackgroundTypeFill" $ \o -> do
    fill <- optional $ o A..: "fill"
    return $ BackgroundTypeFill { fill = fill }