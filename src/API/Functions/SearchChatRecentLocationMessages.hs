-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatRecentLocationMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns information about the recent locations of chat members that were sent to the chat. Returns up to 1 location message per user 
-- 
-- __chat_id__ Chat identifier
-- 
-- __limit__ The maximum number of messages to be returned
data SearchChatRecentLocationMessages = 

 SearchChatRecentLocationMessages { limit :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show SearchChatRecentLocationMessages where
 show SearchChatRecentLocationMessages { limit=limit, chat_id=chat_id } =
  "SearchChatRecentLocationMessages" ++ cc [p "limit" limit, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SearchChatRecentLocationMessages where
 toJSON SearchChatRecentLocationMessages { limit = limit, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "searchChatRecentLocationMessages", "limit" A..= limit, "chat_id" A..= chat_id ]

instance T.FromJSON SearchChatRecentLocationMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchChatRecentLocationMessages" -> parseSearchChatRecentLocationMessages v
   _ -> mempty
  where
   parseSearchChatRecentLocationMessages :: A.Value -> T.Parser SearchChatRecentLocationMessages
   parseSearchChatRecentLocationMessages = A.withObject "SearchChatRecentLocationMessages" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SearchChatRecentLocationMessages { limit = limit, chat_id = chat_id }
 parseJSON _ = mempty
