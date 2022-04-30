-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.HttpUrl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Contains an HTTP URL 
-- 
-- __url__ The URL
data HttpUrl = 

 HttpUrl { url :: Maybe String }  deriving (Eq)

instance Show HttpUrl where
 show HttpUrl { url=url } =
  "HttpUrl" ++ U.cc [U.p "url" url ]

instance T.ToJSON HttpUrl where
 toJSON HttpUrl { url = url } =
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
    url <- o A..:? "url"
    return $ HttpUrl { url = url }
 parseJSON _ = mempty
