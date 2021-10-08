-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ThumbnailFormat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes format of the thumbnail
data ThumbnailFormat = 
 -- |
 -- 
 -- The thumbnail is in JPEG format
 ThumbnailFormatJpeg |
 -- |
 -- 
 -- The thumbnail is in PNG format. It will be used only for background patterns
 ThumbnailFormatPng |
 -- |
 -- 
 -- The thumbnail is in WEBP format. It will be used only for some stickers
 ThumbnailFormatWebp |
 -- |
 -- 
 -- The thumbnail is in static GIF format. It will be used only for some bot inline results
 ThumbnailFormatGif |
 -- |
 -- 
 -- The thumbnail is in TGS format. It will be used only for animated sticker sets
 ThumbnailFormatTgs |
 -- |
 -- 
 -- The thumbnail is in MPEG4 format. It will be used only for some animations and videos
 ThumbnailFormatMpeg4 deriving (Eq)

instance Show ThumbnailFormat where
 show ThumbnailFormatJpeg {  } =
  "ThumbnailFormatJpeg" ++ cc [ ]

 show ThumbnailFormatPng {  } =
  "ThumbnailFormatPng" ++ cc [ ]

 show ThumbnailFormatWebp {  } =
  "ThumbnailFormatWebp" ++ cc [ ]

 show ThumbnailFormatGif {  } =
  "ThumbnailFormatGif" ++ cc [ ]

 show ThumbnailFormatTgs {  } =
  "ThumbnailFormatTgs" ++ cc [ ]

 show ThumbnailFormatMpeg4 {  } =
  "ThumbnailFormatMpeg4" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ThumbnailFormat where
 toJSON ThumbnailFormatJpeg {  } =
  A.object [ "@type" A..= T.String "thumbnailFormatJpeg" ]

 toJSON ThumbnailFormatPng {  } =
  A.object [ "@type" A..= T.String "thumbnailFormatPng" ]

 toJSON ThumbnailFormatWebp {  } =
  A.object [ "@type" A..= T.String "thumbnailFormatWebp" ]

 toJSON ThumbnailFormatGif {  } =
  A.object [ "@type" A..= T.String "thumbnailFormatGif" ]

 toJSON ThumbnailFormatTgs {  } =
  A.object [ "@type" A..= T.String "thumbnailFormatTgs" ]

 toJSON ThumbnailFormatMpeg4 {  } =
  A.object [ "@type" A..= T.String "thumbnailFormatMpeg4" ]

instance T.FromJSON ThumbnailFormat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "thumbnailFormatJpeg" -> parseThumbnailFormatJpeg v
   "thumbnailFormatPng" -> parseThumbnailFormatPng v
   "thumbnailFormatWebp" -> parseThumbnailFormatWebp v
   "thumbnailFormatGif" -> parseThumbnailFormatGif v
   "thumbnailFormatTgs" -> parseThumbnailFormatTgs v
   "thumbnailFormatMpeg4" -> parseThumbnailFormatMpeg4 v
   _ -> mempty
  where
   parseThumbnailFormatJpeg :: A.Value -> T.Parser ThumbnailFormat
   parseThumbnailFormatJpeg = A.withObject "ThumbnailFormatJpeg" $ \o -> do
    return $ ThumbnailFormatJpeg {  }

   parseThumbnailFormatPng :: A.Value -> T.Parser ThumbnailFormat
   parseThumbnailFormatPng = A.withObject "ThumbnailFormatPng" $ \o -> do
    return $ ThumbnailFormatPng {  }

   parseThumbnailFormatWebp :: A.Value -> T.Parser ThumbnailFormat
   parseThumbnailFormatWebp = A.withObject "ThumbnailFormatWebp" $ \o -> do
    return $ ThumbnailFormatWebp {  }

   parseThumbnailFormatGif :: A.Value -> T.Parser ThumbnailFormat
   parseThumbnailFormatGif = A.withObject "ThumbnailFormatGif" $ \o -> do
    return $ ThumbnailFormatGif {  }

   parseThumbnailFormatTgs :: A.Value -> T.Parser ThumbnailFormat
   parseThumbnailFormatTgs = A.withObject "ThumbnailFormatTgs" $ \o -> do
    return $ ThumbnailFormatTgs {  }

   parseThumbnailFormatMpeg4 :: A.Value -> T.Parser ThumbnailFormat
   parseThumbnailFormatMpeg4 = A.withObject "ThumbnailFormatMpeg4" $ \o -> do
    return $ ThumbnailFormatMpeg4 {  }
 parseJSON _ = mempty
