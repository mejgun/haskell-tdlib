-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageAddedReactions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns reactions added for a message, along with their sender
-- 
-- __chat_id__ Identifier of the chat to which the message belongs
-- 
-- __message_id__ Identifier of the message
-- 
-- __reaction__ If non-empty, only added reactions with the specified text representation will be returned
-- 
-- __offset__ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
-- 
-- __limit__ The maximum number of reactions to be returned; must be positive and can't be greater than 100
data GetMessageAddedReactions = 

 GetMessageAddedReactions { limit :: Maybe Int, offset :: Maybe String, reaction :: Maybe String, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetMessageAddedReactions where
 show GetMessageAddedReactions { limit=limit, offset=offset, reaction=reaction, message_id=message_id, chat_id=chat_id } =
  "GetMessageAddedReactions" ++ U.cc [U.p "limit" limit, U.p "offset" offset, U.p "reaction" reaction, U.p "message_id" message_id, U.p "chat_id" chat_id ]

instance T.ToJSON GetMessageAddedReactions where
 toJSON GetMessageAddedReactions { limit = limit, offset = offset, reaction = reaction, message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getMessageAddedReactions", "limit" A..= limit, "offset" A..= offset, "reaction" A..= reaction, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetMessageAddedReactions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessageAddedReactions" -> parseGetMessageAddedReactions v
   _ -> mempty
  where
   parseGetMessageAddedReactions :: A.Value -> T.Parser GetMessageAddedReactions
   parseGetMessageAddedReactions = A.withObject "GetMessageAddedReactions" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- o A..:? "offset"
    reaction <- o A..:? "reaction"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetMessageAddedReactions { limit = limit, offset = offset, reaction = reaction, message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
