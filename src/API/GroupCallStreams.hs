-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.GroupCallStreams where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.GroupCallStream as GroupCallStream

-- |
-- 
-- Represents a list of group call streams 
-- 
-- __streams__ A list of group call streams
data GroupCallStreams = 

 GroupCallStreams { streams :: Maybe [GroupCallStream.GroupCallStream] }  deriving (Eq)

instance Show GroupCallStreams where
 show GroupCallStreams { streams=streams } =
  "GroupCallStreams" ++ cc [p "streams" streams ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GroupCallStreams where
 toJSON GroupCallStreams { streams = streams } =
  A.object [ "@type" A..= T.String "groupCallStreams", "streams" A..= streams ]

instance T.FromJSON GroupCallStreams where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "groupCallStreams" -> parseGroupCallStreams v
   _ -> mempty
  where
   parseGroupCallStreams :: A.Value -> T.Parser GroupCallStreams
   parseGroupCallStreams = A.withObject "GroupCallStreams" $ \o -> do
    streams <- o A..:? "streams"
    return $ GroupCallStreams { streams = streams }
 parseJSON _ = mempty
