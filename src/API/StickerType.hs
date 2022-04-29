-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StickerType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.MaskPosition as MaskPosition

-- |
-- 
-- Describes type of a sticker
data StickerType = 
 -- |
 -- 
 -- The sticker is an image in WEBP format
 StickerTypeStatic |
 -- |
 -- 
 -- The sticker is an animation in TGS format
 StickerTypeAnimated |
 -- |
 -- 
 -- The sticker is a video in WEBM format
 StickerTypeVideo |
 -- |
 -- 
 -- The sticker is a mask in WEBP format to be placed on photos or videos 
 -- 
 -- __mask_position__ Position where the mask is placed; may be null
 StickerTypeMask { mask_position :: Maybe MaskPosition.MaskPosition }  deriving (Eq)

instance Show StickerType where
 show StickerTypeStatic {  } =
  "StickerTypeStatic" ++ cc [ ]

 show StickerTypeAnimated {  } =
  "StickerTypeAnimated" ++ cc [ ]

 show StickerTypeVideo {  } =
  "StickerTypeVideo" ++ cc [ ]

 show StickerTypeMask { mask_position=mask_position } =
  "StickerTypeMask" ++ cc [p "mask_position" mask_position ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON StickerType where
 toJSON StickerTypeStatic {  } =
  A.object [ "@type" A..= T.String "stickerTypeStatic" ]

 toJSON StickerTypeAnimated {  } =
  A.object [ "@type" A..= T.String "stickerTypeAnimated" ]

 toJSON StickerTypeVideo {  } =
  A.object [ "@type" A..= T.String "stickerTypeVideo" ]

 toJSON StickerTypeMask { mask_position = mask_position } =
  A.object [ "@type" A..= T.String "stickerTypeMask", "mask_position" A..= mask_position ]

instance T.FromJSON StickerType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "stickerTypeStatic" -> parseStickerTypeStatic v
   "stickerTypeAnimated" -> parseStickerTypeAnimated v
   "stickerTypeVideo" -> parseStickerTypeVideo v
   "stickerTypeMask" -> parseStickerTypeMask v
   _ -> mempty
  where
   parseStickerTypeStatic :: A.Value -> T.Parser StickerType
   parseStickerTypeStatic = A.withObject "StickerTypeStatic" $ \o -> do
    return $ StickerTypeStatic {  }

   parseStickerTypeAnimated :: A.Value -> T.Parser StickerType
   parseStickerTypeAnimated = A.withObject "StickerTypeAnimated" $ \o -> do
    return $ StickerTypeAnimated {  }

   parseStickerTypeVideo :: A.Value -> T.Parser StickerType
   parseStickerTypeVideo = A.withObject "StickerTypeVideo" $ \o -> do
    return $ StickerTypeVideo {  }

   parseStickerTypeMask :: A.Value -> T.Parser StickerType
   parseStickerTypeMask = A.withObject "StickerTypeMask" $ \o -> do
    mask_position <- o A..:? "mask_position"
    return $ StickerTypeMask { mask_position = mask_position }
 parseJSON _ = mempty
