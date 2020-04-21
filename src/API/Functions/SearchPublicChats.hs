-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchPublicChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SearchPublicChats = 
 SearchPublicChats { query :: String }  deriving (Show)

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
    query <- o A..: "query"
    return $ SearchPublicChats { query = query }