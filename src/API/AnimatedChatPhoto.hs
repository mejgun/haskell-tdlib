-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AnimatedChatPhoto where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.File as File

-- |
-- 
-- Animated variant of a chat photo in MPEG4 format
-- 
-- __length__ Animation width and height
-- 
-- __file__ Information about the animation file
-- 
-- __main_frame_timestamp__ Timestamp of the frame, used as a static chat photo
data AnimatedChatPhoto = 

 AnimatedChatPhoto { main_frame_timestamp :: Maybe Float, file :: Maybe File.File, _length :: Maybe Int }  deriving (Eq)

instance Show AnimatedChatPhoto where
 show AnimatedChatPhoto { main_frame_timestamp=main_frame_timestamp, file=file, _length=_length } =
  "AnimatedChatPhoto" ++ U.cc [U.p "main_frame_timestamp" main_frame_timestamp, U.p "file" file, U.p "_length" _length ]

instance T.ToJSON AnimatedChatPhoto where
 toJSON AnimatedChatPhoto { main_frame_timestamp = main_frame_timestamp, file = file, _length = _length } =
  A.object [ "@type" A..= T.String "animatedChatPhoto", "main_frame_timestamp" A..= main_frame_timestamp, "file" A..= file, "length" A..= _length ]

instance T.FromJSON AnimatedChatPhoto where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "animatedChatPhoto" -> parseAnimatedChatPhoto v
   _ -> mempty
  where
   parseAnimatedChatPhoto :: A.Value -> T.Parser AnimatedChatPhoto
   parseAnimatedChatPhoto = A.withObject "AnimatedChatPhoto" $ \o -> do
    main_frame_timestamp <- o A..:? "main_frame_timestamp"
    file <- o A..:? "file"
    _length <- mconcat [ o A..:? "length", readMaybe <$> (o A..: "length" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AnimatedChatPhoto { main_frame_timestamp = main_frame_timestamp, file = file, _length = _length }
 parseJSON _ = mempty
