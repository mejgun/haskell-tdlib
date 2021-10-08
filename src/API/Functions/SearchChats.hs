-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Searches for the specified query in the title and username of already known chats, this is an offline request. Returns chats in the order seen in the main chat list 
-- 
-- __query__ Query to search for. If the query is empty, returns up to 50 recently found chats
-- 
-- __limit__ The maximum number of chats to be returned
data SearchChats = 

 SearchChats { limit :: Maybe Int, query :: Maybe String }  deriving (Eq)

instance Show SearchChats where
 show SearchChats { limit=limit, query=query } =
  "SearchChats" ++ cc [p "limit" limit, p "query" query ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SearchChats where
 toJSON SearchChats { limit = limit, query = query } =
  A.object [ "@type" A..= T.String "searchChats", "limit" A..= limit, "query" A..= query ]

instance T.FromJSON SearchChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchChats" -> parseSearchChats v
   _ -> mempty
  where
   parseSearchChats :: A.Value -> T.Parser SearchChats
   parseSearchChats = A.withObject "SearchChats" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    query <- o A..:? "query"
    return $ SearchChats { limit = limit, query = query }
 parseJSON _ = mempty
