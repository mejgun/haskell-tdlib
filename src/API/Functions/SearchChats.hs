-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchChats = 
 SearchChats { limit :: Int, query :: String }  -- deriving (Show)

instance T.ToJSON SearchChats where
 toJSON (SearchChats { limit = limit, query = query }) =
  A.object [ "@type" A..= T.String "searchChats", "limit" A..= limit, "query" A..= query ]
-- searchChats SearchChats  { limit :: Int, query :: String } 



instance T.FromJSON SearchChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchChats" -> parseSearchChats v
  where
   parseSearchChats :: A.Value -> T.Parser SearchChats
   parseSearchChats = A.withObject "SearchChats" $ \o -> do
    limit <- o A..: "limit"
    query <- o A..: "query"
    return $ SearchChats { limit = limit, query = query }