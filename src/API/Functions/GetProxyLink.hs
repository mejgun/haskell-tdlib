-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetProxyLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetProxyLink = 
 GetProxyLink { proxy_id :: Int }  -- deriving (Show)

instance T.ToJSON GetProxyLink where
 toJSON (GetProxyLink { proxy_id = proxy_id }) =
  A.object [ "@type" A..= T.String "getProxyLink", "proxy_id" A..= proxy_id ]
-- getProxyLink GetProxyLink  { proxy_id :: Int } 

