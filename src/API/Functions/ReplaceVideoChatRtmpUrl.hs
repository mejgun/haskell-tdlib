-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReplaceVideoChatRtmpUrl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Replaces the current RTMP URL for streaming to the chat; requires creator privileges 
-- 
-- __chat_id__ Chat identifier
data ReplaceVideoChatRtmpUrl = 

 ReplaceVideoChatRtmpUrl { chat_id :: Maybe Int }  deriving (Eq)

instance Show ReplaceVideoChatRtmpUrl where
 show ReplaceVideoChatRtmpUrl { chat_id=chat_id } =
  "ReplaceVideoChatRtmpUrl" ++ cc [p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ReplaceVideoChatRtmpUrl where
 toJSON ReplaceVideoChatRtmpUrl { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "replaceVideoChatRtmpUrl", "chat_id" A..= chat_id ]

instance T.FromJSON ReplaceVideoChatRtmpUrl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "replaceVideoChatRtmpUrl" -> parseReplaceVideoChatRtmpUrl v
   _ -> mempty
  where
   parseReplaceVideoChatRtmpUrl :: A.Value -> T.Parser ReplaceVideoChatRtmpUrl
   parseReplaceVideoChatRtmpUrl = A.withObject "ReplaceVideoChatRtmpUrl" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ReplaceVideoChatRtmpUrl { chat_id = chat_id }
 parseJSON _ = mempty
