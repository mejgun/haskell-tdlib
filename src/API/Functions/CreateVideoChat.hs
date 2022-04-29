-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateVideoChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Creates a video chat (a group call bound to a chat). Available only for basic groups, supergroups and channels; requires can_manage_video_chats rights
-- 
-- __chat_id__ Identifier of a chat in which the video chat will be created
-- 
-- __title__ Group call title; if empty, chat title will be used
-- 
-- __start_date__ Point in time (Unix timestamp) when the group call is supposed to be started by an administrator; 0 to start the video chat immediately. The date must be at least 10 seconds and at most 8 days in the future
-- 
-- __is_rtmp_stream__ Pass true to create an RTMP stream instead of an ordinary video chat; requires creator privileges
data CreateVideoChat = 

 CreateVideoChat { is_rtmp_stream :: Maybe Bool, start_date :: Maybe Int, title :: Maybe String, chat_id :: Maybe Int }  deriving (Eq)

instance Show CreateVideoChat where
 show CreateVideoChat { is_rtmp_stream=is_rtmp_stream, start_date=start_date, title=title, chat_id=chat_id } =
  "CreateVideoChat" ++ cc [p "is_rtmp_stream" is_rtmp_stream, p "start_date" start_date, p "title" title, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CreateVideoChat where
 toJSON CreateVideoChat { is_rtmp_stream = is_rtmp_stream, start_date = start_date, title = title, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "createVideoChat", "is_rtmp_stream" A..= is_rtmp_stream, "start_date" A..= start_date, "title" A..= title, "chat_id" A..= chat_id ]

instance T.FromJSON CreateVideoChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createVideoChat" -> parseCreateVideoChat v
   _ -> mempty
  where
   parseCreateVideoChat :: A.Value -> T.Parser CreateVideoChat
   parseCreateVideoChat = A.withObject "CreateVideoChat" $ \o -> do
    is_rtmp_stream <- o A..:? "is_rtmp_stream"
    start_date <- mconcat [ o A..:? "start_date", readMaybe <$> (o A..: "start_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    title <- o A..:? "title"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CreateVideoChat { is_rtmp_stream = is_rtmp_stream, start_date = start_date, title = title, chat_id = chat_id }
 parseJSON _ = mempty
