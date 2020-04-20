-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatsOnServer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchChatsOnServer = 
 SearchChatsOnServer { limit :: Int, query :: String }  -- deriving (Show)

instance T.ToJSON SearchChatsOnServer where
 toJSON (SearchChatsOnServer { limit = limit, query = query }) =
  A.object [ "@type" A..= T.String "searchChatsOnServer", "limit" A..= limit, "query" A..= query ]
-- searchChatsOnServer SearchChatsOnServer  { limit :: Int, query :: String } 

