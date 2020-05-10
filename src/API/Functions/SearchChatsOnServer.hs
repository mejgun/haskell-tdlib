-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatsOnServer where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Searches for the specified query in the title and username of already known chats via request to the server. Returns chats in the order seen in the chat list 
-- 
-- __query__ Query to search for
-- 
-- __limit__ The maximum number of chats to be returned
data SearchChatsOnServer = 

 SearchChatsOnServer { limit :: Maybe Int, query :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SearchChatsOnServer where
 toJSON (SearchChatsOnServer { limit = limit, query = query }) =
  A.object [ "@type" A..= T.String "searchChatsOnServer", "limit" A..= limit, "query" A..= query ]

instance T.FromJSON SearchChatsOnServer where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchChatsOnServer" -> parseSearchChatsOnServer v
   _ -> mempty
  where
   parseSearchChatsOnServer :: A.Value -> T.Parser SearchChatsOnServer
   parseSearchChatsOnServer = A.withObject "SearchChatsOnServer" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    query <- o A..:? "query"
    return $ SearchChatsOnServer { limit = limit, query = query }