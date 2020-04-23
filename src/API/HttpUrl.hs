-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.HttpUrl where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data HttpUrl = 
 HttpUrl { url :: Maybe String }  deriving (Show)

instance T.ToJSON HttpUrl where
 toJSON (HttpUrl { url = url }) =
  A.object [ "@type" A..= T.String "httpUrl", "url" A..= url ]

instance T.FromJSON HttpUrl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "httpUrl" -> parseHttpUrl v
   _ -> mempty
  where
   parseHttpUrl :: A.Value -> T.Parser HttpUrl
   parseHttpUrl = A.withObject "HttpUrl" $ \o -> do
    url <- optional $ o A..: "url"
    return $ HttpUrl { url = url }