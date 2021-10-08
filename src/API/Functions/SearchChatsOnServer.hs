-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatsOnServer where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Searches for the specified query in the title and username of already known chats via request to the server. Returns chats in the order seen in the main chat list 
-- 
-- __query__ Query to search for
-- 
-- __limit__ The maximum number of chats to be returned
data SearchChatsOnServer = 

 SearchChatsOnServer { limit :: Maybe Int, query :: Maybe String }  deriving (Eq)

instance Show SearchChatsOnServer where
 show SearchChatsOnServer { limit=limit, query=query } =
  "SearchChatsOnServer" ++ cc [p "limit" limit, p "query" query ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SearchChatsOnServer where
 toJSON SearchChatsOnServer { limit = limit, query = query } =
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
 parseJSON _ = mempty
