-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatPhotoInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail
import {-# SOURCE #-} qualified API.File as File

-- |
-- 
-- Contains basic information about the photo of a chat
-- 
-- __small__ A small (160x160) chat photo variant in JPEG format. The file can be downloaded only before the photo is changed
-- 
-- __big__ A big (640x640) chat photo variant in JPEG format. The file can be downloaded only before the photo is changed
-- 
-- __minithumbnail__ Chat photo minithumbnail; may be null
-- 
-- __has_animation__ True, if the photo has animated variant
data ChatPhotoInfo = 

 ChatPhotoInfo { has_animation :: Maybe Bool, minithumbnail :: Maybe Minithumbnail.Minithumbnail, big :: Maybe File.File, small :: Maybe File.File }  deriving (Show, Eq)

instance T.ToJSON ChatPhotoInfo where
 toJSON (ChatPhotoInfo { has_animation = has_animation, minithumbnail = minithumbnail, big = big, small = small }) =
  A.object [ "@type" A..= T.String "chatPhotoInfo", "has_animation" A..= has_animation, "minithumbnail" A..= minithumbnail, "big" A..= big, "small" A..= small ]

instance T.FromJSON ChatPhotoInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatPhotoInfo" -> parseChatPhotoInfo v
   _ -> mempty
  where
   parseChatPhotoInfo :: A.Value -> T.Parser ChatPhotoInfo
   parseChatPhotoInfo = A.withObject "ChatPhotoInfo" $ \o -> do
    has_animation <- o A..:? "has_animation"
    minithumbnail <- o A..:? "minithumbnail"
    big <- o A..:? "big"
    small <- o A..:? "small"
    return $ ChatPhotoInfo { has_animation = has_animation, minithumbnail = minithumbnail, big = big, small = small }