-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetVideoChatRtmpUrl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns RTMP URL for streaming to the chat; requires creator privileges 
-- 
-- __chat_id__ Chat identifier
data GetVideoChatRtmpUrl = 

 GetVideoChatRtmpUrl { chat_id :: Maybe Int }  deriving (Eq)

instance Show GetVideoChatRtmpUrl where
 show GetVideoChatRtmpUrl { chat_id=chat_id } =
  "GetVideoChatRtmpUrl" ++ cc [p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetVideoChatRtmpUrl where
 toJSON GetVideoChatRtmpUrl { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getVideoChatRtmpUrl", "chat_id" A..= chat_id ]

instance T.FromJSON GetVideoChatRtmpUrl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getVideoChatRtmpUrl" -> parseGetVideoChatRtmpUrl v
   _ -> mempty
  where
   parseGetVideoChatRtmpUrl :: A.Value -> T.Parser GetVideoChatRtmpUrl
   parseGetVideoChatRtmpUrl = A.withObject "GetVideoChatRtmpUrl" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetVideoChatRtmpUrl { chat_id = chat_id }
 parseJSON _ = mempty
