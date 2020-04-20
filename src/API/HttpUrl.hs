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

