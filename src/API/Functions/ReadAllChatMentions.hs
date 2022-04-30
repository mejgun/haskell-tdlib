-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReadAllChatMentions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Marks all mentions in a chat as read 
-- 
-- __chat_id__ Chat identifier
data ReadAllChatMentions = 

 ReadAllChatMentions { chat_id :: Maybe Int }  deriving (Eq)

instance Show ReadAllChatMentions where
 show ReadAllChatMentions { chat_id=chat_id } =
  "ReadAllChatMentions" ++ U.cc [U.p "chat_id" chat_id ]

instance T.ToJSON ReadAllChatMentions where
 toJSON ReadAllChatMentions { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "readAllChatMentions", "chat_id" A..= chat_id ]

instance T.FromJSON ReadAllChatMentions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "readAllChatMentions" -> parseReadAllChatMentions v
   _ -> mempty
  where
   parseReadAllChatMentions :: A.Value -> T.Parser ReadAllChatMentions
   parseReadAllChatMentions = A.withObject "ReadAllChatMentions" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ReadAllChatMentions { chat_id = chat_id }
 parseJSON _ = mempty
