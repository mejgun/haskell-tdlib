-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchContacts where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Searches for the specified query in the first names, last names and usernames of the known user contacts 
-- 
-- __query__ Query to search for; may be empty to return all contacts
-- 
-- __limit__ The maximum number of users to be returned
data SearchContacts = 

 SearchContacts { limit :: Maybe Int, query :: Maybe String }  deriving (Eq)

instance Show SearchContacts where
 show SearchContacts { limit=limit, query=query } =
  "SearchContacts" ++ cc [p "limit" limit, p "query" query ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SearchContacts where
 toJSON SearchContacts { limit = limit, query = query } =
  A.object [ "@type" A..= T.String "searchContacts", "limit" A..= limit, "query" A..= query ]

instance T.FromJSON SearchContacts where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchContacts" -> parseSearchContacts v
   _ -> mempty
  where
   parseSearchContacts :: A.Value -> T.Parser SearchContacts
   parseSearchContacts = A.withObject "SearchContacts" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    query <- o A..:? "query"
    return $ SearchContacts { limit = limit, query = query }
 parseJSON _ = mempty
