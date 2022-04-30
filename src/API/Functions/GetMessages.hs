-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns information about messages. If a message is not found, returns null on the corresponding position of the result 
-- 
-- __chat_id__ Identifier of the chat the messages belong to
-- 
-- __message_ids__ Identifiers of the messages to get
data GetMessages = 

 GetMessages { message_ids :: Maybe [Int], chat_id :: Maybe Int }  deriving (Eq)

instance Show GetMessages where
 show GetMessages { message_ids=message_ids, chat_id=chat_id } =
  "GetMessages" ++ U.cc [U.p "message_ids" message_ids, U.p "chat_id" chat_id ]

instance T.ToJSON GetMessages where
 toJSON GetMessages { message_ids = message_ids, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getMessages", "message_ids" A..= message_ids, "chat_id" A..= chat_id ]

instance T.FromJSON GetMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessages" -> parseGetMessages v
   _ -> mempty
  where
   parseGetMessages :: A.Value -> T.Parser GetMessages
   parseGetMessages = A.withObject "GetMessages" $ \o -> do
    message_ids <- o A..:? "message_ids"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetMessages { message_ids = message_ids, chat_id = chat_id }
 parseJSON _ = mempty
