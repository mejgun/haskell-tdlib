-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AnimatedEmoji where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.Sticker as Sticker

-- |
-- 
-- Describes an animated representation of an emoji
-- 
-- __sticker__ Animated sticker for the emoji
-- 
-- __fitzpatrick_type__ Emoji modifier fitzpatrick type; 0-6; 0 if none
-- 
-- __sound__ File containing the sound to be played when the animated emoji is clicked; may be null. The sound is encoded with the Opus codec, and stored inside an OGG container
data AnimatedEmoji = 

 AnimatedEmoji { sound :: Maybe File.File, fitzpatrick_type :: Maybe Int, sticker :: Maybe Sticker.Sticker }  deriving (Eq)

instance Show AnimatedEmoji where
 show AnimatedEmoji { sound=sound, fitzpatrick_type=fitzpatrick_type, sticker=sticker } =
  "AnimatedEmoji" ++ U.cc [U.p "sound" sound, U.p "fitzpatrick_type" fitzpatrick_type, U.p "sticker" sticker ]

instance T.ToJSON AnimatedEmoji where
 toJSON AnimatedEmoji { sound = sound, fitzpatrick_type = fitzpatrick_type, sticker = sticker } =
  A.object [ "@type" A..= T.String "animatedEmoji", "sound" A..= sound, "fitzpatrick_type" A..= fitzpatrick_type, "sticker" A..= sticker ]

instance T.FromJSON AnimatedEmoji where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "animatedEmoji" -> parseAnimatedEmoji v
   _ -> mempty
  where
   parseAnimatedEmoji :: A.Value -> T.Parser AnimatedEmoji
   parseAnimatedEmoji = A.withObject "AnimatedEmoji" $ \o -> do
    sound <- o A..:? "sound"
    fitzpatrick_type <- mconcat [ o A..:? "fitzpatrick_type", readMaybe <$> (o A..: "fitzpatrick_type" :: T.Parser String)] :: T.Parser (Maybe Int)
    sticker <- o A..:? "sticker"
    return $ AnimatedEmoji { sound = sound, fitzpatrick_type = fitzpatrick_type, sticker = sticker }
 parseJSON _ = mempty
