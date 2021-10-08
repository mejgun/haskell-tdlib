-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Deletes messages 
-- 
-- __chat_id__ Chat identifier
-- 
-- __message_ids__ Identifiers of the messages to be deleted
-- 
-- __revoke__ Pass true to try to delete messages for all chat members. Always true for supergroups, channels and secret chats
data DeleteMessages = 

 DeleteMessages { revoke :: Maybe Bool, message_ids :: Maybe [Int], chat_id :: Maybe Int }  deriving (Eq)

instance Show DeleteMessages where
 show DeleteMessages { revoke=revoke, message_ids=message_ids, chat_id=chat_id } =
  "DeleteMessages" ++ cc [p "revoke" revoke, p "message_ids" message_ids, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON DeleteMessages where
 toJSON DeleteMessages { revoke = revoke, message_ids = message_ids, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "deleteMessages", "revoke" A..= revoke, "message_ids" A..= message_ids, "chat_id" A..= chat_id ]

instance T.FromJSON DeleteMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteMessages" -> parseDeleteMessages v
   _ -> mempty
  where
   parseDeleteMessages :: A.Value -> T.Parser DeleteMessages
   parseDeleteMessages = A.withObject "DeleteMessages" $ \o -> do
    revoke <- o A..:? "revoke"
    message_ids <- o A..:? "message_ids"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DeleteMessages { revoke = revoke, message_ids = message_ids, chat_id = chat_id }
 parseJSON _ = mempty
