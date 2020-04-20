-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.HttpUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data HttpUrl = 
 HttpUrl { url :: String }  -- deriving (Show)

instance T.ToJSON HttpUrl where
 toJSON (HttpUrl { url = url }) =
  A.object [ "@type" A..= T.String "httpUrl", "url" A..= url ]
-- httpUrl HttpUrl  { url :: String } 



instance T.FromJSON HttpUrl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "httpUrl" -> parseHttpUrl v
  where
   parseHttpUrl :: A.Value -> T.Parser HttpUrl
   parseHttpUrl = A.withObject "HttpUrl" $ \o -> do
    url <- o A..: "url"
    return $ HttpUrl { url = url }