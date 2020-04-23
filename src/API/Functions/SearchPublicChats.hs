-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchPublicChats where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SearchPublicChats = 
 SearchPublicChats { query :: Maybe String }  deriving (Show)

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
    query <- optional $ o A..: "query"
    return $ SearchPublicChats { query = query }