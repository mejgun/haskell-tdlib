-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchContacts where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SearchContacts = 
 SearchContacts { limit :: Maybe Int, query :: Maybe String }  deriving (Show)

instance T.ToJSON SearchContacts where
 toJSON (SearchContacts { limit = limit, query = query }) =
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
    limit <- optional $ o A..: "limit"
    query <- optional $ o A..: "query"
    return $ SearchContacts { limit = limit, query = query }