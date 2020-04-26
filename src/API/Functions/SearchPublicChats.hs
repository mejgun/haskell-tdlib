-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchPublicChats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Searches public chats by looking for specified query in their username and title. Currently only private chats, supergroups and channels can be public. Returns a meaningful number of results. Returns nothing if the length of the searched username prefix is less than 5. Excludes private chats with contacts and chats from the chat list from the results 
-- 
-- __query__ Query to search for
data SearchPublicChats = 
 SearchPublicChats { query :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SearchPublicChats where
 toJSON (SearchPublicChats { query = query }) =
  A.object [ "@type" A..= T.String "searchPublicChats", "query" A..= query ]

instance T.FromJSON SearchPublicChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchPublicChats" -> parseSearchPublicChats v
   _ -> mempty
  where
   parseSearchPublicChats :: A.Value -> T.Parser SearchPublicChats
   parseSearchPublicChats = A.withObject "SearchPublicChats" $ \o -> do
    query <- o A..:? "query"
    return $ SearchPublicChats { query = query }