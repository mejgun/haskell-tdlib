-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageThread where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns information about a message thread. Can be used only if message.can_get_message_thread == true 
-- 
-- __chat_id__ Chat identifier
-- 
-- __message_id__ Identifier of the message
data GetMessageThread = 

 GetMessageThread { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetMessageThread where
 show GetMessageThread { message_id=message_id, chat_id=chat_id } =
  "GetMessageThread" ++ cc [p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetMessageThread where
 toJSON GetMessageThread { message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getMessageThread", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetMessageThread where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessageThread" -> parseGetMessageThread v
   _ -> mempty
  where
   parseGetMessageThread :: A.Value -> T.Parser GetMessageThread
   parseGetMessageThread = A.withObject "GetMessageThread" $ \o -> do
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetMessageThread { message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
