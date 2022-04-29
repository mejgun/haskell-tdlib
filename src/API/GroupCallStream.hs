-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.GroupCallStream where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes an available stream in a group call
-- 
-- __channel_id__ Identifier of an audio/video channel
-- 
-- __scale__ Scale of segment durations in the stream. The duration is 1000/(2**scale) milliseconds
-- 
-- __time_offset__ Point in time when the stream currently ends; Unix timestamp in milliseconds
data GroupCallStream = 

 GroupCallStream { time_offset :: Maybe Int, scale :: Maybe Int, channel_id :: Maybe Int }  deriving (Eq)

instance Show GroupCallStream where
 show GroupCallStream { time_offset=time_offset, scale=scale, channel_id=channel_id } =
  "GroupCallStream" ++ cc [p "time_offset" time_offset, p "scale" scale, p "channel_id" channel_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GroupCallStream where
 toJSON GroupCallStream { time_offset = time_offset, scale = scale, channel_id = channel_id } =
  A.object [ "@type" A..= T.String "groupCallStream", "time_offset" A..= time_offset, "scale" A..= scale, "channel_id" A..= channel_id ]

instance T.FromJSON GroupCallStream where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "groupCallStream" -> parseGroupCallStream v
   _ -> mempty
  where
   parseGroupCallStream :: A.Value -> T.Parser GroupCallStream
   parseGroupCallStream = A.withObject "GroupCallStream" $ \o -> do
    time_offset <- mconcat [ o A..:? "time_offset", readMaybe <$> (o A..: "time_offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    scale <- mconcat [ o A..:? "scale", readMaybe <$> (o A..: "scale" :: T.Parser String)] :: T.Parser (Maybe Int)
    channel_id <- mconcat [ o A..:? "channel_id", readMaybe <$> (o A..: "channel_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GroupCallStream { time_offset = time_offset, scale = scale, channel_id = channel_id }
 parseJSON _ = mempty
