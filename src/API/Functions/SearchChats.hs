-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChats where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SearchChats = 
 SearchChats { limit :: Maybe Int, query :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SearchChats where
 toJSON (SearchChats { limit = limit, query = query }) =
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
    limit <- optional $ o A..: "limit"
    query <- optional $ o A..: "query"
    return $ SearchChats { limit = limit, query = query }