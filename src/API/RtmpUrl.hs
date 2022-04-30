-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.RtmpUrl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Represents an RTMP url 
-- 
-- __url__ The URL
-- 
-- __stream_key__ Stream key
data RtmpUrl = 

 RtmpUrl { stream_key :: Maybe String, url :: Maybe String }  deriving (Eq)

instance Show RtmpUrl where
 show RtmpUrl { stream_key=stream_key, url=url } =
  "RtmpUrl" ++ U.cc [U.p "stream_key" stream_key, U.p "url" url ]

instance T.ToJSON RtmpUrl where
 toJSON RtmpUrl { stream_key = stream_key, url = url } =
  A.object [ "@type" A..= T.String "rtmpUrl", "stream_key" A..= stream_key, "url" A..= url ]

instance T.FromJSON RtmpUrl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "rtmpUrl" -> parseRtmpUrl v
   _ -> mempty
  where
   parseRtmpUrl :: A.Value -> T.Parser RtmpUrl
   parseRtmpUrl = A.withObject "RtmpUrl" $ \o -> do
    stream_key <- o A..:? "stream_key"
    url <- o A..:? "url"
    return $ RtmpUrl { stream_key = stream_key, url = url }
 parseJSON _ = mempty
