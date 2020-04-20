-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchPublicChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchPublicChats = 
 SearchPublicChats { query :: String }  -- deriving (Show)

instance T.ToJSON SearchPublicChats where
 toJSON (SearchPublicChats { query = query }) =
  A.object [ "@type" A..= T.String "searchPublicChats", "query" A..= query ]
-- searchPublicChats SearchPublicChats  { query :: String } 



instance T.FromJSON SearchPublicChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchPublicChats" -> parseSearchPublicChats v
  where
   parseSearchPublicChats :: A.Value -> T.Parser SearchPublicChats
   parseSearchPublicChats = A.withObject "SearchPublicChats" $ \o -> do
    query <- o A..: "query"
    return $ SearchPublicChats { query = query }