-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateVoiceChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Creates a voice chat (a group call bound to a chat). Available only for basic groups, supergroups and channels; requires can_manage_voice_chats rights
-- 
-- __chat_id__ Chat identifier, in which the voice chat will be created
-- 
-- __title__ Group call title; if empty, chat title will be used
-- 
-- __start_date__ Point in time (Unix timestamp) when the group call is supposed to be started by an administrator; 0 to start the voice chat immediately. The date must be at least 10 seconds and at most 8 days in the future
data CreateVoiceChat = 

 CreateVoiceChat { start_date :: Maybe Int, title :: Maybe String, chat_id :: Maybe Int }  deriving (Eq)

instance Show CreateVoiceChat where
 show CreateVoiceChat { start_date=start_date, title=title, chat_id=chat_id } =
  "CreateVoiceChat" ++ cc [p "start_date" start_date, p "title" title, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CreateVoiceChat where
 toJSON CreateVoiceChat { start_date = start_date, title = title, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "createVoiceChat", "start_date" A..= start_date, "title" A..= title, "chat_id" A..= chat_id ]

instance T.FromJSON CreateVoiceChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createVoiceChat" -> parseCreateVoiceChat v
   _ -> mempty
  where
   parseCreateVoiceChat :: A.Value -> T.Parser CreateVoiceChat
   parseCreateVoiceChat = A.withObject "CreateVoiceChat" $ \o -> do
    start_date <- mconcat [ o A..:? "start_date", readMaybe <$> (o A..: "start_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    title <- o A..:? "title"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CreateVoiceChat { start_date = start_date, title = title, chat_id = chat_id }
 parseJSON _ = mempty
