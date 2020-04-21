-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatsOnServer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchChatsOnServer = 
 SearchChatsOnServer { limit :: Int, query :: String }  deriving (Show)

instance T.ToJSON SearchChatsOnServer where
 toJSON (SearchChatsOnServer { limit = limit, query = query }) =
  A.object [ "@type" A..= T.String "searchChatsOnServer", "limit" A..= limit, "query" A..= query ]



instance T.FromJSON SearchChatsOnServer where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchChatsOnServer" -> parseSearchChatsOnServer v

   _ -> mempty ""
  where
   parseSearchChatsOnServer :: A.Value -> T.Parser SearchChatsOnServer
   parseSearchChatsOnServer = A.withObject "SearchChatsOnServer" $ \o -> do
    limit <- o A..: "limit"
    query <- o A..: "query"
    return $ SearchChatsOnServer { limit = limit, query = query }